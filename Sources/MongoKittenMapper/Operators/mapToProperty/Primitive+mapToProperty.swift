//
// Created by Arnon Keereena on 2019-03-10.
//

import Foundation
import BSON

extension Primitive {
  mutating func map(with map: Map) {
    self = map.currentValue as! Self
  }
}

extension Array where Element: Primitive {
  mutating func map(with map: Map) {
    (map.currentValue as? Document)?.arrayRepresentation.forEach {
      if let doc = $0 as? Document {
        var item: Element? = nil
        item?.map(with: Map(to: .property, document: doc))
        item.flatMap { self.append($0) }
      } else {
        self.append($0 as! Element)
      }
    }
  }
}
