//
//  ViewController.swift
//  Internet
//
//  Created by ReusHarper on 28/10/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as! AppDelegate
        
        //
        if ad.internetStatus {
            // TODO:
            // 1. Instanciar un objeto webview y colocarlo en la vista
            let wv = WKWebView(frame: self.view.frame)
            wv.allowsBackForwardNavigationGestures = true
            self.view.addSubview(wv)
            
            // 2. Obtener una pagina web y cargarla en el objeto webview
            if let URL = URL(string: "https://www.unam.mx") {
                wv.load(URLRequest(url: URL))
            }
        }
        else {
            let ac = UIAlertController(
                title: "Error",
                message: "Lo sentimos, no cuenta con una conexion a Internet",
                preferredStyle: .alert
            )
            let action = UIAlertAction(
                title: "Enterado",
                style: .default,
                handler: nil
            )
            ac.addAction(action)
            self.present(ac, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("")
    }

}

