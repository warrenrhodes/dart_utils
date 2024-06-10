/// A formatted print function.
///
/// The function takes a list of objects to print, a separator to use between
/// the objects, an end character to append at the end of the output, and an
/// optional file to write the output to.
///
/// Args:
///   args (Object?): The list of objects to print.
///   sep (String?): The separator to use between objects. Defaults to a space.
///   end (String): The end character to append at the end. Defaults to a newline.
///   unpack (bool): Whether to unpack the map or iterable objects. Defaults to false.
///
/// Example:
///   fprint(['Hello', 'world', 123], sep: ', ', end: '!\n');
///   fprint(['Dart', 'is', 'fun']);
void fprint(Object? args,
    {String sep = ' ', String end = '\n', bool unpack = false}) {
  String output;
  if (args is Map) {
    if (unpack) {
      output = args.keys.join(sep);
    } else {
      output = args.toString();
    }
  } else if (args is Iterable) {
    output = unpack ? args.join(sep) : args.toString();
  } else {
    output = args.toString();
  }

  output += end;

  print(output);
}
