String getAbbreviation(String name) {
  List<String> words = name.split(' ');
  if (words.length == 1) {
    return name[0].toUpperCase();
  } else if (words.length == 2) {
    return words[0][0].toUpperCase() + words[1][0].toUpperCase();
  } else {
    String abbreviation = '';
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        abbreviation += word[0].toUpperCase();
      }
    }
    return abbreviation;
  }
}
