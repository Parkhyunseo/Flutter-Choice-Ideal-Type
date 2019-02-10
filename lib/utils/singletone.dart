import 'dart:core';

Singleton get singleton => Singleton.instance;

class Singleton {
  static final Singleton instance = Singleton._private();
  Singleton._private();
  factory Singleton() => instance;
}
