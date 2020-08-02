//https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed


void main() {
  var varName = 'Var Name';
  dynamic dynamicName = 'Dynamic Name';
  String stringName = 'String Name';
  print(varName);
  print(dynamicName);
  print(stringName);

  // Uninitialized variables have an inital value of null.
  int count;
  assert(count== null);

  /*
  If you never intend to change a variable, use final or const, either instead of var or in addition to a type. 
  A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.)
   A final top-level or class variable is initialized the first time it’s used.

   Note: Instance variables can be final but not const.
  */
  final finalName = 'Final Name'; // Without a type annotation
  final String finalStringName = 'Final String Name';
  print(finalName);
  print(finalStringName);

  /*
  Use const for variables that you want to be compile-time constants. If the const variable is at the class level, 
  mark it static const. Where you declare the variable, set the value to a compile-time 
  constant such as a number or string literal, a const variable, or the result of an arithmetic operation on constant numbers:
  */

  const bar = 1000000;
  const double atm = 1.01325 * bar;
  print(atm);

  /*
  The const keyword isn’t just for declaring constant variables. You can also use it to create constant values,
   as well as to declare constructors that create constant values. Any variable can have a constant value.
  */

  var foo1 = const [];
  final bar1 = const [];
  const baz = []; //  // Equivalent to `const []`

  // You can change the value of a non-final, non-const variable, even if it used to have a const value:
  foo1 = [1, 2, 3]; // // Was const []
  print(foo1);

  // You can’t change the value of a const variable:
  // baz = [42]; // Error: Constant variables can't be assigned a value.

  // TODO: https://dart.dev/guides/language/language-tour#variables
  
  // Valid compile-time constants as of Dart 2.5.
  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: "int"}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
}
