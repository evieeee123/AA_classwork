require "singleton"

class NullPiece
include Singleton
    def empty?
        return true
    end
end
