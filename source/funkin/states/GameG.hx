package funkin.states;

import flixel.util.typeLimit.NextState;
import haxe.extern.EitherType;

class GameG  {
    public static function switchState(n:EitherType<NextState,String>) {
        if(!(n is String))
            FlxG.switchState(n);
        else {
            
        }
    }
}