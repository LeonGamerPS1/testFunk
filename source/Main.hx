package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import rulescript.RuleScript;

class Main extends Sprite
{
	public function new()
	{
		super();
		RuleScript.resolveScript;
		addChild(new FlxGame(0, 0, InitState, 64, 64, true));
	}

	@:noCompletion private override function __hitTest(x:Float, y:Float, shapeFlag:Bool, stack:Array<DisplayObject>, interactiveOnly:Bool,
			hitObject:DisplayObject):Bool
	{
		return false;
	}

	@:noCompletion override private function __hitTestHitArea(x:Float, y:Float, shapeFlag:Bool, stack:Array<DisplayObject>, interactiveOnly:Bool,
			hitObject:DisplayObject):Bool
	{
		return false;
	}

	@:noCompletion private override function __hitTestMask(x:Float, y:Float):Bool
	{
		return false;
	}
}
