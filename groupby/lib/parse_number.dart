class ParseNumber{
  parseNumber(String money){
    String temp='';
    int index = 0 ;
    for(int i = money.length-1 ; i>=0 ; i--){
      if(index==3){
        index = 0 ;
        temp = '.' + temp ;
      }
      temp = money[i] + temp ;
      index ++ ;
    }
    // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$temp');
    return temp ;
  }
}