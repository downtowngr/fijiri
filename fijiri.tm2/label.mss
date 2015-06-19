// LABEL.MSS CONTENTS:
// 2__ Place Names
//     2_7__ Neighbourhoods & Hamlets
// 4__ Water Labels 
// 5__ Road Labels

// Font sets are defined in vars.mss

// =====================================================================
// 2__ PLACE NAMES
// =====================================================================

// 2_7__ Neighbourhoods & Hamlets ______________________________________

#place_label[zoom>=13][zoom<=14][localrank<=1],
#place_label[zoom>=15][zoom<=18] {
  [type='hamlet'],
  [type='neighbourhood'] {
    text-name: @name;
    text-face-name: @sans_lt;
    text-placement: point;
    text-fill: @other_text;
    text-size: 11;
    text-halo-fill: @other_halo;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-line-spacing: -2;
    [zoom>=14] { text-size: 12; text-wrap-width: 80; }
    [zoom>=16] { text-size: 14; text-wrap-width: 100; }
    [zoom>=17] { text-size: 16; text-wrap-width: 130; }
    [zoom>=18] { text-size: 18; text-wrap-width: 160; }
  }
}


// =====================================================================
// 4__ WATER LABELS
// =====================================================================

#water_label {
  [zoom<=15][area>200000],
  [zoom=16][area>50000],
  [zoom=17][area>10000],
  [zoom>=18][area>0]{
    text-name: @name;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-size: 11;
    text-wrap-width: 50;
    text-wrap-before: true;
    text-halo-fill: #fff;
    text-line-spacing: -2;
    text-face-name: @sans_italic;
    text-fill: @water * 0.75;
  }
  [zoom>=14][area>3200000],
  [zoom>=15][area>800000],
  [zoom>=16][area>200000],
  [zoom>=17][area>50000],
  [zoom>=18][area>10000] {
    text-size: 12;
    text-wrap-width: 75;
  }
  [zoom>=15][area>3200000],
  [zoom>=16][area>800000],
  [zoom>=17][area>200000],
  [zoom>=18][area>50000] {
    text-size: 14;
    text-wrap-width: 100;
    text-halo-radius: 2;
  }
  [zoom>=16][area>3200000],
  [zoom>=17][area>800000],
  [zoom>=18][area>200000] {
    text-size: 16;
    text-wrap-width: 125;
  }
  [zoom>=17][area>3200000],
  [zoom>=18][area>800000] {
    text-size: 18;
    text-wrap-width: 150;
  }
}

#waterway_label[class='river'][zoom>=13],
#waterway_label[class='canal'][zoom>=15],
#waterway_label[class='stream'][zoom>=17],
#waterway_label[class='stream_intermittent'][zoom>=17] {
  text-avoid-edges: true;
  text-name: @name;
  text-face-name: @sans_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(#fff,80%);
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-placement: line;
  text-size: 10;
  text-character-spacing: 1;
  [class='river'][zoom=14],
  [class='canal'][zoom=16],
  [class='stream'][zoom>=18],
  [class='stream_intermittent'][zoom>=18] {
    text-size: 10;
  }
  [class='river'][zoom=15],
  [class='canal'][zoom>=17] {
    text-size: 11;
  }
  [class='river'][zoom>=16],
  [class='canal'][zoom>=18] {
    text-size: 14;
    text-spacing: 300;
  }
}


// =====================================================================
// 5__ ROAD LABELS
// =====================================================================

// highway shield
#road_label[class='motorway'][reflen>0][reflen<=6],
#road_label[class='main'][reflen>0][reflen<=6] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-file: url('img/shield/generic-sm-[reflen].png');
  shield-face-name: @sans_bold;
  shield-fill: #555;
  shield-spacing: 200;
  shield-avoid-edges: true;
  // Workaround for Mapnik bug where shields are placed slightly over the
  // edge even when avoid-edges is true:
  shield-min-padding: 5;
  shield-min-distance: 40;
  [zoom>=12] { shield-min-distance: 50; }
  [zoom>=14] {
    shield-spacing: 400;
    shield-min-distance: 80;
    shield-size: 11;
    shield-file: url('img/shield/generic-md-[reflen].png');
  }
}

// regular labels
#road_label['mapnik::geometry_type'=2] {
  // Longer roads get a label earlier as they are likely to be more
  // important. This especially helps label density in rural/remote areas.
  // This z14 filter is *not* redundant to logic in SQL queries. Because z14
  // includes all data for z14+ via overzooming, the streets included in a
  // z14 vector tile include more features than ideal for optimal performance.
  [class='motorway'][zoom>=12],
  [class='main'][zoom>=12],
  [class='street'][zoom<=14][len>2500],
  [class='street'][zoom>=15],
  [class='street_limited'] {
    text-avoid-edges: true;
    text-transform: uppercase;
    text-name: @name;
    text-character-spacing: 0.25;
    text-placement: line;
    text-face-name: @sans;
    text-fill: #444;
    text-size: 8;
    text-halo-fill: @road_halo;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-min-distance: 200; // only for labels w/ the same name
    [zoom>=14] { text-size: 9; }
    [zoom>=16] { text-size: 11; }
    [zoom>=18] { text-size: 12; }
    [class='motorway'],
    [class='main'] {
      [zoom>=14] { text-size: 10; }
      [zoom>=16] { text-size: 11; text-face-name: @sans_bold; }
      [zoom>=17] { text-size: 12; }
      [zoom>=18] { text-size: 14; }
    }
  }
}

// less prominent labels for all other types, by length
#road_label['mapnik::geometry_type'=2]
[class!='motorway']
[class!='main']
[class!='street']
[class!='street_limited'] {
  [len>10000][zoom>=12],
  [len>5000][zoom>=13],
  [len>2500][zoom>=14],
  [len>1200][zoom>=15],
  [len>0][zoom>=16] {
    text-avoid-edges: true;
    text-name: @name;
    text-character-spacing: 0.25;
    text-placement: line;
    text-face-name: @sans;
    text-fill: #666;
    text-size: 9;
    text-halo-fill: @road_halo;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-min-distance: 200; // only for labels w/ the same name
    [zoom>=17] { text-size: 10; }
    [zoom>=18] { text-size: 11; }
  }
}
