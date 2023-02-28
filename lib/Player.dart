import 'dart:math';

import 'package:flutter_rpg/roll_dices.dart';
import 'package:flutter_rpg/user_input.dart';
import 'package:flutter_rpg/Weapon.dart';
import 'package:flutter_rpg/Fighter.dart';

class Player extends Fighter {
  final String _pseudo;

  Player(int strength, int health, Weapon weapon, this._pseudo)
      : super(strength, health, weapon);

  stats() {
    print('$_pseudo - Force: $strength / Santé: $health');
  }

  attack(bot) {
    readEnter('$_pseudo, appuyez sur entrée pour lancer les dés');
    int dices = rollDices();
    readEnter('$_pseudo lance les dés...$dices');

    if (Random().nextInt(100) + 1 < weapon.accuracy) {
      readEnter('$_pseudo assène un coup sur le bot avec une force de $dices');
      bot.health -= dices * strength + weapon.power;
    } else {
      readEnter('$_pseudo rate son attaque!');
    }
  }

  heal() {
    readEnter('$_pseudo, appuyez sur entrée pour lancer les dés');
    int dices = rollDices();
    readEnter('$_pseudo lance les dés...');
    readEnter('$_pseudo récupère ${dices * 2} de santé');
    health += dices * 2;
  }

  selectWeapon(weapon) {
    weapon = weapon;
  }

  win() {
    health = 100;
    strength += 1;
    health += 100;
  }

  String get pseudo => _pseudo;
}
