class Weapon {
  String _name;
  int _power;
  int _accuracy;

  Weapon(this._name, this._power, this._accuracy);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get power => _power;

  set power(int value) {
    _power = value;
  }

  int get accuracy => _accuracy;

  set accuracy(int value) {
    _accuracy = value;
  }
}
