module MCollective
  module Data
    class Monit_data<Base
      activate_when { File.executable?("/usr/bin/monit") }

      query do |query|
	Log.debug("query get status for monit service: #{query}")
	value = nil
        shell = Shell.new("/usr/bin/monit summary")
        shell.runcommand
        if shell.status.exitstatus == 0
                shell.stdout.each_line do |line|
                  if line !~ /^$/ && line =~ /Process/
                        line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
                        process, status = line.split(" ", 2)
                        status = status.gsub(/ $/, "")
			if query == process
		  	  Log.debug("found status for monit service: #{query}")
			  value = status
			end
                  end
                end
		if value != nil
                  result[:status] = value
		else
		  Log.debug("Could not get status for monit service: #{query}")
		end
        end
      end
    end
  end
end
