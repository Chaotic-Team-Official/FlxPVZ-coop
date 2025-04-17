package pvz.obj.plants;

class Sunflower extends PlantBase
{
    public function new()
    {
        super();
        plant = 'sunflower';
        anim.addBySymbol("idle", "dancy", 12, true);
        anim.addBySymbol("idleBlink", "blinky", 12, false);

        anim.play('idle');
    }
}