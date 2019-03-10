//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON
import BSONMapper

public struct PersonWithNestedProps: DocumentMappable {
  public var name: String?
  public var lastname: String = ""
  public var contact: Contact?
  
  public init?(map: Map) {
  }
  
  public mutating func mapping(map: Map) {
    name <- map["name"]
    lastname <- map["last-name"]
    contact <- map["contact"]
  }
}

public struct Contact: DocumentMappable {
  public var telephone: String?
  public var email: String?
  public var address: Address?
  
  public init?(map: Map) {}
  
  public mutating func mapping(map: Map) {
    telephone <- map["telephone"]
    email <- map["email"]
    address <- map["address"]
  }
}

public struct Address: DocumentMappable {
  public var number: Int?
  
  public init?(map: Map) {}
  
  public mutating func mapping(map: Map) {
    number <- map["number"]
  }
}
