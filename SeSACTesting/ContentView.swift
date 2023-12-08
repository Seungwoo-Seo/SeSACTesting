//
//  ContentView.swift
//  SeSACTesting
//
//  Created by 서승우 on 2023/12/08.
//

import SwiftUI

struct ContentView: View {
    @State private var emailText = ""
    @State private var idText = ""
    @State private var passwordText = ""

    @State private var showPage = false

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            TextField("이메일을 입력해주세요", text: $emailText)
                .font(.title)
                .foregroundColor(.green)
                .accessibilityIdentifier("emailTextField")  // 개발자들이 지정할 식별자
                .accessibilityLabel("이메일 기입란")  // 장애인들에게 말해줄 텍스트

            TextField("아이디를 입력해주세요", text: $idText)
                .accessibilityIdentifier("idTextField")

            TextField("비밀번호를 입력해주세요", text: $passwordText)
                .accessibilityIdentifier("passwordTextField")

            Button("로그인 하기") {

            }
            .accessibilityIdentifier("loginButton")
        }
        .padding()
        .sheet(isPresented: $showPage) {
            NextView()
        }
    }
}

struct NextView: View {
    var body: some View {
        Text("다음 페이지")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
