//
//  LoginView.swift
//  OSP Student Portal
//
//  Created by Craig Clifford on 4/3/21.
//

import SwiftUI
import WebKit

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


struct LoginView: View {
    
    @State var sid: String = "7132"
    @State var cid: String = "1231"
    
    var body: some View {
        NavigationView {

        VStack {
            WelcomeText()
            ospLogo()
            Text("OHIO SCHOOL OF PHLEBOTOMY")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            TextField("Student ID" , text: $sid)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            TextField("Class ID", text: $cid)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 25)

            NavigationLink(destination: ContentViewB(sid: $sid, cid: $cid)) {
                LoginButtonContent()
            }
            
        }
        .padding()
        }
        .padding(.bottom, 10.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            
            
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct ospLogo: View {
    var body: some View {
        Image("osp_logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 40)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}
struct ContentViewB: View {
    //log student in and expose student variable for db search
    @Binding var sid: String
    @Binding var cid: String

    let externshipAttach = "Adena_Externship_OSP.pdf"
    
    //list view
    var body: some View {
        VStack {
            NavigationView {
                List {
                    NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https://ospcf.azurewebsites.net/indexStudent.php?sid=" + sid)!))) {
                        HStack {
                            Image(systemName: "list.bullet").foregroundColor(.red)
                            Text("Payment History")
                        }
                    }

                    NavigationLink(destination: ExReqView(request: URLRequest(url: URL(string: "https://ospcf.azurewebsites.net/exView.php?sid=" + sid + "&cid=" + cid)!))) {
                        HStack {
                            Image(systemName: "e.square").foregroundColor(.red)
                            Text("Externship Assignment")
                        }
                        
                    }
                    NavigationLink(destination: ExReqView(request: URLRequest(url: URL(string: "https://ospcf.azurewebsites.net/attach/" + externshipAttach)!))) {
                        HStack {
                            Image(systemName: "doc").foregroundColor(.red)
                            Text("Externship Requirements")
                        }
                        
                    }
                    NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https://ospcf.azurewebsites.net/uploadini.php?sid=" + sid)!))) {
                        HStack {
                            Image(systemName: "doc.badge.plus").foregroundColor(.red)
                            
                            Text("Document Upload")
                        }
                        
                    }
                    NavigationLink(destination: MessagesView(request: URLRequest(url: URL(string: "https://ospcf.azurewebsites.net/paymentportal.php?sid=" + sid + "&cid=" + cid)!))) {
                        HStack {
                            Image(systemName: "creditcard").foregroundColor(.red)
                            
                            Text("Online Payment")
                        }
                    }
//                    NavigationLink(destination: LoginView()) {
//                        HStack {
//                            Image(systemName: "a.circle").foregroundColor(.red)
//
//                            Text("View Grades")
//                            //goto to web grades
//                        }
//                    }
                    NavigationLink(destination: MessagesView(request: URLRequest(url: URL(string: "https://ospcf.azurewebsites.net/indexStudentMessages.php?sid=" + sid)!))) {
                        HStack {
                            Image(systemName: "envelope").foregroundColor(.red)
                            
                            Text("Student Messages")
                        }                }
                }
                .navigationBarTitle(Text("Student Portal"))
                
            }
            
            Spacer()
            
            Text("O H I O  S C H O O L  O F  P H L E B O T O M Y")
                .font(.caption)
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
// Struct Page Views
//struct ImageView: View {
//    var body: some View {
//        Text("Login View")
//    }
//}
//struct LoginView: View {
//    var body: some View {
//        Text("Login View")
//    }
//}
struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}
struct MessagesView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}
struct PaymentView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}
struct ExReqView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}
