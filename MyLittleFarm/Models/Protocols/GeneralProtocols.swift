//
//  GeneralProtocols.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import Foundation

protocol Animal {
    associatedtype Feed: AnimalFeed
    func eat(_ feed: Feed)
}

// any type of food
protocol AnimalFeed {
    
}



protocol Growable {
    associatedtype Feed: AnimalFeed
    
    func grow() -> Feed
}


protocol Harvestable {
    func harvest() -> Int
}
