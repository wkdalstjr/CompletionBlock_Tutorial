//
//  ViewController.swift
//  CompletionBlock-Tutorial
//
//  Created by 장민석 on 2021/11/09.
//  Copyright © 2021 장민석. All rights reserved.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var mainTitile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController -> viewDidLoad() 호출됨")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            
            print("컴플레션 블락으로 넘겨받았음: \(result)")
            
            KRProgressHUD.showSuccess()
            
            self.mainTitile.text = result
            
        })
    }


    
    fileprivate func sayHi(completion: @escaping(String) -> ()) {
        print("ViewController - sayHi() 호출됨")
        
        //2초 딜레이를 줌
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            //print("하이!")
            completion("하이")
        }
        
    }
}

