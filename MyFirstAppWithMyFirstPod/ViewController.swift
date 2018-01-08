//
//  ViewController.swift
//  MyFirstAppWithMyFirstPod
//
//  Created by Kevin Hijlkema on 08/01/2018.
//  Copyright © 2018 Kevin Hijlkema. All rights reserved.
//

import UIKit
import FirstTestPod

class ViewController: UIViewController, MyKitProtocol {

    let pod = MyKit.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pod.open("1234", withNotifier: self)
        pod.doSomething("do some stuff")
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.didClickOnView))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(gesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        didClickOnView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Methodes
    func didClickOnView() {
        self.view.backgroundColor = pod.getAColor()
    }


    //MYKIT DELEGATE
    func didAskToDoSomething() {
        NSLog("HEYYY Mykkit ask for it !")
    }
    
    func configurationMCKit() -> MyKitConfig {
        return MyKitConfig(alpha: 0.5, key: "1234")
    }
}

