//
//  StonesViewModel.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI
import CoreData

final class StonesViewModel: ObservableObject {
    
    @AppStorage("stoneFavs") var stoneFavs: Int = 0
    @AppStorage("numStones") var numStones: Int = 0
    @AppStorage("stonesTotAmount") var stonesTotAmount: Int = 0
    @AppStorage("stonesCatAdded") var stonesCatAdded: Int = 4
    
    func calculatePercentage() -> Double {
        
        let value = stoneFavs
        let maxValue = numStones
        
        let percentCircle = Double(value) / (Double(maxValue) ?? 1) * 100
        
        return percentCircle
    }

    @Published var ekrans: [String] = ["List", "Favorites"]
    @Published var currentEkran: String = "List"
    
    @Published var images: [String] = ["s1", "s2", "s3"]
    @Published var currentImage: String = ""
    
    @Published var types: [String] = ["All", "Ruby", "Pearl", "Emerald", "Amethyst"]
    @Published var currentType: String = "All"
    
    @Published var addingTypes: [String] = ["Ruby", "Pearl", "Emerald", "Amethyst"]
    @Published var typeForAdd: String = ""
    
    @Published var plusStoneCat: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isStoneView: Bool = false

    @Published var stPhoto: String = ""
    @Published var stTitle: String = ""
    @Published var stType: String = ""
    @Published var stWeight: String = ""
    @Published var stSize: String = ""
    @Published var stDate: String = ""
    @Published var stPrice: String = ""

    @Published var stones: [StonesModel] = []
    @Published var selectedStone: StonesModel?

    func addStone() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "StonesModel", into: context) as! StonesModel

        loan.stPhoto = stPhoto
        loan.stTitle = stTitle
        loan.stType = stType
        loan.stWeight = stWeight
        loan.stSize = stSize
        loan.stDate = stDate
        loan.stPrice = stPrice

        CoreDataStack.shared.saveContext()
    }

    func fetchStones() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StonesModel>(entityName: "StonesModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.stones = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.stones = []
        }
    }
    
    @AppStorage("savedStones") var savedStones: [String] = []
    
    func isHas(model: StonesModel) -> Bool {
        
            return savedStones.contains(model.stTitle ?? "")

    }
    
    func favoritesManager(model: StonesModel) {
        
                        if savedStones.contains(model.stTitle ?? "") {
                
                if let indexer = savedStones.firstIndex(of: model.stTitle ?? "") {
                    
                    savedStones.remove(at: indexer)
                    
                    stoneFavs -= 1
                }
                
            } else {
                
                savedStones.append(model.stTitle ?? "")
                
                stoneFavs += 1
            }
    }
}
