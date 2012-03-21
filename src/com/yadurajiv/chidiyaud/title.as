package com.yadurajiv.chidiyaud
{	
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Yadu Rajiv
	 */
	public class title extends FlxState
	{
		//[Embed(source = "data/title.png")] private var imgTitle:Class;
		private var storyText:FlxText;
		
		override public function create():void  
		{
			super.create();
			
			FlxG.mouse.hide();
			
			FlxG.flash(0xff000000, 2, function():void {
			});
			
			//add(new FlxSprite(0, 0, imgTitle));
			
			storyText = new FlxText(FlxG.width / 2 -300, FlxG.height / 2 - 150, 600, "Stand on the mat to start the game :)\nDon't worry, it's not going to give you a shock :)\n\nGet a high score of 2000 to win\n\nEach mistake will cost you 200 points!\n\nDo your best!", true);
			storyText.size = 16;
			storyText.alignment = "center";
			add(storyText);
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.pressed("SPACE") || FlxG.keys.pressed("PLUS")) {
				FlxG.fade(0xff000000, 3, function():void {
					FlxG.switchState(new game_level_1);
				});
			}
			
			if (FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("PLUS")) {
				FlxG.switchState(new title);
			}
		}
	}
	
}