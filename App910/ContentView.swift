//
//  ContentView.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI

struct ContentView: View {
    

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
                StatisticsView()
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
