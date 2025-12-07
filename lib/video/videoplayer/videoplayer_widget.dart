import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/video/postvideo/postvideo_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'videoplayer_model.dart';
export 'videoplayer_model.dart';

/// Create a page of video page, video then title 1 per row and good design
class VideoplayerWidget extends StatefulWidget {
  const VideoplayerWidget({
    super.key,
    required this.parameter1,
  });

  final DocumentReference? parameter1;

  static String routeName = 'videoplayer';
  static String routePath = '/videoplayer';

  @override
  State<VideoplayerWidget> createState() => _VideoplayerWidgetState();
}

class _VideoplayerWidgetState extends State<VideoplayerWidget> {
  late VideoplayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoplayerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FeedsRecord>(
      stream: FeedsRecord.getDocument(widget.parameter1!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
              ),
            ),
          );
        }

        final videoplayerFeedsRecord = snapshot.data!;

        return YoutubeFullScreenWrapper(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              floatingActionButton: Visibility(
                visible: currentUserEmail == 'gareshahada@gmail.com',
                child: FloatingActionButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 300.0,
                                child: PostvideoWidget(),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  child: Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '0c5frluo' /* Garee Shahadaa Watch */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.outfit(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: FlutterFlowAdBanner(
                        showsTestAd: false,
                        androidAdUnitID:
                            'ca-app-pub-3940256099942544/9214589741',
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 370.0,
                            minHeight: 242.0,
                            maxWidth: 800.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x0E6F61EF),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowYoutubePlayer(
                                  url: videoplayerFeedsRecord.vidoelink,
                                  autoPlay: false,
                                  looping: true,
                                  mute: false,
                                  showControls: true,
                                  showFullScreen: true,
                                  strictRelatedVideos: true,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: GradientText(
                                    valueOrDefault<String>(
                                      videoplayerFeedsRecord.title,
                                      ' How to Win Friends and Influence People in 50 Minutes',
                                    ).maybeHandleOverflow(
                                      maxChars: 150,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                    colors: [
                                      FlutterFlowTheme.of(context).alternate,
                                      FlutterFlowTheme.of(context).alternate,
                                      Color(0xFFABA2F7)
                                    ],
                                    gradientDirection: GradientDirection.ltr,
                                    gradientType: GradientType.linear,
                                  ),
                                ),
                              ].divide(SizedBox(height: 15.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (currentUserEmail == 'gareshahadaa@gmail.com')
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 49.49,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.restore_from_trash_outlined,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await videoplayerFeedsRecord.reference.delete();

                          context.pushNamed(
                            FeedsWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        },
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                      child: FlutterFlowAdBanner(
                        showsTestAd: false,
                        androidAdUnitID:
                            'ca-app-pub-3940256099942544/9214589741',
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                      child: FlutterFlowAdBanner(
                        showsTestAd: false,
                        androidAdUnitID:
                            'ca-app-pub-3940256099942544/9214589741',
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                      child: FlutterFlowAdBanner(
                        showsTestAd: false,
                        androidAdUnitID:
                            'ca-app-pub-3940256099942544/9214589741',
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
