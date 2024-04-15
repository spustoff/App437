//
//  TabBar.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    if index == Tab.Add {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 10)
                        
                    } else {
                        
                        VStack(alignment: .center, spacing: 8, content: {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color.white : Color.white.opacity(0.4))
                                .frame(height: 22)
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color.white : Color.white.opacity(0.4))
                                .font(.system(size: 12, weight: .regular))
                            
                        })
                        .frame(maxWidth: .infinity)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("prim"))
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Calculator = "Calculator"
    
    case Add = "Add"
    
    case History = "History"
    
    case Settings = "Settings"
        
}
