/*
* Created on 12 January 2023
* @author Sai Sumanth
*/

import 'dart:io';

/// Problem Statement - Read a text file and count the occurrences of each word.

///
/// 🏁 entry point
///
void main() {
  /// File Relative Path
  const filePath = 'assets/words.txt';

  try {
    /// Read the File Content as String
    final fileContent = File(filePath).readAsStringSync();

    final wordFrequencies = countWordsUsingRegExp(text: fileContent);
    final wordFrequencies2 = countWordsUsingSplit(text: fileContent);

    /// display the map to console
    displayMap(wordsMap: wordFrequencies);
    // displayMap(wordsMap: wordFrequencies2);
  } catch (e) {
    print('Error while reading the file: $e');
  }
}

///
/// using built-in split method
///
Map<String, int> countWordsUsingSplit({required String text}) {
  final Map<String, int> wordFrequencyMap = {};

  final words = text.split(" ");

  for (final word in words) {
    wordFrequencyMap[word] = (wordFrequencyMap[word] ?? 0) + 1;
  }
  return wordFrequencyMap;
}

///
/// Counts the frequency of each word in the given text using Regular Expression
///
/// returns [Map] where keys are unique words, and values represent
/// the frequency of each word
///
Map<String, int> countWordsUsingRegExp({required String text}) {
  final Map<String, int> wordFrequencyMap = {};

  ///
  /// Split the text into words using whitespace as a separator
  ///
  /// '\s' matches whitespace character
  ///
  /// '\s+' matches one or more consecutive whitespace characters
  ///
  final words = text.split(RegExp(r'\s+'));

  for (final word in words) {
    // Remove punctuation and convert to lowercase for accurate counting
    ///
    /// '\w' matches any alphanumeric character (equivalent to [a-zA-Z0-9_])
    ///
    /// '^\w' replace all other than alphanumeric
    ///
    final cleanedWord = word.replaceAll(RegExp(r'[^\w]'), '').toLowerCase();

    if (cleanedWord.isNotEmpty) {
      wordFrequencyMap[cleanedWord] = (wordFrequencyMap[cleanedWord] ?? 0) + 1;
    }
  }
  return wordFrequencyMap;
}

///
/// Displays a given Map
///
void displayMap({required Map<String, int> wordsMap}) {
  // Sort the word frequencies in descending order.
  final sortedMap = wordsMap.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));
  int totalWordsCount = 0;

  print('\nWord Frequencies:');
  for (final entry in sortedMap) {
    print('${entry.key}: ${entry.value}');
    totalWordsCount += entry.value;
  }

  print('Total Words Count: $totalWordsCount');
}
