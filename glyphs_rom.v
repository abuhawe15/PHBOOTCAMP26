`default_nettype none

module glyphs_rom(
    input  wire [5:0] c,
    input  wire [3:0] y,
    input  wire [2:0] x,
    output reg pixel
);
    reg [7:0] rb;

    always @(*) begin
        case (c % 12)

            // 0 = A
            0, 1, 9: begin
                case (y)
                    2:         rb = 8'h3C;
                    3,4,5:     rb = 8'h66;
                    6,7:       rb = 8'hFF;
                    8,9,10:    rb = 8'hC3;
                    default:   rb = 8'h00;
                endcase
            end

            // 2 = R
            2: begin
                case (y)
                    2,6:       rb = 8'hFC;
                    3,4,5:     rb = 8'hC6;
                    7,8,9:     rb = 8'hD8;
                    10:        rb = 8'hC6;
                    default:   rb = 8'h00;
                endcase
            end

            // 3 = O
            3: begin
                case (y)
                    2,10:      rb = 8'h3C;
                    3,9:       rb = 8'h66;
                    4,5,6,7,8: rb = 8'hC3;
                    default:   rb = 8'h00;
                endcase
            end

            // 4 = N
            4: begin
                case (y)
                    2,3:       rb = 8'hC6;
                    4:         rb = 8'hE6;
                    5:         rb = 8'hF6;
                    6:         rb = 8'hD6;
                    7:         rb = 8'hC6;
                    8:         rb = 8'hCE;
                    9,10:      rb = 8'hC6;
                    default:   rb = 8'h00;
                endcase
            end

            // 5 = SPACE
            5: begin
                rb = 8'h00;
            end

            // 6 = B
            6: begin
                case (y)
                    2,6,10:    rb = 8'hFC;
                    3,4,5,7,8,9: rb = 8'hC6;
                    default:   rb = 8'h00;
                endcase
            end

            // 7 = U
            7: begin
                case (y)
                    2,3,4,5,6,7,8,9: rb = 8'hC6;
                    10:        rb = 8'h7E;
                    default:   rb = 8'h00;
                endcase
            end

            // 8 = H
            8: begin
                case (y)
                    2,3,4,5,7,8,9,10: rb = 8'hC6;
                    6:         rb = 8'hFE;
                    default:   rb = 8'h00;
                endcase
            end

            // 10 = W
            10: begin
                case (y)
                    2,3,4,5:   rb = 8'hC3;
                    6:         rb = 8'hDB;
                    7:         rb = 8'hFF;
                    8:         rb = 8'hE7;
                    9,10:      rb = 8'hC3;
                    default:   rb = 8'h00;
                endcase
            end

            // 11 = E
            11: begin
                case (y)
                    2,6,10:    rb = 8'hFE;
                    3,4,5,7,8,9: rb = 8'hC0;
                    default:   rb = 8'h00;
                endcase
            end

            default: begin
                rb = 8'h00;
            end
        endcase

        pixel = rb[7-x];
    end
endmodule
