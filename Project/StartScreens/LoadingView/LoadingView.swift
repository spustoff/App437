//
//  LoadingView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
