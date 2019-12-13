class BeerSong {
  List<String> recite(int bottles, int verses) {
    return new List<String>.generate(
            verses,
            (int index) =>
                getBeerOnWall(bottles) +
                ', ' +
                getBottlesBeer(bottles).toLowerCase() +
                "." +
                getTakeOne(bottles) +
                getBeerOnWall(bottles == 0 ? 99 : --bottles).toLowerCase() +
                (index + 1 != verses ? './r' : '.'))
        .expand((el) => el.split('/r'))
        .toList();
  }

  String getBeerOnWall(int bottles) => getBottlesBeer(bottles) + ' on the wall';
  String getBottlesBeer(int bottles) =>
      (bottles == 0 ? 'No more' : bottles.toString()) +
      ' bottle' +
      (bottles == 1 ? '' : 's') +
      ' of beer';
  String getTakeOne(int bottles) =>
      '/r' +
      (bottles == 1
          ? 'Take it down and pass it around, '
          : (bottles == 0
              ? 'Go to the store and buy some more, '
              : 'Take one down and pass it around, '));
}
