import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'main_home_page_model.dart';
export 'main_home_page_model.dart';

class MainHomePageWidget extends StatefulWidget {
  const MainHomePageWidget({
    super.key,
    int? tabNumber,
  })  : tabNumber = tabNumber ?? 0;

  final int tabNumber;

  @override
  _MainHomePageWidgetState createState() => _MainHomePageWidgetState();
}

class _MainHomePageWidgetState extends State<MainHomePageWidget>
    with TickerProviderStateMixin {
  late MainHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.requestNotificationPermissions();
      await requestPermission(notificationsPermission);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: min(
          valueOrDefault<int>(
            widget.tabNumber,
            0,
          ),
          3),
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFDBE0EB),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [
            Align(
              alignment: const AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primaryBtnText,
                  borderRadius: 15.0,
                  borderWidth: 0.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    context.pushNamed(
                      'taskCreatorPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                ),
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Time Tracker Pro',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
            titlePadding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 15.0),
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => GradientText(
                            'Hello ${valueOrDefault<String>(
                              currentUserDisplayName,
                              'Naveen',
                            )},'
                                .maybeHandleOverflow(
                              maxChars: 50,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 30.0,
                                ),
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              const Color(0xFFE0E0DE)
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.00, -1.00),
                  child: ClipRRect(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(-1.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 12.0, 0.0),
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              unselectedLabelStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: const [
                                Tab(
                                  text: 'Active Tasks',
                                ),
                                Tab(
                                  text: 'Upcomming Tasks',
                                ),
                                Tab(
                                  text: 'Completed Task',
                                ),
                                Tab(
                                  text: 'Incomplete Task',
                                ),
                              ],
                              controller: _model.tabBarController,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                    child: PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        UserTasksRecord>.separated(
                                      pagingController:
                                          _model.setListViewController1(
                                        UserTasksRecord.collection
                                            .where(
                                              'status',
                                              isEqualTo: 'Started',
                                            )
                                            .orderBy('start_time',
                                                descending: true),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        5.0,
                                        0,
                                        60.0,
                                      ),
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 5.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              UserTasksRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewUserTasksRecord = _model
                                              .listViewPagingController1!
                                              .itemList![listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: const Color(0x4C090250),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (listViewUserTasksRecord
                                                              .status !=
                                                          'Completed') {
                                                        // ViewTaskPageAction

                                                        context.pushNamed(
                                                          'ViewTaskPage',
                                                          queryParameters: {
                                                            'taskId':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskId,
                                                              ParamType.String,
                                                            ),
                                                            'taskName':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskName,
                                                              ParamType.String,
                                                            ),
                                                            'description':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .description,
                                                              ParamType.String,
                                                            ),
                                                            'comments':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .comments,
                                                              ParamType.String,
                                                            ),
                                                            'startTime':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .startTime,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'status':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .status,
                                                              ParamType.String,
                                                            ),
                                                            'taskReference':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'id':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference.id,
                                                              ParamType.String,
                                                            ),
                                                            'tabIndex':
                                                                serializeParam(
                                                              _model
                                                                  .tabBarCurrentIndex,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          'taskCompletionPage',
                                                          queryParameters: {
                                                            'rewardPoints':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .rewardPoints,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: Slidable(
                                                      endActionPane: ActionPane(
                                                        motion:
                                                            const ScrollMotion(),
                                                        extentRatio: 0.25,
                                                        children: [
                                                          SlidableAction(
                                                            label: 'Delete',
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            icon: Icons
                                                                .delete_forever,
                                                            onPressed:
                                                                (_) async {
                                                              await listViewUserTasksRecord
                                                                  .reference
                                                                  .delete();

                                                              context.goNamed(
                                                                'mainHomePage',
                                                                queryParameters:
                                                                    {
                                                                  'tabNumber':
                                                                      serializeParam(
                                                                    2,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.task,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                        title: Text(
                                                          listViewUserTasksRecord.taskName,
                                                          style: const TextStyle(
                                                            color: Color(
                                                                0xF80D0B0B),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          dateTimeFormat(
                                                                  'M/d/y h:mm a',
                                                                  listViewUserTasksRecord
                                                                      .startTime!)
                                                              .maybeHandleOverflow(
                                                            maxChars: 50,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        trailing: FaIcon(
                                                          FontAwesomeIcons
                                                              .angleRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: true,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                    child: PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        UserTasksRecord>.separated(
                                      pagingController:
                                          _model.setListViewController2(
                                        UserTasksRecord.collection
                                            .where(
                                              'status',
                                              isEqualTo: 'Initiated',
                                            )
                                            .where(
                                              'start_time',
                                              isGreaterThanOrEqualTo:
                                                  getCurrentTimestamp,
                                            )
                                            .orderBy('start_time',
                                                descending: true),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        5.0,
                                        0,
                                        60.0,
                                      ),
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 5.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              UserTasksRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewUserTasksRecord = _model
                                              .listViewPagingController2!
                                              .itemList![listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: const Color(0x4C090250),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (listViewUserTasksRecord
                                                              .status !=
                                                          'Completed') {
                                                        // ViewTaskPageAction

                                                        context.pushNamed(
                                                          'ViewTaskPage',
                                                          queryParameters: {
                                                            'taskId':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskId,
                                                              ParamType.String,
                                                            ),
                                                            'taskName':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskName,
                                                              ParamType.String,
                                                            ),
                                                            'description':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .description,
                                                              ParamType.String,
                                                            ),
                                                            'comments':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .comments,
                                                              ParamType.String,
                                                            ),
                                                            'startTime':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .startTime,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'status':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .status,
                                                              ParamType.String,
                                                            ),
                                                            'taskReference':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'id':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference.id,
                                                              ParamType.String,
                                                            ),
                                                            'tabIndex':
                                                                serializeParam(
                                                              _model
                                                                  .tabBarCurrentIndex,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          'taskCompletionPage',
                                                          queryParameters: {
                                                            'rewardPoints':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .rewardPoints,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: Slidable(
                                                      endActionPane: ActionPane(
                                                        motion:
                                                            const ScrollMotion(),
                                                        extentRatio: 0.25,
                                                        children: [
                                                          SlidableAction(
                                                            label: 'Delete',
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            icon: Icons
                                                                .delete_forever,
                                                            onPressed:
                                                                (_) async {
                                                              await listViewUserTasksRecord
                                                                  .reference
                                                                  .delete();

                                                              context.goNamed(
                                                                'mainHomePage',
                                                                queryParameters:
                                                                    {
                                                                  'tabNumber':
                                                                      serializeParam(
                                                                    2,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.task,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                        title: Text(
                                                          listViewUserTasksRecord.taskName,
                                                          style: const TextStyle(
                                                            color: Color(
                                                                0xF80D0B0B),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          dateTimeFormat(
                                                                  'M/d/y h:mm a',
                                                                  listViewUserTasksRecord
                                                                      .startTime!)
                                                              .maybeHandleOverflow(
                                                            maxChars: 50,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        trailing: FaIcon(
                                                          FontAwesomeIcons
                                                              .angleRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: true,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                    child: PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        UserTasksRecord>.separated(
                                      pagingController:
                                          _model.setListViewController3(
                                        UserTasksRecord.collection
                                            .where(
                                              'status',
                                              isEqualTo: 'Completed',
                                            )
                                            .orderBy('start_time',
                                                descending: true),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        5.0,
                                        0,
                                        60.0,
                                      ),
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 5.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              UserTasksRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewUserTasksRecord = _model
                                              .listViewPagingController3!
                                              .itemList![listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: const Color(0x4C090250),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (listViewUserTasksRecord
                                                              .status !=
                                                          'Completed') {
                                                        // ViewTaskPageAction

                                                        context.pushNamed(
                                                          'ViewTaskPage',
                                                          queryParameters: {
                                                            'taskId':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskId,
                                                              ParamType.String,
                                                            ),
                                                            'taskName':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskName,
                                                              ParamType.String,
                                                            ),
                                                            'description':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .description,
                                                              ParamType.String,
                                                            ),
                                                            'comments':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .comments,
                                                              ParamType.String,
                                                            ),
                                                            'startTime':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .startTime,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'status':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .status,
                                                              ParamType.String,
                                                            ),
                                                            'taskReference':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'id':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference.id,
                                                              ParamType.String,
                                                            ),
                                                            'tabIndex':
                                                                serializeParam(
                                                              _model
                                                                  .tabBarCurrentIndex,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          'taskCompletionPage',
                                                          queryParameters: {
                                                            'rewardPoints':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .rewardPoints,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: Slidable(
                                                      endActionPane: ActionPane(
                                                        motion:
                                                            const ScrollMotion(),
                                                        extentRatio: 0.25,
                                                        children: [
                                                          SlidableAction(
                                                            label: 'Delete',
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            icon: Icons
                                                                .delete_forever,
                                                            onPressed:
                                                                (_) async {
                                                              await listViewUserTasksRecord
                                                                  .reference
                                                                  .delete();

                                                              context.goNamed(
                                                                'mainHomePage',
                                                                queryParameters:
                                                                    {
                                                                  'tabNumber':
                                                                      serializeParam(
                                                                    2,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.task,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                        title: Text(
                                                          listViewUserTasksRecord.taskName,
                                                          style: const TextStyle(
                                                            color: Color(
                                                                0xF80D0B0B),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          dateTimeFormat(
                                                                  'M/d/y h:mm a',
                                                                  listViewUserTasksRecord
                                                                      .startTime!)
                                                              .maybeHandleOverflow(
                                                            maxChars: 50,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        trailing: FaIcon(
                                                          FontAwesomeIcons
                                                              .angleRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: true,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                    child: PagedListView<
                                        DocumentSnapshot<Object?>?,
                                        UserTasksRecord>.separated(
                                      pagingController:
                                          _model.setListViewController4(
                                        UserTasksRecord.collection
                                            .where(
                                              'start_time',
                                              isLessThan: getCurrentTimestamp,
                                            )
                                            .orderBy('start_time',
                                                descending: true),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        5.0,
                                        0,
                                        60.0,
                                      ),
                                      shrinkWrap: true,
                                      reverse: false,
                                      scrollDirection: Axis.vertical,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 5.0),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              UserTasksRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),

                                        itemBuilder:
                                            (context, _, listViewIndex) {
                                          final listViewUserTasksRecord = _model
                                              .listViewPagingController4!
                                              .itemList![listViewIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: const Color(0x4C090250),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (listViewUserTasksRecord
                                                              .status !=
                                                          'Completed') {
                                                        // ViewTaskPageAction

                                                        context.pushNamed(
                                                          'ViewTaskPage',
                                                          queryParameters: {
                                                            'taskId':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskId,
                                                              ParamType.String,
                                                            ),
                                                            'taskName':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .taskName,
                                                              ParamType.String,
                                                            ),
                                                            'description':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .description,
                                                              ParamType.String,
                                                            ),
                                                            'comments':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .comments,
                                                              ParamType.String,
                                                            ),
                                                            'startTime':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .startTime,
                                                              ParamType
                                                                  .DateTime,
                                                            ),
                                                            'status':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .status,
                                                              ParamType.String,
                                                            ),
                                                            'taskReference':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'id':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .reference.id,
                                                              ParamType.String,
                                                            ),
                                                            'tabIndex':
                                                                serializeParam(
                                                              _model
                                                                  .tabBarCurrentIndex,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          'taskCompletionPage',
                                                          queryParameters: {
                                                            'rewardPoints':
                                                                serializeParam(
                                                              listViewUserTasksRecord
                                                                  .rewardPoints,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: Slidable(
                                                      endActionPane: ActionPane(
                                                        motion:
                                                            const ScrollMotion(),
                                                        extentRatio: 0.25,
                                                        children: [
                                                          SlidableAction(
                                                            label: 'Delete',
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            icon: Icons
                                                                .delete_forever,
                                                            onPressed:
                                                                (_) async {
                                                              await listViewUserTasksRecord
                                                                  .reference
                                                                  .delete();

                                                              context.goNamed(
                                                                'mainHomePage',
                                                                queryParameters:
                                                                    {
                                                                  'tabNumber':
                                                                      serializeParam(
                                                                    2,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.task,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                        title: Text(
                                                          listViewUserTasksRecord.taskName,
                                                          style: const TextStyle(
                                                            color: Color(
                                                                0xF80D0B0B),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18.0,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          dateTimeFormat(
                                                                  'M/d/y h:mm a',
                                                                  listViewUserTasksRecord
                                                                      .startTime!)
                                                              .maybeHandleOverflow(
                                                            maxChars: 50,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                        trailing: FaIcon(
                                                          FontAwesomeIcons
                                                              .angleRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: true,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
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
    );
  }
}
