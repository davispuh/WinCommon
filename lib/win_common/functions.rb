module WinCommon
    module Functions

        GetLastError        = Fiddle::Function.new( Libraries::Kernel32['GetLastError'], [], Fiddle::TYPE_LONG )
        VerifyVersionInfo   = Fiddle::Function.new( Libraries::Kernel32['VerifyVersionInfoW'],
        [Fiddle::TYPE_VOIDP, -Fiddle::TYPE_LONG, -Fiddle::TYPE_LONG_LONG], Fiddle::TYPE_INT )
        VerSetConditionMask = Fiddle::Function.new( Libraries::Kernel32['VerSetConditionMask'],
        [-Fiddle::TYPE_LONG_LONG, -Fiddle::TYPE_LONG, -Fiddle::TYPE_CHAR], Fiddle::TYPE_LONG_LONG )

        def self.IsWindowsVersionOrGreater?(wMajorVersion, wMinorVersion, wServicePackMajor = 0)
            osvi = Structs::OSVERSIONINFOEXW.malloc
            osvi.dwOSVersionInfoSize = Structs::OSVERSIONINFOEXW.size
            osvi.dwMajorVersion      = wMajorVersion
            osvi.dwMinorVersion      = wMinorVersion
            osvi.wServicePackMajor   = wServicePackMajor

            dwlConditionMask = VerSetConditionMask.call(VerSetConditionMask.call(VerSetConditionMask.call(0,
            Constants::VER_MAJORVERSION, Constants::VER_GREATER_EQUAL),
            Constants::VER_MINORVERSION, Constants::VER_GREATER_EQUAL),
            Constants::VER_SERVICEPACKMAJOR, Constants::VER_GREATER_EQUAL)

            dwTypeMask = Constants::VER_MAJORVERSION | Constants::VER_MINORVERSION | Constants::VER_SERVICEPACKMAJOR
            VerifyVersionInfo.call(osvi, dwTypeMask, dwlConditionMask) != Constants::FALSE
        end

        def self.IsWindows7OrGreater?
            win7 = Constants::SpecVersion[:WIN32_WINNT_WIN7]
            IsWindowsVersionOrGreater?(Macro::HIBYTE(win7), Macro::LOBYTE(win7), 0)
        end

        def self.IsWindows7SP1OrGreater?
            win7 = Constants::SpecVersion[:WIN32_WINNT_WIN7]
            IsWindowsVersionOrGreater?(Macro::HIBYTE(win7), Macro::LOBYTE(win7), 1)
        end

        def self.IsWindows8OrGreater?
            win8 = Constants::SpecVersion[:WIN32_WINNT_WIN8]
            IsWindowsVersionOrGreater?(Macro::HIBYTE(win8), Macro::LOBYTE(win8), 0)
        end

        def self.IsWindows8Point1OrGreater?
            winBlue = Constants::SpecVersion[:WIN32_WINNT_WINBLUE]
            IsWindowsVersionOrGreater?(Macro::HIBYTE(winBlue), Macro::LOBYTE(winBlue), 0)
        end
    end
end
