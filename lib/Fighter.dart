import 'package:flutter_rpg/Weapon.dart';

class Fighter {
  int _strength;
  int _health;
  Weapon _weapon;

  Fighter(this._strength, this._health, this._weapon);

  int get strength => _strength;

  set strength(int value) {
    _strength = value;
  }

  int get health => _health;

  set health(int value) {
    _health = value;
  }

  Weapon get weapon => _weapon;

  set weapon(Weapon value) {
    _weapon = value;
  }
}
