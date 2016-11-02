class Report
  attr_accessor :results, :beginning_time, :end_time

  def initialize
    @beginning_time = Time.now
    @end_time = @beginning_time
    @results = []
  end

  def addResult result
    @results.push result
  end

  def addResults results
    @results.concat results
  end

  def getSuccessResult
    @results.select {|result| result.success?}
  end

  def getFailureResult
    @results.select {|result| result.failure?}
  end

  def success?
    @results.all? {|result | result.success?}
  end

  def timeLapse
    ((@end_time - @beginning_time) * 24 * 60 * 60).to_f
  end

  def report
    @end_time = Time.now
    self.results.each do |result|
      puts result.message
    end
    
     puts self.results.length.to_s + " tests"
     puts self.getSuccessResult.length.to_s + " tests ejecutados correctamente"
     puts self.getFailureResult.length.to_s +  " tests fallidos"
     puts "Tests ejecutados en in " + self.timeLapse.to_s + " segundos"
  end

end