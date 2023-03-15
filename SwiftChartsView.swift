//
//  SwiftChartsView.swift
//  swift-charts
//
//  Created by Oskar Kwaśniewski on 15/03/2023.
//

import SwiftUI

class DataStore: ObservableObject {
    @Published var data: [ValuePerCategory] = []
    @Published var color: Color = .accentColor
}

class SwiftChartsView: UIView {
    private var dataStore: DataStore = DataStore()
    
    @objc var data: NSArray = [] {
        didSet {
            dataStore.data = processData(data)
        }
    }
    
    @objc var color: String = "" {
        didSet {
            dataStore.color = Color(hex: color) ?? .accentColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let hostingController = UIHostingController(rootView: ChartView().environmentObject(dataStore))
        addSubview(hostingController.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        subviews.first?.frame = self.frame
    }
    
    private func processData(_ data: NSArray) -> [ValuePerCategory] {
        let dictArray = data.compactMap { $0 as? NSDictionary }
        return dictArray.map { data in
            return ValuePerCategory(
                category: data["category"] as? String ?? "",
                value: data["value"] as? Double ?? 0
            )
        }
    }
}
