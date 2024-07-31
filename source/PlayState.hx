package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyboard;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var playbutton:FlxSprite;

	override public function create():Void
	{
		super.create();
		// Create and configure the logo sprite
		var logo:FlxSprite = new FlxSprite();
		logo.loadGraphic("assets/images/logo.png"); // Load the logo image
		logo.scale.set(0.5, 0.5); // Scale the logo
		logo.screenCenter();
		logo.y -= 100; // Adjust logo position

		// Load play button graphics and frames
		var buttonGraphics:FlxGraphic = FlxGraphic.fromAssetKey("assets/images/playbutton.png");
		var buttonFrames:FlxAtlasFrames = FlxAtlasFrames.fromSparrow(buttonGraphics, "assets/images/playbutton.xml");

		// Create and configure the play button sprite
		playbutton = new FlxSprite();
		playbutton.frames = buttonFrames;

		// Add animations
		playbutton.animation.addByPrefix("idle", "playbtn", 24, true); // Idle animation
		playbutton.animation.addByPrefix("pressed", "playPRESSED", 24, false); // Pressed animation
		playbutton.animation.play("idle");
		playbutton.scale.set(0.5, 0.5); // Scale the button

		playbutton.screenCenter();
		playbutton.y += 200; // Adjust button position

		// Add sprites to the state
		add(playbutton);
		add(logo);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		// Check for key press in update (alternative to the key listener)
		if (FlxG.keys.justPressed.SPACE)
		{
			playbutton.animation.play("pressed");
		}
	}
}
