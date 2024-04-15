//
//  ChartView.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct ChartView: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
 
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Currency value")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .medium))
                    
                    HStack {
                        
                        Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9)))),\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                        
                        Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))%")
                            .foregroundColor(.green)
                            .font(.system(size: 13, weight: .semibold))
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 80)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                
                Image("graph")
                    .resizable()
                
                HStack {
                    
                    HStack {

                        Button(action: {
                                                        
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                        })
                        
                        Button(action: {
                                                        
                            viewModel.isChart = false
                            viewModel.isCurr = false
                            
                        }, label: {
                            
                            Text("Apply")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.green))
                        })
                    }
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ChartView(viewModel: HomeViewModel())
}
