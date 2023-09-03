//
//  MapView.swift
//  mapkit-swift
//
//  Created by Takeshi Kondo on 2023/09/02.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let searchKey: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context){
        print("検索キーワード:\(searchKey)")
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString (
            searchKey,
            completionHandler: { (placemarks, error) in
                if let placemarks,
                   let firstPlacemark = placemarks.first,
                   let location = firstPlacemark.location {
                    
                    let targetCoordinate = location.coordinate
                    print("緯度経度：\(targetCoordinate)")
                }
            })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "羽田空港")
    }
}
