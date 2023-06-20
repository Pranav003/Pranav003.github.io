import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GrowthtrackerloginpageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Weightatbirth widget.
  TextEditingController? weightatbirthController;
  String? Function(BuildContext, String?)? weightatbirthControllerValidator;
  // State field(s) for Heightatbirth widget.
  TextEditingController? heightatbirthController;
  String? Function(BuildContext, String?)? heightatbirthControllerValidator;
  // State field(s) for headcircumference widget.
  TextEditingController? headcircumferenceController;
  String? Function(BuildContext, String?)? headcircumferenceControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    weightatbirthController?.dispose();
    heightatbirthController?.dispose();
    headcircumferenceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
