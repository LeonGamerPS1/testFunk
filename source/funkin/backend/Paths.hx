package funkin.backend;

import flixel.graphics.FlxGraphic;

typedef FlxMapGraphic = Map<String,FlxGraphic>; 
class Paths {
    // will get cleared on state switch
    static var cachedImages:FlxMapGraphic = new FlxMapGraphic();

    // stay for the rest of the games duration, needs restart to clear
    static var permCachedImages:FlxMapGraphic = new FlxMapGraphic();


}