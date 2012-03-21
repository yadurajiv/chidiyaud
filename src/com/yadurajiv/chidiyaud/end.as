package com.yadurajiv.chidiyaud
{	
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Yadu Rajiv
	 */
	public class end extends FlxState
	{
		
		override public function create():void 
		{
			super.create();
			
			FlxG.flash(0xff000000, 2, function():void {
				FlxG.shake(0.01, 1);
			});
			
			var msgText:FlxText = new FlxText(10, 56, 600, "You Win!!\n\nYour Score is "+ FlxG.score +"\n\nTo go to the title screen, get off the mat :)", true);
			msgText.size = 16;
			msgText.alignment = "center";
			add(msgText);
			
			FlxG.mouse.hide();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("PLUS")) {
				FlxG.fade(0xff000000, 2, function():void {
					FlxG.switchState(new title);
				});
			}
		}
	}
	
}