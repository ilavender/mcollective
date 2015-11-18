module MCollective
  module Agent
    class Monit<RPC::Agent

      # summary
      action "summary" do
	command = "/usr/bin/monit summary"
	shell = Shell.new(command)
        shell.runcommand
	if shell.status.exitstatus == 0
		out = []
		shell.stdout.each_line do |line|
		  if line !~ /^$/ && line =~ /Process/
			line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
		        process, status = line.split(" ", 2)
			status = status.gsub(/ $/, "")
		        out.push({ process => status })
		  end
		end
	        reply[:summary] = out
        	reply.statusmsg
	else
		reply.fail "ERROR: #{shell.stderr}"
	end	
      end

      # status
      action "status" do
        command = "/usr/bin/monit summary"
        shell = Shell.new(command)
        shell.runcommand
        if shell.status.exitstatus == 0
                out = []
                shell.stdout.each_line do |line|
                  if line !~ /^$/ && line =~ /Process/
                        line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
                        process, status = line.split(" ", 2)
                        status = status.gsub(/ $/, "")
			if process == request[:service]
                          out.push({ process => status })
                        end
                  end
                end
                reply[:summary] = out
                reply.statusmsg
        else
                reply.fail "ERROR: #{shell.stderr}"
        end
      end

      # stop
      action "stop" do

        command = "/usr/bin/monit summary"
        shell = Shell.new(command)
        shell.runcommand
        if shell.status.exitstatus == 0
                out = []
                shell.stdout.each_line do |line|
                  if line !~ /^$/ && line =~ /Process/
                        line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
                        process, status = line.split(" ", 2)
                        status = status.gsub(/ $/, "")
			if process == request[:service]
			  command = "/usr/bin/monit stop %s" % request[:service]
			  shell = Shell.new(command)
			  shell.runcommand
			  if shell.status.exitstatus != 0
			    reply.fail "ERROR: #{shell.stderr}"
			  end
			end
                  end
                end
        else
                reply.fail "ERROR: #{shell.stderr}"
        end

        command = "/usr/bin/monit summary"
        shell = Shell.new(command)
        shell.runcommand
        if shell.status.exitstatus == 0
                out = []
                shell.stdout.each_line do |line|
                  if line !~ /^$/ && line =~ /Process/
                        line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
                        process, status = line.split(" ", 2)
                        status = status.gsub(/ $/, "")
			if process == request[:service]
	                  out.push({ process => status })
			end
                  end
                end
                reply[:summary] = out
                reply.statusmsg
        else
                reply.fail "ERROR: #{shell.stderr}"
        end
      end

# stop
      action "start" do

        command = "/usr/bin/monit summary"
        shell = Shell.new(command)
        shell.runcommand
        if shell.status.exitstatus == 0
                out = []
                shell.stdout.each_line do |line|
                  if line !~ /^$/ && line =~ /Process/
                        line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
                        process, status = line.split(" ", 2)
                        status = status.gsub(/ $/, "")
			if process == request[:service]
			  command = "/usr/bin/monit start %s" % request[:service]
			  shell = Shell.new(command)
			  shell.runcommand
			  if shell.status.exitstatus != 0
			    reply.fail "ERROR: #{shell.stderr}"
			  end
			end
                  end
                end
        else
                reply.fail "ERROR: #{shell.stderr}"
        end

        command = "/usr/bin/monit summary"
        shell = Shell.new(command)
        shell.runcommand
        if shell.status.exitstatus == 0
                out = []
                shell.stdout.each_line do |line|
                  if line !~ /^$/ && line =~ /Process/
                        line = line.gsub(/Process|'/, "").gsub(/\s+/, " ")
                        process, status = line.split(" ", 2)
                        status = status.gsub(/ $/, "")
			if process == request[:service]
	                  out.push({ process => status })
			end
                  end
                end
                reply[:summary] = out
                reply.statusmsg
        else
                reply.fail "ERROR: #{shell.stderr}"
        end
      end

    end
  end
end
