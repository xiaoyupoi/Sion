//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 4 files.
  struct file {
    /// Resource file `EaseUIResource.bundle`.
    static let easeUIResourceBundle = Rswift.FileResource(bundle: R.hostingBundle, name: "EaseUIResource", pathExtension: "bundle")
    /// Resource file `Info.plist`.
    static let infoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "Info", pathExtension: "plist")
    /// Resource file `cities.plist`.
    static let citiesPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "cities", pathExtension: "plist")
    /// Resource file `sionApp.clr`.
    static let sionAppClr = Rswift.FileResource(bundle: R.hostingBundle, name: "sionApp", pathExtension: "clr")
    
    /// `bundle.url(forResource: "EaseUIResource", withExtension: "bundle")`
    static func easeUIResourceBundle(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.easeUIResourceBundle
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "Info", withExtension: "plist")`
    static func infoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.infoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "cities", withExtension: "plist")`
    static func citiesPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.citiesPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "sionApp", withExtension: "clr")`
    static func sionAppClr(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sionAppClr
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 14 images.
  struct image {
    /// Image `WX1`.
    static let wx1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "WX1")
    /// Image `btn_airplay`.
    static let btn_airplay = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_airplay")
    /// Image `btn_audiosubtitle`.
    static let btn_audiosubtitle = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_audiosubtitle")
    /// Image `btn_back24x25`.
    static let btn_back24x25 = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_back24x25")
    /// Image `btn_float_close20x20`.
    static let btn_float_close20x20 = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_float_close20x20")
    /// Image `btn_fullscreen22x22`.
    static let btn_fullscreen22x22 = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_fullscreen22x22")
    /// Image `btn_normalscreen22x22`.
    static let btn_normalscreen22x22 = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_normalscreen22x22")
    /// Image `btn_pause22x22`.
    static let btn_pause22x22 = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_pause22x22")
    /// Image `btn_play22x22`.
    static let btn_play22x22 = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_play22x22")
    /// Image `change_phone`.
    static let change_phone = Rswift.ImageResource(bundle: R.hostingBundle, name: "change_phone")
    /// Image `dashed`.
    static let dashed = Rswift.ImageResource(bundle: R.hostingBundle, name: "dashed")
    /// Image `huoshan_tabbar_32x32_`.
    static let huoshan_tabbar_32x32_ = Rswift.ImageResource(bundle: R.hostingBundle, name: "huoshan_tabbar_32x32_")
    /// Image `huoshan_tabbar_press_32x32_`.
    static let huoshan_tabbar_press_32x32_ = Rswift.ImageResource(bundle: R.hostingBundle, name: "huoshan_tabbar_press_32x32_")
    /// Image `passWord`.
    static let passWord = Rswift.ImageResource(bundle: R.hostingBundle, name: "passWord")
    
    /// `UIImage(named: "WX1", bundle: ..., traitCollection: ...)`
    static func wx1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.wx1, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_airplay", bundle: ..., traitCollection: ...)`
    static func btn_airplay(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_airplay, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_audiosubtitle", bundle: ..., traitCollection: ...)`
    static func btn_audiosubtitle(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_audiosubtitle, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_back24x25", bundle: ..., traitCollection: ...)`
    static func btn_back24x25(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_back24x25, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_float_close20x20", bundle: ..., traitCollection: ...)`
    static func btn_float_close20x20(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_float_close20x20, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_fullscreen22x22", bundle: ..., traitCollection: ...)`
    static func btn_fullscreen22x22(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_fullscreen22x22, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_normalscreen22x22", bundle: ..., traitCollection: ...)`
    static func btn_normalscreen22x22(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_normalscreen22x22, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_pause22x22", bundle: ..., traitCollection: ...)`
    static func btn_pause22x22(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_pause22x22, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_play22x22", bundle: ..., traitCollection: ...)`
    static func btn_play22x22(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_play22x22, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "change_phone", bundle: ..., traitCollection: ...)`
    static func change_phone(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.change_phone, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dashed", bundle: ..., traitCollection: ...)`
    static func dashed(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dashed, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "huoshan_tabbar_32x32_", bundle: ..., traitCollection: ...)`
    static func huoshan_tabbar_32x32_(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.huoshan_tabbar_32x32_, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "huoshan_tabbar_press_32x32_", bundle: ..., traitCollection: ...)`
    static func huoshan_tabbar_press_32x32_(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.huoshan_tabbar_press_32x32_, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "passWord", bundle: ..., traitCollection: ...)`
    static func passWord(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.passWord, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 5 nibs.
  struct nib {
    /// Nib `EZPlayerAudibleLegibleViewController`.
    static let ezPlayerAudibleLegibleViewController = _R.nib._EZPlayerAudibleLegibleViewController()
    /// Nib `EZPlayerControlView`.
    static let ezPlayerControlView = _R.nib._EZPlayerControlView()
    /// Nib `EZPlayerFloatContainerRootViewController`.
    static let ezPlayerFloatContainerRootViewController = _R.nib._EZPlayerFloatContainerRootViewController()
    /// Nib `EZPlayerFloatView`.
    static let ezPlayerFloatView = _R.nib._EZPlayerFloatView()
    /// Nib `View`.
    static let view = _R.nib._View()
    
    /// `UINib(name: "EZPlayerAudibleLegibleViewController", in: bundle)`
    static func ezPlayerAudibleLegibleViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.ezPlayerAudibleLegibleViewController)
    }
    
    /// `UINib(name: "EZPlayerControlView", in: bundle)`
    static func ezPlayerControlView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.ezPlayerControlView)
    }
    
    /// `UINib(name: "EZPlayerFloatContainerRootViewController", in: bundle)`
    static func ezPlayerFloatContainerRootViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.ezPlayerFloatContainerRootViewController)
    }
    
    /// `UINib(name: "EZPlayerFloatView", in: bundle)`
    static func ezPlayerFloatView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.ezPlayerFloatView)
    }
    
    /// `UINib(name: "View", in: bundle)`
    static func view(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.view)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _EZPlayerFloatView.validate()
      try _EZPlayerControlView.validate()
    }
    
    struct _EZPlayerAudibleLegibleViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "EZPlayerAudibleLegibleViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _EZPlayerControlView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "EZPlayerControlView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> EZPlayerControlView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? EZPlayerControlView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "btn_play22x22", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_play22x22' is used in nib 'EZPlayerControlView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_back24x25", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_back24x25' is used in nib 'EZPlayerControlView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_fullscreen22x22", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_fullscreen22x22' is used in nib 'EZPlayerControlView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_audiosubtitle", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_audiosubtitle' is used in nib 'EZPlayerControlView', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _EZPlayerFloatContainerRootViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "EZPlayerFloatContainerRootViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _EZPlayerFloatView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "EZPlayerFloatView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> EZPlayerFloatView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? EZPlayerFloatView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "btn_float_close20x20", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_float_close20x20' is used in nib 'EZPlayerFloatView', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _View: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "View"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = ViewController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
