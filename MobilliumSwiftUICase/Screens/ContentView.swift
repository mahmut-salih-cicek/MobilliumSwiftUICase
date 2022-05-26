//
//  ContentView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("Login") var isLogin : Bool = true
    // uygulamanin her yerinden appStorage ulasabildiğim için ekranlari appStorage ile yönetiyorum.
    
    var body: some View {
        ZStack{
            if isLogin{
                HomeView()
            }else{
                // eğer giriş yapildiysa MovieListView yonlendircek
               MovieListView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
