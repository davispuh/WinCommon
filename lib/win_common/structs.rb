module WinCommon
    module Structs
        OSVERSIONINFOEXW = Fiddle::CStructBuilder.create(Fiddle::CStruct,
        [-Fiddle::TYPE_LONG,
            -Fiddle::TYPE_LONG,
            -Fiddle::TYPE_LONG,
            -Fiddle::TYPE_LONG,
            -Fiddle::TYPE_LONG,
            [Fiddle::TYPE_SHORT, 128],
            -Fiddle::TYPE_SHORT,
            -Fiddle::TYPE_SHORT,
            -Fiddle::TYPE_SHORT,
            -Fiddle::TYPE_CHAR,
            -Fiddle::TYPE_CHAR
        ],
        ['dwOSVersionInfoSize',
            'dwMajorVersion',
            'dwMinorVersion',
            'dwBuildNumber',
            'dwPlatformId',
            'szCSDVersion',
            'wServicePackMajor',
            'wServicePackMinor',
            'wSuiteMask',
            'wProductType',
            'wReserved'
        ])
    end
end
