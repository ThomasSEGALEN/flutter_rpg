import 'package:flutter_rpg/roll_dices.dart';
import 'package:flutter_rpg/user_input.dart';
import 'package:flutter_rpg/Weapon.dart';
import 'package:flutter_rpg/Fighter.dart';

class Bot extends Fighter {
  Bot(int strength, int health, Weapon weapon)
      : super(strength, health, weapon);

  stats() {
    print('Bot - Force: $strength / Santé: $health');
  }

  attack(player) {
    int dices = rollDices();
    readEnter('Bot lance les dés...$dices');
    readEnter(
        'Bot assène un coup sur ${player.pseudo} avec une force de $dices');
    player.health -= dices * strength;
  }

  heal() {
    int dices = rollDices();
    readEnter('Bot lance les dés...');
    readEnter('Bot récupère ${dices * 2} de santé');
    health += dices * 2;
  }
}
