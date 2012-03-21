package
{
	import org.flixel.FlxGame;
	import com.yadurajiv.chidiyaud.*;
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "com.yadurajiv.chidiyaud.gameLoader")]
	
	/** 
	 * ...
	 * @author Yadu Rajiv
	 */
	public class Main extends FlxGame
	{
		function Main() {
			super(640, 480, title, 1);
			
			useSoundHotKeys = false;
		}
	}
	
}