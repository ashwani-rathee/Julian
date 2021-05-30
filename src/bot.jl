
DISCORD_TOKEN = "ODQzMDAwMTA5NzgzODQyODE2.YJ9fCA.Sq_54KDF-EY8hkAQwov_NNeb4_4"

using InteractiveUtils

# Import Discord.jl.
using Discord
# Create a client.
c = Client(DISCORD_TOKEN; presence = (game = (name = "Julia", type = AT_GAME),))

# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageCreate)
    # Display the message contents.
    println("Received message: $(e.message.content)")
    # Add a reaction to the message.
    if e.message.content == "Hello"
        println(e.message.channel_id)
        reply(c, e.message, "Hey Monsieur!!")
        #  create(c, Message, e.message.channel_id; content = "Hello Monsieur");
    end

    if e.message.content == "add 1,1"
        a = 1
        b = 1
        reply(c, e.message, "$(a+b)")
    end
    
    if e.message.content == "good boy"
        create(c, Reaction, e.message, '👍')
    end

    if e.message.content=="meta.init()"
        create(c, Reaction, e.message, '👍')
    end

    if e.message.content == "meta.test()"
        x=rand(100,100);
        io = IOBuffer();
        show(IOContext(io, :limit => true, :displaysize => (10, 10)), "text/plain", x);
        s = String(take!(io));
        reply(c, e.message , s)
        # println(s)
        # io = IOBuffer();
        # show(IOContext(io, :limit => true, :displaysize => (20, 40)), "text/plain", x);
        # s = String(take!(io));
        # reply(c, e.message , s)

    end

    if e.message.content == "help()"
        string ="
        Hey, I am Julian() \n 
        - meta.init() => MetaProgramming Environment Setup
        - meta.test() => MetaProgramming Test
        - help() => To get documented help
        - add 1,1 =-> Some Math I guess
        - Hello => To get a greeting {back} `Hello Monsieur`
        "
        reply(c, e.message , string)
    end
    if e.message.content == "versioninfo()"
        x = versioninfo()
        io = IOBuffer();
        show(IOContext(io, :limit => true, :displaysize => (100, 100)), "text/plain", x);
        s = String(take!(io));
        reply(c, e.message , s)
    end
end

# Add the handler.
add_handler!(c, MessageCreate, handler)
# Log in to the Discord gateway.
open(c)
# Wait for the client to disconnect.
wait(c)