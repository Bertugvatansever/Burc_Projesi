import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'burc_.dart';

class BurcDetay extends StatefulWidget{
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc ,Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarrengi = Colors.pink;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    appbarrengiBul();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarrengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi+ " Burcu ve Özellikleri"),
              centerTitle: true,
              background:Image.asset(
                "images/"+widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
                )
              ),
            ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child:Text(widget.secilenBurc.burcDetayi),),
          ),
        ],
      )
        
    );
  }
  
  void appbarrengiBul() async{
    _generator = await PaletteGenerator.fromImageProvider(AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appbarrengi = _generator.dominantColor!.color;
    setState(() {
      
    });

  }
}