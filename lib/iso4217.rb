module ISO4217
  VERSION = "001"

  class Code
    attr_reader :code, :num, :locations, :currency, :ccc

    def initialize(table)
      @code = table[:code]
      @num = table[:num]
      @locations = table[:locations]
      @currency = table[:currency]
      @ccc = table[:ccc]
      @obsolete = table[:obsolete]
    end

    def to_s; @currency; end

    def obsolete; CODE[@obsolete]; end
  end

  CODE = Hash.new
end

require "iso4217/code"
