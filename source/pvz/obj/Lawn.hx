package pvz.obj;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;

class Lawn extends FlxSpriteGroup
{
    public var theme:String;
    private var lawnSpr:FlxSprite;

    // how many columns/rows...
    private var gridCols:Int;
    private var gridRows:Int;

    // cell size
    private var cellW:Int;
    private var cellH:Int;

    // grid origin
    private var gridOffsetX:Float;
    private var gridOffsetY:Float;

    private var mouseSquare:FlxSprite;

    public function new(theme:String = 'day')
    {
        super();
        this.theme = theme;

        gridOffsetX = 195;
        gridOffsetY = 130;

        lawnSpr = new FlxSprite().loadGraphic(Paths.image('game/lawns/$theme'));
        add(lawnSpr);

        gridCols = 9;
        gridRows = 5;
        cellW    = 80;
        cellH    = 100;

        mouseSquare = new FlxSprite()
            .makeGraphic(cellW, cellH, 0x77FF0000);
        add(mouseSquare);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        final localX = FlxG.mouse.x - gridOffsetX;
        final localY = FlxG.mouse.y - gridOffsetY;
        
        var mx = Math.floor(localX / cellW);
        var my = Math.floor(localY / cellH);

        mx = Std.int(Math.max(mx, 0));
        mx = Std.int(Math.min(mx, gridCols - 1));
        my = Std.int(Math.max(my, 0));
        my = Std.int(Math.min(my, gridRows - 1));

        mouseSquare.setPosition(gridOffsetX + mx * cellW, gridOffsetY + my * cellH);
    }
}
