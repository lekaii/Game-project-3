# Global.gd
extends Node

var player_position: Vector3 = Vector3.ZERO

var player_is_dead: bool = false
var player_is_sprinting: bool = false
var player_is_walking: bool = false
var player_is_sneaking: bool = false
var player_is_idle: bool = true


var flashlight_aquired: bool = true
