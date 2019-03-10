//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

extension DocumentMappable {
  private func makeMap(direction: Map.MapTo) -> Map {
    let document = Document()
    let map = Map(to: direction, document: document)
    var this = self
    this.mapping(map: map)
    return map
  }
  
  func makeDocument() -> Document {
    return makeMap(direction: .document).document
  }
  
  func makeDictionary() -> [String: Primitive] {
    return makeMap(direction: .dictionary).dictionary
  }
  
  static func array(map: Map) -> [Self] {
    guard let document = map.currentValue as? Document else {
      return []
    }
    return document.arrayRepresentation.compactMap {
      guard let doc = $0 as? Document else {
        return nil
      }
      let newMap = Map(to: .property, document: doc)
      var element = self.init(map: newMap)
      element?.mapping(map: newMap)
      return element
    }
  }
}
