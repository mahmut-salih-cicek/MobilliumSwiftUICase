//
//  TextFieldView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

/// Textfield birçok yerde kullancağım için tek bir view oluşturdum.

struct TextFieldView: View {
    
    var placeHolder : String
    @Binding var textFieldValue : String
    
    var body: some View {
        TextField("\(placeHolder)", text: $textFieldValue)
            .padding()
            .frame(maxWidth:.infinity)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.1), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(placeHolder: "name", textFieldValue: .constant("")).previewLayout(.sizeThatFits)
        /// preview boyutunu textfield boyutu kadar yaptim
    }
}
