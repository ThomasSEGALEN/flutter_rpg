import 'dart:math';

import 'package:flutter_rpg/Bot.dart';
import 'package:flutter_rpg/Player.dart';
import 'package:flutter_rpg/Weapon.dart';
import 'package:flutter_rpg/user_input.dart';

void main() {
  List<Weapon> weapons = [
    Weapon('Glock18', 20, 70),
    Weapon('AK47', 30, 60),
    Weapon('Dragonlore', 50, 100),
  ];

  bool checkHealth(playerHealth, botHealth) {
    if (playerHealth <= 0) return true;
    if (botHealth <= 0) return true;

    return false;
  }

  Bot generateBot(number) {
    Bot bot = Bot(Random().nextInt(number) + 1, number * 100, weapons[1]);

    return bot;
  }

  String pseudo = readString('Quel est votre pseudo ?');

  String weaponName = readString(
      'Quelle arme souhaitez-vous utiliser :\n1: ${weapons[0].name}\n2: ${weapons[1].name}\n3: ${weapons[2].name}');
  late Weapon weapon = weapons[0];

  switch (weaponName) {
    case '1':
      weapon.name = 'Glock18';
      break;
    case '2':
      weapon.name = 'AK47';
      break;
    case '3':
      weapon.name = 'Dragonlore';
      break;
  }

  Player player = Player(1, 100, weapon, pseudo);

  int stage = 1;
  int round = 1;

  while (true) {
    Bot bot = generateBot(stage);

    print(
        'Bot - Force: ${bot.strength} / Santé: ${bot.health} / Arme: ${bot.weapon.name}');
    print(
        '${player.pseudo} - Force: ${player.strength} / Santé: ${player.health} / Arme: ${player.weapon.name}\n');
    do {
      if ((Random().nextInt(2) + 1).isEven) {
        if (checkHealth(player.health, bot.health)) break;

        if ((Random().nextInt(2) + 1).isOdd) {
          bot.attack(player);
        } else {
          bot.heal();
        }

        if (checkHealth(player.health, bot.health)) break;

        String attack =
            readString('Choisissez une action :\n1: Attaque\n2: Soin');

        switch (attack) {
          case '1':
            player.attack(bot);
            break;
          case '2':
            player.heal();
            break;
        }

        if (checkHealth(player.health, bot.health)) break;
      } else {
        bot.attack(player);

        if (checkHealth(player.health, bot.health)) break;

        String attack =
            readString('Choisissez une action :\n1: Attaque\n2: Soin');

        switch (attack) {
          case '1':
            player.attack(bot);
            break;
          case '2':
            player.heal();
            break;
        }

        if (checkHealth(player.health, bot.health)) break;
      }

      player.stats();
      bot.stats();
      readEnter('Fin du tour $round');
      round++;
    } while (player.health > 0 && bot.health > 0);

    if (player.health <= 0) {
      print('Vous avez perdu la partie!');
      break;
    }

    if (bot.health <= 0) {
      player.win();

      print('Vous avez gagné la partie!');
      print(
          '${player.pseudo} a évolué:\n- Force: ${player.strength}\n- Santé: ${player.health}');

      String weapon = readString(
          'Choisissez une nouvelle arme :\n1: ${weapons[0].name}\n2: ${weapons[1].name}\n3: ${weapons[2].name}');

      switch (weapon) {
        case '1':
          player.selectWeapon(weapon[0]);
          break;
        case '2':
          player.selectWeapon(weapon[1]);
          break;
        case '3':
          player.selectWeapon(weapon[2]);
          break;
      }

      readEnter('Appuyez sur Entrer pour combattre de nouveau');
    }

    stage++;
  }
}
