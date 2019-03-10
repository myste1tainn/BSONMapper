//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

extension Primitive {
  mutating func map(with map: DocumentMap) {
    self = map.currentValue as! Self
  }
}

extension Array where Element: Primitive {
  mutating func map(with map: DocumentMap) {
    (map.currentValue as? Document)?.arrayRepresentation.forEach {
      if let doc = $0 as? Document {
        var item: Element? = nil
        item?.map(with: DocumentMap(to: .property, document: doc))
        item.flatMap { self.append($0) }
      } else {
        self.append($0 as! Element)
      }
    }
  }
}
