//
//  MyGardenViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 24.01.24.
//

import Foundation
import CoreData

protocol MyGardenViewModelDelegate: AnyObject {
    func fetchComplete(myPlants: [MyPlant])
}

final class MyGardenViewModel {
    
    // MARK: - Class Properties
    var myPlants: [MyPlant] = []
    let container: NSPersistentContainer
    weak var delegate: MyGardenViewModelDelegate?
    
    // MARK: - Initialization
    init() {
        container = NSPersistentContainer(name: "PlantsContainer")
        container.loadPersistentStores { description, error in
            if let error {
                print("Error Loading Core Data. \(error)")
            } else {
                print("Successfully loaded Core Data")
            }
        }
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        fetchMyPlants()
    }
    
    // MARK: - Core Data Methods
    func fetchMyPlants() {
        let request = NSFetchRequest<MyPlant>(entityName: "MyPlant")
        
        do {
            myPlants = try container.viewContext.fetch(request)
            delegate?.fetchComplete(myPlants: myPlants)
        } catch {
            print("ERROR FETCHING DATA. \(error)")
        }
    }
    
    func addMyPlant(name: String) {
        let newMyPlant = MyPlant(context: container.viewContext)
        newMyPlant.name = name
        saveData()
    }
    
    func deleteMyPlant(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = myPlants[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchMyPlants()
        } catch {
            print("ERROR SAVING. \(error)")
        }
    }
}
