//
//  ButtonView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    @State var bgColor : Color
    @State var buttonTitle : String
    @State var foregroundColor : Color
    
    
    var body: some View {
        VStack{
            Text(buttonTitle)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
                .frame(maxWidth:.infinity)
                .padding()
                .background(bgColor)
                .cornerRadius(50)
            
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            bgColor: Color("ButtonColor"),
            buttonTitle: "Button",
            foregroundColor: Color("White")
            
        ).previewLayout(.sizeThatFits)
        // ayni şekilde tekrar preview'i view boyutunda ayarladim.
    }
}
