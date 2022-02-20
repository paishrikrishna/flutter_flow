import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GymInfoWidget extends StatefulWidget {
  const GymInfoWidget({
    Key key,
    this.gym,
  }) : super(key: key);

  final String gym;

  @override
  _GymInfoWidgetState createState() => _GymInfoWidgetState();
}

class _GymInfoWidgetState extends State<GymInfoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GymRecord>>(
      stream: queryGymRecord(
        queryBuilder: (gymRecord) =>
            gymRecord.where('gym_id', isEqualTo: widget.gym),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<GymRecord> gymInfoGymRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final gymInfoGymRecord =
            gymInfoGymRecordList.isNotEmpty ? gymInfoGymRecordList.first : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 20, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      48, 10, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 13, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Text(
                                                'Gym Info',
                                                style: GoogleFonts.getFont(
                                                  'Roboto',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, -1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 20, 0),
                                    child: Icon(
                                      Icons.share_sharp,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final gymImages =
                          gymInfoGymRecord.images.toList()?.toList() ?? [];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(gymImages.length, (gymImagesIndex) {
                            final gymImagesItem = gymImages[gymImagesIndex];
                            return Image.network(
                              gymImagesItem,
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              fit: BoxFit.cover,
                            );
                          }),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  gymInfoGymRecord.name,
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'Address line 1\n',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Color(0xFF999999),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'Address line 2',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Color(0xFF999999),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    'City',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    ', ',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    'State',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'Pincode',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Color(0xFF999999),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Text(
                                      'View On Map',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Color(0xFFFF7600),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.location_on,
                                        color: Color(0xFF999999),
                                        size: 15,
                                      ),
                                    ),
                                    Text(
                                      'Distance',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Color(0xFF999999),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        'from your location',
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Color(0xFF999999),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 156,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFFCBE9FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                StreamBuilder<List<MembershipsRecord>>(
                                  stream: queryMembershipsRecord(
                                    queryBuilder: (membershipsRecord) =>
                                        membershipsRecord.where('gym_id',
                                            isEqualTo: widget.gym),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MembershipsRecord>
                                        textMembershipsRecordList =
                                        snapshot.data;
                                    return Text(
                                      formatNumber(
                                        textMembershipsRecordList.length,
                                        formatType: FormatType.compact,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  'Active Members',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 156,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFFCBE9FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '6am to 12pm',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Gym Timings',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
