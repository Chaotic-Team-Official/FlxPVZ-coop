package pvz.backend;

import Type;
import haxe.ds.StringMap;
import pvz.obj.PlantBase;

class PlantFactory
{
    private static var cache: StringMap<Class<Dynamic>> = new StringMap();

    public static function create(typeName:String):PlantBase
    {
        var clazz = cache.get(typeName);
        if (clazz == null)
        {
            clazz = Type.resolveClass(typeName);
            if (clazz == null)
                throw "Unknown plant type: " + typeName;

            cache.set(typeName, clazz);
        }
        var instance = Type.createInstance(clazz, []);
        if (Std.isOfType(instance, PlantBase))
            return cast(instance, PlantBase);
        else
            throw '$typeName is not a plant class.';
    }
}