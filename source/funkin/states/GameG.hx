package funkin.states;

import flixel.util.typeLimit.NextState;
import funkin.scripting.ScriptedState;
import haxe.extern.EitherType;
import rulescript.RuleScript;
import rulescript.interps.NeoInterp;
import rulescript.parsers.HxParser;
import rulescript.scriptedClass.RuleScriptedClassUtil;

class GameG
{
	static var script:RuleScript;

	public static function switchState(n:EitherType<NextState, String>)
	{
		if (!(n is String))
			FlxG.switchState(n);
		else
		{
			var scriptPath = Paths.getPath("scripts/states/" + Std.string(n) + '.hx');
			if (Paths.exists(scriptPath))
			{
				trace(scriptPath);
				RuleScriptedClassUtil.registerRuleScriptedClass(n, script.getParser(HxParser).parse(Paths.getText(scriptPath)));
				FlxG.switchState(new ScriptedState(Std.string(n)));
			}
		}
	}

	static public function init()
	{
		script = new RuleScript(new NeoInterp(), new HxParser());

		script.scriptName = ' [[RULESCRIPT TEST]]';

		script.getInterp(NeoInterp);

		script.errorHandler = onError;
	}

	static function onError(e:haxe.Exception):Dynamic
	{
		trace('[ERROR] : ${e.details()}');

		return e.details();
	}
}
