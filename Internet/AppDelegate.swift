//
//  AppDelegate.swift
//  Internet
//
//  Created by ReusHarper on 28/10/22.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var internetStatus : Bool = false
    var internetType: String = ""

    // 1. La aplicacion se lanza por primera vez
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let monitor = NWPathMonitor()
        // Closure: Es un bloque de codigo que se ejecuta de manera asincrona
        monitor.pathUpdateHandler = { path in
            // path es un argumento que llega a la funcion
            if path.status != .satisfied {
                self.internetStatus = false
            }
            else {
                self.internetStatus = true
                
                // TODO: Si hay internet, verificar el tipo
                if path.usesInterfaceType(.wifi) {
                    self.internetType = "WIFI"
                }
                else if path.usesInterfaceType(.cellular){
                    self.internetType = "CELL"
                }
            }
        }
        
        //
        monitor.start(queue: DispatchQueue.global())
        return true
    }
    
    // 2. El usuario cambia de aplicacion o llego una interrupcion del SO (Ej: Una llamada)
    func applicationWillResignActive(_ application: UIApplication) {
        print("")
    }
    
    // 3. La app ya no esta activa pero sigue abierta
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("")
    }
    
    // 4. La app va a volver  a primer planoo
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("")
    }
    
    // 5. La app ya se reactiva (vuelve del 2do plano)
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("")
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

