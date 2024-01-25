//
//  NotificationManager.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 25.01.24.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    func requestAuthorization() {
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error {
                print("Error \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotifications(for name: String, repeatIn days: Double) {
        let content = UNMutableNotificationContent()
        content.title = "Plant needs Watering!!"
        content.subtitle = "Water \(name.capitalized)"
        content.sound = .default
        content.badge = 1
        
        let dateComponents = DateComponents()

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: days * 24 * 60 * 60, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
