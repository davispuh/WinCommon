module WinCommon
    module Macro
        def self.LOWORD(dword)
            dword & 0xFFFF
        end

        def self.HIWORD(dword)
            (dword >> 16) & 0xFFFF
        end

        def self.LOBYTE(word)
            word & 0xFF
        end

        def self.HIBYTE(word)
            (word >> 8) & 0xFF
        end

        def self.SpecVersion(version)
            Constants::SpecVersion(version)
        end

        def self.HRESULT_FROM_WIN32(error)
            error <= 0 ? error : ((error & 0x0000FFFF) | (Constants::FACILITY_WIN32 << 16) | 0x80000000)
        end
    end
end
