package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import pvz.obj.Lawn;
import pvz.obj.Sun;

class PlayState extends FlxState
{
	var lawn:Lawn;
	override public function create()
	{
		super.create();
		// TODO: theme system depending on level
		lawn = new Lawn('day');
		lawn.screenCenter();
		add(lawn);
	}

	var SUN_TIMER:Float = 0;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		SUN_TIMER += elapsed;

		if (SUN_TIMER >= 12)
			sunFall();
	}

	private function sunFall()
	{
		SUN_TIMER = 0;
		var sun = new Sun(FlxG.random.float(100, FlxG.width - 200), -300);
		add(sun);
		FlxTween.tween(sun, {y: FlxG.random.float(300, 680)}, 8);
	}
}
