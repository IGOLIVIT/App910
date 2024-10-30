//
//  JewelryView.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI

struct JewelryView: View {
    
    @StateObject var viewModel = JewelryViewModel()
    @Environment(\.presentationMode) var rounter
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        rounter.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                    })
                    
                    Spacer()
                }
                .padding(.vertical)
                
                Text("Jewelry")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    HStack {
                        
                        ForEach(viewModel.ekrans, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentEkran = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(.white.opacity(viewModel.currentEkran == index ? 0.4 : 0)))
                            })
                        }
                    }
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.1)))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding(8)
                            .padding(.horizontal, 4)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .padding(.vertical, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.types, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentType = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.currentType == index ? .white : .white.opacity(0.3))
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(8)
                                    .padding(.horizontal, 6)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentType == index ? Color("prim") : .white.opacity(0.1)))
                            })
                        }
                    }
                }
                
                if viewModel.jewelries.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        
                        Image("jempty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.05)))
                    
                    Spacer()
                    
                } else {
                    
                    if viewModel.currentEkran == "List" {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            if viewModel.currentType == "All" {
                                
                                ForEach(viewModel.jewelries, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image(index.jewPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 110, height: 110)
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    
                                                    Text(index.jewTitle ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("Product Type")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewType ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Materials")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewMat ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Weight")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewWeight ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Price")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text("\(index.jewPrice ?? "")$")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Image(systemName: "calendar")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Text(index.jewDate ?? "")
                                                    .foregroundColor(.white.opacity(0.5))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                    viewModel.favoritesManager(model: index)
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: viewModel.isHas(model: index) ? "heart.fill" : "heart")
                                                        .foregroundColor(Color("prim"))
                                                        .font(.system(size: 16, weight: .regular))
                                                })
                                            }
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedJew = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isEdit = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .regular))
                                                .frame(maxHeight: .infinity)
                                                .frame(width: 45)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                        
                                    }
                                    .frame(height: 200)
                                }
                                
                            } else {
                                
                                ForEach(viewModel.jewelries.filter{($0.jewType ?? "") == viewModel.currentType}, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image(index.jewPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 110, height: 110)
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    
                                                    Text(index.jewTitle ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("Product Type")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewType ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Materials")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewMat ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Weight")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewWeight ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Price")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewPrice ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                }
                                            }
                                            
                                            HStack {
                                                
                                                Image(systemName: "calendar")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Text(index.jewDate ?? "")
                                                    .foregroundColor(.white.opacity(0.5))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                    viewModel.favoritesManager(model: index)
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: viewModel.isHas(model: index) ? "heart.fill" : "heart")
                                                        .foregroundColor(Color("prim"))
                                                        .font(.system(size: 16, weight: .regular))
                                                })
                                            }
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedJew = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isEdit = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .regular))
                                                .frame(maxHeight: .infinity)
                                                .frame(width: 40)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                        
                                    }
                                    .frame(height: 200)
                                }
                            }
                        }
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            if viewModel.currentType == "All" {
                                
                                ForEach(viewModel.jewelries.filter{viewModel.savedJew.contains($0.jewTitle ?? "")}, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image(index.jewPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 110, height: 110)
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    
                                                    Text(index.jewTitle ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("Product Type")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewType ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Materials")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewMat ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Weight")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewWeight ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Price")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewPrice ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Image(systemName: "calendar")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Text(index.jewDate ?? "")
                                                    .foregroundColor(.white.opacity(0.5))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                    viewModel.favoritesManager(model: index)
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: viewModel.isHas(model: index) ? "heart.fill" : "heart")
                                                        .foregroundColor(Color("prim"))
                                                        .font(.system(size: 16, weight: .regular))
                                                })
                                            }
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedJew = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isEdit = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .regular))
                                                .frame(maxHeight: .infinity)
                                                .frame(width: 45)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                        
                                    }
                                    .frame(height: 200)
                                }
                                
                            } else {
                                
                                ForEach(viewModel.jewelries.filter{($0.jewType ?? "") == viewModel.currentType}.filter{viewModel.savedJew.contains($0.jewTitle ?? "")}, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image(index.jewPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 110, height: 110)
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    
                                                    Text(index.jewTitle ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 18, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        Text("Product Type")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewType ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Materials")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewMat ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Weight")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewWeight ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                    
                                                    HStack {
                                                        
                                                        Text("Price")
                                                            .foregroundColor(.white.opacity(0.6))
                                                            .font(.system(size: 12, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text(index.jewPrice ?? "")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12, weight: .regular))
                                                    }
                                                }
                                            }
                                            
                                            HStack {
                                                
                                                Image(systemName: "calendar")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Text(index.jewDate ?? "")
                                                    .foregroundColor(.white.opacity(0.5))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                    viewModel.favoritesManager(model: index)
                                                    
                                                }, label: {
                                                    
                                                    Image(systemName: viewModel.isHas(model: index) ? "heart.fill" : "heart")
                                                        .foregroundColor(Color("prim"))
                                                        .font(.system(size: 16, weight: .regular))
                                                })
                                            }
                                            .padding(7)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.05)))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedJew = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isEdit = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .regular))
                                                .frame(maxHeight: .infinity)
                                                .frame(width: 40)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                        
                                    }
                                    .frame(height: 200)
                                }
                            }
                        }
                    }
                }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchJews()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddJew(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            EditJew(viewModel: viewModel)
        })
    }
}

#Preview {
    JewelryView()
}
