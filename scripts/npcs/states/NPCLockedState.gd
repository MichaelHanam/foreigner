extends NPCState
class_name NPCLockedState

func enter(npc):
	npc.collider.disabled = true

func exit(npc):
	npc.collider.disabled = false
