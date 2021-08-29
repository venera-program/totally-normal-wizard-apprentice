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
//choice like '*[examine the parlor]'
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

//choices here: a) examine desk (if not been to rug, -> rug, if have seen rug, -> desk)
//b) examine paintings (see a) c) examine armchair (see a) d) (conditional to seen-rug) examine safe e) examine lunarium f) (conditional to not (both have-grager AND have-safekey1)) examine fireplace g) bother the wizard
->->

=== room_couch ===
the couch. talk to the wizard. she has clues for the paperweight, the paintings, the safe, the tea, the books, the parrots in the lunarium, and the telescope. u can also ask if your master is back yet (again).
->->

=== room_fireplace ===
//not-grager, has-grager, not-safekey1, has-safekey1 all track item/inventory states
#not-grager
The Wizard's FIREPLACE probably did hold fires at some point. It has a mantle and casing carved of heavy pale marble in ornate swoops and swirls; a brass fire grate and poker stand off to one side half-forgotten. At some point in the last five hundred years, though, the Wizard has converted the hearth into a large FISHTANK for little candy-striped peppermint angelfish. You tap on the glass.

#has-grager
The glass FISHTANK in the hearth is now a ruined husk of shattered glass and a sharp puddle on the floor, angelfish flopping around helplessly. You wonder briefly if you could eat one.

#not-safekey1
The mantle is covered with small curios, but what really catches your eye is a TAXIDERMY TIGER HEAD mounted on the wall above it. You think you see something glimmering in its mouth.

//gather here?
//(has-paperweight and not-grager) [*smash fishtank] (-> fishtank2)
//(not-paperweight & not came from fishtank1) [+examine fishtank] (-> fishtank1)
//(not-safekey1 and seen-footstool) [*drag over the footstool] (->tiger2)
//(not-safekey and not-footstool and not came from tiger1) [+examine tiger head] (->tiger1)
//[+look somewhere else] (-> hub)
->->
= fishtank1
You appraise the fishtank. The red-and-white striped fish are pretty, vibrant against the brick of the old fireplace. What really catches your eye is something half-buried in the sand at the bottom. It glistens, but barely, as if it's made of worn tin. But you can't find any way to open the fishtank— it must be built into the hearth, and a few repeated taps on the glass tell you it's too heavy to break. You'll have to look around and see if anything else gives you ideas.

//go back to choice loop/gather in room_fireplace
->->
= fishtank2
You heft the paperweight in both hands and swing it as hard as you can into the glass.

CRASH

Splinters of glass fly past your face. Water rushes out of the jagged hole in the side of the fishtank, carrying angelfish with it. You stick your little hand in through the hole and pry the mystery object from the bottom. It's covered in sand and gravel, so it takes a few tugs. #has-grager
//(-> instruments.grager)
->->
= tiger1
The snarling tiger head on the wall above stares down at you with glass eyes. There definitely is something gold on its tongue, but you can't quite see what, and it's too high up for you to reach— you're not quite five foot, after all.

//go back to choice loop/gather in room_fireplace
->->
= tiger2
Looking up at the tiger head, you have a brilliant realization. You can just stand on something to be taller!

You cross the room back to the armchair and grab its footstool. With some difficulty— it's heavier than it looks— you carry it over, set it down in front of the [has-grager: ruined] fishtank, and stand on it. Perfect. You're now at eye height with the tiger and can easily reach in and yank the object you saw out: an ornate golden key, gold thread wrapped around the knob at the end. So what if you also yank out the tiger's left tooth?#has-safekey1
//go back to choice loop/gather in room_fireplace
->->

=== room_lunarium ===
the lunarium. feed the parrots to the plants, get desk key.
->->
= parrots1
examine the parrots. take a feather for inventory clue?
->->
= parrots2
feeding time.
->->
= plants
examine the carnivorous plants
->->

=== room_armchair ===
The Wizard's ARMCHAIR by the window is somehow both fancy and squashy— lavishly upholstered, yet comfortable looking. It has a matching FOOTSTOOL nearby, equally comfortable looking, and a wooden table taken up by various teapots, cups, saucers, sugar bowls, and containers of TEA. On the floor stands an enormous enameled SAMOVAR, bright blue and chartreuse and probably big enough to boil you alive inside. #seen-footstool

A copper TELESCOPE on a stand is aimed out the window, gazing out into the lunar jungle, dark green foliage rich with translucent flowers and bioluminescent birds.
//gather here
//+sit down and put your feet up (->sit)
//*make yourself some tea (-> samovar)
//+look through the telescope (been to telescope ->telescope1, else telescope2)
//[+look somewhere else] (-> hub)
->->
= sit
You sit down (been here: again) and put your feet up. You almost sink into the upholstery, and the footstool is comfortable under your feet. You wonder if the Wizard likes to fall asleep in this armchair. Your Master calls this 'pondering the infinities of the universe.'

You think you doze for a few minutes, but you wake up with a crook in your neck and a renewed determination to get out of this stuffy parlor.
//go back to armchair gather
->->
= samovar
You decide to make yourself some tea. The samovar already has hot water; the Wizard told you a fire spirit lives in it and keeps it warm at all times, in case she wants a drink during late night research. The concentrate from the teapot on top of the water heater smells fragrant and spiced. You spill half of it over the table as you pour it into your cup, then spill more as you try to dump as much milk and sugar in as humanly possible. #has-tea

Then you burn your tongue on it. Damn, it's hot! Stupid fire spirit. You have to put it down and drink it later.
//go back to armchair gather
->->
= telescope1
You pull the telescope around to fit your height and peer through. It takes extensive fiddling to focus it, but your Master's always said you were too clever for your own good, and you figure it out. (glue this to telescope2? thread it in and glue it? i want one paragraph)
//go to telescope2
->->

= telescope2
The telescope lense comes into focus in the midst of the lush jungle outside, on a large amethyst parrot stuck in a venus flytrap about your own height, struggling in futility. You watch with fascination for several minutes before you get bored.
//back to armchair gather
->->

=== room_desk ===
The Wizard's hulking wooden desk is carved with lunar sigils and elaborate swirls; behind it is an equally oversized wooden chair. Its surface is littered with BOOKS; besides those, the only notable object is a huge and brilliant GEODE, cracked open and currently serving as a PAPERWEIGHT.
//(not has-paperweight
->->
= desk
examine desk and find locked drawer.
->->

= drawer
open with desk key if you have it and get kazoo.
->->
= books1
look at books.
->->
= books2
if you've made tea, pour tea on books and get lunarium clue 2.
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

= grager
the grager
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
