package funkin.backend;

import flixel.graphics.FlxGraphic;

typedef FlxMapGraphic = Map<String, FlxGraphic>;

class Paths
{
	// will get cleared on state switch
	static var cachedImages:FlxMapGraphic = new FlxMapGraphic();

	// stay for the rest of the games duration, needs restart to clear
	static var permCachedImages:FlxMapGraphic = new FlxMapGraphic();

	public static function getGraphicFromCache(key:String):FlxGraphic
	{
		if (cachedImages.exists(key))
			return cachedImages.get(key);
		else if (permCachedImages.exists(key))
			return permCachedImages.get(key);
		return null;
	}
	public static function graphicExists(key:String)
	{
		return getGraphicFromCache(key) != null;
	}

	public function cacheImageFromString(key:String, ?persistForever:Bool = false):FlxGraphic
	{
		if (graphicExists(key))
			return getGraphicFromCache(key);
		if (FlxG.assets.exists(key, IMAGE))
		{
			var graphic:FlxGraphic = FlxGraphic.fromAssetKey(key, false, key, false);
			graphic.persist = persistForever;
			if (persistForever)
				permCachedImages.set(key, graphic);
			else
				cachedImages.set(key, graphic);
			return graphic;
		}
		return null;
	}
}
