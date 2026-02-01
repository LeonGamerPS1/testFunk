package funkin.backend;

import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import haxe.extern.EitherType;
import openfl.utils.AssetType;
import openfl.utils.Assets;

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

	public static function cacheImageFromString(key:String, ?persistForever:Bool = false):FlxGraphic
	{
		if (graphicExists(key))
			return getGraphicFromCache(key);
		if (FlxG.assets.exists(key, IMAGE))
		{
			var graphic:FlxGraphic = FlxGraphic.fromAssetKey(key, false, key, true);
			graphic.persist = persistForever;
			if (persistForever)
				permCachedImages.set(key, graphic);
			else
				cachedImages.set(key, graphic);
			return graphic;
		}
		return null;
	}

	public static function image(key:String, ?persistForever:Bool = false, ?graphic:Bool = false):EitherType<FlxGraphic, String>
	{
		var cacheKey = getPath('images/$key');
		cacheImageFromString(key, persistForever);
		if (graphic)
			return getGraphicFromCache(key);
		return cacheKey;
	}

	public static function getPath(key:String):String
	{
		final path = 'assets/$key';
		return path;
	}

	public static function exists(key:String, ?type:AssetType)
	{
		return Assets.exists(key, type);
	}

	public static function getText(key:String)
	{
		return Assets.getText(key);
	}
	public static function getSparrowAtlas(key:String)
	{
		var pngPath = image(key);
		var xmlPath = getPath('images/$key.xml');
		if (!Paths.exists(xmlPath, TEXT) || !Paths.exists(pngPath, IMAGE))
		{
			FlxG.log.error("Missing Sparrow atlas PNG or XML: " + xmlPath);
			return null;
		}
		var atlas = FlxAtlasFrames.fromSparrow(getGraphicFromCache(pngPath), xmlPath);
		return atlas;
	}

	public static function getPackerXMLAtlas(key:String)
	{
		var pngPath = image(key);
		var xmlPath = getPath('images/$key.xml');
		if (!Paths.exists(xmlPath, TEXT) || !Paths.exists(pngPath, IMAGE))
		{
			FlxG.log.error("Missing Packer atlas PNG or XML: " + xmlPath);
			return null;
		}
		var atlas = FlxAtlasFrames.fromTexturePackerXml(pngPath, xmlPath);
		return atlas;
	}

	public static function getPackerJSONAtlas(key:String, ?useFrameDuration:Bool = false)
	{
		var pngPath = image(key);
		var jsonPath = getPath('images/$key.json');
		if (!Paths.exists(jsonPath, TEXT) || !Paths.exists(pngPath, IMAGE))
		{
			FlxG.log.error("Missing Packer atlas PNG or JSON: " + jsonPath);
			return null;
		}
		var atlas = FlxAtlasFrames.fromTexturePackerJson(pngPath, jsonPath);
		return atlas;
	}
}
