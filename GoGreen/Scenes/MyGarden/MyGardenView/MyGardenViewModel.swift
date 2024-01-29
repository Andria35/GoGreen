//
//  MyGardenViewModel.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 24.01.24.
//

import UIKit
import CoreData

final class MyGardenViewModel {
    
    // MARK: - Class Properties
    var myPlants: [MyPlant] = []
    let container: NSPersistentContainer
    weak var delegate: MyGardenViewModelDelegate?
    let localFileManager: LocalFileManaging
    
    // MARK: - Initialization
    init(localFileManager: LocalFileManaging) {
        self.localFileManager = localFileManager
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
    
    func saveMyPlantLocally(name: String?, image: UIImage?, description: String?) {
        guard let name,
            let image,
            !name.isEmpty else {
            print("No Name")
            return
        }
        let imagePath = UUID().uuidString
        
        localFileManager.saveImage(image: image, name: imagePath)
        addMyPlant(name: name, description: description, imagePath: imagePath)
        
    }
    
    func getImageFromImagePath(imagePath: String) -> UIImage? {
        localFileManager.getImage(name: imagePath)
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
    
    func addMyPlant(name: String?, description: String?, imagePath: String) {
        let newMyPlant = MyPlant(context: container.viewContext)
        newMyPlant.name = name
        newMyPlant.imagePath = imagePath
        newMyPlant.plantDescription = description
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
