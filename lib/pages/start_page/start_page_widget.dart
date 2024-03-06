import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({super.key});

  @override
  State<StartPageWidget> createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.lightMode = false;
      });
    });

    _model.destinationController ??= TextEditingController();
    _model.destinationFocusNode ??= FocusNode();

    _model.startDateController ??= TextEditingController(
        text: _model.calendarSelectedDay1?.start?.toString());
    _model.startDateFocusNode ??= FocusNode();

    _model.endDateController ??= TextEditingController(
        text: _model.calendarSelectedDay2?.start?.toString());
    _model.endDateFocusNode ??= FocusNode();

    _model.budgetController ??= TextEditingController();
    _model.budgetFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
                  context: context,
                  desktop: false,
                ) &&
                (MediaQuery.sizeOf(context).width >= 768.0)
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'Welcome',
                  style: FlutterFlowTheme.of(context).displaySmall,
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Container(
                width: 100.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            Expanded(
              flex: 8,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 16.0, 4.0, 70.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                  ))
                                    Container(
                                      width: 400.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Travel Details',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium,
                                      ),
                                      ToggleIcon(
                                        onPressed: () async {
                                          setState(() => _model.lightMode =
                                              !_model.lightMode!);
                                          if (Theme.of(context).brightness ==
                                              Brightness.dark) {
                                            setDarkModeSetting(
                                                context, ThemeMode.light);
                                          } else {
                                            setDarkModeSetting(
                                                context, ThemeMode.dark);
                                          }
                                        },
                                        value: _model.lightMode!,
                                        onIcon: Icon(
                                          Icons.nights_stay_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.lightbulb_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Fill out the information below in order to help us better understand your situation.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.destinationController,
                                      focusNode: _model.destinationFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Your Destination',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                      validator: _model
                                          .destinationControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 4.0),
                                    child: Text(
                                      'Enter the dates for your travel',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  FlutterFlowCalendar(
                                    color: Color(0xFF6FAEA3),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: true,
                                    weekStartsMonday: false,
                                    rowHeight: 64.0,
                                    onChange:
                                        (DateTimeRange? newSelectedDate) async {
                                      if (_model.calendarSelectedDay1 ==
                                          newSelectedDate) {
                                        return;
                                      }
                                      _model.calendarSelectedDay1 =
                                          newSelectedDate;
                                      setState(() {
                                        _model.startDateController?.text =
                                            dateTimeFormat(
                                                'yMMMd',
                                                _model.calendarSelectedDay1!
                                                    .start);
                                      });
                                      setState(() {});
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                    dayOfWeekStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    dateStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.startDateController,
                                      focusNode: _model.startDateFocusNode,
                                      autofocus: true,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Start Date',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      validator: _model
                                          .startDateControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: FlutterFlowCalendar(
                                      color: Color(0xFF60AE9F),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      weekFormat: true,
                                      weekStartsMonday: false,
                                      rowHeight: 64.0,
                                      onChange: (DateTimeRange?
                                          newSelectedDate) async {
                                        if (_model.calendarSelectedDay2 ==
                                            newSelectedDate) {
                                          return;
                                        }
                                        _model.calendarSelectedDay2 =
                                            newSelectedDate;
                                        setState(() {
                                          _model.endDateController?.text =
                                              dateTimeFormat(
                                                  'yMMMd',
                                                  _model.calendarSelectedDay2!
                                                      .start);
                                        });
                                        setState(() {});
                                      },
                                      titleStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                      dayOfWeekStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge,
                                      dateStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      selectedDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleSmall,
                                      inactiveDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: TextFormField(
                                      controller: _model.endDateController,
                                      focusNode: _model.endDateFocusNode,
                                      autofocus: true,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'End Date',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      validator: _model
                                          .endDateControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 4.0),
                                    child: Text(
                                      'Specify your budget(in USD)  for the travel.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.budgetController,
                                      focusNode: _model.budgetFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '500',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      minLines: 1,
                                      validator: _model
                                          .budgetControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 4.0),
                                    child: Text(
                                      'Interests/Activities',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 12.0),
                                    child: Text(
                                      'Please select all kind of activities you want to do.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Adventure'),
                                        ChipData('Shopping'),
                                        ChipData('Culture'),
                                        ChipData('Nature')
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.interestsValues = val);
                                        context.pushNamed(
                                          'TravelPage',
                                          queryParameters: {
                                            'destination': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'startDate': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'endDate': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'budget': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'travelPlan': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary30,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .lineColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                      ),
                                      chipSpacing: 16.0,
                                      rowSpacing: 12.0,
                                      multiselect: true,
                                      initialized:
                                          _model.interestsValues != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.interestsValueController ??=
                                              FormFieldController<List<String>>(
                                        ['Adventure'],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 44.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              setState(() {
                                                _model.travelPrompt = '';
                                              });
                                              _model.chatResponse =
                                                  await OpenAIChatGPTGroup
                                                      .sendFullPromptCall
                                                      .call(
                                                apiKey:
                                                    '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',
                                                promptJson:
                                                    functions.convertToJSON(
                                                        _model.travelPrompt),
                                              );
                                              if ((_model.chatResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() {
                                                  _model.travelPlan = '';
                                                });

                                                context.pushNamed(
                                                  'TravelPage',
                                                  queryParameters: {
                                                    'destination':
                                                        serializeParam(
                                                      _model
                                                          .destinationController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'startDate': serializeParam(
                                                      _model.startDateController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'endDate': serializeParam(
                                                      _model.endDateController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'budget': serializeParam(
                                                      _model.budgetController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'travelPlan':
                                                        serializeParam(
                                                      '',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Something went wrong'),
                                                      content: Text(
                                                          'We were not able to genetare travel plan for you.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              setState(() {});
                                            },
                                            text: 'Generate Your Travel Plan',
                                            options: FFButtonOptions(
                                              height: 45.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Container(
                width: 100.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 500),
                fadeOutDuration: Duration(milliseconds: 500),
                imageUrl:
                    'https://images.unsplash.com/photo-1439853949127-fa647821eba0?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: 630.0,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
