import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_creams/models/ice_cream_model.dart';
import 'package:ice_creams/screens/ice_cream_details_screen.dart';
import 'package:ice_creams/utils/overlay_utility.dart';
import 'package:ice_creams/widgets/ice_cream_card.dart';

class IceCreamScreen extends StatefulWidget {
  const IceCreamScreen({super.key});

  @override
  State<IceCreamScreen> createState() => _IceCreamScreen();
}

class _IceCreamScreen extends State<IceCreamScreen> {
  IceCreamsData? decodedIceCreams;

  @override
  void initState() {
    super.initState();
    loadIceCreams();
  }

  Future<void> loadIceCreams() async {
    final rawIceCreams = await rootBundle.loadString("assets/ice-creams.json");
    setState(() {
      decodedIceCreams = iceCreamsDataFromJSON(rawIceCreams);
    });
  }

  void Function() onIceCreamTap(BuildContext context, int iceCreamIndex) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IceCreamDetailsScreen(
            iceCream: decodedIceCreams!.iceCreams[iceCreamIndex],
          ),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: OverlayUtility.getStatusBarOverlayStyles(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ice Creams",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "We have something yummy for you",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (decodedIceCreams != null)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    height:
                                        MediaQuery.sizeOf(context).height / 2.5,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      itemBuilder: (context, index) => SizedBox(
                                        width: 300,
                                        child: InkWell(
                                          onTap: onIceCreamTap(
                                            context,
                                            index,
                                          ),
                                          child: IceCreamCard(
                                            iceCream: decodedIceCreams!
                                                .iceCreams[index],
                                          ),
                                        ),
                                      ),
                                      itemCount:
                                          decodedIceCreams?.iceCreams.length ??
                                              0,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                ],
                              )
                            : const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
