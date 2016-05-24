module WinCommon

    module Libraries

        # Windows Kernel32 library
        Kernel32 = Fiddle.dlopen('kernel32')

    rescue Fiddle::DLError
        # Ignore
    end

end

