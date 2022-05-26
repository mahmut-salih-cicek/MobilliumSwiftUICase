//
//  LoginView.swift
//  MobilliumSwiftUICase
//
//  Created by xmod on 25.05.2022.
//

import SwiftUI

struct LoginView: View {
    
    
    // butun  ekranlarda düzgün görünmesi ekranlarin width ve heightini aldim ve bunlari kullanacağim zaman oranlayip kullaniyorum.
    @State private var width : Double = UIScreen.main.bounds.width
    @State private var height : Double = UIScreen.main.bounds.height
    
    @State var textFieldName : String = ""
    @State var textFieldPassworrd : String = ""
    

    @Binding var name : String
    @Binding var password : String
    
    @State private var checked: [Bool] = [false,false]
    // check boxlari arraylerde tuttum.
    var labelData = ["Remind me"," I accept to get promotional e-mail from Mobillium about ZonZero Program."]
    
    @State private var visibialityCheckBox = false
    @State private var isAlert = false
    @State private var alertText = ""
    @State private var isMovieListActive = false
    
    // custom back button için environment ekledim
    @Environment(\.presentationMode) var presentation : Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
        ZStack{
            Color("bgColor").ignoresSafeArea(.all)
       
            VStack(spacing:60){
                
                /// kod okunabilirliği için HEADER CENTER FOOTER diye 3 ayirdim
                
                // MARK: - HEADER
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Image("left-arrow")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 320))
                }
                
        
                Text("Login Screen")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 50, trailing: 0))
   

                // MARK: - CENTER
                VStack{
                VStack{
                    TextFieldView(placeHolder: "Name", textFieldValue: $textFieldName)
                    SecureTextFieldView(textFieldValue: $textFieldPassworrd, placeHolder: "Password")
                }.padding()
                
                VStack(alignment:.leading,spacing: 10){
                      
                    
                    HStack(){
                        CheckBoxView(checked: $checked[0],visibialityCheckBox2: $visibialityCheckBox)
                        Text(labelData[0])
                    }.frame(width: width/1.3, height: 30,alignment: .leading)
                        
                    HStack{
                        if visibialityCheckBox{
                            CheckBoxView(checked: $checked[1],visibialityCheckBox2: $visibialityCheckBox)
                                .padding(.bottom, 30.0)
                            Text(labelData[1])
                        }
                    }.frame(width: width/1.3, height: height/10,alignment: .leading)
                            
                }
            }
                
                // MARK: - FOOTER
              
                    Button {
                        checkTextField()
                    } label: {
                        ButtonView(bgColor: Color("ButtonColor"), buttonTitle: "Login", foregroundColor: Color("White"))
                             .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }.padding()
                    .alert(isPresented: $isAlert) { () -> Alert in
                                 Alert(title: Text("Hata Var"), message: Text(alertText),
                                       primaryButton: .default(Text("Retry"), action: {
                                     textFieldName = ""
                                     textFieldPassworrd = ""
                                 }), secondaryButton: .default(Text("Cancel")))
                    }
                
                NavigationLink(
                    destination: MovieListView(),
                    isActive: $isMovieListActive,
                    label: EmptyView.init)
                
                Spacer()
                
            
        } // MARK: - HSTACK
    } // MARK: - ZStack
        .navigationBarHidden(true)
        }.navigationBarHidden(true)
}
    
    func checkTextField(){
        if name != "" && password != ""{
        if textFieldName == name {
            if textFieldPassworrd == password{
                // listview götür
                isMovieListActive = true
            }else{
                isAlert = true
                alertText = "wrong password"
            }
        }else{
            // uyari mesaji isim hatali göster
            isAlert = true
            alertText = "wrong name"
        }
        }else{
            isAlert = true
            alertText = "empty text"
        }
    }

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(name: .constant(""), password: .constant(""))
    }
}
    
}
