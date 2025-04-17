package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import pvz.backend.*;
import pvz.obj.*;
import pvz.obj.plants.*;

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
		var sunflower = new Sunflower();
		sunflower.screenCenter();
		add(sunflower);
	}

	var SUN_TIMER:Float = 0;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		SUN_TIMER += elapsed;

		if (SUN_TIMER >= 12)
			sunFall();
		if (FlxG.mouse.justPressed)
		{
			var sunflower:PlantBase = PlantFactory.create("pvz.obj.plants.Sunflower");
			add(sunflower);
			sunflower.setPosition(FlxG.mouse.gameX, FlxG.mouse.gameY);
		}
	}

	private function sunFall()
	{
		SUN_TIMER = 0;
		var sun = new Sun(FlxG.random.float(100, FlxG.width - 200), -300);
		add(sun);
		FlxTween.tween(sun, {y: FlxG.random.float(300, 680)}, 8);
	}
}
