import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pregnancy_third_tremerster_model.dart';
export 'pregnancy_third_tremerster_model.dart';

class PregnancyThirdTremersterWidget extends StatefulWidget {
  const PregnancyThirdTremersterWidget({Key? key}) : super(key: key);

  @override
  _PregnancyThirdTremersterWidgetState createState() =>
      _PregnancyThirdTremersterWidgetState();
}

class _PregnancyThirdTremersterWidgetState
    extends State<PregnancyThirdTremersterWidget> {
  late PregnancyThirdTremersterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PregnancyThirdTremersterModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).cultured,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Third tremester tips',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  130.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 0.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x00616161),
                                icon: Icon(
                                  Icons.vertical_align_top_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await _model.columnController?.animateTo(
                                    0,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              controller: _model.columnController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/320.PNG',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Common third trimester symptoms include trouble sleeping, heartburn, and for many moms-to-be, all-over discomfort. We asked BabyCenter moms how they stayed comfortable in the third trimester: Many tried various methods to ease aches around their crowded bellies, while others turned to warm baths and pregnancy pillows, and some went for a swim or to a prenatal yoga class. While the aches and pains may feel unrelenting at times, there are many ways to get relief, so don\'t be afraid to try a few things out until you find something that feels good.',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/322.PNG',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Text(
                      'It can be hard to get comfortable during the third trimester of pregnancy: Your back aches (honestly, everything might ache), your baby is kicking your ribs or giving you lightning crotch, and you\'re really in need of a decent night\'s sleep (pregnancy insomnia is real).\n\nWe asked BabyCenter moms to share their best tips for handling the third trimester symptoms that pregnant women often encounter. Their takeaways prove that there are many different ways to ease third trimester discomfort, so don\'t be afraid to try a few things – whether it\'s sitting on an exercise ball or taking a warm bath – until you find something that feels good for you.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Text(
                      'Relieve belly pain in the third trimester',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF040404),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'By the third trimester, especially in the last few weeks of pregnancy, it might start to feel like your baby is officially running out of room in your uterus – kicking your ribs, putting pressure on your pelvis, and causing all kinds of uncomfortable pregnancy aches. Here\'s what a few BabyCenter moms did to relieve some of the crowded belly discomfort:\n\n\"Give your baby (and your lungs) some room by keeping your back straight or slightly arched, instead of slumped forward.\"\n\n\"Try to relax into the baby\'s movements as much as possible. Tensing up when they kick only makes you more uncomfortable.\"\n\n\"Using a foam roller or tennis ball to relax tight muscles helps with my back pain during pregnancy. Also, wearing good shoes helps.\"',
                      style: TextStyle(
                        color: Color(0xFF040404),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: FlutterFlowYoutubePlayer(
                      url:
                          'https://www.youtube.com/watch?v=Z3xjGr8BG8Y&ab_channel=FirstCryParenting',
                      autoPlay: false,
                      looping: true,
                      mute: false,
                      showControls: true,
                      showFullScreen: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Text(
                      'More tips',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Urbanist',
                            color: Color(0xFF040404),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Try pregnancy massage and warm baths\nUse a pregnancy pillow (or other pillows) for support\nFind the best pregnancy sleeping positions\nKeep up the third trimester exercise',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
