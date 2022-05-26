//
//  HomeView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 26.05.2022.
//

import SwiftUI

struct HomeView: View {
    
    // butun  ekranlarda düzgün görünmesi ekranlarin width ve heightini aldim ve bunlari kullanacağim zaman oranlayip kullaniyorum.
    @State private var width : Double = UIScreen.main.bounds.width
    @State private var height : Double = UIScreen.main.bounds.height
    

    @State private var isAnimating : Bool = false
    @State private var isRegisterButtonActive = false
    @State private var isSignInButtonActive = false
    @State private var isAlert = false
    
    var body: some View {
        NavigationView{
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all,edges: .all)
            
            VStack(spacing:30){
                
                Spacer()
                // MARK: - HEADER
                ZStack{
                    
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .blur(radius: isAnimating ? 0 : 10)
                        .opacity(isAnimating ? 1 : 0)
                        .scaleEffect(isAnimating ? 1 : 0.5)
                        .animation(.easeOut(duration: 0.9), value: isAnimating)
                    
                Image("business-person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .aspectRatio(contentMode: .fit)
                    .offset(y:isAnimating ? 15 : -15)
                    .animation(Animation
                                .easeInOut(duration: 2)
                                .repeatForever()
                                ,value: isAnimating
                    )
                   
                }
                
                // MARK: - CENTER
                Spacer()
                VStack{
                    Button {
                        isRegisterButtonActive = true
                    } label: {
                        ButtonView(bgColor: Color("ButtonColor"), buttonTitle: "Register", foregroundColor: Color("White"))
                    }

                    Button {
                        isAlert = true
                    } label: {
                        ButtonView(bgColor: .white, buttonTitle: "Sign In", foregroundColor: .pink)
                    }
                    .alert(isPresented: $isAlert) { () -> Alert in
                        Alert(title: Text(""), message: Text("Bu ekrana giriş işlemini koymadım case'de belirtilen gibi registerdan sonra giris yapabilmeyi ekledim"), dismissButton: .default(Text("Tamam Yinede Bakalım"),action: {
                            isSignInButtonActive = true
                        }))
                         }
                    
                NavigationLink(
                    destination: RegisterView(),
                    isActive: $isRegisterButtonActive,
                    label: EmptyView.init)
                    
                    
                NavigationLink(
                    destination: LoginView(name: .constant(""), password: .constant("")),
                    isActive: $isSignInButtonActive,
                    label: EmptyView.init)

               
                }.padding()
            
                Spacer()
                // MARK: - FOOTER
                HStack{
                    Text("New around here?")
                        .foregroundColor(.white)
                        
                    Text("Sign In")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                Divider()
            }
            
        }
        .onAppear(perform: {
            // animasyonu ekran göründüğü an başlatiyorum
            isAnimating = true
           
        })
        }.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
