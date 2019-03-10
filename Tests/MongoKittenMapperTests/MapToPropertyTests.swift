//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import XCTest
import MongoKitten
@testable import MongoKittenMapper

final class MapToPropertySpec: XCTestCase {
  func testMapToProperty() {
    var document = Document()
    document["name"] = "Arnon"
    document["last-name"] = "Keereena"
    let map = Map(to: .property, document: document)
    let model = Person(map: map)
    
    XCTAssertEqual(model?.name, "Arnon")
    XCTAssertEqual(model?.lastname, "Keereena")
  }
  
  static var allTests = [
    ("testMapToProperty", testMapToProperty)
  ]
}

