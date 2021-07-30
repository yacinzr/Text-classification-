use strict ; 
use warnings; 
use File::Spec;
my @myarticles =("a1.txt","e3.txt","ee.txt","k6.txt","m2.txt","md.txt","te.txt","z1.txt",
"j1.txt","dm.txt","ml.txt","r1.txt","q.txt","ia.txt","le.txt","us.txt"
,"x1.txt","ss.txt","nm.txt","pr.txt","qu.txt","de.txt",
"su.txt","me.txt","G1.txt","e9.txt","b13.txt","c3.txt",
"mo.txt","ez.txt","er.txt","ve.txt","ur.txt","je.txt","ir.txt","ff.txt","ch.txt",
"ps.txt","in.txt","ft.txt","br.txt","ys.txt","wa.txt","mn.txt","ab.txt","cb.txt","dz.txt",
"ns.txt","st.txt",);
my $size2 = scalar @myarticles ;
#print "eee".$size2;
#----- change the path -------
my $Reparticles   = 'C:\Users\NGSi\Desktop\fdms\article';
#----------------------------------------------------- dictionnaire domaine --------------------------------------------------------
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



my @dic_all; 

sub wdicall {
open (FHR,"<alldico.txt" )or die("Impossible ouvrir...  ");
@dic_all = <FHR>;
return @dic_all;
}
my $nbw_alldic=wdicall();
#--------------------------------------------------------dictionnaire no domaine -----------------------------------------------------------
my @dic_Ninfo; 

sub wdicNinfo {
open (FHR,"<noinfodic.txt" )or die("Impossible ouvrir....  ");
@dic_Ninfo = <FHR>;
return @dic_Ninfo;
}
my $nbw_Ninfodic =wdicNinfo(); 


my @dic_Nchemie; 

sub wdicNchemi {
open (FHR,"<nochemidic.txt" )or die("Impossible ouvrir....  ");
@dic_Nchemie = <FHR>;
return @dic_Nchemie;
}
my $nbw_Nchemidic =wdicNchemi();


my @dic_Nge; 

sub wdicNge {
open (FHR,"<nogedic.txt" )or die("Impossible ouvrir....  ");
@dic_Nge= <FHR>;
return @dic_Nge;
}
my $nbw_Ngedic =wdicNge();

my @dic_Nmechanic; 

sub wdicNmechanic {
open (FHR,"<nomechanic.txt" )or die("Impossible ouvrir....  ");
@dic_Nmechanic= <FHR>;
return @dic_Nmechanic;
}
my $nbw_Nmechanicdic =wdicNmechanic();

my @dic_Nbio; 

sub wdicNbio {
open (FHR,"<nobiologie.txt" )or die("Impossible ouvrir....  ");
@dic_Nbio= <FHR>;
return @dic_Nbio;
}
my $nbw_Nbio =wdicNbio();
#---------------------------------------fonctions to compare with dic ---------------------------------------------------------------------
 my @nom_recuperer = (); 
sub file_given_info
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $info = "true";
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;
    my $probabilities =0;
	my $probabilities_n =0;
    my $countn = 0;
	my @wordsn = ();
	my $d = $nbw_alldic - $nbw_infodic;

	for my $val (@dic_info) {
		
		chomp $val;
		if ( exists $hash{$val} ) {
			$count++;
			push @words, $val;
		}
	}

		for my $valn (@dic_Ninfo) {
		
		chomp $valn;
		if ( exists $hash{$valn} ) {
			$countn++;
			push @wordsn, $valn;
		}
	}

              # print "le count :  $count \n  le nb dic info : $nbw_infodic \n le d :  $d\n";
			   #print " ele count n $countn \n  le dic non info ; $nbw_Ninfodic \n le d :  $d";
		if ( $nbw_infodic > 0 && $nbw_Ninfodic > 0  ) {
			
		   $probabilities  = ( $count +1) / ($nbw_infodic+1*$d);
		   #print "$probabilities\n";
		   $probabilities_n  = ($countn +1) / ($nbw_Ninfodic+(1*$d));
		  #print "$probabilities\n";
		   if ($probabilities >$probabilities_n )
		   {
			 return  $info ;  
		   }

 
	else
		{
			 $info = "false";
			 return $info ; 
		}
		   
		}

		

}

sub file_given_chemie
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $chemie = "true";
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;
    my $probabilities =0;
	my $probabilities_n =0;
    my $countn = 0;
	my @wordsn = ();
	my $d = $nbw_alldic - $nbw_chimie;

	for my $val (@dic_chemie) {
		
		chomp $val;
		if ( exists $hash{$val} ) {
			$count++;
			push @words, $val;
		}
	}

		for my $valn (@dic_Nchemie) {
		
		chomp $valn;
		if ( exists $hash{$valn} ) {
			$countn++;
			push @wordsn, $valn;
		}
	}

              # print "le count :  $count \n  le nb dic info : $nbw_infodic \n le d :  $d\n";
			   #print " ele count n $countn \n  le dic non info ; $nbw_Ninfodic \n le d :  $d";
		if ( $nbw_chimie> 0 && $nbw_Nchemidic > 0  ) {
			
		   $probabilities  = ( $count +1) / ($nbw_chimie+1*$d);
		   #print "$probabilities\n";
		   $probabilities_n  = ($countn +1) / ($nbw_Nchemidic+(1*$d));
		  #print "$probabilities\n";
		   if ($probabilities >$probabilities_n )
		   {
			 return  $chemie ;  
		   }

 
	else
		{
			 $chemie = "false";
			 return $chemie ; 
		}
		   
		}

		

}

sub file_given_ge
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $ge = "true";
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;
    my $probabilities =0;
	my $probabilities_n =0;
    my $countn = 0;
	my @wordsn = ();
	my $d = $nbw_alldic - $nbw_gedic;

	for my $val (@dic_GE) {
		
		chomp $val;
		if ( exists $hash{$val} ) {
			$count++;
			push @words, $val;
		}
	}

		for my $valn (@dic_Nge) {
		
		chomp $valn;
		if ( exists $hash{$valn} ) {
			$countn++;
			push @wordsn, $valn;
		}
	}

              # print "le count :  $count \n  le nb dic info : $nbw_infodic \n le d :  $d\n";
			   #print " ele count n $countn \n  le dic non info ; $nbw_Ninfodic \n le d :  $d";
		if ( $nbw_gedic> 0 && $nbw_Ngedic > 0  ) {
			
		   $probabilities  = ( $count +1) / ($nbw_gedic+1*$d);
		   #print "$probabilities\n";
		   $probabilities_n  = ($countn +1) / ($nbw_Ngedic+(1*$d));
		  #print "$probabilities\n";
		   if ($probabilities >$probabilities_n )
		   {
			 return  $ge ;  
		   }

 
	else
		{
			 $ge = "false";
			 return $ge ; 
		}
		   
		}
}

sub file_given_mechanic
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $mechanic = "true";
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;
    my $probabilities =0;
	my $probabilities_n =0;
    my $countn = 0;
	my @wordsn = ();
	my $d = $nbw_alldic - $nbw_mcdic;

	for my $val (@dic_mechanic) {
		
		chomp $val;
		if ( exists $hash{$val} ) {
			$count++;
			push @words, $val;
		}
	}

		for my $valn (@dic_Nmechanic) {
		
		chomp $valn;
		if ( exists $hash{$valn} ) {
			$countn++;
			push @wordsn, $valn;
		}
	}

              # print "le count :  $count \n  le nb dic info : $nbw_infodic \n le d :  $d\n";
			   #print " ele count n $countn \n  le dic non info ; $nbw_Ninfodic \n le d :  $d";
		if ( $nbw_mcdic> 0 && $nbw_Nmechanicdic > 0  ) {
			
		   $probabilities  = ( $count +1) / ($nbw_gedic+1*$d);
		   #print "$probabilities\n";
		   $probabilities_n  = ($countn +1) / ($nbw_Ngedic+(1*$d));
		  #print "$probabilities\n";
		   if ($probabilities >$probabilities_n )
		   {
			 return  $mechanic ;  
		   }

 
	else
		{
			 $mechanic = "false";
			 return $mechanic; 
		}
		   
		}
}

sub file_given_bio
{	my ($Document) = @_;
	my $count = 0;
	my %hash;
	my @words = ();
	my $bio = "true";
	@hash{@nom_recuperer} = 0 .. $#nom_recuperer;
    my $probabilities =0;
	my $probabilities_n =0;
    my $countn = 0;
	my @wordsn = ();
	my $d = $nbw_alldic - $nbw_biodic;

	for my $val (@dic_bio) {
		
		chomp $val;
		if ( exists $hash{$val} ) {
			$count++;
			push @words, $val;
		}
	}

		for my $valn (@dic_Nbio) {
		
		chomp $valn;
		if ( exists $hash{$valn} ) {
			$countn++;
			push @wordsn, $valn;
		}
	}

              # print "le count :  $count \n  le nb dic info : $nbw_infodic \n le d :  $d\n";
			   #print " ele count n $countn \n  le dic non info ; $nbw_Ninfodic \n le d :  $d";
		if ( $nbw_biodic> 0 && $nbw_Nbio > 0  ) {
			
		   $probabilities  = ( $count +1) / ($nbw_biodic+1*$d);
		   #print "$probabilities\n";
		   $probabilities_n  = ($countn +1) / ($nbw_Nbio+(1*$d));
		  #print "$probabilities\n";
		   if ($probabilities >$probabilities_n )
		   {
			 return  $bio ;  
		   }

 
	else
		{
			 $bio = "false";
			 return $bio; 
		}
		   
		}
}
#---------------------------------------------------------------------------------------------------------------------------------
my @art_info=();
my @art_chemie=();
my @art_GE =();
my @art_bio =();
my @art_mechanic =();
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
	


my $infoo = file_given_info($Document);
my $chemiee = file_given_chemie($Document);
my $GEe =  file_given_ge($Document);
my $mechanicc =  file_given_mechanic($Document);
my $biologiee = file_given_bio($Document);
if ($infoo eq "true" && $chemiee eq "false" && $GEe eq "false" && $mechanicc eq "false"  && $biologiee eq "false" )
{ push @art_info, $Document;
	

}


if ($infoo eq "false" && $chemiee eq "true" && $GEe eq "false" && $mechanicc eq "false"  && $biologiee eq "false" )
{ 
push @art_chemie, $Document;
}

if ($infoo eq "false" && $chemiee eq "false" && $GEe eq "true" && $mechanicc eq "false"  && $biologiee eq "false" )
{  push @art_GE, $Document;

}




if ($infoo eq "false" && $chemiee eq "false" && $GEe eq "false" && $mechanicc eq "true"  && $biologiee eq "false" )
{  push @art_mechanic, $Document;
}

if ($infoo eq "false" && $chemiee eq "false" && $GEe eq "false" && $mechanicc eq "false"  && $biologiee eq "true" )
{  push @art_bio, $Document;
}


	undef %Comptage;
	undef @nom_recuperer;
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