bool isWhite(int index){
  int x = index ~/ 8;         //this gives us the integer division ie. row
  int y = index % 8;          //this gives us the remainder ie. column

  //alternative colors for each square
  bool isWhite = (x + y) % 2 == 0;
  return isWhite;
}