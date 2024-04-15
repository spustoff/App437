//
//  HomeView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
                Text("Home")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
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
                            .foregroundColor(.black)
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
                
                if viewModel.subscriptions.isEmpty {
                    
                    VStack(spacing: 12) {

                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add subscriptions")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                .padding(.top, 5)
   
                        })
                        
                        
                        VStack(spacing: 12) {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Text("You haven't added any subscriptions yet")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isCurr = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, content: {
                                     
                                    HStack(content: {
                                         
                                        Image("flags")
                                        
                                        Spacer()
                                                                                
                                            Image(systemName: "pencil")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                    })
                                    
                                    Text("Currency change")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .semibold))
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 110)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            })
                            
                            ForEach(viewModel.subscriptions, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 6, content: {
                                     
                                    Text(index.subTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Text(index.subDate ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("\(index.subAmount ?? "")$")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 14, weight: .regular))
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 110)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        })
                    }
                    .padding(.top, 6)
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.gray.opacity(0.6))
                        .frame(width: 40, height: 4)
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(6)
                                    .background(Circle().fill(.white.opacity(0.1)))
                            })
                            
                            Spacer()

                        }
                        
                        Text("Create an item")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                    }
                    
                    
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
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchSubscriptions()
        }
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CurrenciesView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}



