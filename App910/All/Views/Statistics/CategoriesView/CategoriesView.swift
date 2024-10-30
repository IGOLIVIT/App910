//
//  CategoriesView.swift
//  App910
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var viewModel: JewelryViewModel
    @StateObject var mainModel:  StonesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                    }
                    
                    Text("Categories")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                }
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Jewelry")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.types.append(viewModel.plusJewCat)
                                viewModel.addingTypes.append(viewModel.plusJewCat)
                                
                                viewModel.plusJewCat = ""
                                
                                viewModel.jewCatAdded += 1
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(6)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            })
                            .opacity(viewModel.plusJewCat.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.plusJewCat.isEmpty ? true : false)
                        }
                        
                        ZStack(content: {
                            
                            Text("Text")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.plusJewCat.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.plusJewCat)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        
                        ForEach(viewModel.addingTypes, id: \.self) { index in
                            
                                Text(index)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.05)))
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Precious stones")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                mainModel.types.append(mainModel.plusStoneCat)
                                mainModel.addingTypes.append(mainModel.plusStoneCat)
                                
                                mainModel.plusStoneCat = ""
                                
                                mainModel.stonesCatAdded += 1
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(6)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            })
                            .opacity(mainModel.plusStoneCat.isEmpty ? 0.5 : 1)
                            .disabled(mainModel.plusStoneCat.isEmpty ? true : false)
                        }
                        
                        ZStack(content: {
                            
                            Text("Text")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(mainModel.plusStoneCat.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $mainModel.plusStoneCat)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        
                        ForEach(mainModel.addingTypes, id: \.self) { index in
                            
                                Text(index)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.05)))
                }
            }
            .padding()
        }
    }
}

#Preview {
    CategoriesView(viewModel: JewelryViewModel(), mainModel: StonesViewModel())
}
