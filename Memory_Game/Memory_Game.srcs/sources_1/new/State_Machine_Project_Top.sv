/*****************************************************************************
 * Module Name: State_Machine_Project_Top
 *
 * Description:
 * This module serves as the top-level module for a state machine project. It interfaces
 * with four input switches for entering the pattern, four LEDs for displaying the pattern,
 * and a 7-segment display for the scoreboard. Parameters allow for customization of game
 * limits, clock frequency, debounce limit, and the number of buttons. It debounces the
 * input switches, interfaces with the game logic, and converts the binary score to a
 * 7-segment display format.
 *
 * Parameters:
 * - GAME_LIMIT: Specifies the game limit, which can be adjusted to change difficulty.
 * - Freq: Specifies the clock frequency, set to 25 MHz.
 * - DEBOUNCE_LIMIT: Specifies the debounce limit, set to 10 ms.
 * - NUM_BUTTONS: Specifies the number of buttons, set to 4.
 *
 * Ports:
 * - Input:
 *   - i_clk: Clock signal for synchronous operations.
 *   - i_Switch: Array of four input switches for entering the pattern.
 * - Output:
 *   - o_LED: Array of four LEDs for displaying the pattern.
 *   - o_Segments: Array of seven output ports for the 7-segment display scoreboard.
 *
 * Notes:
 * - This module interfaces with the game logic and the debounce filter for switch inputs.
 * - It converts the binary score to a 7-segment display format.
 *
 * Author: [Author Name]
 * Date: [Date]
 *****************************************************************************/

module State_Machine_Project_Top(
    input logic i_clk,
    //input switches for entering the pattern
    input logic [3:0] i_Switch,
    //output LEDs for displaying the pattern
    output logic [3:0] o_LED,
    //scoreboard on the ssd
    output logic [6:0] o_Segments
);

    // Provide timescale
    timeunit 1ns;        // The time unit for delays and simulation time is 1 ns.
    timeprecision 1ps;   // The smallest unit of time that can be represented is 1 ps.
    
    localparam GAME_LIMIT = 7; //can increase or decrease to change difficulty
    localparam Freq = 25000000; // 25 MHz clock
    localparam DEBOUNCE_LIMIT = 250000; // 10 ms debounce filter
    localparam NUM_BUTTONS = 4; // # of switches being debounced
    
    logic [3:0] w_Switch;
    logic [6:0] w_Segments;
    logic [3:0] w_score;
    
    //Debounce all the input switches
    Debounce_Filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT), .NUM_BUTTONS(NUM_BUTTONS)) Debounce_Switches (
        .i_clk,
        .i_Bouncy(i_Switch), //switches before debouce
        .o_Debounced(w_Switch) //switches after debounce
    );
    
    //Instance of the game
    State_Machine_Game #() Game_Inst (
        .i_clk,
        .i_Switch(w_Switch),
        .o_score(w_score),
        .o_LED(o_LED)
    );
    
    //Instance of Binary to 7-Segment converter
    Binary_To_7Segment Scoreboard (
        .i_clk,
        .i_Binary_Num(w_score), //give score in binary
        .o_Segments(w_Segments) //get score in 7 bits for ssd
    );
    
    assign o_Segments = w_Segments;

endmodule
