require 'fiddle'
require 'fiddle/import'

class CellForge
  def initialize(lib_path = nil)
    # Default to ../../lib/libcellforge.so
    base_path = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'libcellforge.so')
    final_path = lib_path || base_path
    
    unless File.exist?(final_path)
      raise "Missing CellForge library at #{final_path}\nRun `make` from the project root to build it."
    end
    
    # Load the shared library
    @lib = Fiddle.dlopen(final_path)
    
    # Get the cellforge function
    @cellforge_func = Fiddle::Function.new(
      @lib['cellforge'],
      [],
      Fiddle::TYPE_VOIDP
    )
  end
  
  def hello
    result_ptr = @cellforge_func.call
    result_ptr.to_s
  end
end 