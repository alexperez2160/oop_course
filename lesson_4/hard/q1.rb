class SecretFile
  
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end
  
  def data 
    @logger.create_log_entry
    @data
  end 

end

class SecurityLogger
  def initialize
    @access_times = 0
  end 
  def create_log_entry
    @access_times += 1
    puts "@{@access_times}"
  end
end

log_track = SecurityLogger.new

num1 = SecretFile.new(1234, log_track)

p log_track

num1.data

p log_track 




