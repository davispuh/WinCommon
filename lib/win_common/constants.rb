module WinCommon
    module Constants
        FALSE = 0
        TRUE  = 1
        SpecVersion = {
            :WIN32_WINNT_NT4     => 0x0400,
            :WIN32_WINNT_WIN2K   => 0x0500,
            :WIN32_WINNT_WINXP   => 0x0501,
            :WIN32_WINNT_WS03    => 0x0502,
            :WIN32_WINNT_VISTA   => 0x0600,
            :WIN32_WINNT_WIN7    => 0x0601,
            :WIN32_WINNT_WIN8    => 0x0602,
            :WIN32_WINNT_WINBLUE => 0x0603
        }
        VER_MINORVERSION                = 0x0000001
        VER_MAJORVERSION                = 0x0000002
        VER_BUILDNUMBER                 = 0x0000004
        VER_PLATFORMID                  = 0x0000008
        VER_SERVICEPACKMINOR            = 0x0000010
        VER_SERVICEPACKMAJOR            = 0x0000020
        VER_SUITENAME                   = 0x0000040
        VER_PRODUCT_TYPE                = 0x0000080
        VER_PLATFORM_WIN32s             = 0
        VER_PLATFORM_WIN32_WINDOWS      = 1
        VER_PLATFORM_WIN32_NT           = 2
        VER_EQUAL                       = 1
        VER_GREATER                     = 2
        VER_GREATER_EQUAL               = 3
        VER_LESS                        = 4
        VER_LESS_EQUAL                  = 5
        VER_AND                         = 6
        VER_OR                          = 7
        VER_CONDITION_MASK              = 7
        VER_NUM_BITS_PER_CONDITION_MASK = 3
    end
end
