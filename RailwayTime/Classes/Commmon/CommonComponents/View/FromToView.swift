//
//  FromToView.swift
//  RailwayTime
//
//  Created by Babul Raj on 02/05/19.
//  Copyright © 2019 Babul Raj. All rights reserved.
//

import UIKit

enum FromToTextFieldType: Int {
    case from = 1,
    to
}

class FromToView: UIView,UITextFieldDelegate {

    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet var contentView: UIView!
    var delegate: FromToViewProtocol?
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        setUpView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        setUpView()
    }
    
    func setUpView() {
    }
    
    
    private func loadViewFromNib() {
        let bundle = Bundle.init(for: self.classForCoder)
        bundle.loadNibNamed("FromToView", owner: self, options: nil)
        self.contentView.frame = bounds
        self.addSubview(self.contentView)
    }
    
    //MARK: TEXTFIELD DELEGATE
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let type = FromToTextFieldType(rawValue: textField.tag) else {return false}
        delegate?.didselectTextField(type: type )
        
        return false
    }
    
    func updateFromTextFields(fromStation: String?, toStation: String?) {
        if  let aFromStation = fromStation  {
            fromTextField.text = aFromStation
        }
        
        if  let aToStation = toStation  {
             toTextField.text = aToStation
        }
    }
}
