//
//  Not.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Play and win with us")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                })
            }
            .padding()
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.gray))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
