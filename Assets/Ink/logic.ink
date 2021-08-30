=== function came_from(-> x) 
    ~ return TURNS_SINCE(x) == 0

=== function has_item(item)
    ~ return inventory ? item

=== function seen_obj(object)
    ~ return seen_objects ? object

=== choice_intro
* ["Can I explore your tower?"] # move: intro.p2
- -> DONE

=== choice_p2
* [Examine the parlor.] # move: hub
- -> DONE

=== choices_hub
// a) examine desk (if not been to rug, -> rug, if have seen rug, -> desk)
+ {seen_obj(rug)} [Examine the DESK] # move: room_desk
+ {!seen_obj(rug)} [Examine the DESK] # move: room_rug # arg: room_desk

// b) examine paintings (see a)
+ {seen_obj(rug)} [Examine the PAINTINGS] # move: room_paintings
+ {!seen_obj(rug)} [Examine the PAINTINGS] # move: room_rug # arg: room_paintings

// c) examine armchair (see a)
+ {seen_obj(rug)} [Examine the ARMCHAIR] # move: room_armchair
+ {!seen_obj(rug)} [Examine the ARMCHAIR] # move: room_rug # arg: room_armchair

// d) (conditional to seen-rug) examine safe
+ {seen_obj(rug)} [Examine the SAFE] # move: room_rug.safe1

// e) examine lunarium
# move: room_lunarium
+ [Examine the LUNARIUM]

// f) (conditional to not (both have-grager AND have-safekey1)) examine fireplace
+ {!has_item(grager) or !has_item(safekey1)} [Examine the FIREPLACE] # move: room_fireplace

// g) bother the wizard
+ [Bother the WIZARD] # move: room_couch

- -> DONE

=== choices_fireplace
//(not-paperweight & not came from fishtank1) [+examine fishtank] (-> fishtank1)
# move: room_fireplace.fishtank1
+ {!has_item(grager) && !has_item(paperweight) && !came_from(-> room_fireplace.fishtank1)} [Examine the FISHTANK]

//(has-paperweight and not-grager) [*smash fishtank with paperweight] (-> fishtank2)
# move: room_fireplace.fishtank2
* {!has_item(grager) && has_item(paperweight)} [Smash the FISHTANK with the PAPERWEIGHT]

//(not-safekey1 and not-footstool and not came from tiger1) [+examine tiger head] (->tiger1)
# move: room_fireplace.tiger1
+ {!has_item(safekey1) && !seen_obj(footstool) && !came_from(-> room_fireplace.tiger1)} [Rxamine the TIGER HEAD]

//(not-safekey1 and seen-footstool) [*drag over the footstool] (->tiger2)
# move: room_fireplace.tiger2
* {!has_item(safekey1) && seen_obj(footstool)} [Drag over the FOOTSTOOL]

//[+look somewhere else] (-> hub)
# move: hub
+ [return to HUB]

- -> DONE
