import UIKit

var greeting = "Hello, playground"

var userInput : String?
var usersOtherInput : String?

print(userInput)

userInput = "finally said hi"
usersOtherInput = "whaaaat"

//force unwrapped
/*
var myUnwrappedString = userInput!!
print(myUnwrappedString, terminator: " ")
print(myUnwrappedString, terminator: " ")
print("\n")
 */

//the non-swift way
if userInput != nil
{
    print(userInput)
}

//if let "swift" way
if let myUnwrappedInput = userInput, let myOtherUnwrappedInput = usersOtherInput
{
    //go in here
    print(myUnwrappedInput)
    print(myOtherUnwrappedInput)
}
else
{
    print("baaad things happened")
}

//this is out of scope (won't compile)
//print(myUnwrappedInput)


//guard (even more of a "swift" way
func thisIsAFunctionBecauseIHaveTo()
{
    guard let theUsersInput = userInput else
    {
        print("userInput was nil here")
        return //stop the car daddy im sick
    }
    
    guard let theUsersOtherInput = usersOtherInput else
    {
        print("usersOtherInput was nil here")
        return //stop the car daddy im sick
    }
    
    //now we can safely use those variables
    print(theUsersInput, theUsersOtherInput, separator: " --- ")
}

//guards need to do a return, so i had to put it in a function
//99.999999% of your code will always be in a function IRL
thisIsAFunctionBecauseIHaveTo()
