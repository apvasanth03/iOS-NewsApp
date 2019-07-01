//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Vasanthakumar Annadurai on 06/05/19.
//  Copyright © 2019 Vasanthakumar Annadurai. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // AppAssembler - Provides Application level dependencies.
    lazy var appAssembler: Assembler = {
        return self.initializeDI()
    }()
    
    // MARK: - UIApplicationDelegate Methods.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    // MARK: - Private Methods.
    fileprivate func initializeDI()-> Assembler{
        let httpClientAssembly = HttpClientAssembly()
        let remoteAssembly = RemoteAssembly()
        let dataAssembly = DataAssembly()
        let domainAssembly = DomainAssembly()
        
        let assembler = Assembler([httpClientAssembly, remoteAssembly, dataAssembly, domainAssembly])
        return assembler
    }
    
    
}

