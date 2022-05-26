//
//  SecureTextFieldView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 26.05.2022.
//

import SwiftUI

struct SecureTextFieldView: View {
    
    @Binding var textFieldValue : String
    var placeHolder : String
    
    var body: some View {
        SecureField("\(placeHolder)", text: $textFieldValue)
            .padding()
            .frame(maxWidth:.infinity)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.1), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
    }
}

struct SecureTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(placeHolder: "name", textFieldValue: .constant("")).previewLayout(.sizeThatFits)
        /// preview boyutunu textfield boyutu kadar yaptim
    }
}
