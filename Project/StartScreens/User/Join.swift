//
//  Join.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {
 
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 12) {
                
                HStack {
  
              Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                            .padding(6)
                            .background(Circle().fill(Color("join")))
                    })
                    
                }
                
                Text("Join and earn")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                
                Spacer()
                
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("join")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
