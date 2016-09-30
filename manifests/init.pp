class cul_sufia (
    $ensure           = present,
    $fedora_version   = undef,
    $fedorauser       = 'tomcat',
    )

{

    file {"${cul_base::culshare}/fits":
        ensure  => directory,
        source  => "puppet:///modules/cul_sufia/fits",
        recurse => true,
        mode    => '0755'
    }

    file {"${cul_base::culbin}/fits.sh":
        ensure  => symlink,
        target  => "${cul_base::culshare}/fits/fits.sh",
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => FILE["${cul_base::culshare}/fits"]
    }

    file {"${cul_base::culbin}/fits-env.sh":
        ensure  => symlink,
        target  => "${cul_base::culshare}/fits/fits-env.sh",
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => FILE["${cul_base::culshare}/fits"]
    }

    file {"${cul_base::culbin}/fits-ngserver.sh":
        ensure  => symlink,
        target  => "${cul_base::culshare}/fits/fits-ngserver.sh",
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => FILE["${cul_base::culshare}/fits"]
    }
       
    file {"${cul_base::culbin}/ffmpeg":
        ensure  => present,
        source  => "puppet:///modules/cul_sufia/ffmpeg/ffmpeg",
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }

    file { '/cul/bin/phantomjs':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        source  => "puppet:///modules/cul_sufia/phantomjs/phantomjs-1.9.8-linux-x86_64/bin/phantomjs"       
    }
}
