
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:govidiriya/Models/fetch_weather.dart';
import 'package:govidiriya/Models/mediaquery.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custom_text.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/custome_sizebox.dart';
import 'package:govidiriya/Widgets/CustomHomeWidgets/custom_weather_icon.dart';
import 'package:govidiriya/Widgets/CustomHomeWidgets/new_loading.dart';
import 'package:govidiriya/constants/colors.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late Future<Weather> _futureWeather;
  @override
  void initState() {
    super.initState();
    _futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    //final timeProvider = Provider.of<NewDateTime>(context, listen: false);
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<Weather>(
              future: _futureWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GlassmorphicContainer(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaResponsive().getWidth(context) * 0.9,
                    borderRadius: 15,
                    blur: 10,
                    alignment: Alignment.center,
                    border: 2,
                    linearGradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white38.withOpacity(0.2)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderGradient: LinearGradient(colors: [
                      Colors.white24.withOpacity(0.2),
                      Colors.white70.withOpacity(0.2)
                    ]),
                    height: MediaResponsive().getheight(context) * 0.2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaResponsive().getWidth(context) * 0.05,
                          vertical:
                              MediaResponsive().getheight(context) * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage: snapshot.data!.weather[0]
                                            ['main'] ==
                                        "Clouds"
                                    ? const AssetImage("assets/cloudy.gif")
                                    : const AssetImage("assets/rainy.gif"),
                              ),
                              //Image.asset("assets/rainy.gif"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    textAlign: TextAlign.end,
                                    color: kBlack,
                                    text: snapshot.data!.name,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                      color: kBlack,
                                      text:
                                          "Today is a ${snapshot.data!.weather[0]['main']} Day"),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    MediaResponsive().getWidth(context) * 0.15,
                                child: CustomText(
                                  color: kBlack,
                                  text: snapshot.data!.main.temp.toString() +
                                      "\u00B0 C",
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaResponsive().getWidth(context) * 0.6,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    CustomWeatherIcon(
                                      imagePath: "assets/cloudy.gif",
                                      day: "Mon",
                                      temp: 45,
                                    ),
                                    CustomWeatherIcon(
                                      imagePath: "assets/sunny.gif",
                                      day: "Tue",
                                      temp: 35,
                                    ),
                                    CustomWeatherIcon(
                                      imagePath: "assets/thunder.gif",
                                      day: "Wed",
                                      temp: 43,
                                    ),
                                    CustomWeatherIcon(
                                      imagePath: "assets/rainy.gif",
                                      day: "Thu",
                                      temp: 52,
                                    ),
                                    CustomWeatherIcon(
                                      imagePath: "assets/cloudy.gif",
                                      day: "Fri",
                                      temp: 41,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // child: SizedBox(
                    //     width: MediaResponsive().getWidth(context) * 0.9,
                    //     //height: MediaResponsive().getheight(context) * 0.13,

                    //     child: Center(
                    //       child: Column(
                    //         children: [
                    //           Text(
                    //             "${timeProvider.now.hour} : ${timeProvider.now.minute}",
                    //             style: const TextStyle(
                    //               color: primaryColor,
                    //               fontSize: 25,
                    //             ),
                    //           ),
                    //           Text(
                    //             "${timeProvider.now.year} - ${timeProvider.now.month} - ${timeProvider.now.day}",
                    //             style: const TextStyle(
                    //               color: primaryColor,
                    //               fontSize: 20,
                    //             ),
                    //           ),
                    //           // Text(
                    //           //   "City ${snapshot.data!.name}",
                    //           //   style: const TextStyle(color: primaryColor),
                    //           // ),
                    //           Text(
                    //             "temp ${snapshot.data!.main.temp}",
                    //             style: const TextStyle(
                    //                 fontSize: 15,
                    //                 color: primaryColor,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             "Weather ${snapshot.data!.weather[0]['main']}",
                    //             style: const TextStyle(
                    //                 color: primaryColor,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //     )),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return Column(
                  children: const [
                    CustomHBox(
                      w: 1,
                      h: 0.05,
                    ),
                    NewLoading(),
                    CustomHBox(
                      w: 1,
                      h: 0.02,
                    ),
                    CustomText(
                      color: kBlack,
                      text: "Fetching weather please wait",
                      fontWeight: FontWeight.bold,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
