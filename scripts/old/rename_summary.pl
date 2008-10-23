#!/usr/bin/perl
# 
#====================================================================
# Results_V1.pl
# Author:    Lukas Swan
# Date:      Aug 2008
# Copyright: Dalhousie University
#
# DESCRIPTION:



#===================================================================

#--------------------------------------------------------------------
# Declare modules which are used
#--------------------------------------------------------------------
use warnings;
use strict;
#use CSV;		#CSV-2 (for CSV split and join, this works best)
#use Array::Compare;	#Array-Compare-1.15
#use Switch;
use threads;		#threads-1.71 (to multithread the program)
#use File::Path;	#File-Path-2.04 (to create directory trees)
use File::Copy;	#(to copy the input.xml file)


#--------------------------------------------------------------------
# Declare important variables and defaults
#--------------------------------------------------------------------
my @hse_types = (2);							#House types to gather data from
my %hse_names = (1, "SD", 2, "DR");

my @regions = (1, 2, 3, 4, 5);						#Regions to gather data from
my %region_names = (1, "1-AT", 2, "2-QC", 3, "3-OT", 4, "4-PR", 5, "5-BC");


#--------------------------------------------------------------------
# Initiate multi-threading to run each region simulataneously
#--------------------------------------------------------------------
my @thread;		#Declare threads
my @thread_return;	#Declare a return array for collation of returning thread data

my $start_time= localtime();	#note the start time of the file generation

foreach my $hse_type (@hse_types) {								#Multithread for each house type
	foreach my $region (@regions) {								#Multithread for each region
		$thread[$hse_type][$region] = threads->new(\&main, $hse_type, $region); 	#Spawn the thread
	}
}
foreach my $hse_type (@hse_types) {
	foreach my $region (@regions) {
		$thread_return[$hse_type][$region] = [$thread[$hse_type][$region]->join()];	#Return the threads together for info collation
	}
}

my $end_time= localtime();	#note the end time of the file generation
print "start time $start_time; end time $end_time\n";	#print generation characteristics


#--------------------------------------------------------------------
# Main code that each thread evaluates
#--------------------------------------------------------------------
sub main () {
	my $hse_type = $_[0];		#house type number for the thread
	my $region = $_[1];		#region number for the thread

	my @folders = <../$hse_type-$hse_names{$hse_type}/$region_names{$region}/*>;
	print "@folders\n";
	foreach my $folder (@folders) { 
		$folder =~ /(..........)$/;
		my $hse = $1;
		print "$hse\n";
		rename ("$folder/$hse.xml","$folder/$hse.summary");
	}
} #end of main code