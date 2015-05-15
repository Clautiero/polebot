package Polebot::Plugin::Faq;
use strict;
use warnings;
 
use base 'Polebot::Plugin::Base';
 
my $filename = '/home/perl/faq'; # Inserire il path dove sono presenti le voci
open my $fh, "<", $filename or die "Can't open $filename:#!";
my @faq = <$fh>;
close $fh;
 
sub description { 'Prova di un FAQ Vediamo se va' }
 
sub public {
 
  my $self = shift;
  my ($who, $where, $msg) = @_;
  return unless $self->is_for_me($msg);
 
 if ($msg =~ /\!faq\s+(\S+)\s*\z/mxs) {
 #   if ( /\!faq\s+(\S+)\s*\z/mxs) { 
          my $faq_ask = quotemeta($1);
 
          foreach my $faq (@faq) {
 
#                 $self->say($where->[0], "$who: $faq") if ($faq =~ /$faq_ask/);
                  $self->say($where->[0], "$faq") if ($faq =~ /$faq_ask/);
          }
  }
 
  return 1;
}
 
1;
