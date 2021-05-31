
using InteractiveUtils
using UnicodePlots
# Import Discord.jl.
using Discord
# Create a client.
c = Client(ENV["DISCORD_TOKEN"]; presence = (game = (name = "Julia", type = AT_GAME),))

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
    # data = e.message.content[1:3]
    # dataint = parse(Int64, data)
    # if dataint == 1
    #     println("1")
    # elseif dataint == 2
    #     println("2")

    # elseif dataint == 3
    #     println("3")

    # elseif dataint == 4
    #     println("4")
    # elseif dataint == 5
    #     println("5")
    # else
    #     println("Please Choose Instruction between 1 to 5")
    # end
end

# Add the handler.
add_handler!(c, MessageCreate, handler)
# Log in to the Discord gateway.
open(c)
# Wait for the client to disconnect.
wait(c)