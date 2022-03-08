import Nat8 "mo:base/Nat8";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Text "mo:base/Text";
import List "mo:base/List";
import Char "mo:base/Char";
import Int "mo:base/Int";
import Error "mo:base/Error";

actor {
  // Challenge 1 
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if (n < 256 and n >= 0) {
      return Nat8.fromNat(n);
    }
    else {
      throw Error.reject("Nat: Out of Valid Range");
      };
  };

  // Challenge 2 
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return 2**n - 1;
  };

  // Challenge 3 *
  public func decimal_to_bits(n : Nat) : async Text {
    var temp: Nat = n; 
    var temp_array : [Nat] = [];
    var string: Text = ""; 
    while ( temp > 1 ) {
      temp_array := Array.append<Nat>(temp_array, [temp % 2]);
      temp /= 2;
    };
    temp_array := Array.append<Nat>(temp_array, [temp]);
    for (values in Iter.revRange(1,temp_array.size())) {
      string #= Nat.toText(temp_array[values-1]);
    };
    return string;
  };

  // Challenge 4 
  public func capitalize_character(c : Char) : async Char {
    return Char.fromNat32(Char.toNat32(c) - 32);
  };

  // Challenge 5 
  public func capitalize_text(t : Text) : async Text {
    var cap_text: Text = "";
    for (char in t.chars()) {
      cap_text #= Char.toText(Char.fromNat32(Char.toNat32(char) - 32));
    };
    return cap_text;
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

  // Challenge 8
  public func duplicated_character(t : Text) : async Text {
    var text_array: [Text] = "";
    var duplicate_true: Bool = false;
    var temp: Text = "";
    for (chars in t.chars()) {
      text_array := Array.append<Text>(text_array,[Char.toText(chars)]);      
    };
    
    for (i in Iter.range(1, text_array.size())) {
      for (j in Iter.range(i+1, text_array.size())) {
        if (text_array[j-1] == text_array[i-1]) {
          duplicate_true := true;
          temp #= text_array[j-1];
        };
      };
    };
    if (duplicate_true) {
      return temp;
    };
    return t;
  };

  // Challenge 9 *
  public func size_in_bytes(t : Text) : async Nat {
    return (Text.encodeUtf8(t)).size();
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