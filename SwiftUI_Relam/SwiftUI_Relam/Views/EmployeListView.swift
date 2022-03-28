//
//  EmployeListView.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import SwiftUI

struct EmployeListView: View
{
    @EnvironmentObject var realmManager: RealmManager

    var body: some View
    {
        VStack
        {
            Text("Employees")
                .font(.title2).bold()
                .padding(.horizontal)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)

            List
            {
                ForEach(realmManager.employees, id: \.id)
                { employe in
                    // Must wrap in an if statement because we don't want to display the employe if it has been invalidated (will run into a crash otherwise)
                    if !employe.isInvalidated
                    {
                        EmployeRow(employeName: employe.name, employeDepartment: employe.department, completed: employe.completed)
                            .onTapGesture
                            {
								realmManager.updateEmploye(id: employe.id, completed: !employe.completed)
                            }
                            .swipeActions(edge: .trailing)
                            {
                                Button(role: .destructive)
                                {
                                    realmManager.deleteEmploye(id: employe.id)
                                }
                                label:
                                {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            Spacer()
        }
    }
}

struct EmployeListView_Previews: PreviewProvider
{
    static var previews: some View
    {
        EmployeListView()
            .environmentObject(RealmManager())
    }
}
