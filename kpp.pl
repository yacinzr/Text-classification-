#!/usr/bin/perl 
use strict;
use warnings;
use File::Spec;

my @myarticles =("a1.txt","e3.txt","ee.txt","k6.txt","m2.txt","md.txt","te.txt","z1.txt",
"j1.txt","dm.txt","ml.txt","r1.txt","q.txt","ia.txt","le.txt","us.txt"
,"x1.txt","ss.txt","nm.txt","pr.txt","qu.txt","de.txt",
"su.txt","me.txt","G1.txt","e9.txt","b13.txt","c3.txt",
"mo.txt","ez.txt","er.txt","ve.txt","ur.txt","je.txt","ir.txt","ff.txt","ch.txt",
"ps.txt","in.txt","ft.txt","br.txt","ys.txt","wa.txt","mn.txt","ab.txt","cb.txt","dz.txt",
"ns.txt","st.txt",);
my $Reparticles   = 'E:\project_m2\fdms\article';
#nlaymo ga3 les fichiers dictionnaire  fe directory wahde 


my @dic_info; 

sub wdicinfo {
open (FHR,"<ifdics.txt" )or die("Impossible ouvrir....  ");
@dic_info = <FHR>;
return @dic_info;
}
my $nbw_infodic =wdicinfo(); 

my @dic_chemie;

sub wdic_chimie{
open (FHR,"<chdics.txt" )or die("Impossible ouvrir .....  ");
@dic_chemie = <FHR>;
return @dic_chemie;
}

my $nbw_chimie = wdic_chimie(); 


my @dic_GE; 

sub wdicge {
open (FHR,"<gedics.txt" )or die("Impossible ouvrir...  ");
@dic_GE = <FHR>;
return @dic_GE;
}
my $nbw_gedic =wdicge(); 



my @dic_mechanic; 

sub wdicmechanic {
open (FHR,"<mcdics.txt" )or die("Impossible ouvrir...  ");
@dic_mechanic = <FHR>;
return @dic_mechanic;
}
my $nbw_mcdic =wdicmechanic();


my @dic_bio; 

sub wdicbio {
open (FHR,"<biodics.txt" )or die("Impossible ouvrir...  ");
@dic_bio = <FHR>;
return @dic_bio;
}
my $nbw_biodic=wdicbio();

#---------------------------------------fonctions to compare with dic ---------------------------------------------------------------------
 my @nom_recuperer = (); 
sub comparer_avec_dicinfo
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $pourcentage_appr=0;
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_info) {
		
		chomp $val;
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
			
		}
	}
		if ( $nbw_infodic > 0 ) {
		 $pourcentage_appr = ( $count * 100 ) / $nbw_infodic;
		}
		return  $pourcentage_appr ; 
}

sub comparer_avec_dic_chimie
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my $pourcentage_appr;
	my @words = ();
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_chemie) {
		chomp $val;
		if ( exists $hash{$val} ) {
			$count++;
		}
	}
		if ( $nbw_chimie > 0 ) {
		 $pourcentage_appr = ( $count * 100 ) / $nbw_chimie;
		 #print "le pr ".$pourcentage_appr."\n";
		}
		return  $pourcentage_appr ; 
}

sub comparer_avec_dicge
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $pourcentage_appr=0;
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_GE) {
		
		chomp $val;
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
		}
	}
		if (   $nbw_gedic> 0 ) {
		 $pourcentage_appr = ( $count * 100 ) /  $nbw_gedic;
		}
		return  $pourcentage_appr ; 
}

sub comparer_avec_dic_mechanic
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $pourcentage_appr=0;
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_mechanic) {
		
		chomp $val;
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
		}
	}
		if ($nbw_mcdic> 0 ) {
		 $pourcentage_appr = ( $count * 100 ) /  $nbw_mcdic;
		}
		return  $pourcentage_appr ; 
}
sub comparer_avec_dic_bio
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $pourcentage_appr=0;
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;

	for my $val (@dic_bio) {
		
		chomp $val;
		if ( exists $hash{$val} ) {

			$count++;
			push @words, $val;
		}
	}
		if ($nbw_biodic> 0 ) {
		 $pourcentage_appr = ( $count * 100 ) /$nbw_biodic;
		}
		return  $pourcentage_appr ; 
}
#----------------------------------------------------------------------------------------------------------------
my @art_info=();
my @art_chemie=();
my @art_GE =();
my @art_bio =();
my @art_mechanic =();
my $motss;
open (FHRR,"<alldico.txt" )or die("Impossible ouvrir");
my @TabMots = <FHRR>;
foreach my $Document (@myarticles) {
my $dir_art = File::Spec->catfile( $Reparticles , $Document );

 open (FHR,'<',$dir_art)or die("Impossible ouvrir ".$Document);


my %Comptage = ();
	my $NbLigne;
	while ( my $Ligne = <FHR> ) {
		$NbLigne++;
		foreach my $Mot (@TabMots) {
		     $motss++;
			chomp $Mot;
			if ( $Ligne =~ $Mot ) {
				$Comptage{$Mot}++;
			}
		}
	}
     while ( my ( $Mot, $Nb ) = each(%Comptage) ) {
		#print  "Le mot '$Mot' est present $Nb fois dans $Document\n";
		
		#remplir les mots trouver dans le tableau[] nom_recuperer
		push @nom_recuperer, $Mot;
	}	
	
	#print "-$Document est  $motss  \n";
my $info = comparer_avec_dicinfo($Document);
my $chemie = comparer_avec_dic_chimie($Document);
my $GE =  comparer_avec_dicge($Document);
my $mechanic =  comparer_avec_dic_mechanic($Document);
my $biologie = comparer_avec_dic_bio($Document);
#print $Document. "ce doc est similaire a info a" .$info ."\n";
#print $Document."ce doc est similaire a chemie a" .$chemie."\n";

if ( $chemie < $info &&$GE < $info&& $mechanic < $info && $biologie < $info )
{
	push @art_info, $Document;
}
if ( $chemie >$info && $GE < $chemie && $mechanic < $chemie && $biologie < $chemie)
{
	push @art_chemie, $Document;
}

if ( $GE >$info && $GE > $chemie && $mechanic < $GE && $biologie < $GE)
{
	push @art_GE, $Document;
}
if ( $biologie >$info && $GE < $biologie && $mechanic < $biologie && $biologie > $chemie)
{
	push @art_bio, $Document;
}

if ( $mechanic >$info && $GE < $mechanic && $mechanic > $chemie && $biologie < $mechanic)
{
	push @art_mechanic, $Document;
}



	undef %Comptage;
	undef @nom_recuperer;
    undef $motss ;
}


print "les articles d\'informatique: \n";
print "\n";
foreach(@art_info)
{	print " ".$_." ";
	
}
print "\n"; 
print "\n"; 	
print "les articles de chimie: \n";
print "\n";	
foreach(@art_chemie)
{
	print " ".$_." ";
	
}

print "\n"; 
print "\n"; 	
print "les articles de mecanique: \n";

print "\n";
foreach(@art_mechanic)
{
	print " ".$_." ";

}
print "\n"; 
print "\n"; 	
print "les articles de genie  electrique: \n";
print "\n";
foreach(@art_GE)
{
	print " ".$_." ";

}
print "\n"; 
print "\n"; 	
print "les articles de biologie: \n";
print "\n";
foreach(@art_bio)
{
	print " ".$_." ";

}







