import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceWidget extends StatefulWidget {
  const AttendanceWidget({Key key}) : super(key: key);

  @override
  _AttendanceWidgetState createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var attendance = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MembershipsRecord>>(
      stream: queryMembershipsRecord(
        queryBuilder: (membershipsRecord) =>
            membershipsRecord.where('user', isEqualTo: FFAppState().mobile),
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
        List<MembershipsRecord> attendanceMembershipsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        16, 16, 0, 17),
                                    child: Text(
                                      FFAppState().mobile,
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 14, 0),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE5E5E5),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                          size: 24,
                                        ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (functions.inlist(
                                  attendanceMembershipsRecordList
                                      .map((e) => e.user)
                                      .toList(),
                                  FFAppState().mobile) ??
                              true)
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.78,
                              child: Stack(
                                alignment: AlignmentDirectional(-1, 0),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    alignment: AlignmentDirectional(-1, 0),
                                    child:
                                        StreamBuilder<List<MembershipsRecord>>(
                                      stream: queryMembershipsRecord(
                                        queryBuilder: (membershipsRecord) =>
                                            membershipsRecord.where('user',
                                                isEqualTo: FFAppState().mobile),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<MembershipsRecord>
                                            columnMembershipsRecordList =
                                            snapshot.data;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                              columnMembershipsRecordList
                                                  .length, (columnIndex) {
                                            final columnMembershipsRecord =
                                                columnMembershipsRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 16, 0),
                                                    child: StreamBuilder<
                                                        List<GymRecord>>(
                                                      stream: queryGymRecord(
                                                        queryBuilder: (gymRecord) =>
                                                            gymRecord.where(
                                                                'gym_id',
                                                                isEqualTo:
                                                                    columnMembershipsRecord
                                                                        .gymId),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<GymRecord>
                                                            rowGymRecordList =
                                                            snapshot.data;
                                                        // Return an empty Container when the document does not exist.
                                                        if (snapshot
                                                            .data.isEmpty) {
                                                          return Container();
                                                        }
                                                        final rowGymRecord =
                                                            rowGymRecordList
                                                                    .isNotEmpty
                                                                ? rowGymRecordList
                                                                    .first
                                                                : null;
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.network(
                                                                rowGymRecord
                                                                    .thumbnail,
                                                                width: 75,
                                                                height: 100,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.7,
                                                                    height:
                                                                        44.5,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              19,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            rowGymRecord.name,
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Roboto',
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width,
                                                                            height:
                                                                                19,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              rowGymRecord.area,
                                                                              style: GoogleFonts.getFont(
                                                                                'Roboto',
                                                                                color: Color(0xFF666666),
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            8),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.7,
                                                                      height: 1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              Color(0xFFCCCCCC),
                                                                          width:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              -1),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.7,
                                                                    height:
                                                                        44.5,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                ),
                                                                                child: Text(
                                                                                  'Membership',
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Roboto',
                                                                                    color: Color(0xFF666666),
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                child: Container(
                                                                                  width: 66,
                                                                                  height: 18,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x1A009306),
                                                                                    borderRadius: BorderRadius.circular(9),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                  child: Text(
                                                                                    'Active',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: GoogleFonts.getFont(
                                                                                      'Roboto',
                                                                                      color: Color(0xFF009306),
                                                                                      fontSize: 12,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1,
                                                                              0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                5,
                                                                                0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  child: Text(
                                                                                    'Valid Till',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: GoogleFonts.getFont(
                                                                                      'Roboto',
                                                                                      color: Color(0xFF666666),
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontSize: 16,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                    child: Text(
                                                                                      columnMembershipsRecord.valid,
                                                                                      style: GoogleFonts.getFont(
                                                                                        'Roboto',
                                                                                        color: Colors.black,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16,
                                                                    16.51,
                                                                    16,
                                                                    0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Recent Visits',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Roboto',
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: StreamBuilder<
                                                            List<
                                                                AttendanceRecord>>(
                                                          stream:
                                                              queryAttendanceRecord(
                                                            queryBuilder: (attendanceRecord) => attendanceRecord
                                                                .where('gym_id',
                                                                    isEqualTo:
                                                                        columnMembershipsRecord
                                                                            .gymId)
                                                                .where('user',
                                                                    isEqualTo:
                                                                        FFAppState()
                                                                            .mobile)
                                                                .where('date',
                                                                    isLessThanOrEqualTo:
                                                                        columnMembershipsRecord
                                                                            .valid)
                                                                .where('date',
                                                                    isGreaterThanOrEqualTo:
                                                                        columnMembershipsRecord
                                                                            .validFrom),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AttendanceRecord>
                                                                columnAttendanceRecordList =
                                                                snapshot.data;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  columnAttendanceRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnAttendanceRecord =
                                                                    columnAttendanceRecordList[
                                                                        columnIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        3.28,
                                                                    height: 19,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              328,
                                                                          height:
                                                                              20,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            border:
                                                                                Border.all(
                                                                              color: Colors.white,
                                                                              width: 0,
                                                                            ),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  columnAttendanceRecord.date,
                                                                                  'No Visits So Far',
                                                                                ),
                                                                                style: GoogleFonts.getFont(
                                                                                  'Roboto',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                                                                child: Text(
                                                                                  columnAttendanceRecord.day,
                                                                                  style: GoogleFonts.getFont(
                                                                                    'Roboto',
                                                                                    color: Colors.black,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                ',',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Roboto',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                columnAttendanceRecord.time,
                                                                                style: GoogleFonts.getFont(
                                                                                  'Roboto',
                                                                                  color: Colors.black,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 8,
                                                                    16, 8),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF999999),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFCCCCCC),
                                                              width: 5,
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, -1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 18, 27),
                                      child: InkWell(
                                        onTap: () async {
                                          attendance =
                                              await FlutterBarcodeScanner
                                                  .scanBarcode(
                                            '#C62828', // scanning line color
                                            'Cancel', // cancel button text
                                            true, // whether to show the flash icon
                                            ScanMode.QR,
                                          );
                                          if (functions.inlist(
                                              attendanceMembershipsRecordList
                                                  .map((e) => e.gymId)
                                                  .toList(),
                                              attendance)) {
                                            final attendanceCreateData =
                                                createAttendanceRecordData(
                                              date: dateTimeFormat(
                                                  'yMMMd', getCurrentTimestamp),
                                              day: dateTimeFormat(
                                                  'EEEE', getCurrentTimestamp),
                                              gymId: attendance,
                                              time: dateTimeFormat(
                                                  'jms', getCurrentTimestamp),
                                              user: FFAppState().mobile,
                                            );
                                            await AttendanceRecord.collection
                                                .doc()
                                                .set(attendanceCreateData);
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 208,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF9D49),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.qr_code_scanner,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14, 0, 0, 0),
                                                  child: Text(
                                                    'Mark Attendance',
                                                    textAlign: TextAlign.end,
                                                    style: GoogleFonts.getFont(
                                                      'Roboto',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (!(functions.inlist(
                                  attendanceMembershipsRecordList
                                      .map((e) => e.user)
                                      .toList(),
                                  FFAppState().mobile)) ??
                              true)
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.76,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ask your gym admin to scan this',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Image.network(
                                      functions
                                          .qrgenerator(FFAppState().mobile),
                                      width: 278,
                                      height: 278,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 38, 0, 0),
                                    child: Text(
                                      'You have no active membership?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      'Click here to find gyms nearby',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        color: Color(0xFFFF7600),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
