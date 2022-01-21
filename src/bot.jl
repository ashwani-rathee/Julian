using InteractiveUtils
using UnicodePlots
using Discord
using GitHub
using HTTP
using JSON
using Dates
using Firebase


include("constants.jl")

# Create a client.
c = Client(String(ENV["DISCORD_TOKEN"]))

GITHUB_TOKEN = String(ENV["GITHUB_TOKEN"])
BASE_URL = String(ENV["BASE_URL"])
DB_URL = String(ENV["DB_URL"])
header = [
    "Authorization"=>"token $(GITHUB_TOKEN)",
    "Accept"=>"application/vnd.github.v3.raw"
]
r = HTTP.get(BASE_URL, header);
response = JSON.json(JSON.parse(String(r.body)));
open("foo.json","w") do f 
    write(f, response) 
end

init("foo.json");
rm("foo.json");
realdb_init(DB_URL);
DATA = realdb_get("/Data", auth_header());
lasttimecheck = DateTime.(DATA["lasttimecheck"]);

whitelist =  delete!(Set(map(x->x["username"],values(DATA["whitelist"]))), nothing);
gitsubscribelist = delete!(Set(map(x->x["gitid"],values(DATA["gitsublist"]))), nothing);
ytsubscribelist = delete!(Set(map(x->x["channelid"],values(DATA["ytsublist"]))), nothing);
mediumsubscribelist = delete!(Set(map(x->x["blogid"],values(DATA["mediumsublist"]))), nothing);

# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageCreate) 
    # People in whitelist can add other people to the whitelist
    if e.message.author.username in whitelist && startswith(e.message.content, "/whitelist")
        username =  split(e.message.content, " ")[2]
        println("Adding to whitelist, ", username)
        push!(whitelist, username)
        body =Dict("username" => username)
        realdb_post("/Data/whitelist", auth_header(), body)
        println("New member added with name: ",username)
        println("Whitelist: ", whitelist)
        return
    end

    # Remove person from whitelist only I can do that 
    if e.message.author.username == "murphy" && startswith(e.message.content, "/removefromlist")
        username = split(e.message.content, " ")[2]
        println("Removing from whitelist, ", username)
        delete!(whitelist, username)
        body =Dict("username" => username)
        realdb_delete("/Data/whitelist", auth_header(), body)
        println("Member removed with name:",username)
        println("Whitelist: ", whitelist)
        return
    end

    # To not recieve bot messages and also to avoid message from anyone outside whitelist
    if e.message.author.username == "volka" && e.message.content !="/hourcheck" || e.message.author.username ∉ whitelist
        # println("Either a bot messaged or person not in whiteslist")
        return
    end

    println("\n\n Received message: $(e.message.content)")
    # println("Received messagea author: $(e.message.author.username)")

    # To do git,yt, medium subscribe 
    if e.message.author.username in whitelist 
        # Create embeds for these methods
        println("Some subscribe:")
        if startswith(e.message.content, "/gitsub")
            #assuming in input format: https://github.com/ashwani-rathee/Firebase.jl
            ## add a method to check if repo is public or not
            newsub = join(split(e.message.content," ")[end-1:end],"/")
            println("Git Subscribing to: ", newsub )
            push!(gitsubscribelist, newsub)
            body = Dict("gitid" => newsub)
            realdb_post("/Data/gitsublist", auth_header(), body)
            println("Git Subscribed to: ", gitsubscribelist)
            return
        elseif startswith(e.message.content, "/ytsub")
            # assuming in format : https://www.youtube.com/playlist?list=PLnD4WkNzClnyy1ZWhZRWUIzOBsMb2AU76 where last part is playlist name id

            ## add a method to check if playlist is public or not
            newsub = split(e.message.content, "=")[end]
            println("Youtube Subscribing to: ", newsub )
            push!(ytsubscribelist, newsub)
            body =Dict("channelid" => newsub)
            realdb_post("/Data/ytsublist", auth_header(), body)
            println("Youtube Subscribed to: ", ytsubscribelist)
            return
        elseif startswith(e.message.content, "/mediumsub")
            # assuming in format : https://medium.com/feed/@ashwanirathee
            # assuming in format : ashwanirathee
            newsub = split(e.message.content, " ")[2]
            println("Medium Subscribing to: ", newsub )
            push!(mediumsubscribelist, newsub)
            body =Dict("blogid" => newsub)
            realdb_post("/Data/mediumsublist", auth_header(), body)
            println("Medium Subscribed to: ", mediumsubscribelist)
            return
        end
    end

    function checkgitsubscribes(c, e, gitlist, lt, token, channel)
        myauth = GitHub.authenticate(token) # don't hardcode your access tokens!
        sincewhen = "$(lt)" # "2022-01-01T00:00:57.400"
        myparams = Dict("since" => sincewhen, "page" => 1);
        for i in gitlist
            # repo_name = "ashwani-rathee/Firebase.jl"
            repo_name = i
            prs, page_data = commits(repo_name; params = myparams, page_limit = 10)
            if length(prs) == 0
                return
            end
            for i in 1:length(prs)
                minorembed = Embed(
                    color = 0xcafafe,
                    title = "Commit Message: $(prs[i].commit.message)",
                    description = "Author: [$(prs[i].committer.login)]($(prs[i].committer.html_url)) ",
                    url ="$(prs[i].html_url)",
                    fields = [
                        EmbedField(
                            name = "Commit Time:",
                            value = "$(prs[1].commit.committer.date)",),],
                    author = EmbedAuthor(
                        name = "$(repo_name)",
                        icon_url = "https://i.imgur.com/Ipt5aKr.png",
                    ),
                )
                create_message(c, channel; embed=minorembed)
                
            end
        end
    end

    function checkytsubscribes(c, e, ytlist, lt, token, channel)
        lastimecheck = lt
        for i in ytlist
            response = HTTP.get("https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=3&playlistId=$(i)&key=$(token)")
            results = JSON.parse(String(response.body))
            for i in results["items"]
                if  DateTime.(i["snippet"]["publishedAt"][1:end-1]) > DateTime.(lasttimecheck)
                    minorembed = Embed(
                        color = 0xcafafe,
                        title = "Title: $(i["snippet"]["title"])",
                        description = "Author: [$(i["snippet"]["channelTitle"])]($(i["snippet"]["channelId"])) ",
                        url ="https://youtu.be/$(i["snippet"]["resourceId"]["videoId"])",
                        fields = [
                            EmbedField(
                                name = "Published At:",
                                value = " Val : $(i["snippet"]["publishedAt"])",),],
                        author = EmbedAuthor(
                            name = "Val: $(i["snippet"]["channelTitle"])",
                            icon_url = "https://i.imgur.com/Ipt5aKr.png",
                        ),
                    )
                    println("New Vid: ", i["snippet"]["title"])
                    create_message(c, channel; embed=minorembed)
                end
            end
        end

    end

    function checkmediumsubscribes(c, e, mediumsubscribelist, lt, channel)
        lastimecheck = lt
        for i in mediumsubscribelist
            response = HTTP.get("https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@$(i)")
            results = JSON.parse(String(response.body))
            for i in results["items"]
                if  DateTime.(i["pubDate"], dateformat"yyyy-mm-ss HH:MM:SS") > DateTime.(lasttimecheck)
                    minorembed = Embed(
                        color = 0xcafafe,
                        title = "Title: $(i["title"])",
                        description = "Author: [$(i["author"])]($(i["author"])) ",
                        url ="$(i["link"])",
                        fields = [
                            EmbedField(
                                name = "Published At:",
                                value = "$(i["pubDate"])",),],
                        author = EmbedAuthor(
                            name = "$(i["author"])",
                            icon_url = "https://i.imgur.com/Ipt5aKr.png",
                        ),
                    )
                    println("New Posts:", i["title"])
                    create_message(c, channel; embed=minorembed)
                end
            end
        end
    end
    
    if e.message.content == "/hourcheck"

        gitsubchannel = DATA["gitsubchannel"]
        ytsubchannel = DATA["ytsubchannel"]
        blogchannel = DATA["blogchannel"]
        checkgitsubscribes(c, e, gitsubscribelist, lasttimecheck, DATA["GITHUB_TOKEN"] , gitsubchannel)
        checkytsubscribes(c, e, ytsubscribelist, lasttimecheck, DATA["YOUTUBE_TOKEN"],  ytsubchannel)
        checkmediumsubscribes(c, e, mediumsubscribelist, lasttimecheck, blogchannel)
        global lasttimecheck = "$(now())";
        realdb_put("/Data/lasttimecheck", auth_header(), String(lasttimecheck))
        println("lasttimecheck: $(lasttimecheck)")
        return
    end

    # Add a reaction to the message.
    if e.message.content == "Hello"
        reply(c, e.message, "Hey Monsieur!!")
    end

    if e.message.content == "I failed."
        reply(c, e.message, "Why do we fall sir? So that we can learn to pick ourselves up.")
    end

    if e.message.content =="You still haven't given up on me?"
        reply(c, e.message, "Never.")
    end

    if e.message.content == "/meta.init()"
        create(c, Reaction, e.message, '👍')
    end

    if e.message.content == "/meta.test()"
        x = rand(100, 100)
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (10, 10)), "text/plain", x)
        s = String(take!(io))
        reply(c, e.message, s)
    end

    if e.message.content == "help()"
        string = "
         Hey, I am Julian() \n 
         - meta.init() => MetaProgramming Environment Setup
         - meta.test() => MetaProgramming Test
         - help() => To get documented help
         - add 1,1 =-> Some Math I guess
         - Hello => To get a greeting {back} `Hello Monsieur`
         "
        reply(c, e.message, string)
    end

    if e.message.content == "versioninfo()"
        x = versioninfo()
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        reply(c, e.message, s)
    end

    if e.message.content == "/graph.histogram()"
        x = histogram(randn(1000) .* 0.1, nbins = 15, closed = :left)
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "/graph.lineplot()"
        x = lineplot([cos, sin], -π / 2, 2π)
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "/graph.scatterplot()"
        x = scatterplot(randn(50), randn(50), title = "My Scatterplot")
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "/graph.barplot()"
        x = barplot(
            ["Paris", "New York", "Moskau", "Madrid"],
            [2.244, 8.406, 11.92, 3.165],
            title = "Population",
        )
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "./rolessetup"
        message = fetchval(create_message(c, e.message.channel_id;embed=roleembed ))
        create(c, Reaction, message, "🙋‍♀️")
        sleep(2)
        create(c, Reaction, message, "🙋")
        sleep(2)
        create(c, Reaction, message, "🧑‍🤝‍🧑")
        sleep(2)
        create(c, Reaction, message, "🤷")
        sleep(2)
    end
  
    if e.message.content == "./setuprules"
        println("Message Id: ",e.message.id) # 849547078085902386
        println("Channel Id: ",e.message.channel_id) # 849324471106142258
        message = fetchval(create_message(c, e.message.channel_id;embed=ruleembed ))
        println("Bot Message Id: ",message.id) # 849547078085902386
        println("Bot Channel Id: ",message.channel_id) # 849324471106142258
    end

    if e.message.content == "./welcomefrens"
        println("Message Id: ",e.message.id) # 849547078085902386
        println("Channel Id: ",e.message.channel_id) # 849324471106142258
        
        message = fetchval(upload_file(c, fetchval(get_channel(c, e.message.channel_id)), "assets/welcome.jpg"))
        sleep(5)
        println("Bot Message Id: ",message.id) # 849547078085902386
        println("Bot Channel Id: ",message.channel_id) # 849324471106142258
    end
end

function handler(c::Client, e::MessageReactionAdd)
    if e.channel_id == 818877472207667231 || e.channel_id == 843007182784954389
        try 
            role = genderpronouns[string(e.emoji)] 

            # get all current roles of a user
            currentroles =  fetchval(get_guild_member(c, e.guild_id, e.user_id))

            userroles = []
            for i in currentroles.roles
                push!(userroles, roles1b[i])
            end
            for i in userroles
                pos = ["He/Him", "She/Her", "They/Them", "Ask me my gender pronouns"]
                if i in ["He/Him", "She/Her", "They/Them", "Ask me my gender pronouns"]
                    remove_guild_member_role(c, e.guild_id, e.user_id, roles1a[i])
                    delete_user_reaction(c, e.channel_id, e.message_id, opp[i], e.user_id)
                end
            end
            add_guild_member_role(c, e.guild_id, e.user_id, roles1a[role])
            return
        catch
            delete_user_reaction(c, e.channel_id, e.message_id, string(e.emoji), e.user_id)
            return
        end

    end  
end

# scheduled timer
@async begin
    while true
        sleep(Hour(1))
        create_message(c, 843007182784954389; content = "/hourcheck")
    end
end

# Add the handler.
add_handler!(c, MessageCreate, handler)
add_handler!(c, MessageReactionAdd, handler)

# Log in to the Discord gateway.
open(c)

wait(c)