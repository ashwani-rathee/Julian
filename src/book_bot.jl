# Import Discord.jl.
using Discord
# Create a client.
c = Client(ENV["DISCORD_TOKEN"]; presence = (game = (name = "Julia", type = AT_GAME),))
# const GUILD = parse(Discord.Snowflake, get(ENV, "DISCORD_GUILD_ID", "849148189998186566"))

message = fetchval(get_channel_message(c,849221959753793536,849221967746957323))
create(c, Reaction, message, "◀️")
create(c, Reaction, message, "▶️")
# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageReactionAdd )
    println("Received message: $(e)")

    if e.emoji.name =="◀️"
        edit_message(c,849221959753793536, 849221967746957323; content="
`Page 1 - Laying Plans`

```md
1. Sun Tzu said: The art of war is of vital importance to the State.
2. It is a matter of life and death, a road either to safety or to ruin. \n Hence it is a subject of inquiry which can on no account be neglected.
3. The art of war, then, is governed by five constant factors,\n to be taken into account in one’s deliberations, when seeking to determine the conditions \n obtaining in the field.
4. These are:
    (1) The Moral Law;
    (2) Heaven;
    (3) Earth;
    (4) The Commander;
    (5) Method and discipline.
5. The Moral Law causes the people to be in complete accord with their ruler, so that they will follow him \nregardless of their lives, undismayed by any danger.
6. Heaven signifies night and day, cold and heat, times and seasons.
        ```
        ")
    end
    if e.emoji.name =="▶️"
        edit_message(c, 849221959753793536, 849221967746957323; content="
`Page 2 - Laying Plans`

```md

8. Earth comprises distances, great and small; danger \n and security; open ground and narrow passes; the \n chances of life and death.
9. The Commander stands for the virtues of \n wisdom, sincerely, benevolence, courage and strictness.
10. By method and discipline are to be understood the \n marshaling of the army in its proper subdivisions, the \n graduations of rank among the officers, the maintenance of roads by which supplies may reach the army, \n and the control of military expenditure.
11. These five heads should be familiar to every general: \n he who knows them will be victorious; he who \n knows them not will fail.
12. Therefore, in your deliberations, when seeking to \n determine the military conditions, let them be made the \n basis of a comparison, in this wise:—
13. (1) Which of the two sovereigns is imbued with the Moral law?
    (2) Which of the two generals has most ability?
    (3) With whom lie the advantages derived from Heaven and Earth?
    (4) On which side is discipline most rigorously enforced?
    (5) Which army is stronger?
```
        ")
    end
    delete_user_reaction(c, 849221959753793536, 849221967746957323, e.emoji.name, 660476255094964233)
end
# Add the handler.
add_handler!(c, MessageReactionAdd, handler)
# Log in to the Discord gateway.
open(c)
# Wait for the client to disconnect.
wait(c)