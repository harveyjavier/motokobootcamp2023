import List "mo:base/List";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";

actor {
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    // 1.
    func unique<T>(l : List.List<T>, equal: (T,T) -> Bool) : List.List<T> {
        let buffer : Buffer.Buffer<T> = Buffer.fromArray<T>(List.toArray(l));
        let uniques : Buffer.Buffer<T> = Buffer.Buffer<T>(buffer.size());
        for (b in buffer.vals()) {
            if (Buffer.contains(uniques, b, equal) == false) {
                uniques.add(b);
            };
        };
        return List.fromArray(Buffer.toArray<T>(buffer));   
    };

    // 2.
    func reverse<T>(l : List.List<T>) : List.List<T> {
        return List.reverse<T>(l);
    };

    // 3.
    public query ({ caller }) func is_anynomous() : async Bool {
        return Principal.isAnonymous(caller);
    };

    // 4.
    func find_in_buffer<T>(buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat {
        var index : Nat = 0;
        for (b in buf.vals()) {
            if (equal(b, val)) {
                return ?index;
            };
            index += 1;
        };
        return null;
    };

    // 5.
    public query func get_usernames() : async [(Principal, Text)] {
        return Iter.toArray(usernames.entries());
    };
}