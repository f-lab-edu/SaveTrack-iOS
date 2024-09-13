//
//  AppDelegate.swift
//  SaveTrack
//
//  Created by Jinyoung Kim on 9/13/24.
//

import UIKit
import os

import KakaoSDKAuth
import KakaoSDKCommon

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KakaoSDK.initSDK(appKey: Secrets.Keys.KAKAO_APP_KEY)
        self.requestNotiAuthorization(application)
        // 앱이 꺼져있었을 때 눌러서 실행되면 받아오는 코드.
        let userInfo = launchOptions?[.remoteNotification]
        return true
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension AppDelegate: UNUserNotificationCenterDelegate {
    // foreground에서 일반 푸시를 수신했을 때 해당 메소드가 호출
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        // Handle the notification presentation here
        completionHandler([.list, .banner, .sound, .badge])
        
        print("willPresent")
        printJSON(userInfo: userInfo)
    }
    
    // foreground, background에서 시스템 푸시를 탭하거나 dismiss했을때 해당 메소드가 호출
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let userInfo = response.notification.request.content.userInfo
        
        print("didReceive")
        printJSON(userInfo: userInfo)
        // 푸시 탭 했을 때
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            // do something
        }
    }
    
    private func printJSON(userInfo: [AnyHashable: Any]) {
        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted)
        if let data {
            print(String(data: data, encoding: .utf8)!)
        }
    }
}

// MARK: - User Notification related UIApplicationDelegate & Helpers

extension AppDelegate {
    private func requestNotiAuthorization(_ application: UIApplication) {
        // Request notification authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
            if granted {
                print("Notification authorization granted")
                // Register for remote notifications
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                    UNUserNotificationCenter.current().delegate = self
                }
            } else {
                print("Notification authorization denied")
                // Handle the case where the user denied notification permissions
            }
        }
    }
    
    // Handle successful registration for remote notifications
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Send the device token to your server for push notification handling
    }
    
    // Handle unsuccessful registration for remote notifications
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error.localizedDescription)")
    }
}

