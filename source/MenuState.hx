package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyboard;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class MenuState extends FlxState
{
	private var DevText:FlxText;

	override public function create():Void
	{
		super.create();

		DevText = new FlxText();
		DevText.text = "Coming soon!";
		DevText.screenCenter();

		add(DevText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
