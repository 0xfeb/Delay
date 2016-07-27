//
//  CLLazy.swift
//  Lazy
//
//  Created by wangyuanou on 16/7/11.
//  Copyright © 2016年 huanxin. All rights reserved.
//

import UIKit

class CLDelay {
	var list:[(AnyObject, Any)] = []
	weak var vc:UIViewController?
	
	func addDelay(value:AnyObject, proc:(AnyObject)->()) {
		list.append((value, proc))
	}
}

extension UIViewController {
	static var lazyList:[CLDelay] = []
	
	func delay(value:AnyObject, proc:(AnyObject)->()) {
		if isViewLoaded() {
			proc(value)
			return
		}
		
		var item:CLDelay? = nil
		for n in UIViewController.lazyList {
			if n.vc == self {
				item = n
				item?.addDelay(value, proc: proc)
				break
			}
		}
		if item == nil {
			item = CLDelay()
			item?.vc = self
			item?.addDelay(value, proc: proc)
			UIViewController.lazyList.append(item!)
		}
	}
	
	func loadDelay() {
		for i in UIViewController.lazyList.indices {
			let n = UIViewController.lazyList[i]
			if n.vc == self {
				n.list.forEach({ (pair:(AnyObject, Any)) in
					let proc = pair.1 as! (AnyObject)->()
					proc(pair.0)
				})
				
				UIViewController.lazyList.removeAtIndex(i)
				break
			}
		}
	}
}
