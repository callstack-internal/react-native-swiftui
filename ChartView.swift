//
//  ChartView.swift
//  swift-charts
//
//  Created by Oskar Kwaśniewski on 14/03/2023.
//

import SwiftUI
import Charts

struct ValuePerCategory {
    var category: String
    var value: Double
}

struct ChartView: View {
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
        VStack {
            Chart(dataStore.data, id: \.category) { item in
                BarMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(dataStore.color.gradient)
            }
        }
    }
}
