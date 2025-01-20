import 'package:flutter/material.dart';
import 'package:lewedly/presentations/components/ma_signalement_item.dart';
import 'package:lewedly/presentations/components/signalement_item.dart';
import 'package:lewedly/presentations/constants/constants.dart';
import 'package:lewedly/presentations/constants/data.dart';
import 'package:lewedly/presentations/screens/Signalements/signalement_details.dart';

class MesSignalements extends StatefulWidget {
  const MesSignalements({Key? key}) : super(key: key);

  @override
  State<MesSignalements> createState() => _MesSignalementsState();
}

class _MesSignalementsState extends State<MesSignalements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: (80),
        automaticallyImplyLeading: false,
        backgroundColor: whitecolor,
        title: Padding(
          padding: const EdgeInsets.only(top: (20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: primarycolor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Text(
                "Ma liste des Signalements",
                style: textstyle.copyWith(
                    fontSize: (18),
                    fontWeight: FontWeight.w700,
                    color: blackcolor),
              ),
              spaceLarge(30)
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: kgrey50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              spaceLong(20),
              Text(
                "Liste des signalements",
                style: textstyle.copyWith(
                    fontSize: (16),
                    fontWeight: FontWeight.w700,
                    color: pdarkcolor),
              ),
              spaceLong(20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return monSignalementItem(
                      context: context,
                      nom: data[index]['Nom'],
                      telephone: data[index]['Telephone'].toString(),
                      age: data[index]['Age'].toString(),
                      location: data[index]['Location'],
                      image: data[index]['Image'],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SignalementDetails(
                                      nom: data[index]['Nom'],
                                      telephone:
                                          data[index]['Telephone'].toString(),
                                      age: data[index]['Age'].toString(),
                                      location: data[index]['Location'],
                                      image: data[index]['Image'],
                                      description: data[index]['Description'],
                                    )));
                      },
                    );
                  }),
              spaceLong(15),
            ],
          ),
        ),
      )),
    );
  }
}
