//
//  GameViewController.swift
//  Copernican
//
//  Updated by Timur Guler on 4/4/19.
//  Copyright © 2017 Timur Guler. All rights reserved.
//  
//  If you are reading this... sup
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit

//(THIS STARTS THE PROGRAM AND CONFIGURES THE VIEW)
class GameViewController: UIViewController
{
    
    
    
    
    
    var sceneView: SCNView!
    
    
    
    
    
    //for popup animation
    var planetInfoView: UIView!
    //weak var visualEffectView: UIVisualEffectView!
    //var effect:UIVisualEffect!
    
    
    
    
    
    //(STARTING POINT FOR PROGRAM)
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        
        //(SETS PROPERTIES FOR AppScene.swift)
        self.sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.sceneView.scene = AppScene()
        
        
        
        //allow user accessibility to the camera
        self.sceneView.allowsCameraControl = true
        sceneView.showsStatistics = false
        
        
        
        //set background color of view
        self.sceneView.backgroundColor = UIColor.black
        
        
        
        //add the views
        self.view.addSubview(self.sceneView)
        
        
        
        //(SETS PROPERTIES FOR InterfaceView.swift)
        sceneView.overlaySKScene = InterfaceView(size: sceneView.frame.size)
        
        
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.sceneView.addGestureRecognizer(tapGesture)
    
        
        
        // store the variables for the popup
        //self.effect = self.visualEffectView.effect
        //self.visualEffectView.effect = nil
        //self.planetInfoView.layer.cornerRadius = 5
    }
    
    
    
    
    
    //(HANDLES A TAP BY THE USER)    NOT WORKING
    func handleTap(_ gestureRecognize: UIGestureRecognizer)
    {
        
        
        //retrieve the SCNView
        let scnView = self.view as! SCNView
        
        
        
        //let touchAcc = AppScene()
        //check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        
        
        
        //check that we clicked on at least one object
        if hitResults.count > 0
        {
            
            
            //retrieved the first clicked object
            let result: AnyObject = hitResults[0]
            
            
            
            //get its material
            let material = result.node!.geometry!.firstMaterial!
            
            
            
            //highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.2
            
            
            
            //on completion - unhighlight
            SCNTransaction.completionBlock =
                {
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.2
                    
                    material.emission.contents = UIColor.black
                    
                    SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.darkGray
            
            SCNTransaction.commit()
        }
    }
    
    
    
    
    
    func animateIn() {
        /*self.view.addSubview(planetInfoView)
        planetInfoView.center = (self.view?.center)!
        
        planetInfoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        planetInfoView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            //self.visualEffectView.effect = self.effect
            self.planetInfoView.alpha = 1
            self.planetInfoView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    
    func animateOut () {
        UIView.animate(withDuration: 0.3, animations: {
            self.planetInfoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.planetInfoView.alpha = 0
            
            //self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.planetInfoView.removeFromSuperview()
        }
    }*/}
    
    
    
    
    private func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    
    
    
    
    
    //Allows screen to autorotate
    private func shouldAutorotate() -> Bool {
        return true
    }
    
    
    
    
    
    //Makes the status bar hidden
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING")
        //Dispose of any resources that can be recreated
    }
}
