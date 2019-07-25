contract ACL {
    /// Allowed transaction types mask
    uint32 constant None = 0;
    uint32 constant All = 0xffffffff;
    uint32 constant Basic = 0x01;
    uint32 constant Call = 0x02;
    uint32 constant Create = 0x04;
    uint32 constant Private = 0x08;

    function allowedTxTypes(address sender) public returns (uint32)
    {
        if (sender == 0x44B318A63D2E69d4Cd6144B33B3e823Fa02Cec40) return All; //MOC
        if (sender == 0x9C39Ff809B76556FF02cE6890D53C4AE98B42302) return All; //DEV1
        if (sender == 0xBeFE052553bd1F3415de0Ab68C691a2009887e29) return All; //DEV2
        if (sender == 0xC2A60354Df9541Cf60055556C1Ce2639894333C3) return All; //DEV3

        return Basic | Call;
    }
}
