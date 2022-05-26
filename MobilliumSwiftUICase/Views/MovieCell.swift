//
//  MovieCell.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 26.05.2022.
//

import SwiftUI

struct MovieCell: View {
    
    @State var movieName : String
    @State private var isAlert = false
    
    
    var body: some View {
        
        Button {
            isAlert = true
        } label: {
            Text(movieName)
                .foregroundColor(Color("darkGrey"))
        }
        .alert(isPresented: $isAlert) { () -> Alert in
            Alert(title: Text("Secilen Film"), message: Text(movieName), dismissButton: .default(Text("Tamam")))
             }

    }
    
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movieName: "Spiderman").previewLayout(.sizeThatFits)
    }
}
