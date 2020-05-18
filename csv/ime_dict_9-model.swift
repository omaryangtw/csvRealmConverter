import Foundation
import RealmSwift

class ImeDict: Object {
    @objc dynamic var wordId: Int = 0
    @objc dynamic var kiplmj: String = ""
    @objc dynamic var kiplmjInputWithNumberTone: String = ""
    @objc dynamic var kiplmjInputWithoutTone: String = ""
    @objc dynamic var kiplmjShortInput: String = ""
    @objc dynamic var poj: String = ""
    @objc dynamic var pojInputWithNumberTone: String = ""
    @objc dynamic var pojInputWithoutTone: String = ""
    @objc dynamic var pojShortInput: String = ""
    @objc dynamic var pojPriority: Int = 0
    @objc dynamic var kiplmjPriority: Int = 0
    @objc dynamic var hanji: String = ""

    override static func primaryKey() -> String? {
        return "wordId"
    }

    override static func indexedProperties() -> [String] {
        return ["kiplmj", "kiplmjInputWithNumberTone", "kiplmjInputWithoutTone", "kiplmjShortInput", "poj", "pojInputWithNumberTone", "pojInputWithoutTone", "pojShortInput", "hanji"]
    }
}

class KipTaigiSu: Object {
    @objc dynamic var mainCode: Int = 0
    @objc dynamic var wordPropertyCode: Int = 0
    @objc dynamic var hanji: String = ""
    @objc dynamic var lomaji: String = ""

    override static func primaryKey() -> String? {
        return "mainCode"
    }

    override static func indexedProperties() -> [String] {
        return ["hanji", "lomaji"]
    }
}

class KipTaigiSuKithannKonghoat: Object {
    @objc dynamic var index: Int = 0
    @objc dynamic var mainCode: Int = 0
    @objc dynamic var lomaji: String = ""

    override static func primaryKey() -> String? {
        return "index"
    }
}

