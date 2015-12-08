use psd_count_contigs_janaka::psd_count_contigs_janakaImpl;

use psd_count_contigs_janaka::psd_count_contigs_janakaServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = psd_count_contigs_janaka::psd_count_contigs_janakaImpl->new;
    push(@dispatch, 'psd_count_contigs_janaka' => $obj);
}


my $server = psd_count_contigs_janaka::psd_count_contigs_janakaServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
