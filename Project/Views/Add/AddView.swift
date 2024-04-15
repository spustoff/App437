//
//  AddView.swift
//  App437
//
//  Created by IGOR on 06/04/2024.
//

import SwiftUI

struct AddView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.gray.opacity(0.6))
                    .frame(width: 40, height: 4)
                
                ZStack {
                    
                    Text("Create an item")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text("Subscription is active")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Toggle(isOn: $viewModel.isOn, label: {
                            
                        })
                    }
                    .padding(.vertical, 6)
                    
                    VStack(spacing: 5) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.subTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.subTitle)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(6)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        .padding(2)
                        
                        Rectangle()
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Date of debiting")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.subDate.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.subDate)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(6)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        .padding(2)
                        
                        Rectangle()
                            .fill(.white.opacity(0.1))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.subAmount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.subAmount)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                        .padding(6)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))
                        .padding(2)
                        
                    }
                    
                    Button(action: {
                        
                        viewModel.expenses += Int(viewModel.subAmount) ?? 0
                        
                        viewModel.addsubScription()
                        
                        viewModel.subTitle = ""
                        viewModel.subDate = ""
                        viewModel.subAmount = ""
                        
                        viewModel.fetchSubscriptions()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Create")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        
                    })
                    .padding(.top, 30)
                    .opacity(viewModel.subTitle.isEmpty || viewModel.subDate.isEmpty || viewModel.subAmount.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.subTitle.isEmpty || viewModel.subDate.isEmpty || viewModel.subAmount.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddView()
}
