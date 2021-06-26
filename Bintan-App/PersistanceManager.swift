//
//  PersistanceManager.swift
//  Bintan-App
//
//  Created by angga saputra on 24/06/21.
//

import Foundation
import CoreData

class PersistanceManager {
    static let shared = PersistanceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Bintan_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // 1. create user itinerary function
    func insertItinerary(name: String, typeExplorer: String, startingPoint: String, oneDayTrip: Bool, dateArrived: Date, dateDepart: Date, endTime: Date, startTime: Date){
        let user = User(context: persistentContainer.viewContext)
        user.name = name
        user.explorerType = typeExplorer
        user.startingPoint = startingPoint
        user.oneDayTrip = oneDayTrip
        user.dateArrived = dateArrived
        user.dateDepart = dateDepart
        user.startTime = startTime
        user.endTime = endTime
        save()
    }
    
    //2. create save user function
    
    //3. create generate itinerary function
    
    
    // create save function
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo))")
            }
        }
    }
}
