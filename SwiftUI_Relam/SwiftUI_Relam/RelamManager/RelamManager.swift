//
//  RelamManager.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject
{
    private(set) var localRealm: Realm?
    @Published var employees: [Employe] = []

    ///
	/// On initialize of the class
	///
    init()
    {
        openRealm()
        getEmployees()
    }

    ///
	/// Function to open a Realm, needed for saving data inside of the Realm.
	///
    func openRealm()
    {
        do
        {
            // Setting the schema version
            let config = Realm.Configuration(schemaVersion: 1)

            // Letting Realm know we want the defaultConfiguration to be the config variable
            Realm.Configuration.defaultConfiguration = config

            // Trying to open a Realm and saving it into the localRealm variable
            localRealm = try Realm()
        }
        catch
        {
            print("Error opening Realm", error)
        }
    }

	///
	/// Function to add a employe and need to unwrap optional,
	/// since localRealm is optional
	///
    func addEmploye(employeName: String, department: String)
    {
        if let localRealm = localRealm
        {
            do
            {
                try localRealm.write
                {
                    // Creating a new employe
                    let newEmploye = Employe(
						value: [
						"name": employeName,
						"department": department,
						"completed": false
						]
					)

                    // Adding employe to localRealm
                    localRealm.add(newEmploye)

                    getEmployees()
                    print("Added new employee to Realm!", newEmploye)
                }
            }
            catch
            {
                print("Error adding employe to Realm: \(error)")
            }
        }
    }

    ///
	/// Function to get all employees from Realm and setting them
	/// in the employee array and getting all objects from
	/// local Realm and sorting them by completed state
	///
    func getEmployees()
    {
        if let localRealm = localRealm
        {
            let all = localRealm.objects(Employe.self).sorted(byKeyPath: "completed")

            employees = []

            all.forEach
            { employe in
                employees.append(employe)
            }
        }
    }

	///
	/// Function to update an employe.
	///
	/// Find the employe by id and changing its completed state.
	///
    func updateEmploye(id: ObjectId, completed: Bool)
    {
        if let localRealm = localRealm
        {
            do
            {
                let employeToUpdate = localRealm.objects(Employe.self).filter(NSPredicate(format: "id == %@", id))

                guard !employeToUpdate.isEmpty else { return }

                try localRealm.write
                {
                    employeToUpdate[0].completed = completed

                    getEmployees()
                    print("Updated employe with id \(id)! Completed status: \(completed)")
                }
            }
            catch
            {
                print("Error updating employe \(id) to Realm: \(error)")
            }
        }
    }

    ///
	/// Function to delete a employe.
	///
	/// Find the employe we want to delete by its id.
	///
    func deleteEmploye(id: ObjectId)
    {
        if let localRealm = localRealm
        {
            do
            {
                let employeToDelete = localRealm.objects(Employe.self).filter(NSPredicate(format: "id == %@", id))

                guard !employeToDelete.isEmpty else { return }

                // Trying to write to the localRealm
                try localRealm.write
                {

                    localRealm.delete(employeToDelete)

                    getEmployees()
                    print("Deleted employe with id \(id)")
                }
            }
            catch
            {
                print("Error deleting employe \(id) to Realm: \(error)")
            }
        }
    }
}
