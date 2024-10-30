//
//  JewelryViewModel.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI
import CoreData

final class JewelryViewModel: ObservableObject {
    
    @AppStorage("jewFavs") var jewFavs: Int = 0
    @AppStorage("numJews") var numJews: Int = 0
    @AppStorage("jewsTotAmount") var jewsTotAmount: Int = 0
    @AppStorage("jewCatAdded") var jewCatAdded: Int = 6
    
    func calculatePercentage() -> Double {
        
        let value = jewFavs
        let maxValue = numJews
        
        let percentCircle = Double(value) / (Double(maxValue) ?? 1) * 100
        
        return percentCircle
    }
    
    @Published var ekrans: [String] = ["List", "Favorites"]
    @Published var currentEkran: String = "List"
    
    @Published var images: [String] = ["j1", "j2", "j3"]
    @Published var currentImage: String = ""
    
    @Published var types: [String] = ["All", "Rings", "Bracelets", "Pendants", "Necklaces", "Brooches", "Other"]
    @Published var currentType: String = "All"
    
    @Published var addingTypes: [String] = ["Rings", "Bracelets", "Pendants", "Necklaces", "Brooches", "Other"]
    @Published var typeForAdd: String = ""
    
    @Published var plusJewCat: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isSettings: Bool = false
    @Published var isCategories: Bool = false
    @Published var isJewView: Bool = false

    @Published var jewPhoto: String = ""
    @Published var jewTitle: String = ""
    @Published var jewType: String = ""
    @Published var jewWeight: String = ""
    @Published var jewMat: String = ""
    @Published var jewDate: String = ""
    @Published var jewPrice: String = ""

    @Published var jewelries: [JewelModel] = []
    @Published var selectedJew: JewelModel?

    func addJew() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "JewelModel", into: context) as! JewelModel

        loan.jewPhoto = jewPhoto
        loan.jewTitle = jewTitle
        loan.jewType = jewType
        loan.jewWeight = jewWeight
        loan.jewMat = jewMat
        loan.jewDate = jewDate
        loan.jewPrice = jewPrice

        CoreDataStack.shared.saveContext()
    }

    func fetchJews() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<JewelModel>(entityName: "JewelModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.jewelries = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.jewelries = []
        }
    }
    
    @AppStorage("savedJew") var savedJew: [String] = []
    
    func isHas(model: JewelModel) -> Bool {
        
            return savedJew.contains(model.jewTitle ?? "")

    }
    
    func favoritesManager(model: JewelModel) {
        
                        if savedJew.contains(model.jewTitle ?? "") {
                
                if let indexer = savedJew.firstIndex(of: model.jewTitle ?? "") {
                    
                    savedJew.remove(at: indexer)
                    
                    jewFavs -= 1

                }
                
            } else {
                
                savedJew.append(model.jewTitle ?? "")
                
                jewFavs += 1

            }
    }
}
