# include("pages.jl")
using InteractiveUtils
using UnicodePlots
# Import Discord.jl.
using Discord
# Create a client.

DISCORD_TOKEN ="ODQzMDAwMTA5NzgzODQyODE2.YJ9fCA.lMn9HOx4PDdlKrXTLf3d1HXd4zE"
c = Client(DISCORD_TOKEN; presence = (game = (name = "Julia", type = AT_GAME),))

page1 = Embed(
    color = 0xfc4445,
    title = "The Art of War",
    description = "[Sun Tzu](https://en.wikipedia.org/wiki/Sun_Tzu) ",
    url ="https://youtu.be/iAbnEUA0wpA",
    fields = [
        EmbedField(
            name = "Laying Plans",
            value = "
```md
1. Sun Tzu said: The art of war is of vital importance to the State.
2. It is a matter of life and death, a road either to safety or to ruin. Hence it is a subject of inquiry which can on no account be neglected.
3. The art of war, then, is governed by five constant factors, to be taken into account in one’s deliberations, when seeking to determine the conditions obtaining in the field.
4. These are:
    - The Moral Law;
    - Heaven;
    - Earth;
    - The Commander;
    - Method and discipline.
5. The Moral Law causes the people to be in complete accord with their ruler, so that they will follow him regardless of their lives, undismayed by any danger.
6. Heaven signifies night and day, cold and heat, times and seasons.
```",
),
    ],
    author = EmbedAuthor(
        name = "Ashwani Rathee",
        icon_url = "https://i.imgur.com/Ipt5aKr.png",
    ),
    thumbnail = EmbedThumbnail(url = "https://i.imgur.com/JB7eKtZ.jpg"),
    # image = EmbedImage(url = "https://i.imgur.com/Ipt5aKr.png"),
    # video = EmbedVideo(url = "https://youtu.be/iAbnEUA0wpA", width = 932, height = 524),
    footer = EmbedFooter(text = "Page 1", icon_url = "https://i.imgur.com/Ipt5aKr.png"),
)
page2 = Embed(
    color = 0x3feee6,
    title = "The Art of War",
    description = "[Sun Tzu](https://en.wikipedia.org/wiki/Sun_Tzu) ",
    url ="https://youtu.be/iAbnEUA0wpA",
    fields = [
        EmbedField(
            name = "Laying Plans",
            value = "
```md
7. Earth comprises distances, great and small; danger  and security; open ground and narrow passes; the  chances of life and death.
9. The Commander stands for the virtues of  wisdom, sincerely, benevolence, courage and strictness.
10. By method and discipline are to be understood the  marshaling of the army in its proper subdivisions, the  graduations of rank among the officers, the maintenance of roads by which supplies may reach the army, \n and the control of military expenditure.
11. These five heads should be familiar to every general:  he who knows them will be victorious; he who  knows them not will fail.
12. Therefore, in your deliberations, when seeking to  determine the military conditions, let them be made the  basis of a comparison, in this wise:—
```"
),
    ],
    author = EmbedAuthor(
        name = "Ashwani Rathee",
        icon_url = "https://i.imgur.com/Ipt5aKr.png",
    ),
    thumbnail = EmbedThumbnail(url = "https://i.imgur.com/JB7eKtZ.jpg"),
    # image = EmbedImage(url = "https://i.imgur.com/Ipt5aKr.png"),
    # video = EmbedVideo(url = "https://youtu.be/iAbnEUA0wpA", width = 932, height = 524),
    footer = EmbedFooter(text = "Page 2", icon_url = "https://i.imgur.com/Ipt5aKr.png"),
)
page3 = Embed(
    color = 0x55bcc9,
    title = "The Art of War",
    description = "[Sun Tzu](https://en.wikipedia.org/wiki/Sun_Tzu) ",
    url ="https://youtu.be/iAbnEUA0wpA",
    fields = [
        EmbedField(
            name = "Laying Plans",
            value = "
```md
13. Some more important questions:-
    - Which of the two sovereigns is imbued with the Moral law?
    - Which of the two generals has most ability?
    - With whom lie the advantages derived from Heaven and Earth?
    - On which side is discipline most rigorously enforced?
    - Which army is stronger?
    - On which side are officers and men more highly trained?
    - In which army is there the greater consistency  both in reward and punishment?
14. By means of these seven considerations I can forecast victory or defeat.
15. The general that hearkens to my counsel and
acts upon it, will conquer: let such a one be retained in
command! The general that hearkens not to my counsel nor acts upon it, will suffer defeat:—let such a one
be dismissed!

```",
),
    ],
    author = EmbedAuthor(
        name = "Ashwani Rathee",
        icon_url = "https://i.imgur.com/Ipt5aKr.png",
    ),
    thumbnail = EmbedThumbnail(url = "https://i.imgur.com/JB7eKtZ.jpg"),
    # image = EmbedImage(url = "https://i.imgur.com/Ipt5aKr.png"),
    # video = EmbedVideo(url = "https://youtu.be/iAbnEUA0wpA", width = 932, height = 524),
    footer = EmbedFooter(text = "Page 3", icon_url = "https://i.imgur.com/Ipt5aKr.png"),
)
page4 = Embed(
    color = 0x97caef,
    title = "The Art of War",
    description = "[Sun Tzu](https://en.wikipedia.org/wiki/Sun_Tzu) ",
    url ="https://youtu.be/iAbnEUA0wpA",
    fields = [
        EmbedField(
            name = "Laying Plans",
            value = "
```md
16. While heading the profit of my counsel, avail yourself 
also of any helpful circumstances over and beyond
the ordinary rules.
17. According as circumstances are favorable, one
should modify one’s plans.
18. All warfare is based on deception.
19. Hence, when able to attack, we must seem
unable; when using our forces, we must seem inactive;
when we are near, we must make the enemy believe we
are far away; when far away, we must make him
believe we are near.
20. Hold out baits to entice the enemy. Feign disorder, and crush him.
21. If he is secure at all points, be prepared for him. If
he is in superior strength, evade him.

```",
),
    ],
    author = EmbedAuthor(
        name = "Ashwani Rathee",
        icon_url = "https://i.imgur.com/Ipt5aKr.png",
    ),
    thumbnail = EmbedThumbnail(url = "https://i.imgur.com/JB7eKtZ.jpg"),
    # image = EmbedImage(url = "https://i.imgur.com/Ipt5aKr.png"),
    # video = EmbedVideo(url = "https://youtu.be/iAbnEUA0wpA", width = 932, height = 524),
    footer = EmbedFooter(text = "Page 4", icon_url = "https://i.imgur.com/Ipt5aKr.png"),
)
page5 = Embed(
    color = 0xcafafe,
    title = "The Art of War",
    description = "[Sun Tzu](https://en.wikipedia.org/wiki/Sun_Tzu) ",
    url ="https://youtu.be/iAbnEUA0wpA",
    fields = [
        EmbedField(
            name = "Laying Plans",
            value = "
```md
22. If your opponent is of choleric temper, seek to irritate him.\n Pretend to be weak, that he may grow arrogant.
23. If he is taking his ease, give him no rest. If his
forces are united, separate them.
24. Attack him where he is unprepared, appear
where you are not expected.
25. These military devices, leading to victory, must not
be divulged beforehand.
26. Now the general who wins a battle makes
many calculations in his temple ere the battle is fought.
The general who loses a battle makes but few calculations beforehand.\n Thus do many calculations lead to
victory, and few calculations to defeat: how much more
no calculation at all! It is by attention to this point that
I can foresee who is likely to win or lose.
```",
),
    ],
    author = EmbedAuthor(
        name = "Ashwani Rathee",
        icon_url = "https://i.imgur.com/Ipt5aKr.png",
    ),
    thumbnail = EmbedThumbnail(url = "https://i.imgur.com/JB7eKtZ.jpg"),
    # image = EmbedImage(url = "https://i.imgur.com/Ipt5aKr.png"),
    # video = EmbedVideo(url = "https://youtu.be/iAbnEUA0wpA", width = 932, height = 524),
    footer = EmbedFooter(text = "Page 5", icon_url = "https://i.imgur.com/Ipt5aKr.png"),
)
page = [page1, page2, page3, page4, page5]

current_page = Int64[]
embedsids = []
# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageCreate)
    println("Received message: $(e.message.content)")
    # Add a reaction to the message.
    if e.message.content == "Hello"
        # println(e.message.channel_id)
        reply(c, e.message, "Hey Monsieur!!")
        #  create(c, Message, e.message.channel_id; content = "Hello Monsieur");
    end

    if e.message.content == "I failed."
        # println(e.message.channel_id)
        reply(c, e.message, "Why do we fall sir? So that we can learn to pick ourselves up.")
        #  create(c, Message, e.message.channel_id; content = "Hello Monsieur");
    end

    if e.message.content =="You still haven't given up on me?"
        # println(e.message.channel_id)
        reply(c, e.message, "Never.")
        #  create(c, Message, e.message.channel_id; cedit_message(c, 849110011010875423, 849334932572209202; embed = page[3])ontent = "Hello Monsieur");
    end

    if e.message.content == "add 1,1"
        a = 1
        b = 1
        reply(c, e.message, "$(a+b)")
    end

    if e.message.content == "good boy"
        create(c, Reaction, e.message, '👍')
    end

    if e.message.content == "meta.init()"
        create(c, Reaction, e.message, '👍')
    end

    if e.message.content == "meta.test()"
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

    if e.message.content == "graph.histogram()"
        x = histogram(randn(1000) .* 0.1, nbins = 15, closed = :left)
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "graph.lineplot()"
        x = lineplot([cos, sin], -π / 2, 2π)
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "graph.scatterplot()"
        x = scatterplot(randn(50), randn(50), title = "My Scatterplot")
        io = IOBuffer()
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x)
        s = String(take!(io))
        # println(s)
        reply(c, e.message, "``` \n" * s * " \n ```")
    end

    if e.message.content == "graph.barplot()"
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
    if e.message.content == "embed.setup()"
        println("Message Id: ",e.message.id) # 849547078085902386
        println("Channel Id: ",e.message.channel_id) # 849324471106142258
        # edit_message(c, e.message.channel_id, e.message.id; content ="Hello",embed = page[3])
        # update(c,e.message;embed=page[3])
        message = fetchval(create_message(c, e.message.channel_id;embed=page[3] ))
        println("Bot Message Id: ",message.id) # 849547078085902386
        println("Bot Channel Id: ",message.channel_id) # 849324471106142258
        create(c, Reaction, message, "⏪")
        sleep(2)
        create(c, Reaction, message, "◀️")
        sleep(2)
        create(c, Reaction, message, "▶️")
        sleep(2)
        create(c, Reaction, message, "⏩")
        sleep(2)
        push!(embedsids, message.id)
        println(embedsids[:])
        push!(current_page,3)
        println(current_page[:])
        
    end
    if e.message.content[1:5] =="Start"
        for i in 1:5
            if parse(Int,e.message.content[7]) == i
                reply(c, e.message, "$(fetchval(get_channel_messages(c,849191171254779924))[i].content[4:end])")
            end
        end
    end
end

function handler(c::Client, e::MessageReactionAdd)
    # message = fetchval(get_channel_message(c,e.channel_id,e.message_id))
    # currentpage = parse(Int,message.embeds[1].title)
    # println(currentpage)
    # println(e.message_id)
    println("Check 1")
    if e.user_id !=843000109783842816
        println("Check 2: ")
        println(findall( x -> x == e.message_id, embedsids ))
        i = findall( x -> x == e.message_id, embedsids )[1]
        println("I:",i)

        println("Embed IDS:" ,embedsids[:])
        println("Current Pages:", current_page[:])
        println("Current Pages I :", current_page[i])
        if length(findall( x -> x == e.message_id, embedsids )) == 1
            if e.emoji.name == "⏪"
                println("Rewind")
                edit_message(c, e.channel_id, e.message_id; embed = page[1])
                global current_page[i] = 1
                println("Rewind:", current_page[i])
            end
            if e.emoji.name == "◀️" && current_page[i] != 1
                println("Back")
                edit_message(c, e.channel_id, e.message_id; embed = page[(current_page[i] - 1)])
                global current_page[i] = current_page[i] - 1
                println("Back:", current_page[i])
            end
            if e.emoji.name == "▶️" && current_page[i] != 5
                # println("Forward")
                edit_message(c, e.channel_id, e.message_id; embed = page[(current_page[i] +1)])
                global current_page[i] = current_page[i] + 1
                println("Next:", current_page[i])
            end
            if e.emoji.name == "⏩"
                println("Fast Forward")
                edit_message(c, e.channel_id, e.message_id; embed = page[5])
                global current_page[i] = 5
                println("Fast Forward:", current_page[i])
            end
            delete_user_reaction(c, e.channel_id, e.message_id, e.emoji.name, e.user_id)
        end
    end
end

# Add the handler.
add_handler!(c, MessageCreate, handler)

# Add the handler.
add_handler!(c, MessageReactionAdd, handler)
# Log in to the Discord gateway.
open(c)
# Wait for the client to disconnect.
wait(c)