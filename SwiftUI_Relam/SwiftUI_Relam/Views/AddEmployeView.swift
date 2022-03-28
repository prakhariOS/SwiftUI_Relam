//
//  AddEmployeView.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import SwiftUI

///
/// Add employe view.
///
struct AddEmployeView: View
{
    @EnvironmentObject var realmManager: RealmManager
	@Environment(\.dismiss) var dismiss

	/// Is show alert.
	@State private var showsAlert = false
	/// A employe name.
    @State private var employeName: String = ""
	/// A employe department name.
	@State private var employeDepartment: String = ""

    var body: some View
    {
        VStack(alignment: .leading, spacing: 20)
        {
            Text("Create a new employe")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField(
                "Enter employe name",
                text: $employeName
            )
			.textFieldStyle(.roundedBorder)

			TextField(
                "Enter employe department",
                text: $employeDepartment
            )
                .textFieldStyle(.roundedBorder)

            Button
            {
                // Only adding a employe if user added something in the TextField
                if employeName != "" && employeDepartment != ""
                {
                    realmManager.addEmploye(
						employeName: employeName,
						department: employeDepartment
					)
					dismiss()
                }
                else
                {
					showsAlert = true
				}
            }
            label:
            {
                Text("Add Employe")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.orange)
                    .cornerRadius(30)
            }

            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(.yellow)

		.alert("Enter both employe name and it's department", isPresented: $showsAlert)
		{
            Button("OK", role: .cancel) { }
        }
    }
}

struct AddEmployeView_Previews: PreviewProvider
{
    static var previews: some View {
        AddEmployeView().environmentObject(RealmManager())
    }
}
