import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVeriCopyWidget extends StatefulWidget {
  const OtpVeriCopyWidget({Key key}) : super(key: key);

  @override
  _OtpVeriCopyWidgetState createState() => _OtpVeriCopyWidgetState();
}

class _OtpVeriCopyWidgetState extends State<OtpVeriCopyWidget> {
  TextEditingController textController;
  bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 29, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OTP SENT TO  ',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFAppState().mobile,
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(58, 33, 58, 0),
                  child: TextFormField(
                    controller: textController,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Enter 6 digits code',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                  child: StreamBuilder<List<UserRecord>>(
                    stream: queryUserRecord(
                      queryBuilder: (userRecord) => userRecord.where('phone',
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<UserRecord> buttonUserRecordList = snapshot.data;
                      return FFButtonWidget(
                        onPressed: () async {
                          if ((FFAppState().otp) != (textController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'OTP Incorrect',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2200),
                                backgroundColor: Color(0xFF999999),
                              ),
                            );
                          }
                          if ((FFAppState().otp) == (textController.text)) {
                            setState(() => FFAppState().uasd = true);
                          } else {
                            return;
                          }
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NavBarPage(initialPage: 'HomePage'),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Verify',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: Color(0xFFFF9D49),
                          textStyle: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 5,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
