//
//  InterfaceView.swift
//  Copernican
//
//  Updated by Timur Guler on 4/4/19.
//  Copyright © 2017 Timur Guler. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

//(THIS WILL DEFINE THE BUTTON LAYOUT FOR THE APP)
class InterfaceView: SKScene
{
    
    
    
    open var labelNode: SKLabelNode?
    open var cursorNode: SKShapeNode?
    let formation = AppScene()
    

    
    override init(size: CGSize)
    {super.init(size: size)
        
        
        
        let modelName = UIDevice.current.modelName
        let SquareDevices = ["iPhone 4", "iPhone 4s", "iPad 2", "iPad 3", "iPad 4", "iPad Air", "iPad Air 2", "iPad Mini", "iPad Mini 2", "iPad Mini 3", "iPad Mini 4", "iPad Pro"]
        
        
        
        scaleMode = .resizeFill
        labelNode = SKLabelNode(text: "Copernican")
        labelNode?.position = CGPoint(x: size.width/2, y: size.height/2)
        self.addChild(labelNode!)
        self.isUserInteractionEnabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
        
            
            
        // Put your code which should be executed with a delay here
        if(self.formation.showLogo == false)
        {
            self.labelNode?.isHidden = true
        }
        })
        
        
        
        func addButtons()
        {
            
            
            //CHECKS IF DEVICE IS 4:3 ASPECT RATIO
            if(SquareDevices.contains(modelName))
            {
            
                
                
                //initialize and add the settings button
                let settingsButton = SKSpriteNode(imageNamed: "settingsIcon.png")
                settingsButton.position = CGPoint(x: size.width * 0.03, y: size.height * 0.97)
                settingsButton.name = "settingsButton"
                settingsButton.size = CGSize(width: settingsButton.size.width * 0.1, height: settingsButton.size.height * 0.1)
                settingsButton.isHidden = false
                addChild(settingsButton)
                
                
                
                //initialize and add the information button
                let informationButton = SKSpriteNode(imageNamed: "infoIcon.png")
                informationButton.position = CGPoint(x: size.width * 0.97, y: size.height * 0.97)
                informationButton.name = "informationButton"
                informationButton.size = CGSize(width: informationButton.size.width * 0.1, height: informationButton.size.height * 0.1)
                informationButton.isHidden = false
                addChild(informationButton)
                
                
                
                //initialize the current planet label
                let planetLabel = SKLabelNode()
                planetLabel.name = "planetLabel"
                planetLabel.text = "Neptune"
                planetLabel.fontName = planetLabel.fontName! + "-Bold"
                planetLabel.fontSize = 30
                planetLabel.fontColor = UIColor.cyan
                planetLabel.position = CGPoint(x: frame.midX, y: frame.size.height * 0.05)
                addChild(planetLabel)
                
                
                
                //initialize the left navigation button
                let leftNavNode = SKShapeNode(circleOfRadius: 20.0)
                leftNavNode.name = "leftNavButton"
                leftNavNode.position = CGPoint(x: planetLabel.position.x-80, y: planetLabel.position.y+10)
                leftNavNode.strokeColor = UIColor.cyan
                self.addChild(leftNavNode)
                
                
                //initialize the right navigation button
                let rightNavNode = SKShapeNode(circleOfRadius: 20.0)
                rightNavNode.name = "rightNavButton"
                rightNavNode.position = CGPoint(x: planetLabel.position.x+80, y: planetLabel.position.y+10)
                rightNavNode.strokeColor = UIColor.cyan
                self.addChild(rightNavNode)
                
                
                
                
            }else{
                
                
                
            //initialize and add the settings button
            let settingsButton = SKSpriteNode(imageNamed: "settingsIcon.png")
            settingsButton.position = CGPoint(x: size.width * 0.03, y: size.height * 0.95)
            settingsButton.name = "settingsButton"
            settingsButton.size = CGSize(width: settingsButton.size.width * 0.3, height: settingsButton.size.height * 0.3)
            settingsButton.isHidden = false
            addChild(settingsButton)
            
                
                
            //initialize and add the information button
            let informationButton = SKSpriteNode(imageNamed: "infoIcon.png")
            informationButton.position = CGPoint(x: size.width * 0.97, y: size.height * 0.95)
            informationButton.name = "informationButton"
            informationButton.size = CGSize(width: informationButton.size.width * 0.3, height: informationButton.size.height * 0.3)
            informationButton.isHidden = false
            addChild(informationButton)
            
            
                
                
            //initialize the current planet label
            let planetLabel = SKLabelNode()
            planetLabel.name = "planetLabel"
            planetLabel.text = "Earth"
            planetLabel.fontName = planetLabel.fontName! + "-Bold"
            planetLabel.fontSize = 15
            planetLabel.fontColor = UIColor.cyan
            planetLabel.position = CGPoint(x: frame.midX, y: frame.size.height * 0.03)
            addChild(planetLabel)
                
              
                //initialize the left navigation button
                let leftNavNode = SKShapeNode(circleOfRadius: 15.0)
                leftNavNode.name = "leftNavButton"
                leftNavNode.position = CGPoint(x: planetLabel.position.x-50, y: planetLabel.position.y+7)
                leftNavNode.strokeColor = UIColor.cyan
                self.addChild(leftNavNode)
                
                
                //initialize the right navigation button
                let rightNavNode = SKShapeNode(circleOfRadius: 15.0)
                rightNavNode.name = "rightNavButton"
                rightNavNode.position = CGPoint(x: planetLabel.position.x+50, y: planetLabel.position.y+7)
                rightNavNode.strokeColor = UIColor.cyan
                self.addChild(rightNavNode)
                
                
    
            }
        }
    
        
        
        func showSymbols()
        {
            /*for currentSymbol in 0..<formation.planets.count
            {
               let symbolView = UIImageView()
                
            }*/
            let planetSymbolNode = SKShapeNode(circleOfRadius: 20)
            planetSymbolNode.position = CGPoint(x: size.width/2, y: size.height/2)
            planetSymbolNode.strokeColor = UIColor.red
            
            //self.addChild(planetSymbolNode)
        }
        
        
        
        addButtons()
        
        
        
        showSymbols()
    
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("InterfaceView.init had a FATAL ERROR")
    
        
    }
    
    
    
    
    
    func touchUp(atPoint pos : CGPoint) {
        let viewTouchLocation = pos
        let touchedNode = scene?.atPoint(viewTouchLocation)
            if touchedNode?.name == "settingsButton"
            {
                settingsPressed()
            }else if touchedNode?.name == "informationButton"{
                infoPressed()
            }else if touchedNode?.name == "rightNavButton"{
                rightNavPressed()
            }else if touchedNode?.name == "leftNavButton"{
                leftNavPressed()
            }else if touchedNode?.name == "planetLabel"{
                planetLabelPressed()
            }
        }
    
    
    
    
    
    func settingsPressed()
    {
        print("settings activated")
        formation.forwardFocus()
        formation.showSpaceBackdrop = true
        formation.showSpaceBackdrop(status: formation.showSpaceBackdrop)
    }
    
    
    
    
    
    func infoPressed()
    {
        print("info activated")
    }
    
    
    
    
    
    func leftNavPressed()
    {
        print("move left activated")
    }
    
    
    
    
    
    func rightNavPressed()
    {
        print("move right activated")
    }
    
    
    
    
    func planetLabelPressed()
    {
        print("get planet information activated")
        //THIS WILL ACTIVATE THE PLANET POPUP
        let getViewController = GameViewController()
        
        getViewController.animateIn()
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    
    
    
    
    /*override init(symbol: UIImage)
    {super.init(symbol: currentSymbol)
        
    }*/
}
