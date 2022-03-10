import Cat "custom";

actor {
  // Challenge 1 *
  public type Cat = Cat.custom;
  let myCat : Cat = {
    breed = "ragdoll";
    age = 7;
    isMale = true;
  };
  
  public func fun() : Text {
    return myCat.breed;
  };
  
  

};
