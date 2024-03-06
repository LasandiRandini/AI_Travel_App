import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'start_page_widget.dart' show StartPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartPageModel extends FlutterFlowModel<StartPageWidget> {
  ///  Local state fields for this page.

  bool? lightMode;

  String travelPrompt = 'hi';

  String travelPlan = 'hi';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Destination widget.
  FocusNode? destinationFocusNode;
  TextEditingController? destinationController;
  String? Function(BuildContext, String?)? destinationControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for StartDate widget.
  FocusNode? startDateFocusNode;
  TextEditingController? startDateController;
  String? Function(BuildContext, String?)? startDateControllerValidator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // State field(s) for EndDate widget.
  FocusNode? endDateFocusNode;
  TextEditingController? endDateController;
  String? Function(BuildContext, String?)? endDateControllerValidator;
  // State field(s) for budget widget.
  FocusNode? budgetFocusNode;
  TextEditingController? budgetController;
  String? Function(BuildContext, String?)? budgetControllerValidator;
  // State field(s) for interests widget.
  FormFieldController<List<String>>? interestsValueController;
  List<String>? get interestsValues => interestsValueController?.value;
  set interestsValues(List<String>? val) =>
      interestsValueController?.value = val;
  // Stores action output result for [Backend Call - API (Send Full Prompt)] action in Button widget.
  ApiCallResponse? chatResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    destinationFocusNode?.dispose();
    destinationController?.dispose();

    startDateFocusNode?.dispose();
    startDateController?.dispose();

    endDateFocusNode?.dispose();
    endDateController?.dispose();

    budgetFocusNode?.dispose();
    budgetController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
