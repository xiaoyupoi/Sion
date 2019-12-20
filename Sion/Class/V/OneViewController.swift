//
//  OneViewController.swift
//  swift
//
//  Created by leimo on 2018/3/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import SwiftyJSON

class Singleton: NSObject {
    // 单例
    static let shared = Singleton.init()
    fileprivate override init(){}
    
    var name:String?
    var sex:String?
    var age:String?
}

extension Singleton {
    override var description: String {
        return "姓名: \(name ?? "") 性别: \(sex ?? "") 年龄: \(age ?? "")"
    }
}

class Rect {
    var width: Double = 5.0
    var height: Double = 5.0
}
//正则
struct MyRegex {
    let regex: NSRegularExpression?
    
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern,
                                         options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input,
                                        options: [],
                                        range: NSMakeRange(0, (input as NSString).length)) {
            return matches.count > 0
        } else {
            return false
        }
    }
}
/*
 //用户名验证（允许使用小写字母、数字、下滑线、横杠，一共3~16个字符）
 ^[a-z0-9_-]{3,16}$
 
 //Email验证
 ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$
 
 //手机号码验证
 ^1[0-9]{10}$
 
 //URL验证
 ^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$
 
 //IP地址验证
 ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
 
 //html标签验证
 ^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$
 */
class ExampleIntEventProvider: RxEventProvider<Int> {
    
}

class OneViewController: RootViewController {
    
    var iPlayer:IJKFFMoviePlayerController?
    var delegatePlayer:IJKMediaPlayback?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        id<IJKMediaPlayback> playback = [[IJKFFMoviePlayerController alloc] initWithContentURL:nil  withOptions:nil];
//
//        [playback shutdown];
        let video = "http://aliyaoapp.oss-cn-hangzhou.aliyuncs.com/videos/001/out.m3u8"//"http://vfx.mtime.cn/Video/2019/03/18/mp4/190318231014076505.mp4"//
        let options:IJKFFOptions = IJKFFOptions.byDefault()
        let url:URL = URL.init(string: video)!
        
        
        self.iPlayer = IJKFFMoviePlayerController.init(contentURL: url, with: options)
        var arm1 = UIViewAutoresizing.init(rawValue: 0)
        arm1.insert(UIViewAutoresizing.flexibleWidth)
        arm1.insert(UIViewAutoresizing.flexibleHeight)
        self.iPlayer?.view.autoresizingMask = arm1
        self.iPlayer?.view.backgroundColor = UIColor.white
        self.iPlayer?.view.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        self.iPlayer?.scalingMode = .aspectFit
        self.iPlayer?.shouldAutoplay = true
        self.delegatePlayer = self.iPlayer
        self.view.autoresizesSubviews = true
        self.view.addSubview((self.iPlayer?.view)!)
        
        
        let dic = ["key1":"A","key2":"B"]
        print("dicA\(dic["key1"] ?? "sa")")
        
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height:200))
//        button.setImage(#imageLiteral(resourceName: "WX1"), for: UIControlState.normal)/Users/leimo/Desktop/Sion/Sion/Class/V/OneViewController.swift
        button.setImage(R.image.wx1(), for: .normal)
//        button.setImage(UIImage(named: "WX1"), for: .highlighted)
        button.titleLabel?.text = "小鬼"
        self.view.addSubview(button)
        
        RxEventHub.sharedHub.eventObservable(ExampleIntEventProvider())
            .share(replay: 1)
            .subscribe { (result) in
                print(result)
            }.disposed(by: rx.disposeBag)
        
        button.rx.tap
            .subscribe(onNext:{
                let sionVC = SionViewController()//XYYCitySelectViewController()
                self.navigationController?.pushViewController(sionVC, animated: true)
            }).disposed(by: rx.disposeBag)
        
        
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher = MyRegex(mailPattern)
        let mail = "admin@qq.com"
        if matcher.match(input: mail) {
            print("邮箱地址格式正确")
        }else{
            print("邮箱地址格式有误")
        }
        
        let headImageView = UIImageView(frame: CGRect(x: (screenWidth - 100 )/2, y: 70, width: 100, height: 100))
        headImageView.image = UIImage.init(named: "recommend")
        self.view.addSubview(headImageView)
//        self.view.bringSubview(toFront: )
        let cameraButton = UIButton(frame: CGRect(x: 50, y: 200, width: screenWidth - 50, height: 40))
        cameraButton.setTitle("相机", for: UIControlState.normal)
//        cameraButton.setTitleColor(R.clr.sionApp.baka(), for: UIControlState.normal)
//        cameraButton.setTitleColor(R.clr.sionApp.custom(), for: UIControlState.normal
//        cameraButton.setTitleColor(UIColor.gray, for: UIControlState.disabled) 31 16 31 31 7 17
        self.view.addSubview(cameraButton)
        
        //相机是否可用
        //    cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        cameraButton.rx.tap.flatMapLatest { [weak self] in
            return UIImagePickerController.rx.createWithParent(self) { picker in
                picker.sourceType = .photoLibrary //.camera 相机
                //是否允许编辑
                picker.allowsEditing = false //true
                picker.allowsEditing = false
                }
                .flatMap { result in
                    result.rx.didFinishPickingMediaWithInfo
                }
                .take(1) //通过 take 操作符你可以只发出头 n 个元素。并且忽略掉后面的元素，直接结束序列。
            }.map { (info) in
                return info[UIImagePickerControllerOriginalImage] as? UIImage
            }.bind(to: headImageView.rx.image)
            .disposed(by: rx.disposeBag)
        
        //map
        Observable.of(1, 2, 3)
            .map { //该操作符通过传入一个函数闭包把原来的 Observable 序列转变为一个新的 Observable 序列。
                //        print($0)
                $0 * 10
            }.subscribe(onNext: { value in
                print("-----\(value)")
            }).disposed(by: rx.disposeBag)
        
        /*
         map 在做转换的时候容易出现“升维”的情况。即转变之后，从一个序列变成了一个序列的序列。
         而 flatMap 操作符会对源 Observable 的每一个元素应用一个转换方法，将他们转换成 Observables。 然后将这些 Observables 的元素合并之后再发送出来。即又将其 "拍扁"（降维）成一个 Observable 序列。
         这个操作符是非常有用的。比如当 Observable 的元素本生拥有其他的 Observable 时，我们可以将所有子 Observables 的元素发送出来。
         */
        
        let subject1 = BehaviorSubject(value: "A")
        let subject2 = BehaviorSubject(value: "1")
        
        let variable = Variable(subject1)
        /*
         variable.asObservable()
         .flatMap { $0 }
         .subscribe(onNext: { value in
         
         print(value)
         }).disposed(by: rx.disposeBag)
         
         subject1.onNext("B")
         variable.value = subject2
         subject2.onNext("2")
         subject1.onNext("C")
         */
        //flatMapLatest与flatMap 的唯一区别是：flatMapLatest只会接收最新的value 事件。
        variable.asObservable()
            .flatMapLatest { $0 }
            .subscribe(onNext: { value in
                
                print(value)
            }).disposed(by: rx.disposeBag)
        variable.value = subject2
        
        /*
         button.rx.tap3
         .flatMapLatest { [weak self] _ in
         return UIImagePickerController.rx.createWithParent(self) { picker in
         picker.sourceType = .photoLibrary
         picker.allowsEditing = false
             }
         .flatMap { value in
         value.rx.didFinishPickingMediaWithInfo
         }
         .take(1)
         }
         .map { info in q
         return info[UIImagePickerControllerOriginalImage] as? UIImage
         }
         .bind(to: button.rx.image(for: UIControlState.normal))
         .disposed(by: rx.disposeBag)
         https://m.baoshuu.com/TXT/list32_41.html
         */
        //KVO: 通知
        button.rx.observe(String.self, #keyPath(UIButton.titleLabel.text))
            .subscribe(onNext: { value in
                print(value!)
            }).disposed(by: rx.disposeBag)
        let model = Singleton.shared
        model.name = "s"
        
        /*
         let mod1 = Singleton.shared
         mod1.name = "sion"[图片]
         let mod2 = Singleton.shared
         mod2.sex = "female"
         let mod3 = Singleton.shared
         mod3.age = "17"
         print(mod1,mod2,mod3)
         //    print(Baka.shared.description)
         
         let array = ["a", "b", "c", "d"]
         for (index, entry) in array.enumerated() {
         print("entry: \(entry)--->index = \(index)")
         }
         
         for entry in array.reversed() {
         print("entry: \(entry)")
         }
         var phoneNum = "18640918309"
         phoneNum.replaceSubrange(Range(phoneNum.index(phoneNum.startIndex, offsetBy: 3)..<phoneNum.index(phoneNum.startIndex, offsetBy: 7)), with: "****")
         print("\(phoneNum)")
         
         let rect1: Rect = Rect()
         
         let rect2: Rect = rect1
         
         if rect1 === rect2 {
         
         print("equal")
         
         }
         if rect1 !== rect2 {
         
         print("Not equal")
         
         }
         */
        // Do any additional setup after loading the view.
    }
    //  @objc func bakaClick() {
    //    loadData()
    //    let sionVC = SionViewController()
    //    navigationController?.pushViewController(sionVC, animated: true)
    //  }
    fileprivate func columnCount() -> Int {
        
        return 0
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
extension OneViewController {
    private func loadData() {

    }
    override func viewWillAppear(_ animated: Bool) {
        print("10")
        super.viewWillAppear(animated)
        self.iPlayer?.prepareToPlay() //准备
        self.iPlayer?.play() //播放
    }
    override func viewDidAppear(_ animated: Bool) {
        print("20")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("30")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("40")
    }
}
