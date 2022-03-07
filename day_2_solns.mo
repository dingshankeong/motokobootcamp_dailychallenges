import Nat8 "mo:base/Nat8";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Text "mo:base/Text";
import List "mo:base/List";
import Char "mo:base/Char";

actor {
  // Challenge 1 
  public func nat_to_nat8(n : Nat) : async Nat8 {
    return Nat8.fromNat(n);
  };

  // Challenge 2 
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return 2**n;
  };

  // Challenge 3 *
  public func decimal_to_bits(n : Nat) : async Text {
    var temp: Nat = n; 
    var string: Text = ""; 
    while ( temp > 1 ) {
      string #= Nat.toText(temp % 2);
      temp /= 2;
    };
    string #= Nat.toText(temp);
    return string;
  };

  // Challenge 4 
  public func capitalize_character(c : Char) : async Char {
    return Char.fromNat32(Char.toNat32(c) - 32);
  };

  // Challenge 5 *
  public func capitalize_text(t : Text) : async Text {
    //let char: Char = t.chars();
    return t;
  };
  
  // Challenge 6 
  public func is_inside(t : Text, c : Char) : async Bool {
    var inside_true: Bool = false;
    for (chars in t.chars()) {
      if (chars == c) {
        inside_true := true;
      };
    };
    return inside_true;
  };

  // Challenge 7 
  public func trim_whitespace(t : Text) : async Text {
    var clean_text: Text = "";
    for (char in t.chars()) {
      if (char != ' ') {
        clean_text #= Char.toText(char);
      };
    };
    return clean_text;
  };

  // Challenge 8 *
    public func duplicate_character(t : Text) : async Text {
      var is_true: Bool = false;
      return t;
     
    };

  // Challenge 9 *
  public func size_in_bytes(t : Text) : async Blob {
    return Text.encodeUtf8(t);
  };

  // Challenge 10 
  public func bubble_sort(array: [Nat]) : async [Nat] {
    let array_sorted: [var Nat] = Array.thaw(array);
    var temp: Nat = 0;

    for (i in Iter.range(1, array.size())) {
      for (j in Iter.range(1, array.size() - i)) {
        if (array_sorted[j-1] > array_sorted[j]) {
          temp := array_sorted[j-1];
          array_sorted[j-1] := array_sorted[j];
          array_sorted[j] := temp;
        };
      };      
    };
    return Array.freeze(array_sorted);   
  };
};
