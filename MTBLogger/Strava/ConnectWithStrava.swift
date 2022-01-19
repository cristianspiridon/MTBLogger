//
//  ViewController.swift
//  MTBLogger
//
//  Created by Cristian Spiridon on 17/01/2022.
//

import UIKit
import StravaSwift

class ConnectWithStrava: UIViewController {
    
    private var token: OAuthToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onConnectWithStrava(_ sender: Any) {
       // presentWithLibrary()
        navigateToHome()
    }
    
    
    private func presentWithLibrary() {
        StravaClient.sharedInstance.authorize() { [weak self] (result: Result<OAuthToken, Error>) in
                    guard let self = self else { return }
                    self.didAuthenticate(result: result)
        }
    }
    
            
    private func didAuthenticate(result: Result<OAuthToken, Error>) {
        switch result {
            case .success(let token):
                self.token = token
                print("[cs] token ", token)
                navigateToHome()
            case .failure(let error):
            print("[cs] error ", error)
        }
    }
    
  
    private func navigateToHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeTabViewController = storyBoard.instantiateViewController(withIdentifier: "homeTab") as! HomeTabBarController
        
        window?.rootViewController = homeTabViewController
        window?.makeKeyAndVisible()
    }
}
