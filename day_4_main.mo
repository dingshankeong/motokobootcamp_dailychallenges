import Cat "custom"; 
import Animal "animal";  

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
  
  // Challenge 2 
  public type Animal = Animal.animal;
  let animal : Cat = {
    species = "lion";
    energy = 75;
  };
  

};
