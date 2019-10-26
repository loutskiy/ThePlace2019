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
    
    private var heatmapLayer: GMUHeatmapTileLayer!
    
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
        heatmapLayer = GMUHeatmapTileLayer()
        addHeatmap()
        heatmapLayer.map = mapView
        
//        contentView.layer.cornerRadius = 4.0
//        contentView.layer.borderWidth = 1.0
    }
    
    func addHeatmap()  {
      var list = [GMUWeightedLatLng]()
      do {
        // Get the data: latitude/longitude positions of police stations.
        if let path = Bundle.main.url(forResource: "heat", withExtension: "json") {
          let data = try Data(contentsOf: path)
          let json = try JSONSerialization.jsonObject(with: data, options: [])
          if let object = json as? [[String: Any]] {
            for item in object {
              let lat = item["lat"]
              let lng = item["lng"]
              let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat as! CLLocationDegrees, lng as! CLLocationDegrees), intensity: 1.0)
              list.append(coords)
            }
          } else {
            print("Could not read the JSON.")
          }
        }
      } catch {
        print(error.localizedDescription)
      }
      // Add the latlngs to the heatmap layer.
      heatmapLayer.weightedData = list
    }
}
