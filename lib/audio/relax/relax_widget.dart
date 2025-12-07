import '/audio/adda_audio/adda_audio_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'relax_model.dart';
export 'relax_model.dart';

/// Create a page of audio player page that will use list and audio widget
class RelaxWidget extends StatefulWidget {
  const RelaxWidget({super.key});

  static String routeName = 'relax';
  static String routePath = '/relax';

  @override
  State<RelaxWidget> createState() => _RelaxWidgetState();
}

class _RelaxWidgetState extends State<RelaxWidget> {
  late RelaxModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelaxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Visibility(
          visible: currentUserEmail == 'gareshahadaa@gmail.com',
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
                        child: AddaAudioWidget(),
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
          title: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '8efgw3fe' /* Garee Shahadaa Relax */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 11.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.settings_sharp,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () async {
                  context.pushNamed(SettingsWidget.routeName);
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowAdBanner(
                  showsTestAd: false,
                  androidAdUnitID: 'ca-app-pub-3940256099942544/9214589741',
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 200.0,
                    constraints: BoxConstraints(
                      maxWidth: 755.0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        alignment: AlignmentDirectional(1.0, 0.0),
                        image: Image.asset(
                          'assets/images/dreamina-2025-10-27-4049-try_to_regenrate_this_image_in_best_way_...-removebg-preview.png',
                        ).image,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'klmu2zaf' /* Please close one
player when
o... */
                                ,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 44.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    constraints: BoxConstraints(
                      maxWidth: 755.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/surah_Yunus_(1).mp3',
                                  metas: Metas(
                                    id: 'surah_Yunus_(1).mp3-9ce26954',
                                    title: 'Surah Yunus',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFDFDFDF),
                                elevation: 0.0,
                                pauseOnNavigate: false,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/surah_meryam_(1).mp3',
                                  metas: Metas(
                                    id: 'surah_meryam_(1).mp3-2ff99d51',
                                    title: 'Surah Maryam',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFDCDCDC),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/muuminun.mp3',
                                  metas: Metas(
                                    id: 'muuminun.mp3-f999ac4d',
                                    title: 'Surah al mu\'uminun',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFD9D9D9),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/sajdah.mp3',
                                  metas: Metas(
                                    id: 'sajdah.mp3-3fdef19e',
                                    title: 'Surah As-Sajdah',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/hujurat.mp3',
                                  metas: Metas(
                                    id: 'hujurat.mp3-0b52ff6d',
                                    title: 'Surah Al-Hujurat',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Colors.white,
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/muzzammil.mp3',
                                  metas: Metas(
                                    id: 'muzzammil.mp3-939f4a2d',
                                    title: 'Surah al-Muzzammil',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFF4F4F4),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/naba.mp3',
                                  metas: Metas(
                                    id: 'naba.mp3-f0c6bf99',
                                    title: 'Surah An-Naba',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFCFD0D0),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/aala.mp3',
                                  metas: Metas(
                                    id: 'aala.mp3-3ac75bb5',
                                    title: 'Surah Al-A\'la',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFDFE0E2),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/gashiya.mp3',
                                  metas: Metas(
                                    id: 'gashiya.mp3-b4c0211c',
                                    title: 'Surah  Al- Gashiya',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFDEDEDE),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/adiyat.mp3',
                                  metas: Metas(
                                    id: 'adiyat.mp3-cd5162d9',
                                    title: 'Surah  Al-\'Adiyat',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFCFCFCF),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/maun.mp3',
                                  metas: Metas(
                                    id: 'maun.mp3-f37cf506',
                                    title: 'Surah  Al- Al-Ma\'un',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Color(0xFFE2E2E2),
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/fatiha.mp3',
                                  metas: Metas(
                                    id: 'fatiha.mp3-7510ac05',
                                    title: 'Surah  Al-Fatiha',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Colors.white,
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/112.mp3',
                                  metas: Metas(
                                    id: '112.mp3-6fc5863e',
                                    title: 'Surah  Al- Al-Ikhlas',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Colors.white,
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio(
                                  'assets/audios/114.mp3',
                                  metas: Metas(
                                    id: '114.mp3-38b52e2f',
                                    title: 'Surah  Al- An-Nas',
                                  ),
                                ),
                                titleTextStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                playbackDurationTextStyle: FlutterFlowTheme.of(
                                        context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFBABABA),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                                fillColor: Color(0xFF090045),
                                playbackButtonColor: Colors.white,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                inactiveTrackColor: Colors.white,
                                elevation: 0.0,
                                playInBackground:
                                    PlayInBackground.disabledPause,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '98rfbk43' /* Online Audios */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(height: 18.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 755.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(11.0, 0.0, 11.0, 0.0),
                      child: StreamBuilder<List<AudioscollectionRecord>>(
                        stream: queryAudioscollectionRecord(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: SpinKitWanderingCubes(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                              ),
                            );
                          }
                          List<AudioscollectionRecord>
                              listViewAudioscollectionRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewAudioscollectionRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 22.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewAudioscollectionRecord =
                                  listViewAudioscollectionRecordList[
                                      listViewIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowAudioPlayer(
                                  audio: Audio.network(
                                    listViewAudioscollectionRecord.audiopath,
                                    metas: Metas(
                                      title: valueOrDefault<String>(
                                        listViewAudioscollectionRecord
                                            .audioName,
                                        'Rayya Abba Macca',
                                      ),
                                    ),
                                  ),
                                  titleTextStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 23.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                  playbackDurationTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFBABABA),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                            lineHeight: 2.0,
                                          ),
                                  fillColor: Color(0xFF090045),
                                  playbackButtonColor: Colors.white,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  inactiveTrackColor: Colors.white,
                                  elevation: 0.0,
                                  playInBackground:
                                      PlayInBackground.disabledPause,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                FlutterFlowAdBanner(
                  showsTestAd: false,
                  androidAdUnitID: 'ca-app-pub-3940256099942544/9214589741',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
