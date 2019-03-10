//
// Created by Arnon Keereena on 7/12/2017 AD.
//

import MongoKitten

extension DocumentMap {
  public static func <-<T>(left: inout T?, right: DocumentMap) where T: Primitive {
    left?.map(with: right)
  }
  
  public static func <-<T>(left: inout T, right: DocumentMap) where T: Primitive {
    switch right.direction {
    case .document: left >>> right
    case .dictionary: left ->> right
    case .property: right.currentValue.flatMap { left = $0 as! T }
    }
  }
  
  public static func <-<T>(left: inout [T], right: DocumentMap) where T: Primitive {
    switch right.direction {
    case .document: left >>> right
    case .dictionary: left ->> right
    case .property:
      (right.currentValue as? Document)?.arrayRepresentation.forEach {
        if let doc = $0 as? Document {
          var item: T? = nil
          item <- DocumentMap(to: .property, document: doc)
          item.flatMap { left.append($0) }
        } else {
          left.append($0 as! T)
        }
      }
    }
  }
  
  public static func >>><T>(left: T?, right: DocumentMap) where T: Primitive {
    right.currentValue = left
    guard let key = right.currentKey,
          let value = right.currentValue else {
      return
    }
    right.document[key] = value
  }
  
  public static func ->><T>(left: T?, right: DocumentMap) where T: Primitive {
    right.currentValue = left
    guard let key = right.currentKey,
          let value = right.currentValue else {
      return
    }
    right.dictionary[key] = value
  }
  
  public static func <-<T>(left: inout [T], right: DocumentMap) where T: DocumentMappable {
    switch right.direction {
    case .document: left >>> right
    case .dictionary: left ->> right
    case .property: left = T.array(map: right)
    }
  }
  
  public static func >>><T>(left: [T], right: DocumentMap) where T: DocumentMappable {
    right.currentValue = left.documents
    guard let key = right.currentKey,
          let value = right.currentValue else {
      return
    }
    right.document[key] = value
  }
  
  public static func ->><T>(left: [T], right: DocumentMap) where T: DocumentMappable {
    right.currentValue = left.dictionaries
    guard let key = right.currentKey,
          let value = right.currentValue else {
      return
    }
    right.dictionary[key] = value
  }
}
