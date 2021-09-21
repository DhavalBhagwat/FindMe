import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:findme/widgets/InfoSection.dart';
import 'package:findme/sync/NetworkService.dart';
import 'package:findme/widgets/LoadingIndicator.dart';
import 'package:findme/utils/Styles.dart';

class HomeActivity extends StatefulWidget {

  @override
  _HomeActivityState createState() => _HomeActivityState();

}

class _HomeActivityState extends State<HomeActivity> {

  String? _location = "", _timeZone = "", _isp = "", _ipAddress = "";
  double? _latitude = 0.0, _longitude = 0.0;
  TextEditingController? _controller;
  Future<void>? _get;

  @override
  void initState() {
    _controller = TextEditingController();
    _get = _getIPLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildBody(BuildContext context) => Stack(
    children: [
      Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pattern-bg.png"),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                  children: [
                    _buildTopBar(),
                    _buildSearchBar(),
                  ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: FutureBuilder<void>(
                future: _get,
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done ? FlutterMap(
                  options: MapOptions(
                    center: LatLng(_latitude!, _longitude!),
                    zoom: 12.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                      tileProvider: NonCachingNetworkTileProvider(),
                    ),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 20.0,
                          height: 20.0,
                          point:  LatLng(_latitude!, _longitude!),
                          builder: (ctx) => SvgPicture.asset("assets/icon-location.svg", semanticsLabel: 'Marker'
                          ),
                        ),
                      ],
                    ),
                  ],
                ): LoadingIndicator(),
              ),
            ),
          ),
        ],
      ),
      buildInfoCard()
    ],
  );

  Widget buildInfoCard() => Positioned(
      top: MediaQuery.of(context).size.height * 0.20,
      left: 20.0,
      right: 20.0,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoSection(title: "IP ADDRESS", value: _ipAddress),
                InfoSection(title: "LOCATION", value: _location),
                InfoSection(title: "TIME ZONE", value: _timeZone),
                InfoSection(title: "ISP", value: _isp),
              ],
            ),
          ),
      ),
  );

  PreferredSizeWidget _buildTopBar() => CupertinoNavigationBar(
    backgroundColor: Colors.transparent,
    border: Border(),
    middle: Text(
      'IP Address Tracker',
      style: Styles.titleStyle()
    ),
  );

  Widget _buildSearchBar() => Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(18.0),
      child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Material(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18.0),
                    bottomRight: Radius.circular(18.0)
                ),
                color: Colors.black,
                child: InkWell(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        bottomRight: Radius.circular(18.0)
                    ),
                    child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.0
                    ),
                    onTap: () {
                      _get = _getIPLocation();
                    }
                ),
              ),
              contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
              hintText: 'Search IP',
              hintStyle: Styles.searchStyle()
          ),
          keyboardType: TextInputType.visiblePassword
      ),
    ),
  );

  Future<void> _getIPLocation() async {
    await NetworkService.getInstance.getIPLocation(ipAddress: _controller!.value.text).then((location) {
      setState(() {
        _location = location?.city;
        _timeZone = location?.timeZone;
        _isp = location?.isp;
        _latitude = location?.latitude;
        _longitude = location?.longitude;
        _ipAddress = location?.ip;
      });
    });

  }

}

