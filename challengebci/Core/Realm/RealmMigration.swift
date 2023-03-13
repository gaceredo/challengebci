//
//  RealmMigration.swift
//  challengebci
//
//  Created by Gustavo Aceredo on 12/3/23.
//

import Foundation
import RealmSwift

class RealmMigration {
    let nukeDBSchemaVersion: UInt64 = 1
    let schemaVersion: UInt64 = 1

    let migrationBlock: MigrationBlock = { migration, oldSchemaVersion in

        if oldSchemaVersion < 1 { }
    }

    var configuration: Realm.Configuration {
        return Realm.Configuration(
            schemaVersion: schemaVersion,
            migrationBlock: migrationBlock
        )
    }
}
