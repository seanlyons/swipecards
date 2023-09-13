extends Node

var db : SQLite = null
const verbosity_level : int = SQLite.VERBOSE
var twitter_name := "res://twitter"

func from_set(set:Array):
	var n = randi_range(0, set.size() - 1)
	return set[n]

func rando_color() -> Color:
	var colors = [Color.LIME_GREEN, Color.MAGENTA, Color.GOLD, Color.DARK_RED, Color.TEAL, Color.YELLOW]
	return %Util.from_set(colors)

func get_tweets(offset:int) -> Array:
	db = SQLite.new()
	db.path = twitter_name
	db.verbosity_level = verbosity_level
	db.open_db()

	db.query("SELECT tw_created_at,tw_full_text,tw_api_content FROM tw_tweets ORDER BY tw_created_at ASC LIMIT 20 OFFSET "+ str(offset) +";")
	
	if db.query_result.size() > 0:
		return db.query_result
	return []

func cprint(text:String):
	%Database.cprint(text)
