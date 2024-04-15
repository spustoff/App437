//
//  HistoryView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = HistoryViewModel()
    @Environment(\.presentationMode) var router
    
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
                
                Text("History")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                    
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.currentType = index
                                viewModel.fetchSubscriptions()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .padding(3)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(viewModel.currentType == index ? 1 : 0)))
                            })
                        }
                    }
                }
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.2)))
                
                if viewModel.subscriptions.isEmpty {
                    
                    VStack(spacing: 12) {

                        Text("Your subscription list is empty")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.subscriptions, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedSubscription = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 10, content: {
                                            
                                            Text(index.subTitle ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                            
                                            Text(index.subDate ?? "")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 14, weight: .regular))
                                            
                                        })
                                        
                                        Spacer()
                                            
                                            Text("$\(index.subAmount ?? "")")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 14, weight: .regular))
                                    }
                                })
                                
                                Rectangle()
                                    .fill(.gray)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.expenses -= Int(viewModel.selectedSubscription?.subAmount ?? "") ?? 0
                            
                            CoreDataStack.shared.deleteSub(withSubTitle: viewModel.selectedSubscription?.subTitle ?? "", completion: {
                                
                                viewModel.fetchSubscriptions()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                
                            }
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .padding(.top)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bgd")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HistoryView()
}
