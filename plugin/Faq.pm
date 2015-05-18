package Polebot::Plugin::Faq;
use strict;
use warnings;
use Config::Tiny;

use base 'Polebot::Plugin::Base';

my $cfg = Config::Tiny->read('config');
my $filename = $cfg -> {"Plugin::Faq"} -> {filename}; 
open my $fh, "<", $filename or die "Non posso aprire il $filename: $!"; 

my @faq = <$fh>;
close $fh;
 
sub description { 'FAQ Permette di memorizzare parole con relativa descrizione' }
 
sub public {
 
  my $self = shift;
  my ($who, $where, $msg) = @_;
  my ($speaker) = split /!/, $who;
 
  return unless $self->is_for_me($msg);
 
 if ($msg =~ /\!faq\s+(\S+)\s*\z/mxs) {
          my $faq_ask = quotemeta($1);
          foreach my $faq (@faq) {
                   $self->say($speaker, $faq) if ($faq =~ /^$faq_ask$/);
          }
  }
 
  return 1;
}
1;
