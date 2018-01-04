//
//  Analytics.swift
//  App
//
//  Created by John Connolly on 2017-12-29.
//

import Foundation

struct Analytics {
    
    let consumers: [Consumer]
    
    private let formatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }()
    
    var successful: Int {
        return consumers
            .map { $0.successful }
            .reduce(0,+)
    }
    
    var failed: Int {
        return consumers
            .map { $0.failed }
            .reduce(0,+)
    }
    
    var queued: Int {
        return consumers
            .map { $0.queued }
            .reduce(0, +)
    }
    
    var formattedSuccessful: String {
        return formatter.string(from: NSNumber(integerLiteral: successful)) ?? ""
    }
    
    var formattedFailed: String {
        return formatter.string(from: NSNumber(integerLiteral: failed)) ?? ""
    }
    
}

struct AnalyticsView: Codable {
    
    let successful: String
    let failed: String
    let queued: String
    let workers: [ConsumerView]
    
    init(_ analytics: Analytics) {
        self.successful = analytics.formattedSuccessful
        self.failed = analytics.formattedFailed
        self.queued = analytics.queued.description
        self.workers = analytics.consumers.map { $0.viewResource }
    }
    
}
