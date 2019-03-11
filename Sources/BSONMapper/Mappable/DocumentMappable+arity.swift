//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

extension Array where Element: DocumentMappable {
  public var documents: [Document] {
    return reduce(into: [Document]()) { $0.append($1.makeDocument()) }
  }
  
  public var dictionaries: [[String: Primitive]] {
    return reduce(into: [[String: Primitive]]()) { $0.append($1.makeDictionary()) }
  }
}

extension DocumentMappable {
  public var document: Document { return makeDocument() }
  public var dictionary: [String: Primitive] { return makeDictionary() }
}
