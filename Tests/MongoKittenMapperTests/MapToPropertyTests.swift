//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import XCTest
import MongoKitten
@testable import MongoKittenMapper

final class MapToPropertySpec: XCTestCase {
  func testMapToPropertyPrimitiveOptionalAndPrimitive() {
    var document = Document()
    document["name"] = "Arnon"
    document["last-name"] = "Keereena"
    let map = Map(to: .property, document: document)
    var model = Person(map: map)
    model?.mapping(map: map)
    
    XCTAssertEqual(model?.name, "Arnon")
    XCTAssertEqual(model?.lastname, "Keereena")
  }
  
  func testMapToPropertyNestedMappable() {
    var document = Document()
    document["name"] = "Arnon"
    document["last-name"] = "Keereena"
    document["contact"] = [
      "telephone": "0833859034",
      "email": "a.keereena@gmail.com",
      "address": [
        "number": 1
      ]
    ]
    let map = Map(to: .property, document: document)
    var model = PersonWithNestedProps(map: map)
    model?.mapping(map: map)
  
    XCTAssertEqual(model?.name, "Arnon")
    XCTAssertEqual(model?.lastname, "Keereena")
    XCTAssertEqual(model?.contact?.telephone, "0833859034")
    XCTAssertEqual(model?.contact?.email, "a.keereena@gmail.com")
    XCTAssertEqual(model?.contact?.address?.number, 1)
  }
  
  static var allTests = [
    ("testMapToPropertyPrimitiveOptionalAndPrimitive", testMapToPropertyPrimitiveOptionalAndPrimitive),
    ("testMapToPropertyNestedMappable", testMapToPropertyNestedMappable)
  ]
}

