//
//  R1.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Control your meetings in one app")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    R1()
}
