//
//  MovieListView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @AppStorage("Login") var isLogin : Bool = false
   
    var body: some View {
        NavigationView{
        ZStack{
            Color("bgColor").ignoresSafeArea(.all)
            VStack{
                List(movieList){ movie in
                    MovieCell(movieName: movie.movieName)
                }
            }
        }
        
        .navigationBarItems(trailing:
            Button(action: {
            isLogin = true
            print("basildi")
            }) {
                Image("exit")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
            }
        )
        }.navigationBarHidden(true)
            .onAppear(perform: {
                isLogin = false
            })
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
