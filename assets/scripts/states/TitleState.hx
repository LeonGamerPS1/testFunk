import flixel.FlxSprite;
import funkin.backend.Paths;

var gf;
function create()
{
	gf = new FlxSprite();
	gf.frames = Paths.getSparrowAtlas("menus/title/gfDanceTitle");
	gf.animation.addByPrefix("dance", "gfDance", 24);
	gf.animation.play("dance");
	add(gf);
}
