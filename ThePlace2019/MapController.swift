//
//  MapController.swift
//  ThePlace2019
//
//  Created by Михаил Луцкий on 26.10.2019.
//  Copyright © 2019 Mikhail Lutskii. All rights reserved.
//

import UIKit

class MapController: UIView {

    let kCONTENT_XIB_NAME = "MapController"
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
//        contentView.layer.cornerRadius = 4.0
//        contentView.layer.borderWidth = 1.0
    }
}
