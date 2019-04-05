//
//  AppScene.swift
//  Copernican
//
//  Updated by Timur Guler on 4/4/19.
//  Copyright © 2017 Timur Guler. All rights reserved.
//

import Foundation
import SceneKit

//(THIS CREATES THE MAIN SOLAR SYSTEM MODEL AND LETS THE MODEL BE INTERACTABLE)
class AppScene: SCNScene
{
    
    
    
    
    
    //(NEEDED INSTANCE VARIABLES GO HERE) MOST LIKELY WILL BE USED FOR IN APP OPTIONS
    var showOrbitMarker = true
    var showSpaceBackdrop = false
    var trueMode = false
    var showLogo = true
    public var currentFocusedElement = 0
    
    
    
    
    
    
    //array for planets
    var planets: [planet] = []
    public var planetNodeArray: [SCNNode] = []
    
    
    
    
    
    
    override init()
    {super.init()
        
    //(NEEDED NODES)
    let sunNode: SCNNode
        
        
        
    let modelName = UIDevice.current.modelName
    let HDCompatibleDevices = ["iPhone 6s","iPhone 6s Plus","iPhone 7","iPhone 7 Plus","iPhone SE","iPad Air","iPad Air 2","iPad Mini 4", "iPad Pro", "Simulator"]
    
        
        
    //(INITIALIZE SCENE AND LIGHTING)
    
    
        
    //declares the camera node
    let pointOfViewNode = SCNNode()
    pointOfViewNode.camera = SCNCamera()
    self.rootNode.addChildNode(pointOfViewNode)
    
    
        
    //positions the camera node
    pointOfViewNode.position = SCNVector3(x:-3, y:65, z:2)
    pointOfViewNode.rotation = SCNVector4Make(1, 1, 1, -90)
    
    
        
    //create light
    let sceneLighter = SCNNode()
    sceneLighter.light = SCNLight()
    sceneLighter.light!.type = .omni
    
    
        
    //set light position
    sceneLighter.position = SCNVector3(x:0, y:0, z:0)
    self.rootNode.addChildNode(sceneLighter)
    
    
        
    // create and add an ambient light to the scene
    let ambientLightNode = SCNNode()
    ambientLightNode.light = SCNLight()
    ambientLightNode.light!.type = .ambient
    ambientLightNode.light!.color = UIColor.darkGray
    self.rootNode.addChildNode(ambientLightNode)
    
    
        
    //get the application view
    
        
        
    //let ButtonView = SKScene(size: self.view.bounds.size)
    
    
        
    //(ADD BACKDROP AND PLANETS TO SCENE)
    
    
        
    //set the backdrop
    showSpaceBackdrop(status: showSpaceBackdrop)
        
    
        
    //set label for location
    
    
        
    //put in sun
    let sunGeometry = SCNSphere(radius: 1.50)
    //let sunGeometry = SCNSphere(radius: 6.96) ACTUAL SIZE
    sunNode = SCNNode(geometry: sunGeometry)
    sunGeometry.segmentCount = 50
    self.rootNode.addChildNode(sunNode)
    sunNode.position = SCNVector3(x:0, y:0, z:0)
    sunGeometry.firstMaterial?.diffuse.contents = UIImage(named: "sunMap.jpg")
    planetNodeArray.append(sunNode)
        
    
        
    //set the default focus to the sun
    var targetNode = SCNLookAtConstraint(target: planetNodeArray[0])
    pointOfViewNode.constraints = [targetNode]
        
    
        
    //array for planets
    let defaultPoint = CGPoint(x: 0.0, y: 0.0)
    //add mercury
    let mercury = planet(name: "Mercury", size: 0.2, trueSize: 0.02, orbitDistance: 3, trueOrbitDistance: 10, orbitSpeed: 1.2, rotationSpeed: 1.6, surfaceImage: "mercuryMapHighRes.jpg", symbol: "mercurySymbol.png", descriptionImage: "mercuryDescImage", location: defaultPoint)
    planets.append(mercury)
    //add venus
    let venus = planet(name: "Venus", size: 0.4, trueSize: 0.06, orbitDistance: 7, trueOrbitDistance: 13, orbitSpeed: 0.8, rotationSpeed: 0.9, surfaceImage: "venusMapHighRes.jpg", symbol: "venusSymbol.png", descriptionImage: "venusDescImage", location: defaultPoint)
    planets.append(venus)
    //add earth
    let earth = planet(name: "Earth", size: 0.45, trueSize: 0.065, orbitDistance: 11, trueOrbitDistance: 15, orbitSpeed: 0.5, rotationSpeed: 1.2, surfaceImage: "earthMapTwo.jpg", symbol: "earthSymbol.png", descriptionImage: "earthDescImage", location: defaultPoint)
    planets.append(earth)
    //add mars
    let mars = planet(name: "Mars", size: 0.4, trueSize: 0.03, orbitDistance: 15, trueOrbitDistance: 18, orbitSpeed: 0.4, rotationSpeed: 0.8, surfaceImage: "marsMapHighRes.jpg", symbol: "marsSymbol.png", descriptionImage: "marsDescImage", location: defaultPoint)
    planets.append(mars)
    //add jupiter
    let jupiter = planet(name: "Jupiter", size: 0.9, trueSize: 0.69, orbitDistance: 20.5, trueOrbitDistance: 22, orbitSpeed: 0.9, rotationSpeed: 1.3, surfaceImage: "jupiterMap.jpg", symbol: "jupiterSymbol.png", descriptionImage: "jupiterDescImage", location: defaultPoint)
    planets.append(jupiter)
    //add saturn
    let saturn = planet(name: "Saturn", size: 0.7, trueSize: 0.58, orbitDistance: 25, trueOrbitDistance: 27, orbitSpeed: 0.7, rotationSpeed: 0.2, surfaceImage: "saturnMap.jpg", symbol: "saturnSymbol.png", descriptionImage: "saturnDescImage", location: defaultPoint)
    planets.append(saturn)
    //add uranus
    let uranus = planet(name: "Uranus", size: 0.5, trueSize: 0.25, orbitDistance: 29, trueOrbitDistance: 31, orbitSpeed: 0.5, rotationSpeed: 0.4, surfaceImage: "uranusMap.jpg", symbol: "uranusSymbol.png", descriptionImage: "uranusDescImage", location: defaultPoint)
    planets.append(uranus)
    //add neptune
    let neptune = planet(name: "Neptune", size: 0.49, trueSize: 0.24, orbitDistance: 32, trueOrbitDistance: 36, orbitSpeed: 0.4, rotationSpeed: 0.8, surfaceImage: "neptuneMap", symbol: "nuptuneSymbol.png", descriptionImage: "neptuneDescImage", location: defaultPoint)
    planets.append(neptune)
    
    
        
    //start the for loop to correspond with the declared planets
    for currentRing in 0..<planets.count
    {
    
        
    
    //sets the radius of the current planet
    var markerRadius: CGFloat
    if(trueMode == true)
    {
    markerRadius = CGFloat(planets[currentRing].getTrueOrbitDistance())//get the true orbit distance of the planet
    } else {
    markerRadius = CGFloat(planets[currentRing].getOrbitDistance())//get the default orbit distance of the planet
    }
        
    
        
    //declare markerNode
    var markerNode = SCNNode()
    var trueMarkerNode = SCNNode()
    
        
    
    //puts in an orbit marker
    /*if(showOrbitMarker == true)
    {
        //declare the markerNode Geometry
        let trueMarkerGeometry = SCNTorus(ringRadius: markerRadius, pipeRadius: 0.003)
        trueMarkerNode.geometry = trueMarkerGeometry
        trueMarkerGeometry.ringSegmentCount = 200
        trueMarkerNode.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
        trueMarkerNode.opacity = 0.5
     if(pointOfViewNode?.camera!.xFov > 20.0)
     {
        trueMarkerNode.isHidden = false
     }else{
        trueMarkerNode.isHidden = true
     }
    }*/
    
        
    //add markerNode to scene
    self.rootNode.addChildNode(markerNode)
    self.rootNode.addChildNode(trueMarkerNode)
    
    
        
    //set the geometry of the current planet
    let planetGeometry: SCNSphere
    if(trueMode == true)
    {
    planetGeometry = SCNSphere(radius: CGFloat(planets[currentRing].getTrueSize()))//get the true size of the planet
    } else {
    planetGeometry = SCNSphere(radius: CGFloat(planets[currentRing].getSize()))
    }
        
        
        
    //makes the current planet a node
    var planetNode = SCNNode(geometry: planetGeometry)
    
        
        
    //adds more detail to the planet
    planetGeometry.segmentCount = 50
    
        
        
    //positions the planet
    planetNode.position = SCNVector3(x:Float(markerRadius) , y:0, z:0)
    
        
        
    //sets the image of the planet
    if(HDCompatibleDevices.contains(modelName))
    {
    planetGeometry.firstMaterial?.diffuse.contents = UIImage(named: planets[currentRing].getSurfaceImage())
    } else {
    let newImage = resizeImage(image: UIImage(named: planets[currentRing].getSurfaceImage())!, targetSize: CGSize.init(width: 1000.0,height: 500.0))//later scale size by /3
    planetGeometry.firstMaterial?.diffuse.contents = newImage
    }
        
        
    
    //add the node to node array
    planetNodeArray.append(planetNode)
        
        
        
    //adds the planet node
    markerNode.addChildNode(planetNode)
    
        
        
    //starts up the general rotation cycle
    let startMix = SCNAction.customAction(duration: 0.0000001) { (markerNode, time) -> () in
    
        
        
    //controls orbit around the sun
    //markerNode.runAction(SCNAction.rotateBy(x: 0, y: planets[currentRing].getRotationSpeed(), z: 0, duration: 0.000000001))
    
        
        
    //controls rotation on planets axis
    planetNode.runAction(SCNAction.rotateBy(x: 0, y: self.planets[currentRing].getRotationSpeed(), z: 0, duration: 0.000000001))
    }
    markerNode.runAction(startMix)
    
    let launchMix = SCNAction.customAction(duration: 0.3) { (markerNode, timeTwo) -> () in
    markerNode.runAction(SCNAction.rotateBy(x: 0, y: self.planets[currentRing].getRotationSpeed(), z: 0, duration: 2.5))
    markerNode.runAction(SCNAction.rotateBy(x: 0, y: self.planets[currentRing].getRotationSpeed(), z: 0, duration: 2.5/365))
    }
    markerNode.runAction(launchMix)
    
    
        
    //controls orbit around the sun
    markerNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: planets[currentRing].getRotationSpeed(), z: 0, duration: 400)))
    
    
        
    //controls rotation on planets axis
    planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: planets[currentRing].getRotationSpeed(), z: 0, duration: 20)))
    
    showLogo = false
        
    
    
        
        
    //sprite kit assets
    //let currentSymbol = planets[currentRing].getSymbol()
    //let showSymbol = InterfaceView(symbol: currentSymbol)
        
    }
    
    
        
    //(ADD CONSTRAINTS TO CAMERA AND GESTURES)
    
    //this focuses pointOfViewNode on earth
    targetNode = SCNLookAtConstraint(target: planetNodeArray[8])
    //print(targetNode.target!.name)
    pointOfViewNode.constraints = [targetNode]
        
    
        
    //(ADD OTHER FEATURES)
    
        
        
    func getTargetNode() -> SCNLookAtConstraint{return targetNode}
    
        
        
    func getPovNode() -> SCNNode{return pointOfViewNode}
    
        
        
    func getTarget() -> SCNNode{return planetNodeArray[currentFocusedElement]}
    
    
    }
    
    
    
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    
    
    
    
    func forwardFocus()
    {
        currentFocusedElement+=1
        showSpaceBackdrop = true
    
        
    }
    
    
    
    
    
    func showSpaceBackdrop(status: Bool)
    {
        if(showSpaceBackdrop == true)
        {
            let backdropGeometry = SCNSphere(radius: 65)
            let backDropNode = SCNNode(geometry: backdropGeometry)
            backdropGeometry.segmentCount = 50
            self.rootNode.addChildNode(backDropNode)
            backDropNode.geometry?.firstMaterial?.isDoubleSided = true
            backDropNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "spaceBackdrop.jpg")
        }
    }

}






    //(THIS FUNCTION SPITS OUT A NEW IMAGE THAT ALLOWS OLDER DEVICES TO RUN THE APP)
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage
    {
    let size = image.size
    
    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height
    
    //Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    //This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    //Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
    }
