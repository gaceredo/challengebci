//
//  RealmSwift+Extension.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import RealmSwift

extension Object {

    /// Delete the current object from the database.
    func delete() {
        let realm = try? Realm()
        try? realm?.write {
            realm?.delete(self)
        }
    }

    /// Save the current object in the database.
    func save() {
        let realm = try? Realm()
        try? realm?.write {
            let primaryKeyExists = type(of: self).primaryKey() != nil
            if primaryKeyExists {
                realm?.add(self, update: .modified)
            } else {
                realm?.add(self)
            }
        }
    }

    /**
     Executes updates actions in a write transaction.

     - Parameter changes: An action containing changes to the object.
     */
    func update(changes: () -> Void) {
        let realm = try? Realm()
        try? realm?.write {
            changes()
        }
    }

    /// Clean out all objects of the current type from database.
    static func deleteAll() {
        let realm = try? Realm()
        guard let objects = realm?.objects(self) else { return }
        try? realm?.write {
            realm?.delete(objects)
        }
    }

    /// Returns the first object in the database.
    static func getFirst() -> Self? {
        let realm = try? Realm()
        return realm?.objects(self).first
    }
    
    static func getLast() -> Self? {
        let realm = try? Realm()
        return realm?.objects(self).last
    }

    /// Returns max value of a given property among all objects.
    static func getMaxValue<T: MinMaxType>(ofProperty name: String) -> T? {
        let realm = try? Realm()
        return realm?.objects(self).max(ofProperty: name)
    }

    /**
     Query the database and returns an object with the given primary key.

     - Parameter primaryKey: A primary key for an object.

     - Returns: An object of the current class with requested primary key value, or `nil` if there is no such object.
     */
    static func getObject(with primaryKey: Any) -> Self? {
        let realm = try? Realm()
        realm?.refresh()
        return realm?.object(ofType: self, forPrimaryKey: primaryKey)
    }

    /// Generic method to get all objects of a given Realm Object type.
    static func getAll<T: Object>() -> Results<T>? {
        let realm = try? Realm()
        return realm?.objects(T.self)
    }

    /// Count of objects of the current class in the database.
    static var count: Int {
        let realm = try? Realm()
        return realm?.objects(self).count ?? 0
    }
}

extension Sequence where Iterator.Element: Object {

    /// Save the sequence of the Realm objects.
    func save() {
        let realm = try? Realm()
        try? realm?.write {
            let primaryKeyExists = Iterator.Element.primaryKey() != nil
            if primaryKeyExists {
                realm?.add(self, update: .modified)
            } else {
                realm?.add(self)
            }
        }
    }

    /// Deletes the sequence of the Realm objects.
    func delete() {
        let realm = try? Realm()
        try? realm?.write {
            realm?.delete(self)
        }
    }
}
