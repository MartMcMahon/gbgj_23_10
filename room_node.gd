extends Node2D

var actionables
var phonograph

func _ready():
	actionables = $Actionables.actionables
	phonograph = $Actionables/phono
