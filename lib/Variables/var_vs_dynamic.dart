// ignore_for_file: prefer_typing_uninitialized_variables, inference_failure_on_uninitialized_variable, prefer_const_declarations

/*
* Created on 13 August 2023
* 
* @author Sai Sumanth
*/

///
/// Var 🆚 Dynamic in Dart
///
void main(List<String> args) {
  ///
  /// No need to specify the type explicitly for variables declared using var or dynamic keywords
  ///
  /// The var keyword is used for type inference. When you declare a variable using var,
  /// the Dart compiler infers the type of that variable based on the assigned value.
  /// Once the type is inferred, the variable's type becomes fixed and cannot be changed.
  ///
  /// 💡 final keyword can't be used with var 🙅
  ///
  /// 💡 late keyword CAN be used with var 👍
  ///
  var score = 99; // type of score is infered as int. since we are assinging the value during declaration

  score = 98;
  score = 67;
  score = 100;

  // A value of type 'String' can't be assigned to a variable of type 'int'.
  // score = 'hundred'; not allowed. Error
  print('var variable score value : $score'); // 100

  /// declaring a variable of type var (observe carefully no value assigned here)
  var unAssignedVar;
  print(
      'unAssignedVar runtimeType : ${unAssignedVar.runtimeType}'); // Null (with capital N - Null)
  print('unAssignedVar value : $unAssignedVar'); // null (with small n - null)

  unAssignedVar = 34; // initializing to int

  /// reassigning bool value (🚨 reassining of different type is possible here 🥲 because value isn't assigned to unAssignedVar at the time of declaration)
  unAssignedVar = bool;
  unAssignedVar = 'can be string also'; // reassinging string value

  ///
  /// 💡 late and var combination
  ///
  late var lateAndVarUnassigned;
  // 🚨 Error The late local variable 'lateAndVarUnassigned' is definitely unassigned at this point.
  // print(lateAndVarUnassigned);
  lateAndVarUnassigned = 'late & final assigned now';
  print(lateAndVarUnassigned); // 'late & final assigned now'

  ///
  /// 🤸‍♂️ DYNAMIC 🤸‍♂️ -  Type inference concept isn't applicable for variables declared with dynamic  keyword.
  /// Type can be changed at runtime.
  ///
  /// So the usage of dynamic should be minimized unless you're dealing with situations where
  /// dynamic typing is absolutely necessary.
  ///
  /// 💡 final keyword CAN be used with dynamic 👍
  ///
  /// 💡 late keyword CAN be used with dynamic 👍
  ///
  dynamic userInput = 43;
  print(userInput.runtimeType); // int
  userInput = 'forty three 😁'; // Type changed to String
  print(userInput.runtimeType); // String
  print('User entered : $userInput'); // forty three 😁

  userInput = null;
  print(userInput.runtimeType); // Null
  print('User entered : $userInput'); // null

  /// ␀
  dynamic someXname;
  print('someXname value : $someXname'); // null

  ///
  /// 💡dynamic & final combination
  ///
  final dynamic finalUserInput = 'final & dynamic';
  // finalUserInput = 'need to mark finalUserInput as non-final to assign this value'; // Error
  print('finalUserInput value : $finalUserInput'); // final & dynamic
  print(
      'finalUserInput run time type : ${finalUserInput.runtimeType}'); // String

  ///
  /// 💡 late & dynamic combination
  ///
  late dynamic someLateDynamicValue;

  // 🚨 Error The late local variable 'someLateDynamicValue' is definitely unassigned at this point.
  // print(someLateDynamicValue);
  someLateDynamicValue = '89';
  someLateDynamicValue = 89;
  print(someLateDynamicValue); // 89
}
