TestingPractice
===============

This is a personal repository that follows the book Everyday Rails Rspec by Aaron Sumner.

There are notes written along the code so that I can better understand testing fundamentals.

RSPEC Resources

shows all the built-in matchers

 - https://github.com/rspec/rspec-expectations
 

 Reading Notes

 Chapter 3 (Key Takeaways)
 	- Use active, explicit expectations: That means use verbs to explain what an example's results should be. Only check for one result per example.
 	- Test for what you expect to happen, and for what you expect to not happen: That about both paths when writing examples, and test accordingly. 
 	- Test for edge cases: If you have a validation that requires a password be between four and ten characters in length, don't just test an eight-character password and call it good. 
 	- Organize your tests for good readability: Use "describe" and "context" to sort similar examples into an outline format, and before and after blocks to remove duplication. Readability > DRYness. 