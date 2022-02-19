import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/otp_veri_copy_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  ApiCallResponse apiCallOutput3;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.local_phone,
                            color: Color(0xFF999999),
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: GoogleFonts.getFont(
                                'Roboto',
                                color: Color(0xFF999999),
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Color(0xFF999999),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: StreamBuilder<List<UserRecord>>(
                    stream: queryUserRecord(),
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
                          if ((functions.mobileverify(textController.text)) !=
                              10) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Incorrect Mobile Number',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0x00000000),
                              ),
                            );
                          }
                          if ((functions.mobileverify(textController.text)) ==
                              10) {
                            await Future.delayed(
                                const Duration(milliseconds: 0));
                          } else {
                            return;
                          }
                          if ((functions.inlist(
                                  buttonUserRecordList
                                      .map((e) => e.phone)
                                      .toList(),
                                  textController.text)) ==
                              false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Account Does not exists Please create an Account',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF999999),
                              ),
                            );
                          }
                          if ((functions.inlist(
                                  buttonUserRecordList
                                      .map((e) => e.phone)
                                      .toList(),
                                  textController.text)) ==
                              true) {
                            apiCallOutput3 = await OtpverificationCall.call();
                            if (!apiCallOutput3.succeeded) {
                              return;
                            }
                          } else {
                            return;
                          }
                          setState(() => FFAppState().otp = getJsonField(
                                (apiCallOutput3?.jsonBody ?? ''),
                                r'''$.Otp''',
                              ).toString());
                          setState(
                              () => FFAppState().mobile = textController.text);
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: OtpVeriCopyWidget(),
                                ),
                              );
                            },
                          );

                          setState(() {});
                        },
                        text: 'Login',
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
                          borderRadius: 12,
                        ),
                      );
                    },
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
