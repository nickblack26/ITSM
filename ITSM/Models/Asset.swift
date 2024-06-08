import Foundation
import RealmSwift

class Asset: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId = .init()
    @Persisted var company: Company?
    @Persisted var name: String = ""
    @Persisted var type: AssetType?
    @Persisted var user: User?
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

extension Asset {
    static let asset1 = Asset(name: "V201849")
}
