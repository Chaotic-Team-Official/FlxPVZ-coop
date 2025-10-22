package pvz.obj;

import flixel.FlxSprite;

class ZombieBase extends FlxSprite
{
    public var name:String;
    public var health:Int = 16;
    public var moving:Bool = false;

    public function new(x:Float = 0, y:Float = 0, name:String = 'regular')
    {
        this.name = name;
        super(x, y);

        // placeholder Uwu
        makeGraphic(64, 32, 0xFF3CFF00);

        velocity.x = -20;

        /**
         * Notes on what to do once I'm home:
         * Implements STEPS, which will work like this:
         * - The zombie shall move step by step, synced with its animation of course.
         * 
         * Implement how many hits it can take (via health variable)
         * make it possible to kill plants too
         * add flags
         * 
         * and commit this because stupid school wifi wont let me.
         */
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }
}