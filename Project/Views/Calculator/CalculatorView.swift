//
//  CalculatorView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 18) {
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.gray.opacity(0.6))
                    .frame(width: 40, height: 4)
                
                Text("Calculator")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Balance")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.calcBalanceString.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.calcBalanceString)
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                    
                })
                .padding(6)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                
                HStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Circle()
                            .stroke(Color("prim2"), lineWidth: 14)
                            .frame(width: 50, height: 50)
                     
                        Circle()
                            .trim(from: 0, to: CGFloat(viewModel.calculatePercentage() / 100))
                            .stroke(Color("prim"), lineWidth: 14)
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(-90))
                    }
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("\(viewModel.expenses)/\(viewModel.balance) $")
                            .foregroundColor(viewModel.expenses > viewModel.balance ? .red : .black)
                            .font(.system(size: 24, weight: .semibold))
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                                
                                Circle()
                                    .fill(Color("prim"))
                                    .frame(width: 8, height: 8)
                                
                                Text("Expenses")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                            
                            HStack {
                                
                                Circle()
                                    .fill(Color("prim2"))
                                    .frame(width: 8, height: 8)
                                
                                Text("Balance")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                        }
                    }
                    
                    Spacer()

                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                
                Button(action: {
                    
                    viewModel.balance = Int(viewModel.calcBalanceString) ?? 0
                    
                    viewModel.calcBalanceString = ""
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    
                })
                .opacity(viewModel.calcBalanceString.isEmpty ? 0.5 : 1)
                .disabled(viewModel.calcBalanceString.isEmpty ? true : false)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CalculatorView()
}
