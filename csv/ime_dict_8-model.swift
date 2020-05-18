import Foundation
import RealmSwift

class ImeDict8: Object {
    @objc dynamic var wordId: Int = 0
    @objc dynamic var mainCode: Int = 0
    @objc dynamic var wordPropertyCode: Int = 0
    @objc dynamic var tailo: String = ""
    @objc dynamic var tailoInputWithNumberTone: String = ""
    @objc dynamic var tailoInputWithoutTone: String = ""
    @objc dynamic var tailoShortInput: String = ""
    @objc dynamic var poj: String = ""
    @objc dynamic var pojInputWithNumberTone: String = ""
    @objc dynamic var pojInputWithoutTone: String = ""
    @objc dynamic var pojShortInput: String = ""
    @objc dynamic var priority: Int = 0
    @objc dynamic var wordLength: Int = 0
    @objc dynamic var lomajiCharLength: Int = 0
    @objc dynamic var hanji: String = ""

    override static func primaryKey() -> String? {
        return "wordId"
    }

    override static func indexedProperties() -> [String] {
        return ["tailo", "tailoInputWithNumberTone", "tailoInputWithoutTone", "tailoShortInput", "poj", "pojInputWithNumberTone", "pojInputWithoutTone", "pojShortInput", "hanji"]
    }
}
