//  Scicos
//
// Copyright (C) 2016 - Pulkit Mittal <mittal.pulkit08@gmail.com>
// Copyright (C) DIGITEO - Clément DAVID <clement.david@scilab.org>
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
//
// See the file ../license.txt
//

function block=new_tkscaleblk(block,flag)

    //
    // Get the current called  xcos block during simulation using curblock() utility function of Scilab
    //
    // @author Pulkit Mittal	<mittal.pulkit08@gmail.com>
    //
    blk=curblock();	
    
    if flag == 1 then
        // Output update
	
        slider = get(block.uid + "#slider");
	
        if slider <> [] then
            // calculate real value
            value = (block.rpar(1) + block.rpar(2) + get(slider,"value")) / block.rpar(3);
	    
            w = get(block.uid);
            if w <> [] then
                set(w, "info_message", string(value));
            end

            block.outptr(1) = value;
        end
    elseif flag == 4 then
        // Initialization
	

	// Use the variable labelling to set the default label of Tk Source window
	// Also typecast the blk (block no) obtained into the string object 
	// Variable label_new is used to get the default sentinel value present in Name of TKSCALE block
	//
	// @author Pulkit Mittal	<mittal.pulkit08@gmail.com>
        //
	//
	labelling = "Tk Source: "+string(blk);
	label_new=string(block.label);
			
        // if already exists (stopped) then reuse
        f = get(block.uid);
        if f <> [] then
            return;
        end

	// Check if user has given some name to Tk Souce and change it 
	//
	// @author Pulkit Mittal	<mittal.pulkit08@gmail.com>
        //
	//
	answer = strcmp(label_new,"NIL");	
	disp("answer of comparison= "+string(answer));	
	if answer ~= 0 then
		//h=get("current_figure");	//get the handle of current graphic window
		//h.figure_name=label_new;	//set the figure name to new value given by user
		labelling=label_new;	
	end	

        f = figure("Figure_name",labelling, ...
        "dockable", "off", ...
        "infobar_visible" , "on", ...
        "toolbar", "none", ...
        "menubar_visible", "off", ...
        "menubar", "none", ...
        "backgroundcolor", [1 1 1], ...
        "default_axes", "off", ...
        "figure_size", [180 350], ...
        "layout", "border", ...
        "figure_position", [40 40], ...
        "Tag", block.uid);

        frame_slider = uicontrol(f, ...
        "style", "frame", ...
        "constraints", createConstraints("border", "left", [180, 0]), ...
        "border", createBorder("line", "lightGray", 1), ...
        "backgroundcolor", [1 1 1], ...
        "layout", "gridbag");

        // slider
        bounds = block.rpar(1:2);
        initial = mean(bounds);
        uicontrol(frame_slider, ...
        "Style", "slider", ...
        "Tag", block.uid + "#slider", ...
        "Min", bounds(1), ...
        "Max", bounds(2), ...
        "Value", initial, ...
        "Position", [0 0 10 20], ...
        "SliderStep", [1 2*1]);

        frame_label = uicontrol(frame_slider, ...
        "style", "frame", ...
        "constraints", createConstraints("border", "right"), ...
        "backgroundcolor", [1 1 1], ...
        "layout", "gridbag");

        // labels
        labels = string([bounds(2) ; ...
        mean([bounds(2) initial])  ; ...
        initial                    ; ...
        mean([bounds(1) initial])  ; ...
        bounds(1)]);
        labels = "<html>" + strcat(labels, "<br /><br /><br />") + "</html>";

        uicontrol(frame_label, ...
        "Style", "text", ...
        "String", labels(1), ...
        "FontWeight", "bold", ...
        "backgroundcolor", [1 1 1]);
	
        // update default value
        block.outptr(1) = initial / block.rpar(3);	
    elseif flag == 5 then
        // Ending
        f = get(block.uid);
        if f <> [] then
            close(f);
        end
    end
endfunction

