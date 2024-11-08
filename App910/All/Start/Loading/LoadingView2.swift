//
//  LoadingView2.swift
//  App910
//
//  Created by IGOR on 08/11/2024.
//

import SwiftUI

struct LoadingView2: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim3"), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView2()
}
