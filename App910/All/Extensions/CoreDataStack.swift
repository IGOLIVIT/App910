//
//  CoreDataStack.swift
//  App910
//
//  Created by IGOR on 13/10/2024.
//

import SwiftUI
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private let modelName: String = "CoreModel"
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllData() {
        let context = persistentContainer.viewContext
        let entities = persistentContainer.managedObjectModel.entities
        
        for entity in entities {
            if let entityName = entity.name {
                let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
                
                do {
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    objects?.forEach { context.delete($0) }
                    
                    try context.save()
                } catch let error {
                    print("Error deleting \(entityName): \(error)")
                }
            }
        }
    }
    
    func deleteJew(withJewTitle name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<JewelModel> = JewelModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "jewTitle == %@", name)

        do {
            let objects = try context.fetch(fetchRequest)

            for object in objects {
                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()

        } catch {
            print("Error fetching: \(error)")
        }
    }
    
    func deleteStone(withStTitle name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<StonesModel> = StonesModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "stTitle == %@", name)

        do {
            let objects = try context.fetch(fetchRequest)

            for object in objects {
                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()

        } catch {
            print("Error fetching: \(error)")
        }
    }

//    func updateGoal(withgName name: String, gNewBalance: String?) {
//        let context = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<PiggyModel> = PiggyModel.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "gName == %@", name)
//
//        do {
//            let goals = try context.fetch(fetchRequest)
//
//            if let goal = goals.first {

//                if let gNewBalance = gNewBalance {
//                    goal.gSBalance = gNewBalance
//                }
//
//                try context.save()
//                print("Diary updated successfully!")
//
//            } else {
//                print("Diary not found")
//            }
//        } catch let error {
//            print("Failed to fetch or update diary: \(error)")
//        }
//    }

}
