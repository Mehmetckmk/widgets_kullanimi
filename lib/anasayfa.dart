import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController=TextEditingController();
  String alinanveri="";
  String resimadi="mutlu.png";
  var switchkontrol=false;
  var checkbox=false;
  int radiodeger=0;
  bool progresskontrol=false;
  double ilerleme=30.0;
  var tfSaat=TextEditingController();
  var tfTarih=TextEditingController();
  var ulkeler=<String>[];
  String secilenulke="Turkiye";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ulkeler.add("Turkiye");
    ulkeler.add("İtalya");
    ulkeler.add("Japonya");

  }
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi=MediaQuery.of(context);
    var yukseklik=ekranbilgisi.size.height;
    var genislik=ekranbilgisi.size.width;

    print("Ekran genişiliği $genislik");
    print("Ekran yüksekliği $yukseklik");

    return Scaffold(
      appBar: AppBar(title: const Text("Widgets",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor:Colors.lightBlue ,),
      //Yüksekliğe Göre Sığmama Durumu Olursa Bu Widgeti Kullanarak Ekranın Aşağı Kaymasını Sağlayabiliriz
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanveri),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  //Controller atanması gerekli
                  controller: tfController,
                  //İçinde yazacak olan metni verdik
                  decoration:const InputDecoration(hintText: "Veri"),
                  //Hangi Tür Kalvyenin Açılmasını İstiyorsak Onu Yazarız
                  keyboardType: TextInputType.number,
                  //Şifreli Olarak Gözükmesini İstiyorsak
                  obscureText: true,
                ),
              ),
              ElevatedButton(onPressed: (){
                //TextField den alınan veriyi En Yukarıdaki Text e Atadık ve Set Özelliği Kullanarak Sayfanın Güncellenmesini Sağladık
                setState(() {
                  alinanveri=tfController.text;
                  tfController.text="";
                });
              }, child:const Text("Veriyi Al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                   setState(() {
                     resimadi="mutlu.png";
                   });
                  }, child: const Text("RESİM 1")),
                  Image.asset("resimler/${resimadi}"),
                 // SizedBox( width: 150,height: 50,
                     // child:
                      //URL ÜZERİNDEN FOTOĞRAF ALABİLMEK İÇİN GEREKLİ KOD PARÇACIĞI
                      //Image.network("https://cdn.yemek.com/mncrop/620/388/uploads/2022/05/ev-koftesi-yemekcom-1.jpg")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimadi="uzgun.png";
                    });
                  }, child: const Text("RESİM 2"))
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 205,height: 60,
                    //Switch Kullanımı
                    child: SwitchListTile(
                        title:const Text("Dart"),
                        //Yazınının Solda Görükmesi İçin Gerekli Kod Bloğu
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchkontrol,
                        onChanged:(veri){
                          setState(() {
                            switchkontrol=veri;
                          });
                        }
                    ),
                  ),
                  //Checkbox Kullanımı
                  SizedBox(width: 205,height: 60,
                    child: CheckboxListTile(
                        title:const Text("Flutter"),
                        //Yazınının Solda Görükmesi İçin Gerekli Kod Bloğu
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkbox,
                        onChanged:(veri){
                          setState(() {
                            checkbox=veri!;
                          });
                        }
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 205,height: 60,
                    //Switch Kullanımı
                    child: RadioListTile(
                        title:const Text("Fenerbahçe"),
                        value: 1,
                        groupValue: radiodeger,
                        onChanged:(veri){
                          setState(() {
                            radiodeger=veri!;
                          });
                        }
                    ),
                  ),
                  //Checkbox Kullanımı
                  SizedBox(width: 205,height: 60,
                    //Switch Kullanımı
                    child: RadioListTile(
                        title:const Text("Galatasaray"),
                        value: 2,
                        groupValue: radiodeger,
                        onChanged:(veri){
                          setState(() {
                            radiodeger=veri!;
                          });
                        }
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresskontrol=true;
                    });
                  },
                      child: Text("Başla",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  ),
                  //Progrress Kullanımı İçin Gerekli Kod Bloğu.(Yükleme İşlemini Gösterebilmek Amacıyla)
                  Visibility(visible:progresskontrol ,child: const CircularProgressIndicator()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progresskontrol=false;
                    });
                  },
                    child: Text("Dur",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  ),
                ],
              ),
              Text(ilerleme.toInt().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              Slider(max:100,min:0.0,value: ilerleme, onChanged: (veri){
                setState(() {
                  ilerleme=veri;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 120,height: 70,child: TextField(controller: tfSaat, decoration: const InputDecoration(hintText:"Saat"),)),
                  IconButton(onPressed: (){
                    showTimePicker(context:context , initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                        .then((value){
                          tfSaat.text="${value!.hour}: ${value!.minute}";
                    });
                  }, icon: const Icon(Icons.access_time)),
                  SizedBox(width: 120,height: 70,child: TextField(controller: tfTarih, decoration: const InputDecoration(hintText:"Tarih"),)),
                  IconButton(onPressed: (){
                    showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate:DateTime(2050)).
                    then((value){
                      tfTarih.text="${value!.day}/ ${value!.month}/ ${value!.year}:";
                    });
                  }, icon: const Icon(Icons.date_range)),
                ],
              ),
              SizedBox(width: 150,height: 70,
                child: DropdownButton(
                    dropdownColor: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    value: secilenulke,
                    icon: const Icon(Icons.pin_drop),
                    //map listemiz varsa listedeki  elemanları sırayala getiren bi yapı
                    items: ulkeler.map((ulke){
                      return DropdownMenuItem(value: ulke,child: Text(ulke),);
                    }).toList(),
                    onChanged:(veri){
                      setState(() {
                        secilenulke=veri!;
                      });
                    }),
              ),
              GestureDetector(
                  onTap:(){
                    print("Container tek Tıklandı");
                  } ,
                  onDoubleTap: (){
                    print("Container çift Tıklandı");
                  },
                  onLongPress: (){
                    print("Container uzun Tıklandı");
                  },
                  child: Container(width:100 ,height:100 ,color: Colors.red,)),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: ElevatedButton(onPressed: (){
                  print("Switch durum:$switchkontrol ");
                  print("Checkbox durum:$checkbox ");
                  print("Radio  durum:$radiodeger ");
                  print("slider  durum:${ilerleme.toInt()} ");
                }, child: Text("Durum Göster",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
