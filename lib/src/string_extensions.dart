extension NullStringExtensions on String? {
  /// Returns `true` if the string is `null` or empty, `false` otherwise.
  ///
  /// This getter checks if the string is `null` or if it is empty. It returns `true` if the string is `null` or if it has no characters.
  ///
  /// Example:
  /// ```dart
  /// final String? myString = null;
  /// final bool isNullOrEmpty = myString.isNullOrEmpty;
  /// print(isNullOrEmpty); // Prints true
  ///
  /// final String emptyString = '';
  /// final bool isNullOrEmpty2 = emptyString.isNullOrEmpty;
  /// print(isNullOrEmpty2); // Prints true
  ///
  /// final String nonEmptyString = 'Hello, world!';
  /// final bool isNullOrEmpty3 = nonEmptyString.isNullOrEmpty;
  /// print(isNullOrEmpty3); // Prints false
  /// ```
  ///
  /// Returns:
  /// - `true` if the string is `null` or empty.
  /// - `false` otherwise.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

/// Extensions for formatting strings.
///
/// This extension provides methods for formatting strings.
extension StringFormat on String {
  /// Returns a new string with leading and trailing characters removed.
  ///
  /// The optional [chars] argument specifies the characters to remove.
  ///
  /// If [chars] is not provided, it removes leading and trailing whitespace.
  String strip([String? chars]) {
    if (chars != null) {
      return replaceAll(RegExp('^[$chars]+|[$chars]+\$'), '');
    } else {
      return trim();
    }
  }

  /// Returns a new string with the first letter of each word capitalized and all other letters lowercased.
  ///
  /// If the string is empty, it returns the original string.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.title); // Output: Hello World
  /// ```
  String get title {
    if (isEmpty) return this;

    final words = split(' ');
    final titleWords = words.map((word) {
      if (word.isEmpty) return '';
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    });

    return titleWords.join(' ');
  }

  /// Returns a new string with the character at the specified [index] capitalized.
  ///
  /// If [index] is not provided, it defaults to the first character of the string.
  ///
  /// Throws a [StateError] if the string is empty.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.charToUpper(0)); // Output: Hello world
  /// print('hello world'.charToUpper(6)); // Output: hello World
  /// print('hello world'.charToUpper()); // Output: Hello world
  /// ```
  String charToUpper([int? index]) {
    if (trim().isEmpty) throw StateError('Empty string');

    return replaceFirst(this[index ?? 0], this[index ?? 0].toUpperCase());
  }

  /// Whether the string is uppercase case or not.
  ///
  /// Example:
  /// ```dart
  /// print('HELLO WORLD'.isUpper); // Output: true
  /// print('hello world'.isUpper); // Output: false
  /// ```
  bool get isUpper => trim().toUpperCase() == this;

  /// Whether the string is lowercase case or not.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.isLow); // Output: true
  /// print('HELLO WORLD'.isLow); // Output: false
  /// ```
  bool get isLow => trim().toLowerCase() == this;

  /// Returns a new string with the first letter capitalized and all other letters lowercased.
  ///
  /// If the string is empty, it returns the original string.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.capitalize); // Output: Hello world
  /// ```
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Returns a new string with the current string centered in a string of length [width].
  ///
  /// If the current string is already longer than [width], the original string is returned.
  ///
  /// The optional [fillChar] parameter specifies the character to use for padding.
  /// Defaults to a space character.
  ///
  /// Example:
  /// ```dart
  /// print('hello'.center(10)); // Output: '   hello   '
  /// print('hello'.center(10, '-')); // Output: '---hello---'
  /// ```
  String center(int width, [String fillChar = ' ']) {
    if (width <= length) return this;
    int totalPadding = width - length;
    int leftPadding = totalPadding ~/ 2;
    int rightPadding = totalPadding - leftPadding;
    return fillChar * leftPadding + this + fillChar * rightPadding;
  }

  /// Returns the number of non-overlapping occurrences of the [substring] in the current string.
  ///
  /// The [substring] parameter is the string to count the occurrences of.
  ///
  /// Returns an integer representing the number of occurrences.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.count('l')); // Output: 3
  /// ```
  int count(String substring) {
    return RegExp(substring).allMatches(this).length;
  }

  /// Checks if the string consists only of numeric characters.
  ///
  /// Returns `true` if the string contains only numeric characters, `false` otherwise.
  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Returns a new string that is left-justified within a width.
  ///
  /// The [width] parameter specifies the total width of the resulting string.
  /// The [fillChar] parameter specifies the character to use for filling the remaining space.
  ///
  /// Returns a new string that is left-justified within the specified width.
  /// If the length of the current string is greater than or equal to the width,
  /// the original string is returned. Otherwise, the string is padded on the right
  /// with the specified fill character until the total width is reached.
  ///
  /// Example:
  /// ```dart
  /// print('hello'.ljust(10)); // Output: 'hello     '
  /// print('hello'.ljust(10, '-')); // Output: 'hello-----'
  /// ```
  String lJust(int width, [String fillChar = ' ']) {
    if (width <= length) return this;
    return this + fillChar * (width - length);
  }

  /// Returns a new string that is right-justified within a width.
  ///
  /// The [width] parameter specifies the total width of the resulting string.
  /// The [fillChar] parameter specifies the character to use for filling the remaining space.
  ///
  /// Returns a new string that is right-justified within the specified width.
  /// If the length of the current string is greater than or equal to the width,
  /// the original string is returned. Otherwise, the string is padded on the left
  /// with the specified fill character until the total width is reached.
  ///
  /// Example:
  /// ```dart
  /// print('hello'.rHust(10)); // Output: '     hello'
  /// print('hello'.rHust(10, '-')); // Output: '-----hello'
  /// ```
  String rJust(int width, [String fillChar = ' ']) {
    if (width <= length) return this;
    return fillChar * (width - length) + this;
  }

  /// Checks if the current string is a valid email address.
  ///
  /// This function uses a regular expression to validate the email address.
  /// It returns `true` if the string is a valid email address, and `false` otherwise.
  ///
  /// Returns a boolean value indicating whether the current string is a valid email address.
  bool get isValidEmail {
    if (isEmpty) return false;
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(this);
  }

  /// Checks if the current string is alphanumeric.
  ///
  /// This function checks if the current string consists only of alphanumeric characters.
  /// It returns `true` if the string is alphanumeric, and `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// String str1 = "Hello123";
  /// print(str1.isAlphanumeric); // Output: true
  ///
  /// String str2 = "Hello World";
  /// print(str2.isAlphanumeric); // Output: false
  /// ```
  ///
  /// Returns a boolean value indicating whether the current string is alphanumeric.
  bool get isAlphanumeric {
    if (isEmpty) return false;
    final alphanumericRegExp = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumericRegExp.hasMatch(this);
  }

  /// Checks if the current string is blank.
  ///
  /// This function checks if the current string is empty or consists only of whitespace characters.
  /// It returns `true` if the string is blank, and `false` otherwise.
  ///
  /// Returns a boolean value indicating whether the current string is blank.
  bool get isBlank => trim().isEmpty;

  /// Reverses the order of the characters in the string.
  ///
  /// This function takes no parameters.
  ///
  /// Returns a new string with the characters in reverse order.
  ///
  /// Example:
  ///
  /// ```dart
  /// String original = 'hello';
  /// String reversed = original.reverse();
  /// print(reversed); // Output: 'olleh'
  /// ```
  String get reverse => split('').reversed.join('');

  /// Converts a string to camel case.
  ///
  /// This function takes a string and converts it to camel case. It replaces any
  /// occurrences of underscores or hyphens with uppercase letters. If the input
  /// string is empty, it returns the original string.
  ///
  /// Returns a new string with the first letter of each word capitalized and all
  /// other letters lowercased.
  ///
  /// Example:
  /// ```dart
  /// print('hello_world'.toCamelCase); // Output: helloWorld
  /// print('hello-world'.toCamelCase); // Output: helloWorld
  /// print(''.toCamelCase); // Output: ''
  /// ```
  String get toCamelCase {
    if (isEmpty) return this;
    String camelCaseString = toLowerCase();
    final regExp = RegExp(r'[_-](\w)');
    camelCaseString = camelCaseString.replaceAllMapped(regExp, (match) {
      return match.group(1)!.toUpperCase();
    });
    return camelCaseString;
  }

  /// Converts a string to kebab case.
  ///
  /// Kebab case is a naming convention where words are separated by hyphens.
  /// This method replaces any occurrence of a lowercase letter followed by an
  /// uppercase letter with the lowercase letter, a hyphen, and the uppercase
  /// letter. The resulting string is then converted to lowercase.
  ///
  /// Returns the kebab case representation of the string.
  ///
  /// Example:
  /// ```dart
  /// 'camelCaseString'.toKebabCase; // 'camel-case-string'
  /// ```
  String get toKebabCase {
    if (isEmpty) return this;
    return replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match[1]}-${match[2]}',
    ).toLowerCase();
  }

  /// Converts a camelCase string to snake_case.
  ///
  /// Example:
  /// ```dart
  /// String str = "camelCaseExample";
  /// print(str.toSnakeCase); // "camel_case_example"
  /// ```
  String get toSnakeCase {
    return replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      return '_${match.group(0)!.toLowerCase()}';
    }).replaceFirstMapped(RegExp(r'^_'), (match) => '');
  }

  /// Truncates the string to the specified [length] and optionally adds an ellipsis.
  ///
  /// The [length] parameter specifies the maximum length of the truncated string.
  /// If [addEllipsis] is `true`, an ellipsis (`...`) is appended to the truncated string.
  ///
  /// Returns the truncated string.
  ///
  /// Example:
  /// ```dart
  /// 'This is a long string'.truncate(10, addEllipsis: true); // 'This is a...'
  /// ```
  String truncate(int length, {bool addEllipsis = false}) {
    if (isEmpty) return this;
    if (this.length <= length) return this;
    return substring(0, length) + (addEllipsis ? '...' : '');
  }

  /// Checks if the current string contains the specified [other] string, ignoring case.
  ///
  /// The [other] parameter specifies the string to search for.
  ///
  /// Returns `true` if the current string contains the [other] string, ignoring case, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// print('Hello World'.containsIgnoreCase('hello')); // Output: true
  /// ```
  bool containsIgnoreCase(String other) {
    if (isEmpty) return false;
    return toLowerCase().contains(other.toLowerCase());
  }

  /// Removes all whitespace characters from the current string.
  ///
  /// This function checks if the current string is empty. If it is, the original string is returned.
  /// Otherwise, it uses the `replaceAll` method to replace all occurrences of whitespace characters
  /// with an empty string. The regular expression `r'\s+'` is used to match one or more whitespace characters.
  ///
  /// Returns a new string with all whitespace characters removed.
  ///
  /// Example:
  /// ```dart
  /// print('  Hello World  '.removeWhitespaces); // Output: 'HelloWorld'
  /// ```
  String get removeWhitespaces {
    if (isEmpty) return this;
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Removes all punctuation characters from the given string.
  ///
  /// Returns an empty string if the input is null.
  ///
  /// Returns a new string with all punctuation characters removed.
  ///
  /// Example:
  /// ```dart
  /// String input = "Hello, world!";
  /// String output = input.removePunctuation();
  /// print(output); // Output: "Hello world"
  /// ```
  ///
  /// Returns:
  /// A new string with all punctuation characters removed.
  String get removePunctuation => replaceAll(RegExp(r'[^\w\s]'), '');

  /// Checks if the string is a palindrome.
  ///
  /// Example:
  /// ```dart
  /// String str = "A man a plan a canal Panama";
  /// print(str.isPalindrome); // true
  /// ```
  bool get isPalindrome {
    String cleanedString = toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleanedString == cleanedString.split('').reversed.join('');
  }

  /// Counts the number of words in the string.
  ///
  /// Example:
  /// ```dart
  /// String str = "Hello world, this is a test.";
  /// print(str.wordCount); // 6
  /// ```
  int get wordCount {
    return trim().split(RegExp(r'\s+')).length;
  }

  /// Returns a new string with the case of each character swapped.
  ///
  /// If the string is empty, it returns the original string.
  ///
  /// Example:
  /// ```dart
  /// String str = "Hello world";
  /// print(str.swapcase); // Output: hELLO wORLD
  /// ```
  String get swapcase {
    if (isEmpty) return this;
    return split('').map((char) {
      if (char == char.toUpperCase()) return char.toLowerCase();
      return char.toUpperCase();
    }).join('');
  }

  /// Returns `true` if the string contains only digits, and `false` otherwise.
  ///
  /// This getter uses a regular expression to check if the string consists of one or more digits.
  ///
  /// Example:
  /// ```dart
  /// String str1 = "123";
  /// print(str1.isDigit); // Output: true
  ///
  /// String str2 = "abc";
  /// print(str2.isDigit); // Output: false
  /// ```
  bool get isDigit => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Formats the string by replacing placeholders with provided arguments.
  ///
  /// The function takes an optional list of positional arguments [posArgs] and
  /// an optional map of named arguments [namedArgs]. The placeholders in the
  /// string can be specified using curly braces `{}` for positional arguments
  /// and `${name}` for named arguments. The function replaces these placeholders
  /// with the corresponding values from the arguments.
  ///
  /// If [sep] is provided, it is used to join the words in the formatted string.
  ///
  /// Returns the formatted string.
  ///
  /// Example:
  /// ```dart
  /// String str = 'Hello {0}, my name is {1}';
  /// String str2 = 'Hello {}, my name is {}';
  /// print(str.format(posArgs: ['Dart', 'John']));  Output: Hello Dart, my name is John.
  /// print(str2.format(posArgs: ['Jhon', 'Smith'])); Output: Hello Jhon, my name is Smith.
  /// ```
  String format(
      {List<dynamic>? posArgs, Map<String, dynamic>? namedArgs, String? sep}) {
    String result = this;

    if (posArgs != null) {
      for (int i = 0; i < posArgs.length; i++) {
        result = result
            .replaceAll('{$i}', posArgs[i].toString())
            .replaceFirst('{}', posArgs[i].toString());
      }
    }

    if (namedArgs != null) {
      namedArgs.forEach((key, value) {
        result = result.replaceAll('{$key}', value.toString());
      });
    }

    return result.split(' ').join(sep ?? ' ');
  }

  /// Returns `true` if the string is a valid URL, `false` otherwise.
  ///
  /// This getter checks if the string matches the regular expression pattern for a valid URL.
  /// It returns `true` if the string is a valid URL, and `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// final String url1 = 'https://www.example.com';
  /// final bool isValidUrl1 = url1.isValidUrl;
  /// print(isValidUrl1); // Prints true
  ///
  /// final String url2 = 'ftp://example.com';
  /// final bool isValidUrl2 = url2.isValidUrl;
  /// print(isValidUrl2); // Prints true
  ///
  /// final String url3 = 'example.com';
  /// final bool isValidUrl3 = url3.isValidUrl;
  /// print(isValidUrl3); // Prints false
  /// ```
  ///
  /// Returns:
  /// - `true` if the string is a valid URL.
  /// - `false` otherwise.
  bool get isUrl => RegExp(
          r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$")
      .hasMatch(this);
}
