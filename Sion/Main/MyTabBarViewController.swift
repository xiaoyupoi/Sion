//
//  MyTabBarViewController.swift
//  swift
//
//  Created by leimo on 2018/3/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    let tabbar = UITabBar.appearance();
    //tabBar是否半透明
    tabBar.isTranslucent = true
    
    addChildViewControllers();
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  private func addChildViewControllers() {
    let oneVC = OneViewController()
    oneVC.tabBarItem.image = UIImage(named: "huoshan_tabbar_32x32_")
    oneVC.tabBarItem.selectedImage = UIImage(named: "huoshan_tabbar_press_32x32_")
    oneVC.title = "首页"
    
    let twoVC = TwoViewController()
    twoVC.tabBarItem.image = UIImage(named: "huoshan_tabbar_32x32_")
    twoVC.tabBarItem.selectedImage = UIImage(named: "huoshan_tabbar_press_32x32_")
    twoVC.title = "第二页"
    
    let threeVC = ThreeViewController()
    threeVC.tabBarItem.image = UIImage(named: "huoshan_tabbar_32x32_")
    threeVC.tabBarItem.selectedImage = UIImage(named: "huoshan_tabbar_press_32x32_")
    threeVC.title = "第三页"
    
    let fourVC = XYYPracticeViewController()
    fourVC.tabBarItem.image = UIImage(named: "huoshan_tabbar_32x32_")
    fourVC.tabBarItem.selectedImage = UIImage(named: "huoshan_tabbar_press_32x32_")
    fourVC.title = "第四页"
    
    let navVc = MyNavigationViewController(rootViewController: oneVC)
    let navVc1 = MyNavigationViewController(rootViewController: twoVC)
    let navVc2 = MyNavigationViewController(rootViewController: threeVC)
    let navVc3 = MyNavigationViewController(rootViewController: fourVC)
    
    addChildViewController(navVc)
    addChildViewController(navVc1)
    addChildViewController(navVc2)
    addChildViewController(navVc3)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
