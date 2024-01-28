//
//  LocalFileManager.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 28.01.24.
//

import UIKit

final class LocalFileManager {
    
    let folderName = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName, directoryHint: .isDirectory)
                .path(percentEncoded: true) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success Creating Folder")
            } catch {
                print("Error creating folder.\(error)")
            }
        }
    }
    
    func deleteFolder() {
        
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName, directoryHint: .isDirectory)
                .path(percentEncoded: true) else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch {
            print("Error Deleting Folder. \(error)")
        }

    }
    
    func saveImage(image: UIImage, name: String) {
        
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
            print("Error getting data")
            return
        }
        
        do {
            try data.write(to: path)
            print(path)
        } catch {
            print("Error Saving/ \(error)")
        }
    }
    
    func getImage(name: String) -> UIImage? {
        
        guard
            let path = getPathForImage(name: name)?.path(percentEncoded: true),
            FileManager.default.fileExists(atPath: path) else {
            print("Error Getting path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) {
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path(percentEncoded: true)) else {
            print("Error Getting path")
            return
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            print("Successfully Deleted")
        } catch {
            print("Error Deleting Image. \(error)")
        }

    }
    
    private func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName, directoryHint: .isDirectory)
                .appending(path: "\(name).jpg", directoryHint: .notDirectory) else {
            print("Error Getting path")
            return nil
        }
        return path

    }
}
