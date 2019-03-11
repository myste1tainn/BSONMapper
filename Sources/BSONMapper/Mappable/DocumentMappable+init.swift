//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import BSON

extension DocumentMappable {
  public init?(document: Document) {
    let map = Map(to: .property, document: document)
    self.init(map: map)
    self.mapping(map: map)
  }
}
