extends Panel
func _ready():
	hide()  # Hide the popup initially
func show_dialogue(text: String):
	$Label.text = text  # Set the dialogue text
	show()  # Show the popup
func _on_ContinueButton_pressed():
	hide()  # Hide the popup when the button is pressed
