//
//  ContentView.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var realmManager = RealmManager()
    @State private var showAddEmployeView = false

    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            EmployeListView()
                .environmentObject(realmManager)

            AddButton()
                .padding()
                .onTapGesture {
                    showAddEmployeView.toggle()
                }
        }
        .sheet(isPresented: $showAddEmployeView)
        {
            AddEmployeView().environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
