//
//  EmployeRow.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import SwiftUI

///
/// A employe row view.
///
struct EmployeRow: View
{
	/// A employe name.
    var employeName: String
	/// A employe department.
    var employeDepartment: String
	/// Is employe completed or not.
    var completed: Bool

	var body: some View
	{
		VStack(alignment: .leading)
		{
			HStack(spacing: 10)
			{
				Text("Name:- \(employeName)")
			}
			.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)

			HStack(spacing: 10)
			{
				// If employe is completed, show a checkmark circle, otherwise show an empty circle
				Image(systemName: completed ? "checkmark.circle" : "circle")
			}
			.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .trailing)

			HStack(spacing: 10)
			{
				Text("Department:- \(employeDepartment)")
			}
			.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
		}
		Divider()
	}
}

struct EmployeRow_Previews: PreviewProvider
{
    static var previews: some View
    {
		EmployeRow(employeName: "test", employeDepartment: "mobile", completed: true)
    }
}
