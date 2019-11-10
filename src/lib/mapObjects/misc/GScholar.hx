package lib.mapObjects.misc;

class GScholar extends GObjectInstance {
    public var bonusType:BonusType;
    public var bonusID:UInt; //ID of skill/spell

    public function new() {
        super();

        bonusType = RANDOM;
        bonusID = 0;
    }
}

@:enum abstract BonusType(Int) from Int to Int {
    public var PRIM_SKILL:Int = 0;
    public var SECONDARY_SKILL:Int = 1;
    public var SPELL:Int = 2;
    public var RANDOM:Int = 255;
}