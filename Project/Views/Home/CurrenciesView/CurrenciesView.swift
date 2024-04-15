//
//  CurrenciesView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency pair")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))

                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isChart = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .regular))
                                }
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                        }
                    }
                }
                .padding()
            }
        }
                .sheet(isPresented: $viewModel.isChart, content: {
        
                    ChartView(viewModel: viewModel)
                })
    }
}

#Preview {
    CurrenciesView(viewModel: HomeViewModel())
}
