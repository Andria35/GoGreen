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
    let notificationManager: Notifying
    
    // MARK: - Initialization
    init(localFileManager: LocalFileManaging, notificationManager: Notifying) {
        self.localFileManager = localFileManager
        self.notificationManager = notificationManager
        
        container = NSPersistentContainer(name: "PlantsContainer")
        container.loadPersistentStores { description, error in
            if let error {
                print("Error Loading Core Data. \(error)")
            } else {
                print("Successfully loaded Core Data")
            }
        }
    }
    
    // MARK: - Class Methods
    func viewDidLoad() {
        fetchMyPlants()
        notificationManager.requestAuthorization()
    }
    
    func saveMyPlantLocally(name: String?, image: UIImage?, description: String?, notificationRepeatDays: Double) {
        guard let name,
              let image,
              !name.isEmpty else {
            print("No Name")
            return
        }
        let plantId = UUID().uuidString
        notificationManager.scheduleNotifications(for: name, repeatIn: notificationRepeatDays, with: plantId)
        
        localFileManager.saveImage(image: image, name: plantId)
        addMyPlant(name: name, description: description, imagePath: plantId)
    }
    
    func deleteMyPlantLocally(with plantID: String) {
        notificationManager.cancelNotification(with: plantID)
        localFileManager.deleteImage(name: plantID)
        deleteMyPlant(with: plantID)
    }
    
    func getImageFromImagePath(imagePath: String) -> UIImage? {
        localFileManager.getImage(name: imagePath)
    }
    
    // MARK: - Core Data Methods
    private func fetchMyPlants() {
        let request = NSFetchRequest<MyPlant>(entityName: "MyPlant")
        
        do {
            myPlants = try container.viewContext.fetch(request)
            delegate?.fetchComplete(myPlants: myPlants)
        } catch {
            print("ERROR FETCHING DATA. \(error)")
        }
    }
    
    private func addMyPlant(name: String?, description: String?, imagePath: String) {
        let newMyPlant = MyPlant(context: container.viewContext)
        newMyPlant.name = name
        newMyPlant.plantID = imagePath
        newMyPlant.plantDescription = description
        saveData()
    }
    
    private func deleteMyPlant(with plantID: String) {
        guard let entity = myPlants.first(where: {$0.plantID == plantID}) else { return }
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
