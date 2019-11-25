package lib.skill;

import haxe.Json;
import constants.GameConstants;
import data.H3mConfigData;
import lib.mod.IHandlerBase;

class SkillHandler implements IHandlerBase {
    public function new() {
    }

    public function loadObject(scope:String, name:String, data:Dynamic, index:UInt = 0) {
    }

    public function loadLegacyData(dataSize:Int):Array<Dynamic> {
        var parser:Array<Dynamic> = Json.parse(H3mConfigData.data.get("DATA/SSTRAITS.TXT"));

        var skillNames:Array<String> = [];
        var skillInfoTexts:Array<Array<String>> = [];
        for (lineObj in parser) {
            var pos = 0;
            skillNames.push(parser[pos++]);
            var skillInfoText:Array<String> = [];
            for (i in 0...3) {
                skillInfoText.push(parser[pos++]);
            }
            skillInfoTexts.push(skillInfoText);
        }

        trace(skillNames.length == GameConstants.SKILL_QUANTITY);

        var legacyData:Array<Dynamic> = [];
        for (id in 0...GameConstants.SKILL_QUANTITY) {
            var skillNode = {name: skillNames[id]};
            for (level in 1...StringConstants.SECONDARY_SKILLS_LEVELS.length) {
                var desc:String = skillInfoTexts[id][level - 1];
                var levelNode = {description: desc, effects: {}}; // create empty effects objects
                Reflect.setField(skillNode, StringConstants.SECONDARY_SKILLS_LEVELS[level], levelNode);
            }
        }

        return legacyData;
    }
}