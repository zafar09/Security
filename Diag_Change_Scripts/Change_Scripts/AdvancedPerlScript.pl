#!/usr/bin/perl
require Opsware::NAS::Client;
use Data::Dumper;

my($host, $user, $pass) = ('localhost','admin','password');
my $nas = Opsware::NAS::Client->new();
my $res = $nas->login(-user => $user, -pass => $pass, -host => $host );
if ($res->ok()) {
        printf STDOUT ("Login succeeded\n");
        $res = $nas->deploy_change_plan( ip => "192.168.122.123", name => "CPQCTP1B356793", user => "Admin", passwd => "password", enablepasswd => "rnetpa55" );
        if ($res->ok()) {
                foreach my $var1 (@$res[0]){
                foreach my $var2 (@$var1){
                print " var is $var2 \n";
            }
        }

                #print Dumper($res);
        } else {
                printf STDERR ("*** New user creation error: %s\n", $res->error_message());
                exit(1);
        }
} else {
        printf STDERR ("*** login error: %s\n", $res->error_message());
        exit(1);
}
