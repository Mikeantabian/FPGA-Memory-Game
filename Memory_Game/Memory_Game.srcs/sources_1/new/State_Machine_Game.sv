
module State_Machine_Game
#(parameter Freq = 25000000,
            GAME_LIMIT = 6 )
(
    input logic i_clk,
    input logic [3:0] i_Switch,
    output logic [3:0] o_score,
    output logic [3:0] o_LED
);

    // Provide timescale
    timeunit 1ns;        // The time unit for delays and simulation time is 1 ns.
    timeprecision 1ps;   // The smallest unit of time that can be represented is 1 ps.
    
    //create states type using ENUM
    typedef enum logic [3:0] {
        START,
        PATTERN_OFF,
        PATTERN_SHOW,
        WAIT_PLAYER,
        INCR_SCORE,
        LOSER,
        WINNER
    } states;
    
    //define all necessary variables and nets
    states r_SM_Main;
    logic r_toggle;
    logic [3:0] r_Switch;
    logic r_Button_DV;
    logic [1:0] r_Pattern [0:10]; //2D arrayL 2 bits wide x 11 deep
    logic [21:0] w_LFSR_Data;
    logic [$clog2(GAME_LIMIT)-1:0] r_Index;
    logic [1:0] r_Button_ID;
    logic w_Count_En, w_toggle;
    

    always @(posedge i_clk) begin
        
        //reset game from any state
        if(i_Switch[0] & i_Switch[1]) begin
            r_SM_Main <= START;
        end else begin // end reset condition
            
            //Case statement for the game state machine
            case(r_SM_Main) 
                //stay in START state until user releases buttons
                START:
                begin
                    //wait for reset condition to go away
                    if(!i_Switch[0] & !i_Switch[1] & r_Button_DV) begin
                        o_score <= 0;
                        r_Index <= 0;
                        r_SM_Main <= PATTERN_OFF;
                    end
                end
                
                PATTERN_OFF:
                begin
                    if(!w_toggle & r_toggle) // falling edge found
                        r_SM_Main <= PATTERN_SHOW;
                end // end : PATTERN OFF
                
                PATTERN_SHOW:
                begin
                    if(!w_toggle & r_toggle) // falling edge found
                        if(o_score == r_Index) begin //if pattern is done on led
                            r_Index <= 0;
                            r_SM_Main <= WAIT_PLAYER; // wait for players response
                        end else begin
                           r_Index <= r_Index + 1;
                            r_SM_Main <= PATTERN_OFF; // continue pattern
                        end
                end // end: PATTERN SHOW
                
                WAIT_PLAYER:
                begin
                    if(r_Button_DV) // player pressed and releases switch
                        //player inputs correct pattern and pattern is completed
                        if(r_Pattern[r_Index] == r_Button_ID && r_Index == o_score) begin
                            r_Index <= 0;
                            r_SM_Main <= INCR_SCORE;
                        end 
                        else if (r_Pattern[r_Index] != r_Button_ID) begin // wrong input
                            r_SM_Main <= LOSER;
                        end else begin // correct input, pattern not completed yet
                            r_Index <= r_Index + 1;
                        end
                end // end: WAIT_PLAYER
                
                INCR_SCORE:
                begin
                    o_score <= o_score + 1; //increment score
                    if(o_score == GAME_LIMIT - 1)
                        r_SM_Main <= WINNER; // Game is completed and won
                    else
                        r_SM_Main <= PATTERN_OFF; // start new pattern
                end // end: INCR_SCORE
                
                //Display oxF on 7-segment display, wait for new game
                LOSER:
                begin
                    o_score <= 4'hF; // Loser!
                end // end: LOSER
                
                //Display oxA on 7-segment display, wait for new game
                WINNER:
                begin
                    o_score <= 4'hA; //  Winner!
                end // end : WINNER
                
                default:
                    r_SM_Main <= START; //start of the game
            endcase
            
        end //end non reset condition
    end // end: always block
    
    //Register in the LFSR to r_Pattern when game starts
    //Each 2 bits of LFSR is one value for the r_Pattern 2D array
    always @(posedge i_clk) begin
        if(r_SM_Main == START) begin
            r_Pattern[0] <= w_LFSR_Data[1:0];
            r_Pattern[1] <= w_LFSR_Data[3:2];
            r_Pattern[2] <= w_LFSR_Data[5:4];
            r_Pattern[3] <= w_LFSR_Data[7:6];
            r_Pattern[4] <= w_LFSR_Data[9:8];
            r_Pattern[5] <= w_LFSR_Data[11:10];
            r_Pattern[6] <= w_LFSR_Data[13:12];
            r_Pattern[7] <= w_LFSR_Data[15:14];
            r_Pattern[8] <= w_LFSR_Data[17:16];
            r_Pattern[9] <= w_LFSR_Data[19:18];
            r_Pattern[10] <= w_LFSR_Data[21:20];
        end // end if (r_SM_main == START)
    end // end always block
    
    //assign the output leds
    assign o_LED[0] = (r_SM_Main == PATTERN_SHOW && r_Pattern[r_Index] == 2'b00) ? 1'b1 : i_Switch[0];
    assign o_LED[1] = (r_SM_Main == PATTERN_SHOW && r_Pattern[r_Index] == 2'b01) ? 1'b1 : i_Switch[1];
    assign o_LED[2] = (r_SM_Main == PATTERN_SHOW && r_Pattern[r_Index] == 2'b10) ? 1'b1 : i_Switch[2];
    assign o_LED[3] = (r_SM_Main == PATTERN_SHOW && r_Pattern[r_Index] == 2'b11) ? 1'b1 : i_Switch[3];
    
    //Create registers to enable falling edge detection
    always @(posedge i_clk) begin
        r_toggle <= w_toggle;
        r_Switch[0] <= i_Switch[0];
        r_Switch[1] <= i_Switch[1];
        r_Switch[2] <= i_Switch[2];
        r_Switch[3] <= i_Switch[3];
        
        //first switch was pushed and released
        if(r_Switch[0] & !i_Switch[0]) begin
            r_Button_DV <= 1'b1;
            r_Button_ID <= 0;
        end 
        
        //second switch was pushed and released
        else if(r_Switch[1] & !i_Switch[1]) begin
            r_Button_DV <= 1'b1;
            r_Button_ID <= 1;
        end 
        
        //third switch was pushed and released
        else if(r_Switch[2] & !i_Switch[2]) begin
            r_Button_DV <= 1'b1;
            r_Button_ID <= 2;
        end 
        
        //fourth switch was pushed and released
        else if(r_Switch[3] & !i_Switch[3]) begin
            r_Button_DV <= 1'b1;
            r_Button_ID <= 3;
        end else begin //none of the switches were pressed and released
            r_Button_DV <= 1'b0;
            r_Button_ID <= 0;
        end
    end // end: always block
    
    //instantiate Count_And_Toggle and LFSR_22
    //w_Count_En is high when state machine is in PATTERN_SHOW or PATTERN_OFF
    assign w_Count_En = (r_SM_Main == PATTERN_SHOW || r_SM_Main == PATTERN_OFF);
    
    Count_And_Toggle #(.COUNT_LIMIT(Freq/4)) Count_Inst(
        .i_clk,
        .i_En(w_Count_En),
        .o_toggle(w_toggle)
    );
    
    LFSR #(.N(22)) (
        .clk(i_clk),
        .o_LFSR_data(w_LFSR_Data),
        .o_LFSR_done() //leave unconnected
    );
    

endmodule
