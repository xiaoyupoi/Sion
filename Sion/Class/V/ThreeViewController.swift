//
//  ThreeViewController.swift
//  swift
//
//  Created by leimo on 2018/3/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ThreeViewController: RootViewController {
  
  let scaleLayer: CALayer = CALayer()
  let rectLayer: CALayer = CALayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    let observable = Observable.just(Music(name: "届不到", singer: "雪莱"))
    
    observable.subscribe(onNext: { music in
      print(music.singer)
    }, onError: { (error) in
      print(error)
    }, onCompleted: {
      
    }, onDisposed: {
      
    }).disposed(by: rx.disposeBag)
    
//    let calendar = NSCalendar.current
//
//    var com = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second], from: Date())
    let sion = SionView(frame: view.bounds)
    self.view.addSubview(sion)
    
    let orange = UIView(frame: CGRect(x: 10, y: 500, width: 50, height: 50))
    orange.backgroundColor = UIColor.orange
    self.view.addSubview(orange)
    UIView.animate(withDuration: 4) {
      orange.frame = CGRect(x: 100, y: 300, width: 50, height: 50)
      orange.alpha = 0.5
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    //CABasicAnimation动画
    createBasicAnimation()
    //CAKeyframeAnimation动画
    createKeyframeAnimation()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    scaleLayer.removeAllAnimations()
  }
  
  func createKeyframeAnimation() {
    
    rectLayer.frame = CGRect(x: 50, y: 300, width: 40, height: 40)
    rectLayer.cornerRadius = 20.0
    rectLayer.backgroundColor = UIColor.orange.cgColor
    self.view.layer.addSublayer(rectLayer)
    
    //淡入淡出
    let rectRunAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "opacity")
    rectRunAnimation.duration = 5.0
    //每个动作的时间百分比
    let valuesArray: [NSNumber] = [NSNumber(value: 0.95), NSNumber(value: 0.90), NSNumber(value: 0.88), NSNumber(value: 0.85), NSNumber(value: 0.35), NSNumber(value: 0.05), NSNumber(value: 0.0), NSNumber(value: 0.35), NSNumber(value: 0.55)]
    rectRunAnimation.values = valuesArray
    rectRunAnimation.fillMode = kCAFillModeForwards
    rectRunAnimation.repeatCount = HUGE
    rectLayer.add(rectRunAnimation, forKey: "KeyFrame")
    
    //CAKeyframeAnimation任意路径动画
    let pathLine: CGMutablePath = CGMutablePath()
    pathLine.move(to: CGPoint(x: 50, y: 300))
    //pathLine.addLine(to: CGPoint(x: 200, y: 150))//绘制直线
    pathLine.addArc(center: CGPoint(x: 50, y: 300), radius: 50, startAngle: 0, endAngle: CGFloat.pi / 2, clockwise: true)
    let pathAnimation: CAKeyframeAnimation = CAKeyframeAnimation()
    pathAnimation.duration = 5.0
    pathAnimation.path = pathLine
    pathAnimation.keyPath = "position"
    pathAnimation.fillMode = kCAFillModeForwards
    rectRunAnimation.repeatCount = HUGE
    rectLayer.add(pathAnimation, forKey: nil)
  }
  
  func createBasicAnimation() {
    
    scaleLayer.backgroundColor = UIColor.orange.cgColor
    scaleLayer.frame = CGRect(x: 50, y: 100, width: 40, height: 40)
//    scaleLayer.cornerRadius = 20.0
    self.view.layer.addSublayer(scaleLayer)
    
    //缩放动画
    let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
    //初始状态
    scaleAnimation.fromValue = 0.5
    //结束状态
    scaleAnimation.toValue = 2.0
    //是否执行逆动画
    scaleAnimation.autoreverses = true
    /*
     kCAFillModeRemoved: 动画结束时 恢复原先状态 default
     kCAFillModeForwards: 动画结束时 保持结束状态
     kCAFillModeBoth:
     kCAFillModeBackwards
     */
    scaleAnimation.fillMode = kCAFillModeForwards
    //永久重复
    scaleAnimation.repeatCount = HUGE
    //动画时间
    scaleAnimation.duration = 2.0

//    scaleLayer.add(scaleAnimation, forKey: "scaleAnimation")
    
    //平移动画
    let moveAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation")
    //初始状态
    moveAnimation.fromValue = NSValue(cgPoint: CGPoint.zero)
    //结束状态
    moveAnimation.toValue = NSValue(cgPoint: CGPoint(x: 200, y: 0))
    //是否执行逆动画
    moveAnimation.autoreverses = true
    moveAnimation.fillMode = kCAFillModeForwards
    //永久重复
    moveAnimation.repeatCount = HUGE
    //动画时间
    moveAnimation.duration = 2.0
    
//    scaleLayer.add(moveAnimation, forKey: "translationAnimation")
    
    //旋转动画 transform.rotation.x 或 transform.rotation.y则为翻转
    let rotateAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
    //初始状态
    rotateAnimation.fromValue = 0
    //结束状态
    rotateAnimation.toValue = CGFloat.pi * 2
    //是否执行逆动画
    rotateAnimation.autoreverses = true
    rotateAnimation.fillMode = kCAFillModeForwards
    //永久重复
    rotateAnimation.repeatCount = HUGE
    //动画时间
    rotateAnimation.duration = 2.0
    
//    scaleLayer.add(rotateAnimation, forKey: "rotatAnimation")

    let groupAnimation:CAAnimationGroup = CAAnimationGroup()
    groupAnimation.duration = 2.0
    groupAnimation.autoreverses = true
    groupAnimation.animations = [moveAnimation,scaleAnimation,rotateAnimation]
    groupAnimation.repeatCount = HUGE
    
    scaleLayer.add(groupAnimation, forKey: "groupAnimation")
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
