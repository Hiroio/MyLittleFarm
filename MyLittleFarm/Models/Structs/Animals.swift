//
//  Animals.swift
//  MyLittleFarm
//
//  Created by user on 23.01.2026.
//

import Foundation

struct Cow {

    static func eat() -> Int{
        return 60
    }

    func getProduct() {
    }

    func butch() {
    }
}


struct Horse{
    static func eat() -> Int {
        return 60 * 5
    }
}

struct Pig {
    static func eat() -> Int{
        return 60 * 3
    }
}

struct Chicken{
    
    static func eat() -> Int {
        return 30
    }
}
