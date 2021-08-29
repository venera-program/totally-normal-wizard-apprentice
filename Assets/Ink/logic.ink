=== function came_from(-> x) 
	~ return TURNS_SINCE(x) == 0

=== choices_fireplace
//(has-paperweight and not-grager) [*smash fishtank] (-> fishtank2)
//(not-paperweight & not came from fishtank1) [+examine fishtank] (-> fishtank1)
//(not-safekey1 and seen-footstool) [*drag over the footstool] (->tiger2)
//(not-safekey and not-footstool and not came from tiger1) [+examine tiger head] (->tiger1)
//[+look somewhere else] (-> hub)
+ {inventory !? grager && inventory ? paperweight} [smash FISHTANK] # choice: room_fireplace.fishtank2
+ {inventory !? grager && inventory !? paperweight && !came_from(-> room_fireplace.fishtank1)} [examine FISHTANK]
+ [return to HUB] # move: hub
- -> DONE
