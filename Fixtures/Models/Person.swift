//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import MongoKitten
import MongoKittenMapper

public struct Person: DocumentMappable {
  public var name: String?
  public var lastname: String?
  
  public init?(map: Map) {
  }
  
  public mutating func mapping(map: Map) {
    name <- map["name"]
    lastname <- map["last-name"]
  }
}

