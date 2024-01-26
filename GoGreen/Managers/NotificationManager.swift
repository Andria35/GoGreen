//
//  NotificationManager.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 25.01.24.
//

import Foundation
import UserNotifications

protocol Notifying {
    func requestAuthorization()
    func scheduleNotifications(for name: String, repeatIn days: Double)
}

final class NotificationManager: Notifying {
    
    static let shared = NotificationManager()
    
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
        
        var timeInterval: Double = 0
        var testRepeat = true
        
        if days == 0 {
            timeInterval = 5
            testRepeat = false
        } else {
            timeInterval = days * 24 * 60 * 60
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: testRepeat)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
