=== function came_from(-> x) 
	~ return TURNS_SINCE(x) == 0

=== function has_item(item)
    ~ return inventory ? item

=== function seen_obj(object)
    ~ return seen_objects ? object

=== choices_fireplace
+ {!has_item(grager) && !has_item(paperweight) && !came_from(-> room_fireplace.fishtank1)} [examine FISHTANK] # move: room_fireplace.fishtank1
* {!has_item(grager) && has_item(paperweight)} [smash FISHTANK] # move: room_fireplace.fishtank2
+ {!has_item(safekey1) && !seen_obj(footstool) && !came_from(-> room_fireplace.tiger1)} [examine TIGER HEAD] # move: room_fireplace.tiger1
* {!has_item(safekey1) && seen_obj(footstool)} [drag over FOOTSTOOL] # move: room_fireplace.tiger2
+ [return to HUB] # move: hub
- -> DONE
