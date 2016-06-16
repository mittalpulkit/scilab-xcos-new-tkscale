// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - INRIA - Pierre MARECHAL
//
// This file is released under the 3-clause BSD license. See COPYING-BSD.

function demo_misc()

    global margin_x;
    global margin_y;

    global padding_x;
    global padding_y;

    global frame_w;
    global frame_h;

    global plot_w;
    global plot_h;

    // Parameters
    // =========================================================================

    frame_w              = 200;     // Frame width
    frame_h              = 330;     // Frame height

    plot_w               = 600;     // Plot width
    plot_h               = 550;     // Plot height

    margin_x             = 15;      // Horizontal margin between each elements
    margin_y             = 15;      // Vertical margin between each elements

    padding_x            = 10;      // Horizontal padding between each elements
    padding_y            = 10;      // Vertical padding between each elements

    defaultfont          = "arial"; // Default Font
    frametitle_font_size = 16;      // Title font size
    text_font_size       = 13;      // Text font size

    // Figure creation
    // =========================================================================

    axes_w       = 3*margin_x + frame_w + plot_w;    // axes width
    axes_h       = 2*margin_y + max(frame_h,plot_h); // axes height

    demo_plot3d = figure(100001);
    clf(demo_plot3d,"reset");

    demo_plot3d.background      = -2;
    demo_plot3d.color_map       = jetcolormap(128);
    demo_plot3d.axes_size       = [axes_w axes_h];
    demo_plot3d.figure_name     = gettext("Misc");

    my_frame_pos_x = margin_x;
    my_frame_pos_y = (axes_h/2-frame_h/2);

    // Frames creation [Control Panel]
    // =========================================================================

    my_frame = uicontrol( ...
    "parent"              , demo_plot3d,...
    "relief"              , "groove",...
    "style"               , "frame",...
    "units"               , "pixels",...
    "position"            , [ my_frame_pos_x my_frame_pos_y frame_w frame_h],...
    "horizontalalignment" , "center", ...
    "background"          , [1 1 1], ...
    "tag"                 , "frame_control" ...
    );

    // Frame title
    my_frame_title = uicontrol( ...
    "parent"              , demo_plot3d,...
    "style"               , "text",...
    "string"              , "Colormap",...
    "units"               , "pixels",...
    "position"            , [ 30+my_frame_pos_x my_frame_pos_y+frame_h-10 frame_w-60 20 ],...
    "fontname"            , defaultfont,...
    "fontunits"           , "points",...
    "fontsize"            , frametitle_font_size,...
    "horizontalalignment" , "center", ...
    "background"          , [1 1 1], ...
    "tag"                 , "title_frame_control" ...
    );

    // Colormap frame creation
    // =========================================================================

    my_cmap_frame_w     = frame_w;
    my_cmap_frame_h     = frame_h;

    // Colormap : Jetcolormap

    jetcolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Jet"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-50 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 1, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "jetcolormap_radio");

    // Colormap : HSVcolormap

    HSVcolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("HSV"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-70 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "HSVcolormap_radio");

    // Colormap : Hotcolormap

    hotcolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Hot"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-90 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "hotcolormap_radio");

    // Colormap : Graycolormap

    graycolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Gray"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-110 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "graycolormap_radio");

    // Colormap : Wintercolormap

    wintercolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Winter"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-130 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "wintercolormap_radio");

    // Colormap : Springcolormap

    springcolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Spring"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-150 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "springcolormap_radio");

    // Colormap : Summercolormap

    summercolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Summer"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-170 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "summercolormap_radio");

    // Colormap : Autumncolormap

    autumncolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Autumn"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-190 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "autumncolormap_radio");

    // Colormap : Bonecolormap

    bonecolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Bone"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-210 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "bonecolormap_radio");

    // Colormap : Coppercolormap

    coppercolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Copper"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-230 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "coppercolormap_radio");

    // Colormap : Pinkcolormap

    pinkcolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Pink"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-250 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "pinkcolormap_radio");

    // Colormap : Rainbowcolormap

    rainbowcolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Rainbow"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-270 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "rainbowcolormap_radio");

    // Colormap : Oceancolormap

    oceancolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("Ocean"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-290 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "oceancolormap_radio");

    // Colormap : Whitecolormap

    whitecolormap_radio = uicontrol( ...
    "parent"             , demo_plot3d,...
    "style"              , "radiobutton",...
    "string"             , gettext("White"),...
    "position"           , [ my_frame_pos_x+10 my_frame_pos_y+my_cmap_frame_h-310 my_cmap_frame_w-25 15],...
    "horizontalalignment", "left",...
    "fontname"           , defaultfont,...
    "fontunits"          , "points",...
    "fontsize"           , text_font_size,...
    "value"              , 0, ...
    "background"          , [1 1 1], ...
    "callback"           , "demo_update_misc",...
    "tag"                , "whitecolormap_radio");

    // Plots creation
    // =========================================================================

    drawlater();

    my_plot_region_pos_x = ((2*margin_x+frame_w)/axes_w);
    my_plot_region_pos_y = 0;
    my_plot_region_w     = 1-my_plot_region_pos_x;
    my_plot_region_h     = 1;

    // First plot : grayplot();  top - left

    my_plot_1_axes  = newaxes();
    my_plot_1_pos_x = ((2*margin_x+frame_w)/axes_w);
    my_plot_1_pos_y = 0;
    my_plot_1_w     = (1-my_plot_region_pos_x)/2;
    my_plot_1_h     = 1/2;
    my_plot_1_axes.axes_bounds = [ my_plot_1_pos_x my_plot_1_pos_y my_plot_1_w my_plot_1_h ];
    grayplot();

    // Second plot : plot3d1(); top right

    my_plot_2_axes  = newaxes();
    my_plot_2_pos_x = ((2*margin_x+frame_w)/axes_w) + my_plot_region_w/2;
    my_plot_2_pos_y = 0;
    my_plot_2_w     = (1-my_plot_region_pos_x)/2;
    my_plot_2_h     = 1/2;
    my_plot_2_axes.axes_bounds = [ my_plot_2_pos_x my_plot_2_pos_y my_plot_2_w my_plot_2_h ];
    plot3d1();

    // Third plot : grayplot();  bottom - left

    my_plot_3_axes  = newaxes();
    my_plot_3_pos_x = ((2*margin_x+frame_w)/axes_w);
    my_plot_3_pos_y = 1/2;
    my_plot_3_w     = (1-my_plot_region_pos_x)/2;
    my_plot_3_h     = 1/2;
    my_plot_3_axes.axes_bounds = [ my_plot_3_pos_x my_plot_3_pos_y my_plot_3_w my_plot_3_h ];
    grayplot();

    // Fourth plot : knot();  bottom - right

    my_plot_4_axes  = newaxes();
    my_plot_4_pos_x = ((2*margin_x+frame_w)/axes_w) + my_plot_region_w/2;
    my_plot_4_pos_y = 1/2;
    my_plot_4_w     = (1-my_plot_region_pos_x)/2;
    my_plot_4_h     = 1/2;
    my_plot_4_axes.axes_bounds = [ my_plot_4_pos_x my_plot_4_pos_y my_plot_4_w my_plot_4_h ];

    deff("[x,y,z]=knot(u,v)",["vv=ones(v)";"uu=ones(u);";
    "x=(5.*cos(u)+cos(u).*cos(v))";
    "y=(5.*sin(u)+sin(u).*cos(v))";
    "z=(uu.*sin(v))";])

    nx=60;
    Nx=(0:nx)/nx;
    ny=20;
    Ny=(0:ny)/ny;

    [xx,yy,zz]=eval3dp(knot,2*%pi*Nx,2*%pi*Ny);
    XXX=[-xx xx];
    YYY=[-yy zz];
    ZZZ=[-zz yy];
    kk1=[1:size(zz,2)];

    kk1=modulo(kk1,60);
    kk2=kk1;
    KKK=list(ZZZ,[kk1 kk2]);
    plot3d(XXX,YYY,KKK,35,70," @ @ ",[2,1,4],[-6,6,-6,6,-6,6]);

    // define colormap
    colormapSize = 128;
    f = gcf();
    f.color_map = jetcolormap(128);

    my_plot_2_axes.background = color(240,240,240);
    my_plot_4_axes.background = color(240,240,240);

    drawnow();

    demo_viewCode("misc.dem.sce");

endfunction


function demo_update_misc()

    my_figure    = gcf();

    my_figure.immediate_drawing = "off";

    set(findobj("tag", "jetcolormap_radio")     , "value", 0);
    set(findobj("tag", "hotcolormap_radio")     , "value", 0);
    set(findobj("tag", "graycolormap_radio")    , "value", 0);
    set(findobj("tag", "wintercolormap_radio")  , "value", 0);
    set(findobj("tag", "springcolormap_radio")  , "value", 0);
    set(findobj("tag", "summercolormap_radio")  , "value", 0);
    set(findobj("tag", "autumncolormap_radio")  , "value", 0);
    set(findobj("tag", "bonecolormap_radio")    , "value", 0);
    set(findobj("tag", "coppercolormap_radio")  , "value", 0);
    set(findobj("tag", "pinkcolormap_radio")    , "value", 0);
    set(findobj("tag", "HSVcolormap_radio")     , "value", 0);
    set(findobj("tag", "rainbowcolormap_radio") , "value", 0);
    set(findobj("tag", "oceancolormap_radio")   , "value", 0);
    set(findobj("tag", "whitecolormap_radio")   , "value", 0);

    set(gcbo, "value", 1);

    my_wanted_colormap = get(gcbo,"tag");

    if get(gcbo, "tag") == "jetcolormap_radio" then
        my_figure.color_map = jetcolormap(128);
    elseif get(gcbo, "tag") == "hotcolormap_radio" then
        my_figure.color_map = hotcolormap(128);
    elseif get(gcbo, "tag") == "graycolormap_radio" then
        my_figure.color_map = graycolormap(128);
    elseif get(gcbo, "tag") == "wintercolormap_radio" then
        my_figure.color_map = wintercolormap(128);
    elseif get(gcbo, "tag") == "springcolormap_radio" then
        my_figure.color_map = springcolormap(128);
    elseif get(gcbo, "tag") == "summercolormap_radio" then
        my_figure.color_map = summercolormap(128);
    elseif get(gcbo, "tag") == "autumncolormap_radio" then
        my_figure.color_map = autumncolormap(128);
    elseif get(gcbo, "tag") == "bonecolormap_radio" then
        my_figure.color_map = bonecolormap(128);
    elseif get(gcbo, "tag") == "coppercolormap_radio" then
        my_figure.color_map = coppercolormap(128);
    elseif get(gcbo, "tag") == "pinkcolormap_radio" then
        my_figure.color_map = pinkcolormap(128);
    elseif get(gcbo, "tag") == "HSVcolormap_radio" then
        my_figure.color_map = hsvcolormap(128);
    elseif get(gcbo, "tag") == "rainbowcolormap_radio" then
        my_figure.color_map = rainbowcolormap(128);
    elseif get(gcbo, "tag") == "oceancolormap_radio" then
        my_figure.color_map = oceancolormap(128);
    elseif get(gcbo, "tag") == "whitecolormap_radio" then
        my_figure.color_map = whitecolormap(128);
    end

    // Gray background for 3d axes

    for i = 1:size(my_figure.children,"*"),
        child = my_figure.children(i);
        if child.type=="Axes" then
            if child.view=="3d" then
                child.background = color(240,240,240);
            end
        end
    end

    // Plot

    my_figure.immediate_drawing = "on";



endfunction

demo_misc();
clear demo_misc;
