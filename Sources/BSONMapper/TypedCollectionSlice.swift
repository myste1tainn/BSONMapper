//
// Created by Arnon Keereena on 9/12/2017 AD.
//

//import MongoKitten
//
//public class TypedCollectionSlice<MappedType> where MappedType: Model {
//  public var rawCollection: CollectionSlice<Document>!
//
//  public class var empty: TypedCollectionSlice<MappedType> {
//    return TypedCollectionSlice()
//  }
//
//  private init() {}
//
//  public init(_ rawCollection: CollectionSlice<Document>) {
//    self.rawCollection = rawCollection
//  }
//
//  public var first: MappedType? {
//    guard let rawCollection = rawCollection else { return nil }
//    return rawCollection.first.flatMap(mappedType)
//  }
//
//  public func forEach(_ each: (MappedType) -> Void) -> Void {
//    guard let rawCollection = rawCollection else { return }
//    try? rawCollection.forEach { each(self.mappedType($0)) }
//  }
//
//  public func map<T>(_ transform: (MappedType) -> T) -> [T] {
//    guard let rawCollection = rawCollection else { return [] }
//    return rawCollection.map { return transform(self.mappedType($0)) }
//  }
//
//  public func flatMap<T>(_ transform: (MappedType) -> T) -> [T] {
//    guard let rawCollection = rawCollection else { return [] }
//    return rawCollection.flatMap { return transform(self.mappedType($0)) }
//  }
//
//  public func reduce<T>(into: inout T, nextPartialResult: (inout T, MappedType) -> ()) -> T {
//    guard let rawCollection = rawCollection else { return into }
//    return rawCollection.reduce(into: into) { nextPartialResult(&$0, self.mappedType($1)) }
//  }
//
//  public func reduce<T>(_ initial: T, nextPartialResult: (T, MappedType) -> T) -> T {
//    guard let rawCollection = rawCollection else { return initial }
//    return rawCollection.reduce(initial) { nextPartialResult($0, self.mappedType($1)) }
//  }
//
//  public var count: Int {
//    return (try? rawCollection.count()) ?? 0
//  }
//
//  private func mappedType(_ document: Document) -> MappedType {
//    let map = DocumentMap(to: .property, document: document)
//    let mappedType = MappedType.init(map: map)
//    mappedType.mapping(map: map)
//    mappedType.isNew = false
//    return mappedType
//  }
//}
