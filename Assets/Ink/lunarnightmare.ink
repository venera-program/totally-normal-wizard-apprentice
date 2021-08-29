INCLUDE logic.ink

LIST inventory = paperweight, grager

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
//(has-paperweight and not-grager) [*smash fishtank with paperweight] (-> fishtank2)
//(not-paperweight & not came from fishtank1) [+examine fishtank] (-> fishtank1)
//(not-safekey1 and seen-footstool) [*drag over the footstool] (->tiger2)
//(not-safekey and not-footstool and not came from tiger1) [+examine tiger head] (->tiger1)
//[+look somewhere else] (-> hub)
-> choices_fireplace
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
The LUNARIUM is your favorite part of the parlor, and entertained you for a solid fifteen minutes when your Master first dropped you off. It's bathed in soft moonglow through the floor-to-ceiling windows and skylights, and the lushest part of the jungle trees and creeping vines are visible outside. Inside, a large BIRDCAGE covered with a blanket sits on an iron table, inside of which you know the Wizard's three PARROTS are sleeping. Because she had to repeatedly ask you not to annoy them. On shelves around, and on the dark slate-tiled floor, tropical PLANTS from all over the Recursive Moons sit in brightly colored pots. Orchids, hibiscus, birds-of-paradise, and others you've never seen.

Pride of place on the floor is given to the three largest plants, half as tall as you: a pink SUNDEW, a green VENUS FLYTRAP, and a pink and green PITCHER plant. The Wizard refused to let you feed them your vegetables from lunch.

//gather
//(not-parrots) [+bother the parrots] (-> parrots1)
//(not-fedplants) [+examine the plants] (-> plants)
//(seen-parrots and has-lunarium1 and has-lunarium2) [*feed the parrots to the plants]
//[+look somewhere else] (-> hub)
->->
= parrots1
You lift the blanket over the ornate birdcage and look in at the parrots. They're mid-sized, all morphs of the same species only found on the Hundred And Thirty-First Moon— a pink one, standard wild coloring, a domestic-bred green colored one, and a mottled pink-and-green that must be a crossbreed. They lift their heads from under their wings and look at you sleepily.

You (not-parrots: grab a pink feather from the bottom of the cage,) pull the blanket back down(,) and let them be for now.
->->
//back to lunarium gather
= parrots2
That which is above is like that which is below, right? And the parrots are definitely ABOVE the plants. And like consumes like, something like that? And you saw a plant eating a much larger bird outside the window. And the colors of the parrots in the cage are the same as the colors of the plants. And you want to see a plant eat something. Ergo, you should feed the parrots to the giant carnivorous plants. QED.

This is an excellent decision that makes complete logical sense and will not make anyone angry.

You feed the green parrot to the green flytrap, the pink parrot to the pink sundew, and the pink-and-green bird to the mottled pink and green pitcher plant. A totally logical hypothesis, right?

. . . nothing in particular happens.

BUT when you drop the last parrot into the pitcher, the water is displaced and a small iron key spills over the side, so you must have done something right? #fed-plants
->->
//back to lunarium gather
= plants
The Wizard's three carnivorous plants are enormous, and you want to see them eat something, but you're at least a little frightened that they could eat YOU. So for once you don't poke at them.
->->
//back to lunarium gather

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
You decide to make yourself some tea. The samovar already has hot water; from your experience most wizards always have hot water for tea. The concentrate from the teapot on top smells fragrant and spiced. You spill half of it over the table as you pour concentrate and water into your cup, then spill more as you try to dump as much milk and sugar in as humanly possible. #has-tea

Then you burn your tongue on it. Damn, it's hot! You have to put this down and drink it later.
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

//gather here
//(not has-paperweight) [*take paperweight] (-> paperweight)
//(not-lunarium2 and not-tea and not-books) [*examine books] (-> books1)
//(not-lunarium2 and has-tea and seen-books) [*examine books again] (-> books2)
//(not-lunarium2 and not-books and has-tea) [*examine books] (-> books3)
//(not-drawer) [*examine desk] (->desk)
//(has-deskkey and seen-drawer) [*use key on drawer] (-> drawer)
->->
= desk
Nothing on the desk currently interests you. You poke around aimlessly, looking for— hahah, yes! You knew this thing had to have secret compartments! There's a false back to this drawer, and if you look closely you can find a tiny keyhole. It looks too small for you to pick even with the tip of one of the desk's many fountain pens.#seen-drawer
//if has-deskkey -> drawer, if not -> gather in room_desk
->->

= drawer
CLICK

The small iron key fits perfectly in the lock. You open the secret compartment with only a touch.

//-> instruments.kazoo
->->
= books1
You thumb idly through some of the books. Curiously, their pages are all blank. Are the secrets inside locked away by some magic spell, or is it invisible ink? You stuff a smaller volume in the pocket of your apprentice robes to ask the Wizard about.
->->
= books2
(wizardclue-books: You recall the Wizard's words about fire magic unlocking the writing in the tomes.)(else: You recall your Master talking about magic books that only show their words when exposed to magical fire.) Fire magic is one of the most difficult elemental masteries, so it's an easy way to hide something from all but the most talented sorcerors. The times (your Master has/he's) tried to teach you it you've usually just exploded things. There must be another way to unlock the writing on the page.

Think, think. What else do you have that's extremely hot?

Your eyes flicker to the tea on the table.

//gather: teatime
//choice: *[dump tea on books]

The Wizard snores peacefully on the couch with a pillow over her face as you empty the sugar bowl (into your mouth), fill it with tea and hot water, and carry it over to her desk. You spread the books out with their pages open and methodically pour boiling tea over the possibly centuries old and undoubtedly priceless tomes.

This mostly just makes them wet and stained.

Disappointed, you thumb through some wet and stuck-together pages— oh, there's actually a single line revealed on one of them. Your hypothesis must have been right! You proudly resolve to tell your Master about your engenuity. Someone could write a paper about this.

The words are badly smudged, but you think they say 'That which is above is like to that which is below, and that which is below is like to that which is above, and like consumes like.'#has-lunarium2
//back to desk loop
->->

= books3
You thumb idly through some of the books. Curiously, their pages are all blank. Are the secrets inside locked away by some magic spell, or is it invisible ink?

Actually, You recall your Master talking about magic books that only show their words when exposed to magical fire.) Fire magic is one of the most difficult elemental masteries, so it's an easy way to hide something from all but the most talented sorcerors. The times he's tried to teach you it you've usually just exploded things. There must be another way to unlock the writing on the page.

Think, think. What else do you have that's extremely hot?

Your eyes flicker to the tea on the table.

//go to teatime gather
->->
= take_paperweight
You pick up the paperweight. It's so heavy you need to pick it up with both hands. You whistle admiringly at the way the light catches on the uneven crystals as you move it around. You may be a little shit, but you ARE a future wizard, so you can always appreciate a fancy rock. Maybe you can steal this when you figure out how to leave the parlor. #has-paperweight
->->

=== room_portraits ===
The entire south wall of the parlor is a gallery of PAINTINGS: maps and orbital chartts of the Recursive Moons, illustrations of strange beasts and ancient queens— but mostly PORTRAITS of old people you don't care about. You spot one of the King, another of the Prince-Consort and Crown Princess (just a little older than you, in this, with a prodigious amount of pimples), and several of your Master.

The ones that catch your eye, though, are a set of six paintings of the Wizard herself, dated to various times within the last five hundred years. Annoyingly, someone has hung them out of order— they were clearly made as a set; she's in the same clothes, and the Eleventh Moon is visible behind her in each, its phases progressing in what SHOULD be chronological order. But on the wall, they're jumbled!

//gather here
//[*rearrange portraits]
//[+look somewhere else] (-> hub)
->->
= portraits
Despite calling you a menace to society, your Master DOES have to admit that you're unusually good at organizing things. You organize crystals and salts by color and shininess before you use them in spells, you organize his spellbooks by reverse first name alphabetical order and prose style while he's not looking, and you organize foods on your plate by length, texture, and overall slurpability before you eat them. 

Seeing the moon phases out of order makes something twitch in your face just below your left eye.

Fortunately, they're at eye height, so it's easy enough to rearrange them. New moon, waxing crescent, waxing half moon, waning gibbous, waning crescent. Wizards are mostly ageless, so she doesn't look different in any of them, but seeing the dates and phases line up makes you feel satisfied.

As you turn to go explore elsewhere, you hear a crash and a ripping noise. You must have hung the last painting funny, because it's fallen off the wall. And torn. Ah well.

An ornate golden key with purple thread wrapped around the knob falls to the floor as you pick it up and re-hang it. It must have been stuck to the back of the frame.
->->
//back to portraits gather

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

= take_grager
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
