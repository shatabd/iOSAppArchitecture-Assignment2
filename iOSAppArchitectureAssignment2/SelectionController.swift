//
//  SelectionController.swift
//  iOSAppArchitectureAssignment2
//
//  Created by Macmini-13 on 15/09/2022.
//

import UIKit

typealias Image = (UIImage) -> ()

protocol  ChangeLogoDelegate: NSObject{
    func changeLogo(image: UIImage)
}
class SelectionController: UIViewController {

    weak var logoDelegate: ChangeLogoDelegate?
    var closure: Image?
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
//MARK:- PROTOCOL AND DELEGATE
    @IBAction func protocolButton(_ sender: UIButton) {
        logoDelegate?.changeLogo(image:  UIImage(imageLiteralResourceName: "logos"))
    }
                 
//MARK:- CLOSURE
    @IBAction func closerButton(_ sender: UIButton) {
      
        guard let closure = closure else {
            return
        }
        closure(.closureLogo)
    

    }
    
     //MARK:- NOTIFICATIONCENTER AND OBSERVER
    @IBAction func notificationButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "changelogo"), object: UIImage.notificationLogo)
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- EXTENSION IMAGE
extension UIImage {
    //static let logo = UIImage(named: "aotlogo")!
    static let closureLogo = UIImage(named: "aotlogo")!
    static let delegateLogo = UIImage(named: "logos")!
    static let notificationLogo = UIImage(named: "notificationLogo")!
}
