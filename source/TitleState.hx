package;

import MenuState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyboard;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class TitleState extends FlxState
{
	private var playbutton:FlxSprite;
	private var logo:FlxSprite;

	override public function create():Void
	{
		super.create();
		logo = new FlxSprite();
		logo.loadGraphic("assets/images/logo.png");
		logo.scale.set(0.5, 0.5);
		logo.screenCenter();
		logo.y -= 100;

		var buttonGraphics:FlxGraphic = FlxGraphic.fromAssetKey("assets/images/playbutton.png");
		var buttonFrames:FlxAtlasFrames = FlxAtlasFrames.fromSparrow(buttonGraphics, "assets/images/playbutton.xml");

		playbutton = new FlxSprite();
		playbutton.frames = buttonFrames;

		playbutton.animation.addByPrefix("idle", "playbtn", 0, true);
		playbutton.animation.addByPrefix("pressed", "playPRESSED", 24, false);
		playbutton.animation.play("idle");
		playbutton.scale.set(0.5, 0.5);

		playbutton.screenCenter();
		playbutton.y += 200;

		add(playbutton);
		add(logo);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		playbutton.screenCenter();
		playbutton.y += 200;

		if (FlxG.keys.justPressed.SPACE)
		{
			playbutton.animation.play("pressed");
			FlxTween.tween(playbutton, {alpha: 0}, 0.35);
			FlxTimer.wait(.5, function()
			{
				FlxTween.tween(logo, {y: 2000}, 0.4, {ease: FlxEase.backIn});
				FlxTimer.wait(.1, function name()
				{
					FlxTween.tween(logo, {"scale.x": .35}, 0.125, {ease: FlxEase.quadOut});
				});
			});

			FlxTimer.wait(1.5, function()
			{
				FlxG.switchState(new MenuState());
			});
		}
	}
}
