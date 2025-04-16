package pvz.obj;

import flixel.FlxSprite;

class Sun extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        frames = Paths.getSparrowAtlas('game/UI/sun');
        animation.addByPrefix('loop', 'loop', 12, true);
        animation.play('loop');
        antialiasing = true;
    }

    override public function update(elapsed:Float){super.update(elapsed);}
}