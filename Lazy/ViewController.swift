//
//  ViewController.swift
//  Lazy
//
//  Created by wangyuanou on 16/7/11.
//  Copyright © 2016年 huanxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var testLabel: UILabel!
	
	var text:String = "" {
		didSet {
			self.delay(text) {
				self.testLabel.text = $0 as? String
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		loadDelay()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

