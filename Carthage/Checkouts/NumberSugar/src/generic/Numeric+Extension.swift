import Foundation

extension Sequence {
    /*
     * key path-based API for summing numbers (INt, CGFLoat, Double etc)
     */
    func sum<T: Numeric>(for keyPath: KeyPath<Element, T>) -> T {
        return reduce(0) { sum, element in
            sum + element[keyPath: keyPath]
        }
    }
}
