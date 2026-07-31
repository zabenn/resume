print STDERR "### LATEXMKRC LOADED, ARGV = @ARGV ###\n";
my %jobnames = (
    'resume'       => 'Sam Cribbs Résumé',
    'cover_letter' => 'Sam Cribbs Cover Letter',
);
my %pngnames = (
    'resume'       => 'resume',
    'cover_letter' => 'cover_letter',
);

my $target;
for (@ARGV) {
    (my $base = $_) =~ s{.*[/\\]}{};  # strip any directory path
    $base =~ s{\.tex$}{};             # strip .tex extension, if present
    if ( exists $jobnames{$base} ) {
        $target = $base;
        last;
    }
}
$target ||= 'resume';

$jobname = $jobnames{$target};
$success_cmd = "pdftoppm -png -r 300 -singlefile %D $pngnames{$target}";
