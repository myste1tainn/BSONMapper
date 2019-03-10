//
// Created by Arnon Keereena on 6/12/2017 AD.
//

import MongoKitten

open class BaseDocumentMappable: DocumentMappable {
  public var document: Document
  
  public func setObjectId(_ id: Primitive?) {
    document["_id"] = id
  }
  
  public func getObjectId<T: Primitive>() -> T {
    return document["_id"] as! T
  }
  
  public required init(map: DocumentMap = DocumentMap(to: .property, document: Document())) {
    document = map.document
  }
  
  open func mapping(map: DocumentMap) {
    fatalError("Subclass must implement mapping(map:)")
  }
  
  open func idMapping(document: inout Document) {
  
  }
}

public protocol DocumentMappable {
  var document: Document { get set }
  init(map: DocumentMap)
  func mapping(map: DocumentMap)
  func idMapping(document: inout Document)
}

extension DocumentMappable {
  
  private func makeMap(direction: DocumentMap.MapTo) -> DocumentMap {
    let map = DocumentMap(to: direction, document: document)
    mapping(map: map)
    idMapping(document: &map.document)
    return map
  }
  
  func makeDocument() -> Document {
    return makeMap(direction: .document).document
  }
  
  func makeDictionary() -> [String: Primitive] {
    return makeMap(direction: .dictionary).dictionary
  }
  
  static func array(map: DocumentMap) -> [Self] {
    guard let document = map.currentValue as? Document else {
      return []
    }
    return document.arrayRepresentation.flatMap {
      guard let doc = $0 as? Document else {
        return nil
      }
      let newMap = DocumentMap(to: .property, document: doc)
      let element = self.init(map: newMap)
      element.mapping(map: newMap)
      return element
    }
  }
}

extension Array where Element: DocumentMappable {
  var documents: [Document] {
    return reduce([Document]()) {
      $0 + [$1.makeDocument()]
    }
  }
  
  var dictionaries: [[String: Primitive]] {
    return reduce([[String: Primitive]]()) {
      $0 + [$1.makeDictionary()]
    }
  }
}