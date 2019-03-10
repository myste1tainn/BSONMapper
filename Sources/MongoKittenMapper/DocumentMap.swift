//
// Created by Arnon Keereena on 7/12/2017 AD.
//

import MongoKitten

public class DocumentMap {
  public var document: Document
  public var dictionary: [String: Primitive]
  public var currentKey: String?
  public var currentValue: Primitive?
  public var direction = MapTo.document
  
  public static var empty: DocumentMap {
    return DocumentMap(to: .property, document: Document())
  }
  
  public init(to: MapTo, document: Document) {
    self.direction = to
    self.document = document
    self.dictionary = [:]
    self.currentValue = document
  }
  
  public enum MapTo {
    case document
    case dictionary
    case property
  }
  
  public subscript(key: String) -> DocumentMap {
    currentKey = key
    currentValue = document[key]
    return self
  }
}