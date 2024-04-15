//
//  U1.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 12) {
                
                HStack {
                    
                    Circle()
                        .fill(Color("prim"))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
      
                }
                
                Text("Show your financial growth")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                
                NavigationLink(destination: {
                    
                    Reviewas(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
