module WinCommon
    module Structs
        class POINT < FFI::Struct
            layout({
                :x => :LONG,
                :y => :LONG
            })
        end

        class SIZE < FFI::Struct
            layout({
                :cx => :LONG,
                :cy => :LONG
            })
        end

        class FILETIME < FFI::Struct
            layout({
                :dwLowDateTime  => :DWORD,
                :dwHighDateTime => :DWORD
            })
        end

        class GUID < FFI::Struct
            layout({
                :data1 => :ulong,
                :data2 => :ushort,
                :data3 => :ushort,
                :data4 => [ :uchar, 8 ]
            })

            def from_str(guid)
                data = [guid.gsub(/[{\-}]/, '')].pack('H*').unpack('L>S>2C8')
                self[:data1] = data[0]
                self[:data2] = data[1]
                self[:data3] = data[2]
                3.upto(data.count - 1) do |i|
                    self[:data4][i-3] = data[i]
                end
            end

            def to_s
                str = "%08X-%04X-%04X-%02X%02X-" % [self[:data1], self[:data2], self[:data3], self[:data4][0], self[:data4][1]]
                2.upto(7) do  |i|
                    str << "%02X" % self[:data4][i]
                end
                str
            end

            def to_ref
                self.ptr
            end
        end

        IID = GUID
        CLSID = GUID
        FMTID = GUID

        class WideString
            extend FFI::DataConverter
            native_type FFI::Type::POINTER
            def self.to_native(value, context)
            end

            def self.from_native(pointer, context)
            end

            def self.size
                FFI.type_size(FFI::Type::POINTER)
            end

            def self.reference_required?
                false
            end
        end
    end

    module Typedefs
        FFI.typedef Structs::POINT.ptr,                      :PPOINT
        FFI.typedef Structs::SIZE.ptr,                       :PSIZE
        FFI.typedef Structs::FILETIME.ptr,                   :PFILETIME
        FFI.typedef Structs::GUID.ptr,                       :LPGUID
        FFI.typedef Structs::GUID.ptr,                       :LPCGUID
        FFI.typedef Structs::IID.ptr,                        :LPIID
        FFI.typedef Structs::CLSID.ptr,                      :LPCLSID
        FFI.typedef Structs::FMTID.ptr,                      :LPFMTID
        FFI.typedef Structs::GUID.by_ref(:in),               :REFGUID
        FFI.typedef Structs::IID.by_ref(:in),                :REFIID
        FFI.typedef Structs::CLSID.by_ref(:in),              :REFCLSID
    end
end
