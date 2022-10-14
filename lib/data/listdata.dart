import 'package:financeapp/data/money.dart';


List<money> getter(){
  money upwork=money();
  upwork.name='upwork';
  upwork.fee='550';
  upwork.time='today';
  upwork.image='up.png';
  upwork.buy=false;

  money starbucks=money();
  starbucks.buy=true;
  starbucks.fee='25';
  starbucks.image='Star.jpg';
  starbucks.name='starbucks';
  starbucks.time='today';

  money transfer=money();
  transfer.buy=true;
  transfer.fee='200';
  transfer.image='cre.png';
  transfer.name='transfer for ali';
  transfer.time='Nov 14,2022';


  return[upwork,starbucks,transfer,upwork,starbucks,transfer,upwork,starbucks,transfer];
}