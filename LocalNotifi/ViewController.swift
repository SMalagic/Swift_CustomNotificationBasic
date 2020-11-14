//
//  ViewController.swift
//  LocalNotifi
//
//  Created by Serkan Malagiç on 23.10.2020.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func notifiTapped(_ sender: Any) {
        
        
        //MARK:- Gösterilecek Seçenekler
        let yes = UNNotificationAction(identifier: "option1", title: "Kitaplığıma Ekle", options: .foreground)
        let no = UNNotificationAction(identifier: "option2", title: "Diğer Filmler", options: .foreground)
        let cancel = UNNotificationAction(identifier: "option3", title: "Paylaş", options: .destructive)
        
        let category = UNNotificationCategory(identifier: "testNotificationCategory", actions: [yes, no, cancel], intentIdentifiers: [], options: [])

        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //MARK: - Bildirim İçeriği
        let content = UNMutableNotificationContent()
        
        content.title              = "Sizin için önerdiğimiz filmler"
        content.subtitle           = "daha fazla bilgi için aşağı çekin"
        content.categoryIdentifier = "testNotificationCategory"
        content.sound              = .default
        
        //MARK: - Tetikleyici Ekle
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        //MARK: - Requeste ekle
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

