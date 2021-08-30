INCLUDE logic.ink

LIST inventory = paperweight, safekey1, safekey2, tea, feather, deskkey
LIST played_instruments = grager, otamatone, kazoo
LIST seen_objects = footstool, rug, books, drawer, lunariumHint1, lunariumHint2

=== cws ===
Hey there! TOTALLY NORMAL WIZARD APPRENTICE is an interactive fiction puzzle game written in the second person, and uses "you" to refer to the player character. 

Additionally, the game contains two instances of comedic (non-graphic) animal death, caused directly by the protagonist. It's obviously not something the makers of this game condone, but if reading about animal harm is distressing or triggering for you, or likewise being identified as a character who does this, you should probably sit this out. Please, take care of yourself while you play. - Stephen
-> DONE

=== intro ===
# bg: room_couch
"I'm bored," you say, for the fiftieth time.

The five-hundred-year-old Master Wizard exhales a puff of violet pipe-smoke and passes her hand wearily over her eyes. "I know," she says.

You are not a five-hundred-year-old Master Wizard. You are twelve. You do not care that you have also already asked your next question forty-nine times. "When is my Master coming back?"

The Wizard takes a deep breath and answers you very slowly as if she were trying not to become annoyed. "Your Master has climbed the highest mountain in the lowest valley on the Recursive Moons, to answer the three riddles of the Lunar Sphinx, to fight the Roc, to steal its egg, to crack it open to find the diamond to cure the King's daughter of her curse of eternal sleep so that she can marry the Prince of the Three Suns and avert a war that will kill us all. It is possible that he will not be back for quite some time."

"So not before dinner?"

"No," she snaps.
-> choice_intro
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
-> choice_p2

=== hub ===
# bg: room_couch
The Master Wizard's parlor is a long room paneled in dark wood and full of tchotchkes, tapestries, pinned butterflies, books, paintings, arcane contraptions, empty liquer bottles, and various ITEMS of almost every kind imaginable. You could probably amuse yourself here without leaving, but it's hot and stuffy and the violet fumes coming from the pipe in the ashtray are making you nauseous.

You've already tried the heavy carved DOOR at the far WEST end of the room, but you're sure you can figure out a way to open it if you poke around enough.

To the right of the door, on the NORTH side of the room, is the Wizard's oversized DESK, an small sitting area by a window with an ARMCHAIR, and the glass-walled bay of the LUNARIUM, full of the Wizard's strange plants.

Along the SOUTH wall of the room is a PORTRAIT WALL full of paintings of old people you don't care about.
{sawObj(rug):
    <> In the MIDDLE of the room is an ornate gold-and-purple RUG, which you've pulled aside to reveal a SAFE.
}

At the EAST end of the room is a cavernous FISHTANK-FIREPLACE, and next to that are the COUCHES and cushions where the Wizard is trying to sleep.

What should you try 
{first_timer:
    <> next?
- else:
    <> first?
}
- (first_timer)

-> choices_hub

=== room_couch ===
# bg: room_couch
The Master Wizard appears to be about twice your age, although of course she is over five hundred. She has short dark hair, extravagant clothes befitting her station, and a variety of jewelry crafted out of gold and precious stones. She currently is lying down with a pillow over her head, snoring gently.

It takes several loud throat-clearings and a bit of poking to get her to sit up, {tired|somewhat surly|increasingly annoyed|extremely grouchily|clearly at the utmost limit of her patience} and half-awake.

"Whadyouwan'???"

-> choices_couch
= hint_paperweight
"Can I have this paperweight?"

"No. That's heavy and you're going to break something. Like your bones."

"That's why I want it," you say.

"Do NOT. Also it's expensive—"

"That's also why I want it."

"NO—"

"OKAY, don't YELL AT ME."

The Wizard makes a strangled noise in the back of her throat, probably of rage.
-> choices_couch
= hint_safe
"You have a safe under your rug," you inform her.

"And the keys are hidden so you'll never open it."

"What's in it?"

"Some things are too dangerous to be held in mortal hands," she says solemnly. You're pretty sure she's joking.
-> choices_couch
= hint_tea
"Would you like some tea?" you ask.

"No," she mumbles, rubbing a hand over her face groggily. "Probably too hot, there's a fire spirit in the samovar that keeps the water extremely warm."

You get a cup of tea and attempt to shove it into her hands. She groans in irritation and swats it away.
-> choices_couch
= hint_books
"Why do the books on your desk not have any words?"

"They're locked unless exposed to magical fire," she says smugly. "I doubt an apprentice, especially an asshole apprentice, knows enough fire magic to open them. Which is probably good because you would kill a person with fire magic. Anyway, don't mess with them."
-> choices_couch
= hint_parrots
"Look, one of your parrots dropped a feather." You hold it out to show her.

"PLEASE leave the parrots alone," she says, sounding equally desperate and exhasperated. "They need to sleep, and if they fly into one of my carnivores in the Lunarium they'll be eaten. They can only be let out with supervision. WE'VE BEEN OVER THIS."

Some people are absolute killjoys.
-> choices_couch
= master_convo
"Do you know when my Master is coming back?"

"If I were your Master," she says sleepily, "I might never come back."

"That's not very nice," you protest. 

The Wizard lets out an incredulous snort.
-> choices_couch

=== room_fireplace ===
# bg: room_fireplace
{playedInstrument(grager):
    The glass FISHTANK in the hearth is now a ruined husk of shattered glass and a sharp puddle on the floor, angelfish flopping around helplessly. You wonder briefly if you could eat one.
- else:
    The Wizard's FIREPLACE probably did hold fires at some point. It has a mantle and casing carved of heavy pale marble in ornate swoops and swirls; a brass fire grate and poker stand off to one side half-forgotten. At some point in the last five hundred years, though, the Wizard has converted the hearth into a large FISHTANK for little candy-striped peppermint angelfish. You tap on the glass.
}

{hasItem(safekey1) == false:
    The mantle is covered with small curios, but what really catches your eye is a TAXIDERMY TIGER HEAD mounted on the wall above it. You think you see something glimmering in its mouth.
}

-> choices_fireplace
= fishtank1
You appraise the fishtank. The red-and-white striped fish are pretty, vibrant against the brick of the old fireplace. What really catches your eye is something half-buried in the sand at the bottom. It glistens, but barely, as if it's made of worn tin. But you can't find any way to open the fishtank— it must be built into the hearth, and a few repeated taps on the glass tell you it's too heavy to break. You'll have to look around and see if anything else gives you ideas.
-> choices_fireplace
= fishtank2
You heft the paperweight in both hands and swing it as hard as you can into the glass.

CRASH

Splinters of glass fly past your face. Water rushes out of the jagged hole in the side of the fishtank, carrying angelfish with it. You stick your little hand in through the hole and pry the mystery object from the bottom. It's covered in sand and gravel, so it takes a few tugs.
-> found_instrument(grager)
= tiger1
The snarling tiger head on the wall above stares down at you with glass eyes. There definitely is something gold on its tongue, but you can't quite see what, and it's too high up for you to reach— you're not quite five foot, after all.
-> choices_fireplace
= tiger2
Looking up at the tiger head, you have a brilliant realization. You can just stand on something to be taller!

You cross the room back to the armchair and grab its footstool. With some difficulty— it's heavier than it looks— you carry it over, set it down in front of the [has-grager: ruined] fishtank, and stand on it. Perfect. You're now at eye height with the tiger and can easily reach in and yank the object you saw out: an ornate golden key, gold thread wrapped around the knob at the end. So what if you also yank out the tiger's left tooth?
~ takeItem(safekey1)
-> choices_fireplace

=== room_lunarium ===
The LUNARIUM is your favorite part of the parlor, and entertained you for a solid fifteen minutes when your Master first dropped you off. It's bathed in soft moonglow through the floor-to-ceiling windows and skylights, and the lushest part of the jungle trees and creeping vines are visible outside. Inside, a large BIRDCAGE covered with a blanket sits on an iron table, inside of which you know the Wizard's three PARROTS are sleeping. Because she had to repeatedly ask you not to annoy them. On shelves around, and on the dark slate-tiled floor, tropical PLANTS from all over the Recursive Moons sit in brightly colored pots. Orchids, hibiscus, birds-of-paradise, and others you've never seen.

Pride of place on the floor is given to the three largest plants, half as tall as you: a pink SUNDEW, a green VENUS FLYTRAP, and a pink and green PITCHER plant. The Wizard refused to let you feed them your vegetables from lunch.

-> choices_lunarium
= parrots1
You lift the blanket over the ornate birdcage and look in at the parrots. They're mid-sized, all morphs of the same species only found on the Hundred And Thirty-First Moon— a pink one, standard wild coloring, a domestic-bred green colored one, and a mottled pink-and-green that must be a crossbreed. They lift their heads from under their wings and look at you sleepily.

You
{parrots1:
    <> grab a pink feather from the bottom of the cage, pull the blanket back down,
    ~ takeItem(feather)
- else:
    <> pull the blanet back down
}
<> and let them be for now.
-> choices_lunarium
= parrots2
That which is above is like that which is below, right? And the parrots are definitely ABOVE the plants. And like consumes like, something like that? And you saw a plant eating a much larger bird outside the window. And the colors of the parrots in the cage are the same as the colors of the plants. And you want to see a plant eat something. Ergo, you should feed the parrots to the giant carnivorous plants. QED.

This is an excellent decision that makes complete logical sense and will not make anyone angry.

You feed the green parrot to the green flytrap, the pink parrot to the pink sundew, and the pink-and-green bird to the mottled pink and green pitcher plant. A totally logical hypothesis, right?

. . . nothing in particular happens.

BUT when you drop the last parrot into the pitcher, the water is displaced and a small iron key spills over the side, so you must have done something right?
~ takeItem(deskkey)
-> choices_lunarium
= plants
The Wizard's three carnivorous plants are enormous, and you want to see them eat something, but you're at least a little frightened that they could eat YOU. So for once you don't poke at them.
-> choices_lunarium

=== room_armchair ===
# bg: room_armchair
The Wizard's ARMCHAIR by the window is somehow both fancy and squashy— lavishly upholstered, yet comfortable looking. It has a matching FOOTSTOOL nearby, equally comfortable looking, and a wooden table taken up by various teapots, cups, saucers, sugar bowls, and containers of TEA. On the floor stands an enormous enameled SAMOVAR, bright blue and chartreuse and probably big enough to boil you alive inside. #seen-footstool

A copper TELESCOPE on a stand is aimed out the window, gazing out into the lunar jungle, dark green foliage rich with translucent flowers and bioluminescent birds.

-> choices_armchair
= sit
You sit down
{sit:
    <> again
}
<> and put your feet up. You almost sink into the upholstery, and the footstool is comfortable under your feet. You wonder if the Wizard likes to fall asleep in this armchair. Your Master calls this 'pondering the infinities of the universe.'

You think you doze for a few minutes, but you wake up with a crook in your neck and a renewed determination to get out of this stuffy parlor.
~ seeObj(footstool)
-> choices_armchair
= samovar
You decide to make yourself some tea. The samovar already has hot water; from your experience most wizards always have hot water for tea. The concentrate from the teapot on top smells fragrant and spiced. You spill half of it over the table as you pour concentrate and water into your cup, then spill more as you try to dump as much milk and sugar in as humanly possible.

Then you burn your tongue on it. Damn, it's hot! You have to put this down and drink it later.
~ takeItem(tea)
-> choices_armchair
= telescope1
You pull the telescope around to fit your height and peer through. It takes extensive fiddling to focus it, but your Master's always said you were too clever for your own good, and you figure it out.
-> telescope2

= telescope2
The telescope lense comes into focus in the midst of the lush jungle outside, on a large amethyst parrot stuck in a venus flytrap about your own height, struggling in futility. You watch with fascination for several minutes before you get bored.
~ seeObj(lunariumHint1)
-> choices_armchair

=== room_desk ===
# bg: room_desk
The Wizard's hulking wooden desk is carved with lunar sigils and elaborate swirls; behind it is an equally oversized wooden chair. Its surface is littered with BOOKS
{hasItem(paperweight):
    <>.    
- else:
    <>; besides those, the only notable object is a huge and brilliant GEODE, cracked open and currently serving as a PAPERWEIGHT.
}
-> choices_desk
= desk
Nothing on the desk currently interests you. You poke around aimlessly, looking for— hahah, yes! You knew this thing had to have secret compartments! There's a false back to this drawer, and if you look closely you can find a tiny keyhole. It looks too small for you to pick even with the tip of one of the desk's many fountain pens.
~ seeObj(drawer)

{hasItem(deskkey):
    -> open_drawer
- else:
    -> choices_desk
}
= open_drawer
CLICK

The small iron key fits perfectly in the lock. You open the secret compartment with only a touch.

-> found_instrument(kazoo)
= books1
You thumb idly through some of the books. Curiously, their pages are all blank. Are the secrets inside locked away by some magic spell, or is it invisible ink? You stuff a smaller volume in the pocket of your apprentice robes to ask the Wizard about.
-> choices_desk
= books2
{room_couch.hint_books:
    You recall the Wizard's words about fire magic unlocking the writing in the tomes.
- else:
    You recall your Master talking about magic books that only show their words when exposed to magical fire.
}
<> Fire magic is one of the most difficult elemental masteries, so it's an easy way to hide something from all but the most talented sorcerors. The times
{room_couch.hint_books:
    <> your Master has
- else:
    <> he's
}
<> tried to teach you it you've usually just exploded things. There must be another way to unlock the writing on the page.

Think, think. What else do you have that's extremely hot?

Your eyes flicker to the tea on the table.
-> choice_tea_time
= books3
You thumb idly through some of the books. Curiously, their pages are all blank. Are the secrets inside locked away by some magic spell, or is it invisible ink?

Actually, You recall your Master talking about magic books that only show their words when exposed to magical fire.) Fire magic is one of the most difficult elemental masteries, so it's an easy way to hide something from all but the most talented sorcerors. The times he's tried to teach you it you've usually just exploded things. There must be another way to unlock the writing on the page.

Think, think. What else do you have that's extremely hot?

Your eyes flicker to the tea on the table.
-> choice_tea_time
= dump_tea
The Wizard snores peacefully on the couch with a pillow over her face as you empty the sugar bowl (into your mouth), fill it with tea and hot water, and carry it over to her desk. You spread the books out with their pages open and methodically pour boiling tea over the possibly centuries old and undoubtedly priceless tomes.

This mostly just makes them wet and stained.

Disappointed, you thumb through some wet and stuck-together pages— oh, there's actually a single line revealed on one of them. Your hypothesis must have been right! You proudly resolve to tell your Master about your engenuity. Someone could write a paper about this.

The words are badly smudged, but you think they say 'That which is above is like to that which is below, and that which is below is like to that which is above, and like consumes like.'
~ seeObj(lunariumHint2)
- -> choices_desk
= take_paperweight
You pick up the paperweight. It's so heavy you need to pick it up with both hands. You whistle admiringly at the way the light catches on the uneven crystals as you move it around. You may be a little shit, but you ARE a future wizard, so you can always appreciate a fancy rock. Maybe you can steal this when you figure out how to leave the parlor.
~ takeItem(paperweight)
-> choices_desk

=== room_portraits ===
# bg: room_portraits
The entire south wall of the parlor is a gallery of PAINTINGS: maps and orbital chartts of the Recursive Moons, illustrations of strange beasts and ancient queens— but mostly PORTRAITS of old people you don't care about. You spot one of the King, another of the Prince-Consort and Crown Princess (just a little older than you, in this, with a prodigious amount of pimples), and several of your Master.

The ones that catch your eye, though, are a set of six paintings of the Wizard herself, dated to various times within the last five hundred years. Annoyingly, someone has hung them out of order— they were clearly made as a set; she's in the same clothes, and the Eleventh Moon is visible behind her in each, its phases progressing in what SHOULD be chronological order. But on the wall, they're jumbled!
-> choices_portraits
= rearrange_portraits
Despite calling you a menace to society, your Master DOES have to admit that you're unusually good at organizing things. You organize crystals and salts by color and shininess before you use them in spells, you organize his spellbooks by reverse first name alphabetical order and prose style while he's not looking, and you organize foods on your plate by length, texture, and overall slurpability before you eat them. 

Seeing the moon phases out of order makes something twitch in your face just below your left eye.

Fortunately, they're at eye height, so it's easy enough to rearrange them. New moon, waxing crescent, waxing half moon, waning gibbous, waning crescent. Wizards are mostly ageless, so she doesn't look different in any of them, but seeing the dates and phases line up makes you feel satisfied.

As you turn to go explore elsewhere, you hear a crash and a ripping noise. You must have hung the last painting funny, because it's fallen off the wall. And torn. Ah well.

An ornate golden key with purple thread wrapped around the knob falls to the floor as you pick it up and re-hang it. It must have been stuck to the back of the frame.
~ takeItem(safekey2)
-> choices_portraits

=== room_rug(from) ===
# bg: room_rug
~ seeObj(rug)
As you're crossing the room to
{from:
    - "room_desk":
        <> the desk
    - "room_portraits":
        <> the portrait wall
    - "room_armchair":
        <> the armchair
}
<>, you trip and stumble in the middle of the room on an unexpected lump. It sends you tumbling forward smack on your face.

Sitting up, you see you're on one of the many antique RUGS in the parlor, an ornate purple-and-gold affair woven with flowering vines and birds. There . . . is . . . a very large and SUSPICIOUSLY SQUARE LUMP under the fabric, which your foot must have caught on.

-> choices_rug.move_rug
= safe1
# bg: room_rug
{first_timer:
    You drag the heavy cloth aside and find a square metal SAFE with two keyholes.
}
- (first_timer)

In the middle of the room you've dragged the ornate purple-and-gold rug to one side, exposing a square metal SAFE set into the dark wood floor. It has two keyholes.
-> choices_rug
= open_safe
You take out the intricate gold- and purple-threaded keys. It takes a minute to match each to a lock, but once you do the safe pops open with a rusty creak.
-> found_instrument(otamatone)

=== instruments ===
= take_grager
You now hold a oxidized TIN GRAGER in your hand, still dripping with saltwater. And there is only one thing to do with a grager: rattle it around wildly. Like so:

GRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGRGR
->->
= take_kazoo
Hidden in the compartment are uncut rubies the size of quail eggs, letters representing blackmail material for every duke at court, and fistfulls of gold coins three centuries old.

Unfortunately for all those interesting things, there is also a shiny SILVER KAZOO. You lift it to your lips immediately:

BZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
->->
= take_otamatone
Inside the safe is, you will learn later, a dagger forged and enchanted to kill the Prince of Three Suns the very instant it draws a single drop of blood from his body. It does momentarily catch your attention— until you spot, tucked behind it in a corner of the safe, an OT.

Your Master threw your otamatone off the highest tower in the realm on the second day of your apprenticeship. How can you resist?:

DO DO DO DO DOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO DO DO DO DO DO DO DO DO DO DO DO DO DOOOO DOOOOO DO DOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO DODO DODODO DO DO DO DOOOOOOOOOOOOOOOOOOOOOOOOOOOOO DOODDDDDDDOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
->->
= instrument_one(instrument)
A bolt of pale lightning shoots from the Wizard's hand and zaps the {instrument} from existence. You yelp as the electric shock tingles through your hand.

"STOP THAT," growls the Master Wizard. "Some of us are trying to SLEEP."

"But I'm bored," you say in a totally reasonable and mature and definitely not whiny tone of voice.

She doesn't respond, only grumbling curses under her breath as she rolls over on the couch to go back to sleep.
->->
= instrument_two(instrument)
The {instrument} dissolves atom by atom from your hand and reassembles itself in the hands of the Wizard, who casually crushes it into dust with undoubtedly magical strength.

"You are BEGINNING to IRRITATE ME," she snarls. "STOP whatever it is you THINK YOU'RE DOING and let me sleep. Go read a book or something! When I was your age I loved books!"

You mutter mutinously under your breath as she lies back down and piles pillows on top of herself, like a cocoon against your racket.
->->

=== outro ===
# bg: room_couch
It is the absolute deafening silence and smell of ozone in the air that makes you pause your gleeful abuse of a perfectly good (instrument). When you turn around the Wizard is standing directly behind you.

She has quite evidently surveyed her ripped paintings, plundered hiding places, broken taxidermies, smashed fishtank, missing parrots, ruined books, and generally ransacked-by-an-invading-army parlor and decided to become more furious than you have ever seen anybody be in your entire life. She's visibly smoking. It must be a wizard thing.

"Get out," she says quietly.

"Huh? Why?"

"Why?" The Master Wizard's voice raises several octaves. "WHY?" she shreaks. "IN MY ENTIRE FIVE HUNDRED AND SIXTEEN YEARS AND THREE MONTHS AND TWENTY-SEVEN DAYS,"

She stops and visibly restrains herself.

"I have NEVER seen a more completely idiotic and destructive apprentice than you," she hisses. "Get out. Get. Out. I do not care what your Master, my best friend for thirty decades, is going to say when he comes back and finds you missing or dead—"

Realization hits you. "So I can leave?"

She points behind you to the heavy DOOR which has opened silently, probably by magic, while she was screaming. "You are REQUIRED to leave."

"Okay."
-> choice_leave_parlor
= outro2
With a jaunty step, you turn around and walk out of the parlor into the hall. Magic towers are usually very interesting. You can't wait to explore whatever dungeons and secret passages this one holds.

Behind you, the five-hundred-year old Master Wizard sits down on the floor and bursts into a hysterical mix between laughter and tears.
-> game_finish

=== credits ===
# bg: titlecard
TOTALLY NORMAL WIZARD APPRENTICE

Design by Stephen March (hecleretical.itch.io) and chasay (chasay.itch.io)
Writing by Stephen March
Programming by chasay
Illustrations by Eva (laughingpineapple.itch.io).

Thank you for playing! # end
-> END