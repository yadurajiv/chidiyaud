package com.yadurajiv.chidiyaud
{
	import caurina.transitions.Tweener;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Yadu Rajiv
	 */
	public class game_level_1 extends FlxState 
	{
		
		private var game_conf_speed:Number = 3;
		private var game_conf_images_total:Number = 20;
		private var game_conf_game_item_count:Number = 10;
		
		private var game_timer:FlxTimer;
		
		private var game_strings:Array;
		private var game_udi:Boolean;
		
		private var game_speed:Number;
		
		private var game_timer_display:FlxText;
		
		private var game_items:FlxGroup;
		private var game_current_item:itemUd;
		private var game_score:Number;
		
		private var game_onTheMat:Boolean;
		
		override public function create():void 
		{
			super.create();
			
			FlxG.mouse.hide();
			
			game_timer = new FlxTimer();
			game_timer.start(1, 1, game_timer_callback);
			
			game_speed = game_conf_speed;
			
			game_timer_display = new FlxText(10, 10, 620, "Time Left: " + game_speed);
			game_timer_display.size = 16;
			add(game_timer_display);
			
			game_items = new FlxGroup();
			
			// load add items here
			game_items.add(new itemUd(120, 40, assets.img_img01, assets.snd_img01, true));
			game_items.add(new itemUd(120, 40, assets.img_img02, assets.snd_img02));
			game_items.add(new itemUd(120, 40, assets.img_img03, assets.snd_img03, true));
			game_items.add(new itemUd(120, 40, assets.img_img04, assets.snd_img04, true));
			game_items.add(new itemUd(120, 40, assets.img_img05, assets.snd_img05, true));
			//game_items.add(new itemUd(120, 40, assets.img_img06, assets.snd_img06));
			//game_items.add(new itemUd(120, 40, assets.img_img07, assets.snd_img07));
			game_items.add(new itemUd(120, 40, assets.img_img08, assets.snd_img08));
			game_items.add(new itemUd(120, 40, assets.img_img09, assets.snd_img09));
			//game_items.add(new itemUd(120, 40, assets.img_img10, assets.snd_img10));
			game_items.add(new itemUd(120, 40, assets.img_img11, assets.snd_img11, true));
			game_items.add(new itemUd(120, 40, assets.img_img12, assets.snd_img12));
			game_items.add(new itemUd(120, 40, assets.img_img13, assets.snd_img13, true));
			game_items.add(new itemUd(120, 40, assets.img_img14, assets.snd_img14, true));
			game_items.add(new itemUd(120, 40, assets.img_img15, assets.snd_img15));
			game_items.add(new itemUd(120, 40, assets.img_img16, assets.snd_img16, true));
			game_items.add(new itemUd(120, 40, assets.img_img17, assets.snd_img17));
			game_items.add(new itemUd(120, 40, assets.img_img18, assets.snd_img18, true));
			game_items.add(new itemUd(120, 40, assets.img_img19, assets.snd_img19, true));
			game_items.add(new itemUd(120, 40, assets.img_img20, assets.snd_img20, true));
			game_items.add(new itemUd(120, 40, assets.img_img21, assets.snd_img21));
			game_items.add(new itemUd(120, 40, assets.img_img22, assets.snd_img22));
			game_items.add(new itemUd(120, 40, assets.img_img23, assets.snd_img23));
			game_items.add(new itemUd(120, 40, assets.img_img24, assets.snd_img24, true));
			
			add(game_items);
			
			set_game_current_item();
			
			// start off the first item
			game_current_item.play_itemSound();
			
			game_score = 0;
			
			game_udi = false;
			game_onTheMat = true;
			
		}
		
		override public function update():void 
		{
			game_timer_display.text = "Score: " + game_score + "  Time Left: " + game_speed + "s";
			
			// when the key is released
			if (FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("PLUS")) {
				game_udi  = true;
				game_timer.stop();
				game_update();
			}
			
			if (FlxG.keys.pressed("SPACE") || FlxG.keys.pressed("PLUS")) {
				game_onTheMat = true;
				game_udi = false;
			} else {
				game_onTheMat = false;
				//game_udi = true;
				// show get back on the mat message!!
			}

			super.update();
		}
		
		// timer reset
		private function game_timer_reset():void {
			game_speed = game_conf_speed;
			game_timer.start(1, 1, game_timer_callback);
		}
		
		private function game_update():void {
			if (game_current_item.item_flies==false && game_udi==true) { // if the item does not fly and you jumped
				game_score -= (game_current_item.health*2);
				FlxG.flash(0xffff0000, 1, null, true);
			} else if (game_current_item.item_flies == false && game_udi == false && game_onTheMat==true) { // if items does not fly and you didn't jump
				game_score += game_current_item.health;
				FlxG.flash(0xff00ff00, 1, null, true);					
			} else if (game_current_item.item_flies == true && game_udi == true) { // if items flies and you jumped
				game_score += game_current_item.health;
				FlxG.flash(0xff00ff00, 1, null, true);					
			} else if (game_current_item.item_flies == true && game_udi == false && game_onTheMat==true) { // if items flies and you didn't jump
				game_score -= (game_current_item.health*2);
				FlxG.flash(0xffff0000, 1, null, true);
			}
			
			if (game_score < 0) {
				// you lost screen!
				FlxG.score = game_score;
				FlxG.switchState(new lost);
				return;
			} else if (game_score > 2000) {
				// win screen!
				FlxG.score = game_score;
				FlxG.switchState(new end);
				return;
			}
			
			game_udi = false;
			set_game_current_item();
			game_timer_reset();
		}
		
		//callbacks
		private function game_timer_callback(t:FlxTimer):void {			
			game_speed--;
			
			if (game_speed <= 0) {
				game_update();
			} else {
				game_timer.start(1, 1, game_timer_callback);
			}
		}
		
		private function set_game_current_item():void {
			if (game_current_item != null) {
				Tweener.addTween(game_current_item, { y: -400, angle: -180, time:1, alpha:0, transition:"easeOutSine", onComplete:function():void { this.visible = false; } } );
				game_current_item.stop_itemSound();
			}
			
			game_current_item = game_items.members[Math.floor((Math.random() * 21))];
			game_current_item.y = 480;
			game_current_item.angle = 180;
			game_current_item.alpha = 0;
			Tweener.addTween(game_current_item, {y:40,angle:0, time:2, alpha:100, transition:"easeOutBack"} );
			game_current_item.visible = true;
			game_current_item.play_itemSound();
			
		}
	}
	
}