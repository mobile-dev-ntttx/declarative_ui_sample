//
//  ContentView.swift
//  Shared
//
//  Created by 神長貴博 on 2022/08/19.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var image = UIImage(named:"DefaultImage")!
    let qrCode = QRCode()

    var body: some View {
        NavigationView {
            VStack {
                TextField("文字を入力してください", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.URL)
                    .autocapitalization(.none)
                    .padding()
                Button(action: {
                    let text = inputText.trimmingCharacters(in: .whitespaces)
                    if( !text.isEmpty ) {
                        image = qrCode.generate(str: text)
                        self.inputText = ""
                    }
                }, label: {
                    Text("生成")
                        .fontWeight(.bold)
                        .frame(width: 150, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(.blue))
                        .cornerRadius(15.0)
                })
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
            }
            .navigationTitle("QRコード生成アプリ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
