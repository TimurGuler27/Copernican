//
//  planet.swift
//  Copernican
//
//  Created by Timur Guler on 1/20/17.
//  Copyright © 2017 Timur Guler. All rights reserved.
//

import Foundation
import SceneKit

//(THIS STORES THE PROPERTY OF THE PLANET)
class planet
{
    var name : String
    var size: CGFloat
    var trueSize: CGFloat
    var orbitDistance: CGFloat
    var trueOrbitDistance: CGFloat
    var orbitSpeed: CGFloat
    var rotationSpeed: CGFloat
    var surfaceImage: String
    var symbol:String
    var location: CGPoint
    var descriptionImage: String
    init(name: String, size: CGFloat, trueSize: CGFloat, orbitDistance: CGFloat, trueOrbitDistance: CGFloat, orbitSpeed: CGFloat, rotationSpeed: CGFloat, surfaceImage: String, symbol: String, descriptionImage: String, location: CGPoint)
    {
        self.name = name
        self.size = size
        self.trueSize = trueSize
        self.orbitDistance = orbitDistance
        self.trueOrbitDistance = trueOrbitDistance
        self.orbitSpeed = orbitSpeed
        self.rotationSpeed = rotationSpeed
        self.surfaceImage = surfaceImage
        self.symbol = symbol
        self.descriptionImage = descriptionImage
        self.location = location
    }
    
    func getName()-> String{return name}
    func getSize()-> CGFloat{return size}
    func getTrueSize()-> CGFloat{return trueSize}
    func getOrbitDistance()-> CGFloat{return orbitDistance}
    func getTrueOrbitDistance()-> CGFloat{return trueOrbitDistance}
    func getOrbitSpeed()-> CGFloat{return orbitSpeed}
    func getRotationSpeed()-> CGFloat{return rotationSpeed}
    func getSurfaceImage()-> String{return surfaceImage}
    func getSymbol()-> String{return symbol}
    func getDescriptionImage()-> String{return descriptionImage}
    func getLocation()-> CGPoint{return location}
}
