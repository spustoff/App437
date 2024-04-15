//
//  SettingsView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                .opacity(0)
                .disabled(true)
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 10) {

                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                }
                .padding(.top, 6)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
