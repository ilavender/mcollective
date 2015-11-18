metadata :name        => 'monit',
         :description => 'monit actions using MCollective',
         :author      => "Itamar Lavender <itamar.lavender@gmail.com>",
         :license     => 'GPLv2',
         :version     => '0.1',
         :url         => 'https://bitbucket.org/ilavender/mcollective',
         :timeout     => 5

action 'status', :description => 'return status of monit managed service' do
    display :always

    input :service,
          :prompt      => 'Service',
          :description => 'Monit service name',
          :type        => :string,
          :validation  => '.*',
          :optional    => false,
          :maxlength   => 1024

    output :summary,
        :description => 'summary',
        :display_as  => 'Summary',
        :default     => ''

    summarize do
        aggregate summary(:summary)
    end

end

action 'stop', :description => 'stop monit managed service' do
    display :always

    input :service,
          :prompt      => 'Service',
          :description => 'Monit service name',
          :type        => :string,
          :validation  => '.*',
          :optional    => false,
          :maxlength   => 1024

    output :summary,
        :description => 'summary',
        :display_as  => 'Summary',
        :default     => ''

    summarize do
        aggregate summary(:summary)
    end

end

action 'start', :description => 'start monit managed service' do
    display :always

    input :service,
          :prompt      => 'Service',
          :description => 'Monit service name',
          :type        => :string,
          :validation  => '.*',
          :optional    => false,
          :maxlength   => 1024

    output :summary,
        :description => 'summary',
        :display_as  => 'Summary',
        :default     => ''

    summarize do
        aggregate summary(:summary)
    end

end


action 'summary', :description => 'show monit summary' do
    display :always

    output :summary,
        :description => 'summary',
        :display_as  => 'Summary',
        :default     => ''

end
