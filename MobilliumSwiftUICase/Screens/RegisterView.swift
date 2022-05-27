//
//  RegisterView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    // butun  ekranlarda düzgün görünmesi ekranlarin width ve heightini aldim ve bunlari kullanacağim zaman oranlayip kullaniyorum.
    @State private var width : Double = UIScreen.main.bounds.width
    @State private var height : Double = UIScreen.main.bounds.height
    
    @State var name : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var rePassword : String = ""
    @State var isLoginViewActive = false
    @State private var isAlert = false
    @State private var alertText = ""
    // custom back button için environment ekledim
    @Environment(\.presentationMode) var presentation : Binding<PresentationMode>

    
    var body: some View {
        
        
        NavigationView{
        ZStack{
            Color("bgColor").ignoresSafeArea(.all,edges: .all)
            
            VStack(spacing:50){
                // Kod okunabilirliğini artirmak için MARK kullaniyorum ekrani 3 böldüm HEADER,CENTER,FOOTER
                
                // MARK: - HEADER
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 320))
                }
                
        
                Text("Register Screen")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                
          
                // MARK: - Center
                VStack{
                TextFieldView(placeHolder: "Name", textFieldValue: $name)
                
                TextFieldView(placeHolder: "Email", textFieldValue: $email)
                
                SecureTextFieldView(textFieldValue: $password, placeHolder: "Password")
                    
                SecureTextFieldView(textFieldValue: $rePassword, placeHolder: "RePassword")
            
                }.padding()
                
                // MARK: - Footer

                Button {
                    checkTextField()
                } label: {
                    ButtonView(bgColor: Color("ButtonColor"), buttonTitle: "Register", foregroundColor: Color("White"))
                         .padding(EdgeInsets(top: 0, leading: 20, bottom: height/20, trailing: 20))
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0))
                    .alert(isPresented: $isAlert) { () -> Alert in
                                 Alert(title: Text("Error"), message: Text(alertText),
                                       primaryButton: .default(Text("Retry"), action: {
                                     name = ""
                                     email = ""
                                     password = ""
                                     rePassword = ""
                                 }), secondaryButton: .default(Text("Cancel")))
                         }
                    
                

                
                NavigationLink(
                    destination: LoginView(name: $name,password: $password),
                    isActive: $isLoginViewActive,
                    label: EmptyView.init)
              
                
               
            } // MARK: - Vstack
          }.navigationBarHidden(true)// MARK: - Navigation 
                
           
        }.navigationBarHidden(true)
        
    }
    
    func checkTextField(){
        if name != "" && email != "" && rePassword != "" && password != ""{
            if name.count > 3 && email.count > 3 && password.count > 3 && rePassword.count > 3{
                if password == rePassword{
                    isLoginViewActive = true
                }else{
                    // passwordlar eslesmiyor
                    isLoginViewActive = false
                    alertText = "not match password"
                    isAlert = true
                }
            }else{
                isLoginViewActive = false
                // count 3 den az
                alertText = "less than 3 characters"
                isAlert = true
            }
        }else{
            // text fieldlarda bos birakilma var
            isLoginViewActive = false
            alertText = "empty text"
            isAlert = true
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
