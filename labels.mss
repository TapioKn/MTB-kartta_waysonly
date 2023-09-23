/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

/* ---- Cities ------------------------------------------------------ */



/* ---- Towns ------------------------------------------------------- */



/* ---- Other small places ------------------------------------------ */



/* ===================================================================== */
/* AREA LABELS                                                           */
/* ===================================================================== */

#area_label {
  // Bring in labels gradually as one zooms in, based on polygon area
  [zoom>=10][area>102400000][type!='building'][type!='parking'],
  [zoom>=11][area>25600000][type!='building'][type!='parking'],
  [zoom>=13][area>1600000][type!='building'][type!='parking'],
  [zoom>=14][area>320000][type!='building'][type!='parking'],
  [zoom>=15][area>120000][type!='building'][type!='parking'],
  [zoom>=16][area>20000][type!='building'][type!='parking'] {
    text-name: "[name]";
    text-halo-radius: 1.5;
    text-face-name:@sans;
    text-size: 10;
    text-wrap-width:40;
    text-fill: @poi_text;
    text-halo-fill: #fff;
    text-clip: false;
    text-allow-overlap: false;
    text-placement-type: simple;
    text-placements: N,NE,E,SE,S,SW,W,NW;
    // Specific style overrides for different types of areas:
    [zoom=16] {  //[area>50000]
      text-name: "[name]";
      text-size: 11;
      text-wrap-width: 60;
      text-character-spacing: 1;
      text-halo-radius: 1.5;
    }
    [zoom>=16] {  //[area>50000]
      text-name: "[name]";
      text-size: 12;
      text-wrap-width: 60;
      text-character-spacing: 1;
      text-halo-radius: 1.5;
    }
  }
}



#area_marker {
  [amenity='parking'][zoom>=15] {
    text-placement: point;
    text-allow-overlap: true;
    text-name: "'P'";
    text-face-name: @sans_bold;
    text-fill: @parking-label;
    [access='no'],[access='private'],[access='customer'],[access='permit'] { text-fill: @forbidden; }
    text-halo-fill: #fff;
    text-size: 12;
    [zoom>=15] { text-size: 11; }
    text-halo-radius: 1.0;
    text-opacity: 0.4;
    [access='permissive'],[access='yes'] { text-opacity: 0.8; }
  }

  [amenity='shelter'][zoom>=10],
  [tourism='wilderness_hut'][zoom>=10],
  [military='bunker'][zoom>=10],
  [building='bunker'][zoom>=10] {
    marker-file: url('images/amenity_shelter.svg');
    [amenity='shelter'][leisure='firepit'] { marker-file: url('images/amenity_shelter_firepit.svg'); }
    [tourism='wilderness_hut'] { marker-file: url('images/tourism_wilderness_hut.svg'); }
    [military='bunker'],[building='bunker'] { marker-file: url('images/military_bunker.svg'); }
    marker-allow-overlap: true;
    marker-width: 13.0;
    marker-height: 13.0;
    marker-fill: @parking-label; //#0091da
    [shelter_type='public_transport'] { marker-opacity: 0; }
    [access='private'],[access='no'] { marker-fill: @forbidden; } //#ff003d
    [zoom>=14] { marker-width: 15.0;  marker-height: 15.0;}
    [zoom>=15] { marker-width: 16.0;  marker-height: 16.0;}
    [zoom>=16] { marker-width: 17.0;  marker-height: 17.0;}
    [zoom>=13] {
      text-name: "[name]";
      text-placement: point;
      text-allow-overlap: true;
      text-dy: 8;
      text-face-name: @sans;
      text-size: 10;
      [zoom<=14] { text-size: 9; }
      text-wrap-width:30;
      text-fill: @parking-label * 0.6;
      text-halo-fill: lighten(@parking-label, 90%);
      [access='private'],[access='no'] { text-fill: @forbidden * 0.6; text-halo-fill: lighten(@forbidden, 90%); }
      text-halo-radius:1;
    }
  }
  [leisure='firepit'] {
    marker-file: url('images/leisure_firepit.svg');
    marker-allow-overlap: true;
    marker-width: 13.0;
    marker-height: 13.0;
    marker-fill: @parking-label; //#0091da
    [access='private'],[access='no']  { marker-fill: @forbidden; } //#ff003d
    [zoom>=14] { marker-width: 15.0;  marker-height: 15.0;}
    [zoom>=15] { marker-width: 16.0;  marker-height: 16.0;}
    [zoom>=16] { marker-width: 17.0;  marker-height: 17.0;}
  }

  [amenity='toilets'][zoom>=14] {
    marker-file: url(images/amenity_toilets.svg);
    marker-allow-overlap: true;
    marker-width: 15.0;  marker-height: 15.0;
    [zoom>=15] { marker-width: 16.0;  marker-height: 16.0;}
    [zoom>=16] { marker-width: 17.0;  marker-height: 17.0;}
    marker-fill: @parking-label; //#0091da
    [access='no'],[access='private'],[access='permit'] { marker-fill: @forbidden; }
  }

}

/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */


/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

#motorway_label[zoom>=11][zoom<=14][reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #fff;
  shield-file: url(images/shield-motorway-1.png);
  [type='motorway'] {
    [reflen=1] { shield-file: url(images/shield-motorway-1.png); }
    [reflen=2] { shield-file: url(images/shield-motorway-2.png); }
    [reflen=3] { shield-file: url(images/shield-motorway-3.png); }
    [reflen=4] { shield-file: url(images/shield-motorway-4.png); }
    [reflen=5] { shield-file: url(images/shield-motorway-5.png); }
    [reflen=6] { shield-file: url(images/shield-motorway-6.png); }
    [reflen=7] { shield-file: url(images/shield-motorway-7.png); }
    [reflen=8] { shield-file: url(images/shield-motorway-8.png); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(images/shield-trunk-1.png); }
    [reflen=2] { shield-file: url(images/shield-trunk-2.png); }
    [reflen=3] { shield-file: url(images/shield-trunk-3.png); }
    [reflen=4] { shield-file: url(images/shield-trunk-4.png); }
    [reflen=5] { shield-file: url(images/shield-trunk-5.png); }
    [reflen=6] { shield-file: url(images/shield-trunk-6.png); }
    [reflen=7] { shield-file: url(images/shield-trunk-7.png); }
    [reflen=8] { shield-file: url(images/shield-trunk-8.png); }
  }
  [zoom=11] { shield-min-distance: 60; } //50
  [zoom=12] { shield-min-distance: 80; } //60
  [zoom=13] { shield-min-distance: 120; } //120
  [zoom=14] { shield-min-distance: 180; }
}

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:"[name]";
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1.5;
  text-min-distance:120;
  text-size:11;
  [zoom>=16] { text-size:12; text-character-spacing:0.75; text-halo-radius:2.0 }
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
  [tunnel='yes'],
  [tunnel='1'] { text-opacity: 0; text-halo-radius: 0; }
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:11;
  text-character-spacing:0.5;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1.5;
  text-min-distance:60;
  [zoom>=16] { text-size:12; text-character-spacing:0.75; text-halo-radius:2.0 }
  [tunnel='yes'],
  [tunnel='1'] { text-opacity: 0; text-halo-radius: 0; }
}

#minorroad_label[zoom>=15] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:11;
  text-character-spacing:0.35;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1.5;
  text-min-distance:40;
  [zoom=15]  { [type='path'],[type='track'],[type='steps'],[type='cycleway'],[type='footway'] { text-size:10; text-dy: 8;} }
  [zoom=16]  { text-size:12; text-character-spacing:0.5; text-halo-radius:2.0;
               [type='path'],[type='track'],[type='steps'],[type='cycleway'],[type='footway'] { text-size:11; text-dy: 9; } }
  [zoom>=17] { text-size:14; text-character-spacing:0.75; text-halo-radius:2.5;
               [type='path'],[type='track'],[type='steps'],[type='cycleway'],[type='footway'] { text-size:12; text-dy: 10;} }
  [tunnel='yes'],
  [tunnel='1'] { text-opacity: 0; text-halo-radius: 0; }
}

#othernames_label[zoom>=15] {
  text-name:'[mtb:name]';
  text-face-name:@sans_italic;
  text-placement:line;
  text-size:10;
  text-character-spacing:0.35;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1.5;
  text-min-distance:40;
  [zoom=15]  { text-size:9; text-dy: -8; }
  [zoom=16]  { text-size:11; text-character-spacing:0.5; text-halo-radius:2.0; text-dy: -9; }
  [zoom>=17] { text-size:12; text-character-spacing:0.75; text-halo-radius:2.5; text-dy: -10; }
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */
#motorway_label[zoom>=16],
#mainroad_label[zoom>=16],
#minorroad_label[zoom>=16] {
  [oneway = 'yes'],
  [oneway='-1'] {
   marker-placement:line;
   marker-max-error: 0.5;
   marker-spacing: 200;
   marker-file: url(images/oneway.svg);
   [oneway='-1'] { marker-file: url(images/oneway-reverse.svg); }
   [zoom=16] { marker-transform: "scale(0.7)"; }
  }
}

/* ================================================================== */
/* FIXME/NOEXIT/ETC LABELS
/* ================================================================== */
#constructs_point[zoom>=14] {
  [type='ford_yes'][zoom>=16] {
    marker-file: url(images/ford_yes-L.png);
    marker-allow-overlap: true;
    marker-placement: point;
  }
  [type='obstacle_fallen_tree'][zoom>=15] {
    marker-file: url(images/obstacle_fallen_tree-M.png);
    [zoom>=16] { marker-file: url(images/obstacle_fallen_tree-L.png); }
    marker-allow-overlap: true;
    marker-placement: point;
  }
  [type='amenity_drinking_water'] {
    marker-file: url(images/amenity-drinking_water.png);
    marker-allow-overlap: true;
    marker-placement: point;
  }

  [type='amenity_toilets'] {
    marker-file: url(images/amenity_toilets.svg);
    marker-allow-overlap: true;
    marker-width: 15.0;  marker-height: 15.0;
    [zoom>=15] { marker-width: 16.0;  marker-height: 16.0;}
    [zoom>=16] { marker-width: 17.0;  marker-height: 17.0;}
    marker-fill: @parking-label; //#0091da
    [access='no'],[access='private'],[access='permit'] { marker-fill: @forbidden; }
  }

  [type='amenity_parking'][zoom>=15] {
    text-name: "'P'";
    text-face-name: @sans_bold;
    text-fill: @parking-label;
    [access='no'],[access='private'],[access='customer'],[access='permit'] { text-fill: @forbidden; }
    text-halo-fill: #fff;
    text-size: 12;
    [zoom>=15] { text-size: 11; }
    text-halo-radius: 1.0;
    text-opacity: 0.4;
    [access='permissive'],[access='yes'] { text-opacity: 0.8; }
  }
}

#point_marker[zoom>=15] {
  [type='fixme_continue'] {
    [zoom=15] { marker-file: url(images/fixme_continue-M.png); }
    [zoom>=16] { marker-file: url(images/fixme_continue-L.png); }
    marker-allow-overlap: true;
    marker-placement: point;
  }
  [type='fixme_resurvey'] {
    [zoom=15] { marker-file: url(images/fixme_resurvey-M.png); }
    [zoom>=16] { marker-file: url(images/fixme_resurvey-L.png); }
    marker-allow-overlap: true;
    marker-placement: point;
  }
  [type='noexit_yes'] {
    [zoom=15] { marker-file: url(images/noexit_yes-S.png); }
    [zoom=16] { marker-file: url(images/noexit_yes-S.png); }
    [zoom>=17] { marker-file: url(images/noexit_yes-M.png); }
    marker-allow-overlap: true;
    marker-placement: point;
    marker-opacity: 1.0;
  }
}

#line_marker[type='fixme_resurvey'][zoom>=15] {
  [zoom=15] { marker-file: url(images/fixme_resurvey-M.png); }
  [zoom>=16] { marker-file: url(images/fixme_resurvey-L.png); }
  marker-allow-overlap: true;
  marker-placement: interior;
}


#point_names[zoom>=15] {
  [type='natural_peak'] {
    text-name: "[name]";
    text-placement: point;
    text-allow-overlap: true;
    text-dy: 8;
    text-face-name: @sans;
    text-size: 9;
    [zoom=15]  { text-size: 10; }
    [zoom=16]  { text-size: 11; }
    [zoom>=17] { text-size: 12; }
    text-wrap-width:30;
    text-fill: @rock * 0.2;
    text-halo-fill: lighten(@rock, 80%);
    text-halo-radius:1.25;
  }
}
