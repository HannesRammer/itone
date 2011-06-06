function toggleClass(elem, className1, className2) {
    elem.className = (elem.className == className1) ? className2 : className1;
}
function setClass(elem, className1) {
    elem.className = className1;
}


function toggleExercise() {
    if ($('exercise').innerHTML != "") {


        if ($('open_exercise').className == "open_exercise") {
            $('open_exercise').className = 'close_exercise';
            $('open_exercise').innerHTML = "V<br/>E<br/>R<br/>B<br/>E<br/>R<br/>G<br/>E<br/>N"

            $('exercise').className = 'show_exercise';
            window.scrollBy(2000, 0);
            setTimeout(toggleImage, 1000);
        } else if ($('open_exercise').className == "close_exercise") {
            window.scrollBy(-2000, 0);
            $('open_exercise').innerHTML = "A<br/>N<br/>S<br/>E<br/>H<br/>E<br/>N"
            $('exercise').className = 'hidden_exercise';
            $('open_exercise').className = 'open_exercise';

        }
    }
}

function toggleTraining() {
    if ($('training').innerHTML != "") {


        if ($('open_training').className == "open_training") {
            $('open_training').className = 'close_training';
            $('open_training').innerHTML = "V<br/>E<br/>R<br/>B<br/>E<br/>R<br/>G<br/>E<br/>N"

            $('training').className = 'show_training';
            window.scrollBy(2000, 0);
            setTimeout(toggleImage, 1000);
        } else if ($('open_training').className == "close_training") {
            window.scrollBy(-2000, 0);
            $('open_training').innerHTML = "A<br/>N<br/>S<br/>E<br/>H<br/>E<br/>N"
            $('training').className = 'hidden_training';
            $('open_training').className = 'open_training';

        }
    }
}

function toggleImage() {
    if ($('open_exercise').className == "close_exercise") {
        s = $('exercise_picture').src.split("/images")[1];
        q = s.split('.jpg');
        if (s.include('1.jpg')) {
            $('exercise_picture').src = "/images" + s.gsub('1.jpg', '.jpg');
        } else {
            $('exercise_picture').src = "/images" + q[0] + "1.jpg" + q[1];

        }
        setTimeout(toggleImage, 1000);
    }
}

function change_style() {
    drop_down = document.style_form.style_options;
    color = drop_down.options[drop_down.selectedIndex].value;
    setClass($('body'), 'theme_' + color);

    var exp = new Date();
    var numdays = 7;
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * numdays));
    document.cookie = "style=" + color + "; path=; expires=" + exp.toGMTString();

}

function back_style() {
    new_style("-");
}

function next_style() {
    new_style("+");
}

function new_style(x) {

    drop_down = document.style_form.style_options;
    if (x == "+") {
        new_index = drop_down.selectedIndex + 1;
    } else if (x == "-") {
        new_index = drop_down.selectedIndex - 1;
    }
    if (new_index >= 0 && drop_down.options[new_index]) {

    } else {
        if (x == "+") {
            new_index = 0;
        } else if (x == "-") {
            new_index = drop_down.length - 1;
        }
    }
    color = drop_down.options[new_index].value;
    drop_down.selectedIndex = new_index;
    setClass($('body'), 'theme_' + color);

    var exp = new Date();
    var numdays = 7;
    exp.setTime(exp.getTime() + (1000 * 60 * 60 * 24 * numdays));
    document.cookie = "style=" + color + "; path=; expires=" + exp.toGMTString();

}

function toggle_tab(id) {
    factor = id.split('_')[0];

    $(factor + '_primary').style.display = 'none';
    $(factor + '_secondary').style.display = 'none';
    /*$(factor + '_antagonist').style.display = 'none';*/

    setClass($(factor + '_primary_tab'), '' + $(factor + '_primary_tab').className.gsub('underline', "") + ' underline');
    setClass($(factor + '_secondary_tab'), '' + $(factor + '_secondary_tab').className.gsub('underline', "") + ' underline');
    /*setClass($(factor + '_antagonist_tab'), '' + $(factor + '_antagonist_tab').className.gsub('underline', "") + ' underline');*/

    if (id == (factor + "_primary")) {

        $(factor + '_primary').style.display = 'block';
        setClass($(factor + '_primary_tab'), $(factor + '_primary_tab').className.gsub('underline', ""));

    }
    else if (id == (factor + "_secondary")) {
        $(factor + '_secondary').style.display = 'block';
        setClass($(factor + '_secondary_tab'), $(factor + '_secondary_tab').className.gsub('underline', ""));

    }
    /* else if (id == (factor + "_antagonist")) {
     $(factor + '_antagonist').style.display = 'block';
     setClass($(factor + '_antagonist_tab'), $(factor + '_antagonist_tab').className.gsub('underline', ""));

     }   */

}


function set_level(percent, id, way) {             //called
    if (way == "down") {
        $("" + id + "_e").style.height = (100 - percent) + "px";
        $("" + id + "_f").style.height = percent + "px";
    }
    if (way == "left") {
        $("" + id + "_f").style.width = (100 - percent) + "px";

    }
}

function toggle_running(elem) {
    if (elem.value == "false") {
        elem.value = "true";
        $('pause_training').innerHTML = "<b>pause training</b>";
    } else {
        elem.value = "false";
        $('pause_training').innerHTML = "<b>resume training</b>";
    }


}

function startExercise(i) {
    $('running').value = "true";
    $('allow_pause').value = "true";
    $('start_training').innerHTML = "";
    /*$('pause_training').innerHTML = "<b>pause training</b>";*/
    reps = $('reps').value;
    single_rep = $('single_rep').value * 1000;
    perc = 100;
    set_level(perc, "reps_div", "left");
    set_level(perc, "single_rep_div", "left");
    set_level(0, "pause_div", "left");
    do_rep(single_rep, single_rep, reps, reps, i);
}
function do_rep(single_rep, counter, reps, new_reps, i) {

    if (counter > 0) {

        if ($("hold_div_f").innerHTML == 0) {
            drown_to_null(single_rep, counter, "single_rep_div");
            //set_timeline(single_rep, counter) ;
            $("single_rep_div_f").innerHTML = (counter / 1000);

            if (counter > (single_rep / 2)) {
                extention = ".jpg";
                do_it = "push it!!";
            }
            else if (counter == (single_rep / 2)) {
                hold = $('hold').value * 1000;
                extention = "1.jpg";
                $("hold_div_f").innerHTML = hold;
                do_it = "Halten";
            }
            else if (counter < (single_rep / 2)) {
                extention = "1.jpg";
                do_it = "release";
            }
            $("training_pic").src = "/images/exercises/" + trainingsArray[i] + extention;

            $("training_text").innerHTML = do_it;

            counter = counter - 100;
            setTimeout('do_rep(' + single_rep + ',' + counter + ',' + reps + ',' + new_reps + ',' + i + ')', 100);
        }
        else {
            hold_on(hold, hold, single_rep, counter, reps, new_reps, i);
        }
    } else {
        fill("single_rep_div", 0);
        $("single_rep_div_f").innerHTML = 0;
        new_reps = new_reps - 1;
        if (new_reps > 0) {
            drown_to_null(reps, new_reps, "reps_div");
            $("reps_div_f").innerHTML = new_reps;
            full("single_rep_div");
            do_rep(single_rep, single_rep, reps, new_reps, i);
        } else {
            fill("reps_div", 0);
            $("reps_div_f").innerHTML = 0;

            i = i + 1;
            if (i < trainingsArray.length) {
                pause = $('pause').value * 1000;
                pause_c(pause, pause, i)
            } else {
                $('running').value = "false";
                $('allow_pause').value = "false";
                $('start_training').innerHTML = "<b>start</b>";
                /*$('pause_training').innerHTML = "";*/
            }
        }


    }


}

function pause_for(milliseconds) {
    var dt = new Date();
    while (new Date() - dt <= milliseconds) { /* Do nothing */
    }
}


function pause_c(x, y, i) {
    $("training_text").innerHTML = "noch " + (x / 1000) + " s pause";
    if (x > 0) {
        x = x - 100;
        drown_to_null(y, x, "pause_div");
        setTimeout("pause_c(" + x + "," + y + "," + i + ")", 100);
    } else {
        startExercise(i);
    }
}
function hold_on(max, counter, single_rep, counter_1, reps, new_reps, i) {
    $("training_text").innerHTML = "noch " + (counter / 1000) + " s halten";
    if (counter > 0) {
        counter = counter - 100;
        drown_to_null(max, counter, "hold_div");
        $("hold_div_f").innerHTML = counter;
        setTimeout("hold_on(" + max + "," + counter + "," + single_rep + "," + counter_1 + "," + reps + "," + new_reps + "," + i + ")", 100);
    } else {
        fill("hold_div", 0);
        do_rep(single_rep, counter_1, reps, new_reps, i);
    }
}
//set_level id to 100%
function full(id) {               //inject
    set_level(100, id, "left");
}

function fill(id, perc) {               //inject
    set_level(perc, id, "left");
}

//calles set_level function with max val and current val
function drown_to_null(counter_max, counter, id) {             //called
    var percent = ((100 / counter_max ) * counter);
    if (percent > 0) {
        set_level(percent, id, "left")
    }
}

function set_timeline(counter_max, counter) {             //called
    var usertime_percent = ((100 / counter_max ) * counter);
         duration = $('htmlPlayer').duration;
    x = (duration / 100) * usertime_percent;
             $('htmlPlayer').currentTime = duration - x;
             $('vid').value = (duration - x)/60;

}

function set_training(r, s, h, p) {
    $('reps').value = r;
    $('single_rep').value = s;
    $('hold').value = h;
    $('pause').value = p;

}