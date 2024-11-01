//
//  StatisticsView.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI
import StoreKit

struct StatisticsView: View {

    @StateObject var viewModel = JewelryViewModel()
    @StateObject var mainModel = StonesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .medium))

                    })
                    .padding(.top, 20)
                }
                .padding(.vertical)
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text("Jewelry")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isJewView = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                    }
                    
                    HStack {
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(Color.white.opacity(0.2), lineWidth: 20)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(viewModel.calculatePercentage() / 100))
                                    .stroke(Color("prim"), lineWidth: 20)
                                    .frame(width: 100, height: 100)
                                    .rotationEffect(.degrees(-90))
                                
                            }
                            
                            VStack {
                                
                                Text("\(viewModel.jewFavs)/\(viewModel.numJews)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Enteries and favorites")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }
                            
                        }
                        .padding(4)
                        .frame(maxHeight: .infinity)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                        
                        VStack {
                            
                            VStack {
                                
                                Text("\(viewModel.jewCatAdded)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Categories added")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }
                            .padding()
                            .frame(maxHeight: .infinity)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                            
                            VStack {
                                
                                Text("$ \(viewModel.jewsTotAmount)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Total amount")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding()
                            .frame(maxHeight: .infinity)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                        }
                    }
                    .frame(height: 260)
                    .padding(.bottom)
                    
                    HStack {
                        
                        Text("Precious stones")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                mainModel.isStoneView = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                        })
                    }
                    
                    HStack {
                        
                        VStack {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(Color.white.opacity(0.2), lineWidth: 20)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(mainModel.calculatePercentage() / 100))
                                    .stroke(Color("prim"), lineWidth: 20)
                                    .frame(width: 100, height: 100)
                                    .rotationEffect(.degrees(-90))
                                
                            }
                            
                            VStack {
                                
                                Text("\(mainModel.stoneFavs)/\(mainModel.numStones)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Enteries and favorites")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }
                            
                        }
                        .padding(4)
                        .frame(maxHeight: .infinity)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                        
                        VStack {
                            
                            VStack {
                                
                                Text("\(mainModel.stonesCatAdded)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Categories added")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }
                            .padding()
                            .frame(maxHeight: .infinity)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                            
                            VStack {
                                
                                Text("$ \(mainModel.stonesTotAmount)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("Total amount")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding()
                            .frame(maxHeight: .infinity)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                        }
                    }
                    .frame(height: 260)
                    
                    Button(action: {

                        withAnimation(.spring()) {
                            
                            viewModel.isCategories = true
                        }
                        
                    }, label: {
                        
                        Text("View categories")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim")))
                    })
                }
            }
            .padding()
            .ignoresSafeArea()
        }
        .sheet(isPresented: $viewModel.isCategories, content: {
            
            CategoriesView(viewModel: viewModel, mainModel: mainModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isSettings ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = false
                        }
                    }
                
                VStack {

                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Button(action: {

                        SKStoreReviewController.requestReview()
                                
                    }, label: {
                        
                        HStack {
                            
                            Text("Rate our app")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 30).fill(.white.opacity(0.1)))
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/d206e23c-5a64-4e2c-963c-79fd5b229acb") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 30).fill(.white.opacity(0.1)))
                        
                    })
                    .padding(.bottom, 80)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .offset(y: viewModel.isSettings ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            }
        )
        .sheet(isPresented: $viewModel.isJewView, content: {
            
            JewelryView()
        })
        .sheet(isPresented: $mainModel.isStoneView, content: {
            
            StonesView()
        })
    }
}

#Preview {
    StatisticsView()
}
