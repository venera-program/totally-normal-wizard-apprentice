//3/30 segments done

=== title ===
title screen.
->->

== intro ===

"I'm bored," you say, for the fiftieth time.

The five-hundred-year-old Master Wizard exhales a puff of violet pipe-smoke and passes her hand wearily over her eyes. "I know," she says.

You are not a five-hundred-year-old Master Wizard. You are twelve. You do not care that you have also already asked your next question forty-nine times. "When is my Master coming back?"

The Wizard takes a deep breath and answers you very slowly as if she were trying not to become annoyed. "Your Master has climbed the highest mountain in the lowest valley on the Recursive Moons, to answer the three riddles of the Lunar Sphinx, to fight the Roc, to steal its egg, to crack it open to find the diamond to cure the King's daughter of her curse of eternal sleep so that she can marry the Prince of the Three Suns and avert a war that will kill us all. It is possible that he will not be back for quite some time."

"So not before dinner?"

"No," she snaps.

"Can I explore your tower?"
//that needs to be a choice that moves to p2
->->

= p2
"Also no."

"Why not?"

"Because," she says through her teeth, "you are a little shit, and although I have no idea why my esteemed friend your Master took you on as his apprentice, my tower is full of extremely dangerous spells and contraptions which would probably kill you in an instant and I have explicitly promised to keep you alive. So no, absolutely not, under no circumstances."

"But I want to."

"What part of ABSOLUTELY NOT do you not understand?!"

"OKAY," you say, sulky. "You didn't have to YELL."

The Master Wizard drags her jewel-ringed hand down across her face with a look somewhere between murder and despair.

"You may not under any circumstances leave this parlor," she says. "In fact, the door is sealed to only open or close under my own hand, so don't even bother. I am going to take a nap. Try not to explode yourself with your latent sorcerous energies."

She flops down on the couch where she's been sitting in a surprisingly undignified way, rolls over, and stuffs a pillow over her head.

You make it about five minutes into listening to her snore before you stand up from your nest of pillows on the floor and resolve to find a way to make it out of the parlor yourself.
//choice like '*[examine the parlor]' or some shit
->->

=== hub ===
The Master Wizard's parlor is a long room paneled in dark wood and full of tchotchkes, tapestries, pinned butterflies, books, paintings, arcane contraptions, empty liquer bottles, and various ITEMS of almost every kind imaginable. You could probably amuse yourself here without leaving, but it's hot and stuffy and the violet fumes coming from the pipe in the ashtray are making you nauseous. 

You've already tried the heavy carved DOOR at the far east end of the room, but you're sure you can figure out a way to open it if you poke around enough.

To the right of the door, on the NORTH side of the room, is the Wizard's oversized DESK, an small sitting area by a window with an ARMCHAIR, and the glass-walled bay of the LUNARIUM, full of the Wizard's strange plants.

Along the SOUTH wall of the room is a PORTRAIT WALL full of paintings of old people you don't care about.

//seen-rug is a conditional for, has tripped over rug and thus knows about the safe. id like to glue this to the above line ('along the south...') if possible.
#seen-rug
In the MIDDLE of the room is an ornate gold-and-purple RUG, which you've pulled aside to reveal a SAFE.

At the WEST end of the room is a cavernous FISHTANK-FIREPLACE, and next to that are the COUCHES and cushions where the Wizard is trying to sleep.

//conditional text based on if you've seen this loop before
What should you try [first/next]?

//choices here: a) examine desk b) examine paintings c) examine armchair d) (conditional to seen-rug) examine safe e) examine lunarium f) examine fireplace g) bother the wizard
->->

=== room_couch ===
the couch. talk to the wizard.
->->

=== room_fireplace ===
//not-grager, has-grager, not-safekey1, has-safekey1 all track item/inventory states
#not-grager
The Wizard's FIREPLACE probably did hold fires at some point. It has a mantle and casing carved of heavy pale marble in ornate swoops and swirls; a brass fire grate and poker stand off to one side half-forgotten. At some point in the last five hundred years, though, the Wizard has converted the hearth into a large FISHTANK for little candy-striped peppermint angelfish. You tap on the glass.

#has-grager
uhhh

#not-safekey1
The mantle is covered with small curios, but what really catches your eye is a TAXIDERMY TIGER HEAD mounted on the wall above it.

#has-safekey1
->->
= fishtank
examine fishtank. smash if you have paperweight. get grager.
->->
= tiger
examine tiger head. stand on footstool to get to it if you've already looked at the footstool. get safe key 1.
->->

=== room_lunarium ===
the lunarium. feed the parrots to the plants, get desk key.
->->
= parrots
examine the parrots. take a feather for inventory clue?
->->
= plants
examine the carnivorous plants
->->

=== room_armchair ===
the armchair. make and take tea, take footstool, look through telescope and get lunarium clue 1.
->->
= footstool
grab the footstool.
->->
= samovar
make tea with the samovar. take tea for inventory clue.
->->
= telescope
look through the telescope. get clue.
->->

=== room_desk ===
the desk. take paperweight, open drawer with desk key and get kazoo, pour tea on books and get lunarium clue 1.
->->
= desk
examine desk and find locked drawer. open with desk key if you have it and get kazoo.
->->
= books
look at books. if you've made tea, pour tea on books and get lunarium clue 2.
->->
= paperweight
take paperweight.
->->

=== room_portraits ===
the portraits. rearrange portraits and get safe key 2.
->->
= portraits
examine and rearrange the portraits.
->->

=== room_rug ===
the rug. move rug, open the safe with two safe keys and get otomatone.
->->
= move_rug
move the rug.
->->
= safe
examine safe. open if you have both safe keys and find otamatone.
->->

=== instruments ===
what happens when you find each instrument.
->->

= gragger
the gragger
->->

= kazoo
the kazoo
->->

= otamatone
the otomatone.
->->

=== outro ===
the game ends because you annoyed the wizard too much and she opens the door and kicks you out.
->->

=== credits ===
us :)
->->
    -> END
