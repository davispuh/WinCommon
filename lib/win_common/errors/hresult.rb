module WinCommon
    module Errors
        module HRESULT
            # Defined in winerror.h
            S_OK                                 = 0x00000000
            S_FALSE                              = 0x00000001
            E_PENDING                            = 0x8000000A
            E_BOUNDS                             = 0x8000000B
            E_CHANGED_STATE                      = 0x8000000C
            E_ILLEGAL_STATE_CHANGE               = 0x8000000D
            E_ILLEGAL_METHOD_CALL                = 0x8000000E
            RO_E_METADATA_NAME_NOT_FOUND         = 0x8000000F
            RO_E_METADATA_NAME_IS_NAMESPACE      = 0x80000010
            RO_E_METADATA_INVALID_TYPE_FORMAT    = 0x80000011
            RO_E_INVALID_METADATA_FILE           = 0x80000012
            RO_E_CLOSED                          = 0x80000013
            RO_E_EXCLUSIVE_WRITE                 = 0x80000014
            RO_E_CHANGE_NOTIFICATION_IN_PROGRESS = 0x80000015
            RO_E_ERROR_STRING_NOT_FOUND          = 0x80000016
            E_STRING_NOT_NULL_TERMINATED         = 0x80000017
            E_ILLEGAL_DELEGATE_ASSIGNMENT        = 0x80000018
            E_ASYNC_OPERATION_NOT_STARTED        = 0x80000019
            E_APPLICATION_EXITING                = 0x8000001A
            E_APPLICATION_VIEW_EXITING           = 0x8000001B
            RO_E_MUST_BE_AGILE                   = 0x8000001C
            RO_E_UNSUPPORTED_FROM_MTA            = 0x8000001D
            RO_E_COMMITTED                       = 0x8000001E
            RO_E_BLOCKED_CROSS_ASTA_CALL         = 0x8000001F
            E_NOTIMPL                            = 0x80004001
            E_NOINTERFACE                        = 0x80004002
            E_POINTER                            = 0x80004003
            E_ABORT                              = 0x80004004
            E_FAIL                               = 0x80004005
            E_UNEXPECTED                         = 0x8000FFFF
            E_PATH_NOT_FOUND                     = 0x80070003
            E_ACCESSDENIED                       = 0x80070005
            E_HANDLE                             = 0x80070006
            E_INVALID_DATA                       = 0x8007000D
            E_OUTOFMEMORY                        = 0x8007000E
            E_INVALIDARG                         = 0x80070057
            module SEVERITY
                SUCCESS = 0
                ERROR   = 1
            end

            def self.toUnsigned(hresult)
                hresult += 0x1_0000_0000 if (hresult < 0)
                hresult
            end

            def self.Compare(error, code)
                error = toUnsigned(error)
                error <=> code
            end

            def self.Equal?(error, codes)
                [*codes].include?(toUnsigned(error))
            end

            def self.ErrorIfEqual(error, code)
                raise HRESULTError.new(error) if Equal?(error, code)
            end

            def self.GetSeverity(hresult)
                (toUnsigned(hresult) >> 31) & 0x01
            end

            def self.GetFacility(hresult)
                (toUnsigned(hresult) >> 16) & 0x1FFF
            end

            def self.GetCode(hresult)
                toUnsigned(hresult) & 0x0000FFFF
            end

            def self.IsSuccess?(hresult)
                GetSeverity(hresult) == SEVERITY::SUCCESS
            end

            def self.IsError?(hresult)
                GetSeverity(hresult) == SEVERITY::ERROR
            end

            def self.GetName(hresult)
                hresult = toUnsigned(hresult)
                constants(true).each do |name|
                    if const_get(name) == hresult
                        return name.to_s
                    end
                end
                if IsSuccess?(hresult)
                    'UKNOWN_SUCCESS'
                else
                    'UKNOWN_ERROR'
                end
            end

            def self.GetNameCode(hresult)
                code = HRESULT.toUnsigned(hresult)
                HRESULT.GetName(code) + " [0x%08X]" % code
            end
        end

        class HRESULTError < WinCommonError
            attr_reader :code
            def initialize(hr)
                @code = HRESULT.toUnsigned(hr)
                super(HRESULT.GetNameCode(@code))
            end
        end
    end
end
