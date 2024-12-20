//
//  EditStone.swift
//  App910
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct EditStone: View {

    @StateObject var viewModel: StonesViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Edit")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                                   
                        Image(viewModel.selectedStone?.stPhoto ?? "")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                        
                        VStack(spacing: 12) {
                            
                            Text("Title")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(viewModel.selectedStone?.stTitle ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            
                            Text("Product Type")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.addingTypes, id: \.self) { index in

                                        Text(index)
                                        .foregroundColor(viewModel.selectedStone?.stType ?? "" == index ? .white : .white.opacity(0.3))
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(7)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(viewModel.selectedStone?.stType ?? "" == index ? Color("prim") : .white.opacity(0.1)))
                                }
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                        
                        VStack(spacing: 12) {
                            
                            Text("Weight")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(viewModel.selectedStone?.stWeight ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .padding(.bottom)
                            
                            Text("Size")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text(viewModel.selectedStone?.stSize ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            
                            HStack {
                                
                                VStack {
                                    
                                    Text("Date")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                    Text(viewModel.selectedStone?.stDate ?? "")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16, weight: .medium))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                                    
                                }
                                
                                VStack {
                                    
                                    Text("Price")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                    Text(viewModel.selectedStone?.stPrice ?? "")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16, weight: .medium))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                                    
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                        .padding(.bottom)
                        
                        HStack {
                            
                            Button(action: {
                                
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = true
                                }
                                
                            }, label: {
                                
                                Text("Delete")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15.0).fill(.white.opacity(0.1)))
                            })
                            
                            Button(action: {
                                
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isEdit = false
                                }
                                
                            }, label: {
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15.0).fill(Color("prim")))
                            })
                            
                        }
                    }
                }
            }
            .padding()
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
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        viewModel.numStones -= 1
                        viewModel.stonesTotAmount -= Int(viewModel.selectedStone?.stPrice ?? "") ?? 0
               
                        CoreDataStack.shared.deleteStone(withStTitle: viewModel.selectedStone?.stTitle ?? "", completion: {
                            
                            viewModel.fetchStones()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isEdit = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    EditStone(viewModel: StonesViewModel())
}
