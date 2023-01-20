import Array "mo:base/Array";
import Error "mo:base/Error";
import Int "mo:base/Int";
import Result "mo:base/Result";
import Buffer "mo:base/Buffer";

module {
    // 1.
    public func second_maximum(array : [Int]) : Int {
        let size = array.size();
        switch(size) {
            case (0 or 1) return 0;
            case _ return Array.sort(array, Int.compare)[size - 2];
        };
    };

    // 2.
    public func remove_even(array : [Nat]) : [Nat] {
        return Array.filter<Nat>(array, func x = x % 2 == 1);
    };

    // 3.
    public func drop<T>(xs : [T], n : Nat) : [T] {
        let size = xs.size();
        let buffer = Buffer.fromArray<T>(xs);
        let subBuffer = Buffer.subBuffer<T>(buffer, n, size - n);
        buffer.clear();
        return Buffer.toArray<T>(subBuffer);
    };
}