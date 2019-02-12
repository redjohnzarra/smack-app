//
//  AddChannelVC.swift
//  smack-app
//
//  Created by Reden John Zarra on 12/02/2019.
//  Copyright © 2019 Reden John Zarra. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    // Outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var channDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else { return }
        guard let channelDesc = channDesc.text, channDesc.text != "" else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = getAttributePlaceholderColor(field: "name")
        channDesc.attributedPlaceholder = getAttributePlaceholderColor(field: "description")
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func getAttributePlaceholderColor(field: String) -> NSAttributedString {
        return NSAttributedString(string: field, attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    }
}
