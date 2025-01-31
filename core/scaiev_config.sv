package scaiev_config;
    //Enable SCAIE-V register bitmap / scoreboard and hazard stall logic.
    localparam ENABLE_SCAIEV_REGHAZARD = 0;
    //Enable support for instruction injection into decode stage.
    //Switches to a dedicated instruction_metadata_and_id_management implementation.
    localparam ENABLE_DECODE_INJECT = 0;

    //Enable alternative decoupled writeback path.
    //Reuses register allocation in SCAIE-V and does not require instruction injection.
    localparam ENABLE_DECOUPLED_WRITEBACK = 0;

    //Enable WaW prevention for alternative decoupled writeback path.
    //Prevents use after free conditions if an instruction that overrides a decoupled ISAX's logical destination register
    // completes first and frees the still-to-be-written physical destination register.
    localparam ENABLE_DECOUPLED_WRITEBACK_WAW = 1;

    //Enable use of RD as a third native register file read port.
    //The alternative is to inject a 'read' pseudo-instruction managed through scaiev_glue,
    // which turns the single instruction into two (halving throughput).
    localparam ENABLE_NATIVE_RD_AS_RS = 0;

endpackage