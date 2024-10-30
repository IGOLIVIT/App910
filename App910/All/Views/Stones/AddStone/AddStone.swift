//
//  AddStone.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI

struct AddStone: View {

    @StateObject var viewModel: StonesViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Add")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.images, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentImage = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                                
                            }
                            
                        }, label: {
                            
                            if viewModel.currentImage.isEmpty {
                                
                                VStack(spacing: 8) {
                                    
                                    Image(systemName: "photo.fill")
                                        .foregroundColor(.gray.opacity(0.5))
                                        .font(.system(size: 25, weight: .medium))
                                    
                                    Text("Add image")
                                        .foregroundColor(.gray.opacity(0.5))
                                        .font(.system(size: 15, weight: .regular))
                                }
                                .frame(width: 120, height: 120)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                                
                            } else {
                                   
                                    Image(viewModel.currentImage)
                                        .resizable()
                                        .frame(width: 120, height: 120)

                            }
                        })
                        
                        VStack(spacing: 12) {
                            
                            Text("Title")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stTitle.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stTitle)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            
                            Text("Product Type")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.addingTypes, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.typeForAdd = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.typeForAdd == index ? .white : .white.opacity(0.3))
                                            .font(.system(size: 12, weight: .regular))
                                            .padding(7)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(viewModel.typeForAdd == index ? Color("prim") : .white.opacity(0.1)))
                                    })
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
                            
                            ZStack(content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stWeight.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stWeight)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .padding(.bottom)
                            
                            Text("Size")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stSize.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stSize)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            
                            HStack {
                                
                                VStack {
                                    
                                    Text("Date")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(content: {
                                        
                                        Text("Text")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.stDate.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.stDate)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                                    
                                }
                                
                                VStack {
                                    
                                    Text("Price")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    ZStack(content: {
                                        
                                        Text("Text")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.system(size: 14, weight: .regular))
                                            .opacity(viewModel.stPrice.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.stPrice)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                    })
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
                        
                        Button(action: {
                            
                            viewModel.numStones += 1
                            
                            viewModel.stonesTotAmount += Int(viewModel.stPrice) ?? 0
                            
                            viewModel.stPhoto = viewModel.currentImage
                            viewModel.stType = viewModel.typeForAdd
                            
                            viewModel.addStone()
                            
                            viewModel.stTitle = ""
                            viewModel.stWeight = ""
                            viewModel.stSize = ""
                            viewModel.stDate = ""
                            viewModel.stPrice = ""
                            
                            viewModel.fetchStones()
                            
                            viewModel.typeForAdd = ""
                            viewModel.currentImage = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                        })
                        .opacity(viewModel.currentImage.isEmpty || viewModel.stTitle.isEmpty || viewModel.stWeight.isEmpty || viewModel.stSize.isEmpty || viewModel.stDate.isEmpty || viewModel.stPrice.isEmpty ? 0.1 : 1)
                        .disabled(viewModel.currentImage.isEmpty || viewModel.stTitle.isEmpty || viewModel.stWeight.isEmpty || viewModel.stSize.isEmpty || viewModel.stDate.isEmpty || viewModel.stPrice.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddStone(viewModel: StonesViewModel())
}
