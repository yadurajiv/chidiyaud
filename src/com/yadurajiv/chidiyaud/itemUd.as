package com.yadurajiv.chidiyaud
{
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Yadu Rajiv
	 */
	public class itemUd extends FlxSprite 
	{	
		public var item_sound:FlxSound;
		
		public var item_flies:Boolean;
		
		public function itemUd(X:Number, Y:Number, SimpleGraphic:Class, SimpleSound:Class, Flies:Boolean = false) {
			super(X, Y, SimpleGraphic);
			
			item_sound = new FlxSound();
			item_sound.loadEmbedded(SimpleSound, false);
			
			health = 100;
			
			item_flies = Flies;
			
			visible = false;
			
		}
		
		public function play_itemSound():void {
			if (item_sound != null) {
				item_sound.play(true);
			}
		}
		
		public function stop_itemSound():void {
			if (item_sound != null) {
				item_sound.stop();
			}
		}
		
	}
	
}