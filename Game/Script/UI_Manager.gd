extends CanvasLayer

@onready var health_bar: ProgressBar = $GameScreen/HealthBar
@onready var coin_label: Label = $GameScreen/CoinLabel

func _ready() -> void:
	var player = get_tree().get_root().get_node("Root").get_node("Player") as PlayerController
	player.playerHealthUpdated.connect(UpdateHealthBar)
	player.playerCoinUpdated.connect(UpdateCoinLabel)

func UpdateHealthBar(newValue:int, maxValue:int):
	var barValue = float(newValue) / float(maxValue) * 100
	health_bar.value = barValue

func UpdateCoinLabel(newValue:int):
	coin_label.text = str(newValue)
