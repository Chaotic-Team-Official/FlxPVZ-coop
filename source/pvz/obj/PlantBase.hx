package pvz.obj;

import flxanimate.FlxAnimate;

class PlantBase extends FlxAnimate
{
    //TODO: Add callbacks and functions to make it easier when zombies are in range and such.
    public var plant(default, set):String;
    public function new(plant:String = 'sunflower')
    {
        super();
        this.plant = plant;
    }

    @:noCompletion public function set_plant(plant:String):String
    {
        this.plant = plant;
        this.loadAtlas(Paths.getPath('images/game/plants/$plant', null));
        return this.plant;    
    }
}