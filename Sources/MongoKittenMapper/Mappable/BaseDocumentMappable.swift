//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import MongoKitten

open class BaseDocumentMappable: DocumentMappable {
  public var document: Document
  
  public func setObjectId(_ id: Primitive?) {
    document["_id"] = id
  }
  
  public func getObjectId<T: Primitive>() -> T {
    return document["_id"] as! T
  }
  
  public required init(map: Map = Map(to: .property, document: Document())) {
    document = map.document
  }
  
  open func mapping(map: Map) {
    fatalError("Subclass must implement mapping(map:)")
  }
  
  open func idMapping(document: inout Document) {
  
  }
}
