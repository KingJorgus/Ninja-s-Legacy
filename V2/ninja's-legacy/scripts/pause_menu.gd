extends Control
@onready var pause_menu_container: PanelContainer = $PauseMenuContainer
@onready var help_container: PanelContainer = $HelpContainer
@onready var enemies_defeated: Label = $PauseMenuContainer/VBoxContainer/EnemiesDefeated

func _ready():

	$AnimationPlayer.play("RESET")
	pause_menu_container.visible = true
	help_container.visible = false


func resume():
	$Menu.play()
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")


func pause():
	$Menu.play()
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	
	pause_menu_container.visible = true
	help_container.visible = false
	
	enemies_defeated.text = "Enemies Defeated: " + str(EnemiesCounter.enemies_defeated)


func esc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()

	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()

func _on_resume_pressed() -> void:
	resume()



func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")


func _process(delta: float):
	esc() 

func _on_help_pressed():
	pause_menu_container.visible = false
	help_container.visible = true

func _on_back_pressed():
	help_container.visible = false
	pause_menu_container.visible = true
