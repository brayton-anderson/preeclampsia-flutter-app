String? replaceWhitespacesRegex(String? s, String? replace) {
 if (s == null) {
   return null;
 }
 final pattern = RegExp('\\s+');
 return s.replaceAll(pattern, replace!);
}