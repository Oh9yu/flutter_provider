class Babies {
  final int age;

  Babies({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(Duration(seconds: 3));
    if (age > 1 && age < 5) {
      return 4;
    } else if (age <= 1) {
      return 3;
    } else
      return 5;
  }

  Stream<String> bark() async* {
    for (int i = 1; i < age; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield 'Bark $i times';
    }
  }
}
