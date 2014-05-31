module WinCommon
    module Errors
        class WinCommonError < RuntimeError; end
    end

    module Constants
        FACILITY_NULL     = 0x00
        FACILITY_RPC      = 0x01
        FACILITY_DISPATCH = 0x02
        FACILITY_STORAGE  = 0x03
        FACILITY_ITF      = 0x04
        FACILITY_WIN32    = 0x07
        FACILITY_WINDOWS  = 0x08
        FACILITY_SSPI     = 0x09
        FACILITY_CONTROL  = 0x0A
        FACILITY_CERT     = 0x0B
        FACILITY_INTERNET = 0x0C
    end
end

require_relative 'errors/hresult'
