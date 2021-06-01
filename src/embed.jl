
using InteractiveUtils
using UnicodePlots
# Import Discord.jl.
using Discord
# Create a client.
c = Client(ENV["DISCORD_TOKEN"]; presence = (game = (name = "Julia", type = AT_GAME),))

# message = fetchval(get_channel_message(c,e.channel_id, e.message_id))
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
 # Send a message to the channel.
# message = fetchval(create_message(c, 849110011010875423; content="Hello, world!"))
# delete_all_reactions(c, 849110011010875423, 849334358427172904)
# delete_all_reactions(c, 849224579259432990, 849224581051056138)
# message = fetchval(get_channel_message(c, 849110011010875423, 849194790150602753))
# create(c, Reaction, message, "⏪")
# sleep(2)
# create(c, Reaction, message, "◀️")
# sleep(2)
# create(c, Reaction, message, "▶️")
# sleep(2)
# create(c, Reaction, message, "⏩")
# sleep(2)
# edit_message(c, 849110011010875423, 849334932572209202; content="")
edit_message(c, 849110011010875423, 849334932572209202; embed = page[3])
currentpage = 3
# currentpage = 1
# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageReactionAdd)
    # message = fetchval(get_channel_message(c,e.channel_id,e.message_id))
    # currentpage = parse(Int,message.embeds[1].title)
    # println(currentpage)
    # println(e.message_id)
    if e.message_id == 849334932572209202
        if e.emoji.name == "⏪"
            # println("Rewind")
            edit_message(c, e.channel_id, e.message_id; embed = page[1])
            global currentpage = 1
            # println("Rewind:", currentpage)
        end
        if e.emoji.name == "◀️" && currentpage != 1
            # println("Back")
            edit_message(c, e.channel_id, e.message_id; embed = page[currentpage-1])
            global currentpage = currentpage - 1
            # println("Back:", currentpage)
        end
        if e.emoji.name == "▶️" && currentpage != 5
            # println("Forward")
            edit_message(c, e.channel_id, e.message_id; embed = page[currentpage+1])
            global currentpage = currentpage + 1
            # println("Next:", currentpage)
        end
        if e.emoji.name == "⏩"
            # println("Fast Forward")
            edit_message(c, e.channel_id, e.message_id; embed = page[5])
            global currentpage = 5
            # println("Fast Forward:", currentpage)
        end
        delete_user_reaction(c, e.channel_id, e.message_id, e.emoji.name, e.user_id)
    end
end
# Add the handler.
add_handler!(c, MessageReactionAdd, handler)
# Log in to the Discord gateway.
open(c)
# Wait for the client to disconnect.
wait(c)