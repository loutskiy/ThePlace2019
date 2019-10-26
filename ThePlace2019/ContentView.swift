//
//  ContentView.swift
//  ThePlace2019
//
//  Created by Михаил Луцкий on 26.10.2019.
//  Copyright © 2019 Mikhail Lutskii. All rights reserved.
//

import SwiftUI

struct GMapKitView: UIViewRepresentable {
    func updateUIView(_ uiView: MapController, context: UIViewRepresentableContext<GMapKitView>) {
        
    }
    
    func makeUIView(context: Context) -> MapController {
        MapController(frame: .zero)
    }
}

struct ContentView: View {
    
    @State var text = ""
    func action() {
        
    }
    
    var body: some View {
            VStack {
                HStack(spacing: 10) {
                    TextField("Address", text: $text, onCommit: action)
                        .frame(height: 32)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .padding(.horizontal, 5)

                    Button(action: {
                        print("clicked")
                    }) {
                        Text("Buildings")
                    }.padding(.horizontal, 10)

                    Button(action: {
                        print("clicked")
                    }) {
                        Text("Animals")
                    }.padding(.horizontal, 10)
                }
                GMapKitView()
                    //UIScreen.main.bounds.height-80
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
                
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
