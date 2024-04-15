//
//  R2.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 12) {
                
                HStack {
  
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                
                Text("All subscriptions in one place")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                
                NavigationLink(destination: {
                    
                    R3()
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
    R2()
}
