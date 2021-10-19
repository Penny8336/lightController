//
//  testData.swift
//  lightController
//
//  Created by 羅珮珊 on 2021/9/3.
//

import Foundation

struct dateInfo {
    var date: Date
    var totalTime: Int
    var floors: [floor]
}

struct floor {
    var name: String
    var totalTime: Int
    var lights: [light]
}


struct light {
    var ID: String
    var usingTime: Double // Miles (we wont be implementing unit conversion for this tutorial)
}

struct lightPower {
    var ID: String
    var power: Bool // 0: off, 1: on
}

class usingTimeTestData {
    
    static let testData: [dateInfo] = [
        dateInfo(date: Date(timeIntervalSince1970: 1603234715), totalTime: 105,
                 floors: [floor(name: "B1",totalTime: 50, lights: [light(ID: "01", usingTime: 10),
                                                                   light(ID: "02", usingTime: 30)]),
                          floor(name: "1F",totalTime: 30, lights:[light(ID: "01", usingTime: 20),
                                                                  light(ID: "02", usingTime: 25)]),
                          floor(name: "2F",totalTime: 25, lights: [light(ID: "01", usingTime: 20)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1604876315), totalTime: 135,
                 floors: [floor(name: "B1",totalTime: 70, lights: [light(ID: "01", usingTime: 10),
                                                                   light(ID: "02", usingTime: 10)]),
                          floor(name: "1F",totalTime: 35, lights:[light(ID: "01", usingTime: 20),
                                                                  light(ID: "02", usingTime: 30)]),
                          floor(name: "2F",totalTime: 30, lights: [light(ID: "01", usingTime: 40),
                                                                   light(ID: "02", usingTime: 25)])
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1607381915), totalTime: 175,
                 floors: [floor(name: "B1",totalTime: 90, lights: [light(ID: "01", usingTime: 50),
                                                                   light(ID: "02", usingTime: 50)]),
                          floor(name: "1F",totalTime: 60, lights:[light(ID: "01", usingTime: 30),
                                                                  light(ID: "02", usingTime: 30)]),
                          floor(name: "2F",totalTime: 25, lights: [light(ID: "01", usingTime: 30),
                                                                   light(ID: "02", usingTime: 25)])
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1607813915), totalTime: 155,
                 floors: [floor(name: "B1",totalTime: 85, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 20)]),
                          floor(name: "1F",totalTime: 50, lights:[light(ID: "01", usingTime: 40),
                                                                  light(ID: "02", usingTime: 25)]),
                          floor(name: "2F",totalTime: 20, lights: [light(ID: "01", usingTime: 40),
                                                                   light(ID: "02", usingTime: 10)])
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1609282718), totalTime: 110,
                 floors: [floor(name: "B1",totalTime: 55, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 15)]),
                          floor(name: "1F",totalTime: 45, lights:[light(ID: "01", usingTime: 25),
                                                                  light(ID: "02", usingTime: 20)]),
                          floor(name: "2F",totalTime: 10, lights: [light(ID: "01", usingTime: 30)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1609282718), totalTime: 110,
                 floors: [floor(name: "B1",totalTime: 30, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 15)]),
                          floor(name: "1F",totalTime: 55, lights:[light(ID: "01", usingTime: 25),
                                                                  light(ID: "02", usingTime: 20)]),
                          floor(name: "2F",totalTime: 15, lights: [light(ID: "01", usingTime: 30)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1609282718), totalTime: 110,
                 floors: [floor(name: "B1",totalTime: 30, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 15)]),
                          floor(name: "1F",totalTime: 60, lights:[light(ID: "01", usingTime: 25),
                                                                  light(ID: "02", usingTime: 20)]),
                          floor(name: "2F",totalTime: 10, lights: [light(ID: "01", usingTime: 30)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1603234715), totalTime: 105,
                 floors: [floor(name: "B1",totalTime: 50, lights: [light(ID: "01", usingTime: 10),
                                                                   light(ID: "02", usingTime: 30)]),
                          floor(name: "1F",totalTime: 30, lights:[light(ID: "01", usingTime: 20),
                                                                  light(ID: "02", usingTime: 25)]),
                          floor(name: "2F",totalTime: 25, lights: [light(ID: "01", usingTime: 20)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1604876315), totalTime: 135,
                 floors: [floor(name: "B1",totalTime: 70, lights: [light(ID: "01", usingTime: 10),
                                                                   light(ID: "02", usingTime: 10)]),
                          floor(name: "1F",totalTime: 35, lights:[light(ID: "01", usingTime: 20),
                                                                  light(ID: "02", usingTime: 30)]),
                          floor(name: "2F",totalTime: 30, lights: [light(ID: "01", usingTime: 40),
                                                                   light(ID: "02", usingTime: 25)])
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1607381915), totalTime: 175,
                 floors: [floor(name: "B1",totalTime: 90, lights: [light(ID: "01", usingTime: 50),
                                                                   light(ID: "02", usingTime: 50)]),
                          floor(name: "1F",totalTime: 60, lights:[light(ID: "01", usingTime: 30),
                                                                  light(ID: "02", usingTime: 30)]),
                          floor(name: "2F",totalTime: 25, lights: [light(ID: "01", usingTime: 30),
                                                                   light(ID: "02", usingTime: 25)])
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1607813915), totalTime: 155,
                 floors: [floor(name: "B1",totalTime: 85, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 20)]),
                          floor(name: "1F",totalTime: 50, lights:[light(ID: "01", usingTime: 40),
                                                                  light(ID: "02", usingTime: 25)]),
                          floor(name: "2F",totalTime: 20, lights: [light(ID: "01", usingTime: 40),
                                                                   light(ID: "02", usingTime: 10)])
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1609282718), totalTime: 110,
                 floors: [floor(name: "B1",totalTime: 55, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 15)]),
                          floor(name: "1F",totalTime: 45, lights:[light(ID: "01", usingTime: 25),
                                                                  light(ID: "02", usingTime: 20)]),
                          floor(name: "2F",totalTime: 10, lights: [light(ID: "01", usingTime: 30)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1609282718), totalTime: 110,
                 floors: [floor(name: "B1",totalTime: 30, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 15)]),
                          floor(name: "1F",totalTime: 55, lights:[light(ID: "01", usingTime: 25),
                                                                  light(ID: "02", usingTime: 20)]),
                          floor(name: "2F",totalTime: 15, lights: [light(ID: "01", usingTime: 30)])
                                                                      
        ]),
        dateInfo(date: Date(timeIntervalSince1970: 1609282718), totalTime: 110,
                 floors: [floor(name: "B1",totalTime: 30, lights: [light(ID: "01", usingTime: 20),
                                                                   light(ID: "02", usingTime: 15)]),
                          floor(name: "1F",totalTime: 60, lights:[light(ID: "01", usingTime: 25),
                                                                  light(ID: "02", usingTime: 20)]),
                          floor(name: "2F",totalTime: 10, lights: [light(ID: "01", usingTime: 30)])
                                                                      
        ]),
//        floor(name: "B1", eachLights: [light(ID: "01", usingTime: 20, date: Date(timeIntervalSince1970: 1609282718)),
//                                       light(ID: "02", usingTime: 30, date: Date(timeIntervalSince1970: 1609282718))]),
//
//        floor(name: "1F", eachLights: [light(ID: "01", usingTime: 30, date: Date(timeIntervalSince1970: 1609282718)),
//                                       light(ID: "02", usingTime: 20, date: Date(timeIntervalSince1970: 1609282718))]),
//
//        floor(name: "2F", eachLights: [light(ID: "01", usingTime: 40, date: Date(timeIntervalSince1970: 1609282718)),
//                                       light(ID: "02", usingTime: 35, date: Date(timeIntervalSince1970: 1609282718))])

    ]
}


class power {
    
    static var testData: [lightPower] = [
        lightPower(ID: "purple", power: false),
        lightPower(ID: "orange", power: true),
        lightPower(ID: "03", power: false)
    ]
}
