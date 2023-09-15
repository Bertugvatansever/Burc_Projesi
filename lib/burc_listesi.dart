import 'package:burc_projesi/model/burc_item.dart';
import 'package:flutter/material.dart';

import 'data/strings.dart';
import 'model/burc_.dart';

class BurcListesi extends StatelessWidget{
  late List<Burc> tumBurclar = [];
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }
  
  get itemBuilder => null;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar Listesi"),

      ),
      body: Center(
        child:ListView.builder(itemBuilder:(context, index){
          return BurcItem(listelenenBurc: tumBurclar[index],);
        },
        itemCount:tumBurclar.length),
      ),
    );
  }
  
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i=0; i<12; i++){
      var burcKucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i+1}.png";
      var burcBuyukResim = Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i+1}.png";
      Burc eklenecekBurc = Burc(Strings.BURC_ADLARI[i],Strings.BURC_TARIHLERI[i],Strings.BURC_GENEL_OZELLIKLERI[i],burcKucukResim,burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }

}