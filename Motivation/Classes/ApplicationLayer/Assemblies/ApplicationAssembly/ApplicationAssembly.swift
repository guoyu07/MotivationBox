//
//  ApplicationAssembly.swift
//  E-Supplements
//
//  Created by Alex Zarochintsev on 6/19/17.
//  Copyright © 2017 Alex Zarochintsev. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
    
    var assembler: Assembler
    
    /// Use default dependency
    class var assembler: Assembler {
        return Assembler([
            MotivationsAssembly(),
            ServiceAssembly()
        ])
    }
    
    // If you want use custom Assembler
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
    
}

// Inject dependency in Main Storyboard
extension SwinjectStoryboard {
    
    public static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
    }
    
}


class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NotificationService.self) { (r: Resolver) in
            return NotificationServiceImpl()
        }
    }
    
}
