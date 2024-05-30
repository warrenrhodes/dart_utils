import 'package:dart_advanced_utils/src/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringFormatExtension', () {
    test('strip with default whitespace', () {
      expect('  hello  '.strip(), 'hello');
      expect('  hello world  '.strip(), 'hello world');
    });

    test('strip with custom characters', () {
      expect('***hello***'.strip('*'), 'hello');
      expect('---hello---'.strip('-'), 'hello');
    });

    test('title', () {
      expect('hello world'.title, 'Hello World');
      expect('HELLO WORLD'.title, 'Hello World');
      expect('hello'.title, 'Hello');
    });

    test('charToUpper with default index', () {
      expect('hello world'.charToUpper(), 'Hello world');
    });

    test('charToUpper with specific index', () {
      expect('hello world'.charToUpper(6), 'hello World');
      expect('hello world'.charToUpper(0), 'Hello world');
    });

    test('isUpper', () {
      expect('HELLO WORLD'.isUpper, true);
      expect('hello world'.isUpper, false);
    });

    test('isLow', () {
      expect('hello world'.isLow, true);
      expect('HELLO WORLD'.isLow, false);
    });

    test('capitalize', () {
      expect('hello world'.capitalize, 'Hello world');
      expect('Hello world'.capitalize, 'Hello world');
    });

    test('center', () {
      expect('hello'.center(10), '  hello   ');
      expect('hello'.center(10, '-'), '--hello---');
    });

    test('count', () {
      expect('hello world'.count('l'), 3);
      expect('banana'.count('a'), 3);
    });

    test('isNumeric', () {
      expect('123456'.isNumeric, true);
      expect('123abc'.isNumeric, false);
    });

    test('lJust', () {
      expect('hello'.lJust(10), 'hello     ');
      expect('hello'.lJust(10, '-'), 'hello-----');
    });

    test('rHust', () {
      expect('hello'.rJust(10), '     hello');
      expect('hello'.rJust(10, '-'), '-----hello');
    });

    test('isValidEmail', () {
      expect('test@example.com'.isValidEmail, true);
      expect('invalid-email'.isValidEmail, false);
    });

    test('isAlphanumeric', () {
      expect('Hello123'.isAlphanumeric, true);
      expect('Hello World'.isAlphanumeric, false);
    });

    test('isBlank', () {
      expect('   '.isBlank, true);
      expect('hello'.isBlank, false);
    });

    test('reverse', () {
      expect('hello'.reverse, 'olleh');
      expect(''.reverse, '');
    });

    test('toCamelCase', () {
      expect('hello_world'.toCamelCase, 'helloWorld');
      expect('hello-world'.toCamelCase, 'helloWorld');
    });

    test('toKebabCase', () {
      expect('camelCaseString'.toKebabCase, 'camel-case-string');
    });

    test('truncate', () {
      expect('This is a long string'.truncate(10, addEllipsis: true),
          'This is a ...');
      expect('This is a long string'.truncate(10, addEllipsis: false),
          'This is a ');
    });

    test('containsIgnoreCase', () {
      expect('Hello World'.containsIgnoreCase('hello'), true);
      expect('Hello World'.containsIgnoreCase('WORLD'), true);
      expect('Hello World'.containsIgnoreCase('test'), false);
    });

    test('removeWhitespaces', () {
      expect('  Hello World  '.removeWhitespaces, 'HelloWorld');
    });

    test('removePunctuation', () {
      expect('Hello, world!'.removePunctuation, 'Hello world');
      expect(''.removePunctuation, '');
    });

    test('isPalindrome', () {
      expect('A man a plan a canal Panama'.isPalindrome, true);
      expect('maman'.isPalindrome, false);
    });

    test('toSnakeCase', () {
      expect('camelCaseExample'.toSnakeCase, 'camel_case_example');
      expect('DartIsAwesome'.toSnakeCase, 'dart_is_awesome');
    });
    test('wordCount', () {
      expect('Hello world, this is a test.'.wordCount, 6);
      expect('Hello'.wordCount, 1);
    });
  });
}
