//
//  AddButton.swift
//  SwiftUI_Relam
//
//  Created by prakhar gupta on 03/03/22.
//

import SwiftUI

///
/// Add button view.
///
struct AddButton: View
{
    var body: some View
    {
        ZStack
        {
            Circle()
                .frame(width: 45)
                .foregroundColor(.red)

            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 45)
    }
}

struct AddButton_Previews: PreviewProvider
{
    static var previews: some View
    {
        AddButton()
    }
}
