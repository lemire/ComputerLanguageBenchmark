/* The Computer Language Benchmarks Game
   http://benchmarksgame.alioth.debian.org/

   contributed by Jos Hirth, based on the JavaScript version
     which was created by Jesse Millikan, jose fco. gonzalez, and Matthew Wilson
*/

import 'dart:io';

void main() {
  var text = new StringBuffer();
  var src = new StringInputStream(stdin);

  src.onLine = () {
    var line = src.readLine();
    if (line != null) {
      text.add(line);
      text.add('\n');
    }
  };
  src.onClosed = () {
    regexAllTheThings(text.toString());
  };
}

void regexAllTheThings (String fullText) {
  var lengthA, lengthB, lengthC, regexp, replacements;

  regexp = ((){
    var pattern = [
      'agggtaaa|tttaccct',
      '[cgt]gggtaaa|tttaccc[acg]',
      'a[act]ggtaaa|tttacc[agt]t',
      'ag[act]gtaaa|tttac[agt]ct',
      'agg[act]taaa|ttta[agt]cct',
      'aggg[acg]aaa|ttt[cgt]ccct',
      'agggt[cgt]aa|tt[acg]accct',
      'agggta[cgt]a|t[acg]taccct',
      'agggtaa[cgt]|[acg]ttaccct'
    ];
    var regexp = [];
    for(var p in pattern) {
      regexp.add(new RegExp(p, ignoreCase: true));
    }
    return regexp;
  }());

  replacements = [
    'B', '(c|g|t)',
    'D', '(a|g|t)',
    'H', '(a|c|t)',
    'K', '(g|t)',
    'M', '(a|c)',
    'N', '(a|c|g|t)',
    'R', '(a|g)',
    'S', '(c|g)',
    'V', '(a|c|g)',
    'W', '(a|t)',
    'Y', '(c|t)'
  ];

  lengthA = fullText.length;

  fullText = fullText.replaceAll(new RegExp('^>.*\n|\n', multiLine: true), ''); // ridiculously slow with r14669

  lengthB = fullText.length;

  for(var i = 0; i < regexp.length; ++i) {
    print('${regexp[i].pattern} ${regexp[i].allMatches(fullText).length}');
  }

  for(var i = -1; i < replacements.length - 1;) {
    fullText = fullText.replaceAll(replacements[++i], replacements[++i]);
  }

  lengthC = fullText.length;

  print('\n$lengthA\n$lengthB\n$lengthC');
}
