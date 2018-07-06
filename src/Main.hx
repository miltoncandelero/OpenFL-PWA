package;

import flash.display.Bitmap;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import spritesheet.AnimatedSprite;
import spritesheet.Spritesheet;
import spritesheet.data.BehaviorData;
import spritesheet.data.SpritesheetFrame;
import spritesheet.importers.BitmapImporter;

/**
 * ...
 * @author Killabunnies
 */
class Main extends Sprite 
{
	public static inline var COLOR_0:Int = 0x9bbc0f;
	public static inline var COLOR_1:Int = 0x8bac0f;
	public static inline var COLOR_2:Int = 0x306230;
	public static inline var COLOR_3:Int = 0x0f380f;
	
	var girl:AnimatedSprite;
	public function new() 
	{
		super();
		
		//girl by Anderson dos Santos
		//song by Receptors
		
		floor =  (new Bitmap(Assets.getBitmapData("img/floor.png"), null, true));
		floor.x = 134;
		floor.y = 577 - 64;
		addChild(floor);
		
		var gb = (new Bitmap(Assets.getBitmapData("img/gameboy.png"), null, true));
		gb.x = (720-gb.width) / 2;
		addChild(gb);
		
		var sheet:Spritesheet = BitmapImporter.create(Assets.getBitmapData("img/green.png"), 4, 1, 34, 63, 0, 4);
		sheet.addBehavior(new BehaviorData("idle", [0,1,2,3,2], true, 10));
		girl = new AnimatedSprite(sheet);
		girl.showBehavior("idle");
		girl.update(1);
		girl.x = (720 - girl.width) / 2;
		girl.y = 577-64-girl.height;
		addChild(girl);
		
		addEventListener(Event.ENTER_FRAME, update);
		
		Assets.getSound("snd/receptors.mp3").play(0, 10000000);
	}
	
	
	var currentTime:Int;
	public static var dt:Int;
	var previousTime:Int;
	var floor:flash.display.Bitmap;
	private function update(e:Event = null):Void{
		currentTime = Lib.getTimer ();
		dt = (currentTime - previousTime);
		previousTime = currentTime;
		
		girl.update(dt);
		floor.x = 134 + ((floor.x-134) - 0.3*dt) % 134;
	}

}
