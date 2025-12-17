extends Node

# Loops a sound effect a certain number of times
func play_count(sfx_name: String, count: int = 1, time: float = 1.0):
	for i in range(count):
		play(sfx_name)
		await get_tree().create_timer(time).timeout

func play(sfx_name: String):
	match sfx_name:
		"drip":
			$Drip.play()
		"door_open":
			$DoorOpen.play()
		"lock_click":
			$LockClick.play()
		"horse_hoof":
			$HorseGallop.play()
		"footsteps":
			$Footsteps.play()
		"creaky_door":
			$CreakyDoor.play()
		"door_slam":
			$SlamDoor.play()
