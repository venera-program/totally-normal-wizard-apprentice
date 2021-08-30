=== function came_from(-> x) 
    ~ return TURNS_SINCE(x) == 0

=== function takeItem(item)
    ~ inventory += item

=== function hasItem(item)
    ~ return inventory ? item

=== function seeObj(object)
    ~ seen_objects += object

=== function sawObj(object)
    ~ return seen_objects ? object
    
=== function playedInstrument(instrument)
    ~ return played_instruments ? instrument

=== choice_intro
* ["Can I explore your tower?"] # move: intro.p2
- -> DONE

=== choice_p2
* [Examine the parlor.] # move: hub
- -> DONE

=== choices_hub
+ {sawObj(rug)} [Examine the DESK] # move: room_desk
+ {!sawObj(rug)} [Examine the DESK] # move: room_rug # arg: room_desk
+ {sawObj(rug)} [Examine the PAINTINGS] # move: room_portraits
+ {!sawObj(rug)} [Examine the PAINTINGS] # move: room_rug # arg: room_portraits
+ {sawObj(rug)} [Examine the ARMCHAIR] # move: room_armchair
+ {!sawObj(rug)} [Examine the ARMCHAIR] # move: room_rug # arg: room_armchair
+ {sawObj(rug)} [Examine the SAFE] # move: room_rug.safe1
+ [Examine the LUNARIUM] # move: room_lunarium
+ {!hasItem(grager) or !hasItem(safekey1)} [Examine the FIREPLACE] # move: room_fireplace
+ [Bother the WIZARD] # move: room_couch
- -> DONE

=== choices_desk
* {!hasItem(paperweight)} [Take the PAPERWEIGHT] # move: room_desk.take_paperweight
* {!sawObj(lunariumHint2) && !hasItem(tea) && !sawObj(books)} [Examine the BOOKS] # move: room_desk.books1
* {!sawObj(lunariumHint2) && hasItem(tea) && sawObj(books)} [Re-examine the BOOKS] # move: room_desk.books2
* {!sawObj(lunariumHint2) && hasItem(tea) && !sawObj(books)} [Examine the BOOKS] # move: room_desk.books3
* {!sawObj(drawer)} [Examine the DESK] # move: room_desk.desk
* {sawObj(drawer) && hasItem(deskkey)} [Use DESK KEY on DRAWER] # move: room_desk.open_drawer
+ [Look somewhere else] # move: hub
- -> DONE

=== choice_tea_time
* [Dump TEA on BOOKS] # move: room_desk.dump_tea
- -> DONE

=== choices_rug
* {hasItem(safekey1) && hasItem(safekey2)} [Use the gold and purple KEYS] # move: room_rug.open_safe
+ [Look somewhere else] # move: hub
- -> DONE

= move_rug
* [Move the RUG] # move: room_rug.safe1
- -> DONE

=== choices_armchair
+ [Sit down and put your feet up] # move: room_armchair.sit
* [Make yourself some TEA] # move: room_armchair.samovar
* [Look through the TELESCOPE] # move: room_armchair.telescope1
+ {room_armchair.telescope1} [Look through the TELESCOPE] # move: room_armchair.telescope2
+ [Look somewhere else] # move: hub
- -> DONE

=== choices_couch
+ {hasItem(paperweight)} [Ask about the PAPERWEIGHT] # move: room_couch.hint_paperweight
+ {sawObj(rug)} [Ask about the SAFE] # move: room_couch.hint_safe
+ {hasItem(tea)} [Offer her some TEA] # move: room_couch.hint_tea
+ {sawObj(books)} [Ask about the BOOKS] # move: room_couch.hint_books
+ {hasItem(feather)} [Ask about the PARROTS] # move: room_couch.hint_parrots
+ [Ask if your Master is back] # move: room_couch.master_convo
+ [Leave her alone] # move: hub
- -> DONE

=== choices_portraits
* {!room_portraits.rearrange_portraits} [Rearrange the portraits] # move: room_portraits.rearrange_portraits
+ [Look somewhere else] # move: hub
- -> DONE

=== choices_lunarium
+ {!hasItem(feather)} [Bother the PARROTS] # move: room_lunarium.parrots1
+ {!hasItem(deskkey)} [Examine the PLANTS] # move: room_lunarium.plants
* {hasItem(feather) && sawObj(lunariumHint1) && sawObj(lunariumHint2)} [Feed the PARROTS to the PLANTS] # move: room_lunarium.parrots2
+ [Look somewhere else] # move: hub
- -> DONE

=== choices_fireplace
+ {!hasItem(grager) && !hasItem(paperweight) && !came_from(-> room_fireplace.fishtank1)} [Examine the FISHTANK] # move: room_fireplace.fishtank1
* {!hasItem(grager) && hasItem(paperweight)} [Smash the FISHTANK with the PAPERWEIGHT] # move: room_fireplace.fishtank2
+ {!hasItem(safekey1) && !sawObj(footstool) && !came_from(-> room_fireplace.tiger1)} [Examine the TIGER HEAD] # move: room_fireplace.tiger1
* {!hasItem(safekey1) && sawObj(footstool)} [Drag over the FOOTSTOOL] # move: room_fireplace.tiger2
+ [Look somewhere else] # move: hub
- -> DONE

=== found_instrument(instrument)
{instrument:
    - otamatone:
        -> instruments.take_otamatone ->
    - grager:
        -> instruments.take_grager ->
    - kazoo:
        -> instruments.take_kazoo ->
}
~ played_instruments += instrument
{-> instruments.instrument_one(instrument) ->|-> instruments.instrument_two(instrument) ->|-> outro}

+ [Resume your antics] # move: hub
-> DONE

=== choice_leave_parlor
* [Leave the PARLOR] # move: outro.outro2
- -> DONE

=== game_finish
* [You did it!] # move: credits
- -> DONE