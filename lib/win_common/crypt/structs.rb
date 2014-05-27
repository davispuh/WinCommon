module WinCommon
    module Crypt
        module Structs
            class CRYPT_INTEGER_BLOB < FFI::Struct
                layout({
                    :cbData => :DWORD,
                    :pbData => :PBYTE
                })
            end

            CRYPT_OBJID_BLOB = CRYPT_INTEGER_BLOB
            CERT_NAME_BLOB = CRYPT_INTEGER_BLOB

            class CRYPT_ALGORITHM_IDENTIFIER < FFI::Struct
                layout({
                    :pszObjId   => :LPSTR,
                    :Parameters => CRYPT_OBJID_BLOB
                })
            end

            class CRYPT_BIT_BLOB < FFI::Struct
                layout({
                    :cbData      => :DWORD,
                    :pbData      => :PBYTE,
                    :cUnusedBits => :DWORD
                })
            end

            class CERT_PUBLIC_KEY_INFO < FFI::Struct
                layout({
                    :Algorithm => CRYPT_ALGORITHM_IDENTIFIER,
                    :PublicKey => CRYPT_BIT_BLOB
                })
            end

            class CERT_EXTENSION < FFI::Struct
                layout({
                    :pszObjId  => :LPSTR,
                    :fCritical => :BOOL,
                    :Value     => CRYPT_OBJID_BLOB
                })
            end
            FFI.typedef CERT_EXTENSION.ptr, :PCERT_EXTENSION

            class CERT_INFO < FFI::Struct
                layout({
                    :dwVersion            => :DWORD,
                    :SerialNumber         => CRYPT_INTEGER_BLOB,
                    :SignatureAlgorithm   => CRYPT_ALGORITHM_IDENTIFIER,
                    :Issuer               => CERT_NAME_BLOB,
                    :NotBefore            => WinCommon::Structs::FILETIME,
                    :NotAfter             => WinCommon::Structs::FILETIME,
                    :Subject              => CERT_NAME_BLOB,
                    :SubjectPublicKeyInfo => CERT_PUBLIC_KEY_INFO,
                    :IssuerUniqueId       => CRYPT_BIT_BLOB,
                    :SubjectUniqueId      => CRYPT_BIT_BLOB,
                    :cExtension           => :DWORD,
                    :rgExtension          => :PCERT_EXTENSION
                })
            end

            class CERT_CONTEXT < FFI::Struct
                layout({
                    :dwCertEncodingType => :DWORD,
                    :pbCertEncoded => :PBYTE,
                    :cbCertEncoded => :DWORD,
                    :pCertInfo => CERT_INFO.ptr,
                    :hCertStore => :HCERTSTORE
                })
            end

        end

        module Typedefs
            FFI.typedef Structs::CRYPT_INTEGER_BLOB.ptr,         :PCRYPT_INTEGER_BLOB
            FFI.typedef Structs::CRYPT_OBJID_BLOB.ptr,           :PCRYPT_OBJID_BLOB
            FFI.typedef Structs::CERT_NAME_BLOB.ptr,             :PCERT_NAME_BLOB
            FFI.typedef Structs::CRYPT_ALGORITHM_IDENTIFIER.ptr, :PCRYPT_ALGORITHM_IDENTIFIER
            FFI.typedef Structs::CRYPT_BIT_BLOB.ptr,             :PCRYPT_BIT_BLOB
            FFI.typedef Structs::CERT_PUBLIC_KEY_INFO.ptr,       :PCERT_PUBLIC_KEY_INFO
            FFI.typedef Structs::CERT_INFO.ptr,                  :PCERT_INFO
            FFI.typedef Structs::CERT_CONTEXT.ptr,               :PCERT_CONTEXT
        end
    end
end
