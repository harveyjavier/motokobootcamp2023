import Text "mo:base/Text";
import Char "mo:base/Char";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor {
  public query func average_array(array : [Int]) : async Int {
    var sum : Int = 0;
    for (i in array.vals()) {
      sum += i;
    };
    return sum / array.size();
  };

  public query func count_character(t : Text, c : Char) : async Nat {
    var count : Nat = 0;
    for (s in t.chars()) {
      if (s == c) count += 1
    };
    return count;
  };

  public query func factorial(n : Nat) : async Nat {
    var sum : Nat = 0;
    var num : Nat = n;
    while (num > 0) {
      sum += num;
      num -= 1;
    };
    return sum;
  };

  public query func number_of_words(t : Text) : async Nat {
    type Pattern = Text.Pattern;
    let p : Pattern = #char(' ');
    var i = Text.split(t, p);
    var count : Nat = 0;
    for (word in i) {
      count += 1; 
    };
    return count;
  };

  public query func find_duplicates(a : [Nat]) : async [Nat] {
    var b = Buffer.Buffer<Nat>(1);
    for (i in Iter.range(0, a.size() -1)) {
      for (j in Iter.range(i + 1, a.size() - 1)) {
        if (a[i] == a[j] and not Buffer.contains(b, a[i], Nat.equal)) {
          b.add(a[j]);
        };
      };
    };
    return Buffer.toArray(b);
  };

  public query func convert_to_binary(n : Nat) : async Text {
    if (n == 0) return "0";
    var bin : Text = "";
    var dec = n;
    while (dec > 0) {
      var bit = dec % 2;
      bin := Nat.toText(bit) # bin;
      dec /= 2;
    };
    return bin;
  };
};