//
//  Reviewas.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI
import StoreKit

struct Reviewas: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 12) {
                
                HStack {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
      
                    Circle()
                        .fill(Color("prim"))
                        .frame(width: 8, height: 8)

                }
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                    }
                    
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviewas(telegram: URL(string: "h")!, isTelegram: false)
}
