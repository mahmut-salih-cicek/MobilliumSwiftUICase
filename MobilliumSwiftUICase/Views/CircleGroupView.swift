//
//  CircleGroupView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 26.05.2022.
//
import SwiftUI

struct CircleGroupView: View {
    
    // Property
    @State var ShapeColor : Color
    @State var ShapeOpacity : Double
  
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            
        } // : Zstack
        
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}

