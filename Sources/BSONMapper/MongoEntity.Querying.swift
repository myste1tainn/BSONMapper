//
// Created by Arnon Keereena on 9/12/2017 AD.
//

import Foundation
//import MongoKitten
//
//extension MongoEntity where Self: Model {
//  static func all() -> TypedCollectionSlice<Self> {
//    let instance = Self.init()
//    let slice = try! instance.collection.find()
//    return TypedCollectionSlice(slice)
//  }
//
//  func insert() {
//    try! collection.insert(makeDocument())
//  }
//
//  func update(upsert: Bool = false) {
//    let doc = makeDocument()
//    var queryDoc = Document()
//    queryDoc["_id"] = doc["_id"]
//    let query = Query(queryDoc)
//    do {
//      try collection.update(query, to: doc, upserting: upsert)
//    } catch let MongoError.invalidResponse(documents) {
//      print("Got invalid response from trying to upsert documents::: \(documents)")
//    } catch let e {
//      print("An error occurred while trying to update document\nError:::\(e.localizedDescription)\nErrorType:::\(e)\nType\(type(of: e))")
//    }
//  }
//
//  func upsert() {
//    update(upsert: true)
//  }
//
//  private static func queryDescription(_ description: ((inout Document) -> Void)?) -> (collection: MongoCollection, query: Query?) {
//    let instance = Self.init()
//    var query: Query? = nil
//    description.flatMap {
//      var doc = Document()
//      $0(&doc)
//      query = Query(doc)
//    }
//    return (collection: instance.collection, query: query)
//  }
//
//  static func find(_ description: ((inout Document) -> Void)?) throws -> TypedCollectionSlice<Self> {
//    let q = queryDescription(description)
//    let slice = try q.collection.find(q.query)
//    return TypedCollectionSlice(slice)
//  }
//
//  static func first(_ description: ((inout Document) -> Void)?) throws -> Self? {
//    let q = queryDescription(description)
//    guard let doc = try q.collection.findOne(q.query) else {
//      return nil
//    }
//    let instance = Self.init()
//    instance.mapping(map: DocumentMap(to: .property, document: doc))
//    instance.isNew = false
//    return instance
//  }
//
//  static func existing(_ description: ((inout Document) -> Void)?) throws -> Self? {
//    let q = queryDescription(description)
//    return try q.collection.findOne(q.query).flatMap {
//      let instance = Self.init()
//      instance.mapping(map: DocumentMap(to: .property, document: $0))
//      instance.updatedDate = Date()
//      instance.isNew = false
//      return instance
//    }
//  }
//
//  static func existingOrNew(_ description: ((inout Document) -> Void)?) throws -> Self {
//    return try existing(description) ?? {
//      let instance = Self.init()
//      instance.mapping(map: DocumentMap(to: .property, document: Document()))
//      instance.createdDate = Date()
//      instance.isNew = true
//      return instance
//    }()
//  }
//
//  public func update(_ filter: Query = [:], to updated: Document, upserting upsert: Bool = false, multiple multi: Bool = false, writeConcern: WriteConcern? = nil, stoppingOnError ordered: Bool? = nil) throws -> Int {
//    return try collection.update(filter,
//                                 to: updated,
//                                 upserting: upsert,
//                                 multiple: multi,
//                                 writeConcern: writeConcern,
//                                 stoppingOnError: ordered)
//  }
//
//  public static var lastUpdated: Self? {
//    var doc = Document()
//    doc["updated_date"] = -1
//    doc["created_date"] = -1
//    let sort = Sort(doc)
//    do {
//      let instance = self.init()
//      return try instance.collection.findOne(nil, sortedBy: sort).flatMap { doc in
//        instance.mapping(map: DocumentMap(to: .property, document: doc))
//        instance.isNew = false
//        return instance
//      }
//    } catch let error {
//      catchError(error)
//      return nil
//    }
//  }
//}
