metadata    :name        => "Monit process status",
            :description => "Retrieve status for a given monit process",
	    :author      => "Itamar Lavender <itamar.lavender@gmail.com>",
            :license     => 'GPLv2',
            :version     => '0.1',
            :url         => 'https://github.com/ilavender/mcollective',
            :timeout     => 1

dataquery :description => "Monit status" do
    input :query,
          :prompt => "Process Name",
          :description => "Valid Process Name",
          :type => :string,
	  :validation => /^[\w\-\.]+$/,
	  :optional    => false,
          :maxlength => 120

    output :status,
           :description => "Monit process status",
           :display_as => "Status"
end
