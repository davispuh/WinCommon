require 'fiddle'
require 'fiddle/import'

require_relative 'win_common/version'
require_relative 'win_common/constants'
require_relative 'win_common/errors'
require_relative 'win_common/libraries'
require_relative 'win_common/structs'
require_relative 'win_common/macro'

if defined?(Libraries::Kernel32)
    require_relative 'win_common/functions'
end

