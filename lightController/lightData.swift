//
//  LogData.swift
//  lineChart
//
//  Created by 羅珮珊 on 2021/8/24.
//

import Foundation

struct ActivityLog {
    var distance: Double // Miles (we wont be implementing unit conversion for this tutorial)
    var duration: Double // Seconds
    var elevation: Double // Feet
    var date: Date
}

class ActivityTestData {
    static let testData: [[ActivityLog]] = [
        [ActivityLog(distance: 9.77, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1609282718)),
        ActivityLog(distance: 10.01, duration: 2800, elevation: 156, date: Date(timeIntervalSince1970: 1607813915)),
        ActivityLog(distance: 9.12, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1607381915)),
        ActivityLog(distance: 10.22, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1606604315)),
        ActivityLog(distance: 8.12, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1606604315)),
        ActivityLog(distance: 3.01, duration: 3200, elevation: 156, date: Date(timeIntervalSince1970: 1605653915)),
        ActivityLog(distance: 4.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1605653915)),
        ActivityLog(distance: 12.76, duration: 3200, elevation: 156, date: Date(timeIntervalSince1970: 1604876315)),
        ActivityLog(distance: 10.12, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1604876315)),
        ActivityLog(distance: 9.01, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1604185115)),
        ActivityLog(distance: 10.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
        ActivityLog(distance: 8.76, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
        ActivityLog(distance: 3.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
        ActivityLog(distance: 3.76, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),],
        
        [ActivityLog(distance: 4.77, duration: 5000, elevation: 356, date: Date(timeIntervalSince1970: 1609282718)),
        ActivityLog(distance: 5.01, duration: 1400, elevation: 156, date: Date(timeIntervalSince1970: 1607813915)),
        ActivityLog(distance: 4.12, duration: 2400, elevation: 156, date: Date(timeIntervalSince1970: 1607381915)),
        ActivityLog(distance: 5.22, duration: 2400, elevation: 156, date: Date(timeIntervalSince1970: 1606604315)),
        ActivityLog(distance: 3.12, duration: 2400, elevation: 156, date: Date(timeIntervalSince1970: 1606604315)),
        ActivityLog(distance: 2.01, duration: 2200, elevation: 156, date: Date(timeIntervalSince1970: 1605653915)),
        ActivityLog(distance: 1.20, duration: 2400, elevation: 156, date: Date(timeIntervalSince1970: 1605653915)),
        ActivityLog(distance: 6.76, duration: 2200, elevation: 156, date: Date(timeIntervalSince1970: 1604876315)),
        ActivityLog(distance: 5.12, duration: 1100, elevation: 156, date: Date(timeIntervalSince1970: 1604876315)),
        ActivityLog(distance: 4.01, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1604185115)),
        ActivityLog(distance: 5.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
        ActivityLog(distance: 4.76, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
        ActivityLog(distance: 1.20, duration: 3400, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),
        ActivityLog(distance: 2.76, duration: 2100, elevation: 156, date: Date(timeIntervalSince1970: 1603234715)),]
        
    ]
}
