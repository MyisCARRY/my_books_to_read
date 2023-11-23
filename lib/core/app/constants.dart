abstract class RegExpPreset {
  static const password = r'^(?=.*[a-zA-Z])(?=.*\d).*$';
  static const email = r'^[\w\.+-]+@(([\w-]+\.)[\w]*).*$';
}

abstract class Constants {}