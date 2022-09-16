//
//  ViewController.swift
//  iOSAppArchitectureAssignment2
//
//  Created by Macmini-13 on 15/09/2022.
//

import UIKit

class ViewController: UIViewController{
    
//MARK:- Outlets
    @IBOutlet weak var mainImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    //MARKS:- NOTIFICATION
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage), name:.init(rawValue: "changelogo"), object: nil)
    }
    
  @objc func updateImage(notification: NSNotification) {
      if let image = notification.object as? UIImage {
      mainImageView.image = image
}
  }
    
 
    
    @IBAction func chooseButton(_ sender: Any) {
        let stordboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = stordboard.instantiateViewController(withIdentifier: "SelectionController") as! SelectionController
        controller.logoDelegate = self
        controller.closure = { [weak self] name in
            self?.mainImageView.image = name
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ViewController: ChangeLogoDelegate {
    func changeLogo(image: UIImage) {
        mainImageView.image = image
    }
    
    
    //MARKS:- unwind segeue
    @IBAction func unwindThat(_ sender: UIStoryboardSegue) {
        
    }
}
