//
//  CheckBoxView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

struct CheckBoxView: View {
    
     @Binding var checked: Bool
     @Binding var visibialityCheckBox2 : Bool
     
     var body: some View {
         Image(systemName: checked ? "checkmark.square.fill" : "square")
             .resizable()
             .frame(width: 25, height: 25, alignment: .center)
             .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
             .onTapGesture {
                 self.checked.toggle()
                 visibialityCheckBox2 = true
                 if checked == false{
                     visibialityCheckBox2 = false
                 }
             }
             
 }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(checked: .constant(true), visibialityCheckBox2: .constant(false)).previewLayout(.sizeThatFits)
    }
}
