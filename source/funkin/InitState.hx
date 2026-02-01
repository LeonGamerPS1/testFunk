package funkin;

import flixel.math.FlxAngle;
import flixel.math.FlxMatrix;
import flixel.math.FlxRandom;
import flixel.math.FlxVelocity;
import funkin.scripting.ScriptedState;
import rulescript.RuleScript;

class InitState extends FlxState
{
	override function create()
	{
		// flixel stuff
		FlxG.cameras.bgColor = 0x0;
		FlxG.cameras.useBufferLocking = true;
		FlxG.fixedTimestep = false;
		FlxG.stage.scaleMode = NO_SCALE;

		// scripting import stuff
		RuleScript.defaultImports.set("flixel", [
			"FlxG" => FlxG,
			"FlxSprite" => FlxSprite,
			"FlxSubState" => FlxSubState,
			"FlxStrip" => FlxStrip,
			"FlxState" => FlxState,
			"FlxObject" => FlxObject,
			"FlxGame" => FlxGame,
			"FlxCamera" => FlxCamera,
			"FlxBasic" => FlxBasic
		]);
		RuleScript.defaultImports.set("flixel.math", [
			"FlxAngle" => FlxAngle,
			"FlxMath" => FlxMath,
			"FlxMatrix" => FlxMatrix,
			"FlxPoint" => FlxPoint,
			"FlxRandom" => FlxRandom,
			"FlxRect" => FlxRect,
			"FlxVelocity" => FlxVelocity
		]);


		super.create();
	}
}
