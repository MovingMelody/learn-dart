// ignore_for_file: dangling_library_doc_comments, always_put_required_named_parameters_first
/*
* Created on 30 September 2023
* @author Sai Sumanth
*/

/*
       📦 Functions & Parameters in Dart 📦
returntype functionName(parameter1,parameter2, ...){
  // function body
}
  
[returntype]: Function output type. It can be void, [String], [int], [double], etc. 
If the function doesn’t return anything, you can use [void] as the return type.

  - Main objective of functions in any language is DRY(Don't Repeat Yourself)
  - [Abstraction]: Functions allow us to hide the implementation details of a piece of code.
  - Functions make our code more readable, reusable and maintainable.
*/

///
/// 1️⃣. Function with No Parameters and No Return Type
///
void sayHelloWorld() {
  /// function body
  print('Hello, world!');
}

///
/// 2️⃣. With Parameters and No Return Type
///
/// Here num1 and num2 are positional parameters
void add(int num1, int num2) {
  int sum;
  sum = num1 + num2;

  print("Sum: $sum");
}

///
/// 3️⃣. No Parameters and With Return Type
///
/// Special type of function called [Arrow Function]. If there's only one expression this function can be used
/// No need to mention [return] keyword instead we can use shorthand syntax =>
DateTime getCurrentTime() => DateTime.now();

///
/// 4️⃣. With Parameters and with Return Type
///
/// Here [principal], [rate], [time] are Named Parameters
double calculateInterest(
    {required double principal, required double rate, required double time}) {
  final interest = principal * rate * time / 100;
  return interest;
}

///
/// 📤 Different Types of Parameters 📥
///
/// 💡 A function can have any number of Required Positional Parameters.
/// These can be followed either by Named Parameters or by Optional Positional Parameters (but not both)
///
///
/// 1. Required Positional Parameters
/// 2. Named Parameters
/// 3. Optional Positional Parameters
///

///
/// 1️⃣. Required Positional Parameters
///
/// Both params need to be specified while calling this function
///
int sum(int a, int b) => a + b;
// even if parameter is nullable, either value or null should be passed explicitly while calling
double getFdRate(int? period, int amount) => amount * 7.5 * (period ?? 1) / 100;

///
/// 2️⃣. Named Parameters
/// Mandatory to provide all params with name (unless a default value is given)
///
void allNamedArgs(
    {required String name, required String gender, required int age}) {
  print('$name can vote at $age. $name is $gender');
}

/// 💡 Default values can be provided to Named Parameters (And those default values should be constant)
/// It's not mandatory to pass [age] here, If any value specified explicitly while calling, then it overwrites the default value
void canIVote({required String name, int age = 18}) {
  print('Yes $name you can vote at $age.');
}

/// 💡 combination of both Required Positional Params & Named Params
/// order is important here - below syntax is not VALID
/// ❌ namedWithRequiredPos({int age = 18, required String cntry}, String name){}
void namedWithRequiredPos(String name, {int age = 18, required String cntry}) {
  print('Yes $name you can vote at $age.');
  print('Country Name : $cntry');
}

///
/// 3️⃣. Optional Positional Parameters
///
/// Wrapping a set of function parameters in [] marks them as optional positional parameters.
/// If you don’t provide a default value, their types must be nullable as their default value will be null
///
/// All Parameters are optional and order matters here
void allOptionalPositional([String? to, String from = 'Earth']) {
  print('Hello $to from Optional Positional Parameters on $from');
}

// Combination of Required Positional Parameters and Optional Positional Parameters
void optionalPosWithRequiredPos(String from, String msg,
    [String? device, String time = 'now']) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  print(result);
}

///
/// 🏁 main function with return type [void]
///
void main() {
  /// REQUIRED POSITIONAL ARGUMENTS
  print(sum(12, 34));
  print(getFdRate(null, 50000));

  /// NAMED ARGUMENTS
  // since arguments are named, order of passing args doesn't matter
  allNamedArgs(gender: 'Male', age: 12, name: 'Sai');
  // named args with default value
  canIVote(name: 'Raju');
  // combination of both Required Positional Args and Named Args
  namedWithRequiredPos('John', cntry: 'India 🇮🇳');

  /// OPTIONAL POSITIONAL PARAMETERS
  allOptionalPositional('Mars🪐');
  optionalPosWithRequiredPos('Earth', 'Hello Aliens', '');
  print('******** Passing Function to another function');

  ///
  /// Functions
  ///
  print('************* Functions **********');
  sayHelloWorld();

  // Here 10 and 20 are arguments
  add(10, 20);

  print(getCurrentTime());

  final interest = calculateInterest(principal: 50000, rate: 6.5, time: 1);
  print('interest : $interest');

  main2();
}

///
/// Define a function that takes another function as an argument
///
void performOperation(int x, int y, int Function(int, int) operation) {
  final result = operation(x, y);
  print('Result: $result');
}

// Define a function that will be passed as an argument
int addTwoNumbers(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

void main2() {
  print('****** Function that takes another function as an Argument');
  const x = 10;
  const y = 5;

  // Pass the 'add' function as an argument
  performOperation(x, y, addTwoNumbers); // Output: Result: 15

  // Pass the 'subtract' function as an argument
  performOperation(x, y, subtract); // Output: Result: 5
}
