//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

extension Array where Element: DocumentMappable {
  var documents: [Document] {
    return reduce(into: [Document]()) { $0.append($1.makeDocument()) }
  }
  
  var dictionaries: [[String: Primitive]] {
    return reduce(into: [[String: Primitive]]()) { $0.append($1.makeDictionary()) }
  }
}

extension DocumentMappable {
  var document: Document { return makeDocument() }
  var dictionary: [String: Primitive] { return makeDictionary() }
}