//
//  GMapKitView.swift
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

struct GMapKitView_Previews: PreviewProvider {
    static var previews: some View {
        GMapKitView()
    }
}
