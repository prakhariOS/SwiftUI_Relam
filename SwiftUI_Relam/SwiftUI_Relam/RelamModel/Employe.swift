//
//  Employe.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import Foundation
import RealmSwift

///
/// A employe table.
///
class Employe: Object, ObjectKeyIdentifiable
{
	/// This is our primary key, and each employe instance can be
	/// uniquely identified by the ID.
    @Persisted(primaryKey: true) var id: ObjectId
    /// A employe name.
    @Persisted var name = ""
	/// A employe department.
	@Persisted var department = ""
	/// A employe state is completed.
    @Persisted var completed = false
}
