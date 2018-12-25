    //
//  TwoViewController.swift
//  swift
//
//  Created by leimo on 2018/3/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import SwiftyJSON

class TwoViewController: RootViewController {
  
  var username: String?
  var password: String?
  
  let userNameTextField = UITextField()
  let passWordTextField = UITextField()
  let userNameImg = UIImageView()
  let passWordImg = UIImageView()
  let dashedImg = UIImageView()
  let findPassWordButton = UIButton()
  let loginButton = UIButton()
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    creatUI()
    bindModel()
    
    sionProvider.rx.request(.login(phone: "12341234123", pwd: "123456", type: "1", mobiletype: "2"))
      .mapJSON()
      .subscribe(onSuccess: {
        let json = JSON($0)
        print(json["data"].description) //jsonString
//        if let homeData = JSONDeserializer<HomeNewData>.deserializeFrom(json: jsonString) {
//          print(homeData.founderName as Any)
//          print(homeData.com_desc as Any)
//          print(homeData.img as Any)
//          print(homeData.name as Any)
//        }
      }, onError: { (error) in
        print(error)
      }).disposed(by: disposeBag)
 
    
  }
  
  func creatUI() {
    userNameTextField.placeholder = "请输入手机号"
    userNameTextField.backgroundColor = UIColor.white
    //return 无文字不可点击
    userNameTextField.enablesReturnKeyAutomatically = true
    userNameTextField.keyboardType = UIKeyboardType.numberPad
    //当textView进入编辑状态时显示clearButton
    userNameTextField.clearButtonMode = UITextFieldViewMode.whileEditing
    //内边距
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
    userNameTextField.leftView = view
    userNameTextField.leftViewMode = UITextFieldViewMode.always
    
    passWordTextField.isSecureTextEntry = true
    passWordTextField.placeholder = "请输入6-12位密码"
    passWordTextField.backgroundColor = UIColor.white
    //内边距
    let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
    passWordTextField.leftView = leftView
    passWordTextField.leftViewMode = UITextFieldViewMode.always
    
    self.view.addSubview(userNameTextField)
    self.view.addSubview(passWordTextField)
    
    userNameTextField.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(0)
      make.top.equalTo(safeAreaTopBar + 10)
      make.width.equalTo(screenWidth)
      make.height.equalTo(40)
    }
    
    passWordTextField.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(0)
      make.top.equalTo(userNameTextField.snp.bottom)
      make.width.equalTo(screenWidth)
      make.height.equalTo(40)
    }
    
    userNameImg.image = UIImage(named: "change_phone")
    passWordImg.image = UIImage(named: "passWord")
    dashedImg.image = UIImage(named: "dashed")//backgroundColor = UIColor.init(patternImage: UIImage(named: "dashed")!)
    
    self.view.addSubview(userNameImg)
    self.view.addSubview(passWordImg)
    self.view.addSubview(dashedImg)
    
    userNameImg.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(10)
      make.centerY.equalTo(userNameTextField)
    }
    
    passWordImg.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(10)
      make.centerY.equalTo(passWordTextField)
    }
    
    dashedImg.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(0)
      make.width.equalTo(screenWidth)
      make.top.equalTo(passWordTextField.snp.top)
    }
    
    findPassWordButton.setTitle("忘记密码?", for: UIControlState.normal)
    findPassWordButton.setTitleColor(UIColor.init(hexString: "#ff8b26"), for: UIControlState.normal)
    findPassWordButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    
    loginButton.setTitle("登录", for: UIControlState.normal)
    loginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
    loginButton.backgroundColor = UIColor.init(hexString: "#ff8b26")
    loginButton.layer.cornerRadius = 4
    
    self.view.addSubview(findPassWordButton)
    self.view.addSubview(loginButton)
    
    findPassWordButton.snp.makeConstraints { (make) -> Void in
      make.right.equalTo(-10)
      make.width.equalTo(80)
      make.top.equalTo(passWordTextField.snp.bottom).offset(13)
    }
    
    loginButton.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(30)
      make.right.equalTo(-30)
      make.top.equalTo(findPassWordButton.snp.bottom).offset(60)
    }
    
    userNameTextField.rx.text.subscribe (onNext: { event in
//      print("\(event!.count)")
      if event!.count > 11 {
        self.userNameTextField.text = self.username
        return
      }
      self.username = self.userNameTextField.text
    }).disposed(by: disposeBag)
    
    findPassWordButton.rx.tap
      .subscribe(onNext :{
        let sionVC = SionViewController()
        self.navigationController?.pushViewController(sionVC, animated: true)
      }).disposed(by: rx.disposeBag)
    
  }

  func bindModel() {
    let viewModel = LoginViewModel.init(input: (username: userNameTextField.rx.text.orEmpty.asDriver(), password: passWordTextField.rx.text.orEmpty.asDriver(), loginTaps: loginButton.rx.tap.asDriver()))
  
    viewModel.signedIn
      .drive(onNext: {  bool in
      if bool {
        print("登录成功")
      }else{
        print("登录失败")
      }
      
    }).disposed(by: disposeBag)
    
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

