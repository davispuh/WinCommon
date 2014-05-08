module WinCommon
    module Errors
        class WinCommonError < RuntimeError; end
    end
end

require_relative 'errors/hresult'
