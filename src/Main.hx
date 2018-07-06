package;

import flash.display.Bitmap;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Killabunnies
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		
		
		//girl by Anderson dos Santos
		//song by Pugly
		
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		var gb = (new Bitmap(Assets.getBitmapData("img/gameboy.png"), null, true));
		gb.x = (720-gb.width) / 2;
		gb.y = (1280-gb.height) / 2  + 15;
		addChild(gb);
	}

}
