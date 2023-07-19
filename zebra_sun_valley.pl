#/usr/bin/perl
use strict;
use warnings;

my %Trees;

#Store all species of tree in the %Trees hash
$Trees{'Oak'} = {
   Scientific_Name => 'Quercus Robur',
   Origin => 'Western Europe', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Maple'} = {
   Scientific_Name => 'Acer palmatum',
   Origin => 'Japan', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Birch'} = {
   Scientific_Name => 'Betula Pendula',
   Origin => 'Europe', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Cypress'} = {
   Scientific_Name => 'Cupressus sempervirens',
   Origin => 'Mediterranean', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

$Trees{'Hemlock'} = {
   Scientific_Name => 'Tsuga Canadensis',
   Origin => 'Northeastern United States', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

$Trees{'Weeping Willow'} = {
   Scientific_Name => 'Salix Babylonica',
   Origin => 'Northeastern United States, Europe, and Asia', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Pine'} = {
   Scientific_Name => 'Pinus Strobus',
   Origin => 'Northeastern United States', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

$Trees{'Dogwood'} = {
   Scientific_Name => 'Cornus Florida',
   Origin => 'Southeastern United States', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Cherry'} = {
   Scientific_Name => 'Prunus Avium',
   Origin => 'Central and Northern Europe', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Apple'} = {
   Scientific_Name => 'Malus Domestica',
   Origin => 'Central Asia', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Linden'} = {
   Scientific_Name => 'Tilia Cordata',
   Origin => 'Northern hemisphere', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Elm'} = {
   Scientific_Name => 'Ulmus Americana',
   Origin => 'Eastern North America', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Holly'} = {
   Scientific_Name => 'Ilex Aquifolium',
   Origin => 'Europe, Northern Africa, and Western Asia', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

$Trees{'Cedar'} = {
   Scientific_Name => 'Cedrus Libani',
   Origin => 'Western Asia', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

$Trees{'Spruce'} = {
   Scientific_Name => 'Picea Abies',
   Origin => 'Northern Europe and Asia', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

$Trees{'Mulberry'} = {
   Scientific_Name => 'Morus Alba',
   Origin => 'Warm temperate and subtropical zones', 
   Type => 'Deciduous',
   Hardy => 'Yes',
};

$Trees{'Redwood'} = {
   Scientific_Name => 'Sequoia Sempervirens',
   Origin => 'Northwestern USA', 
   Type => 'Evergreen',
   Hardy => 'Yes',
};

#Print out all of the species stored in %Trees
foreach my $key (keys %Trees) {
   print "$key\n";
   print "Scientific Name: ", $Trees{$key}{Scientific_Name}, "\n";
   print "Origin: ", $Trees{$key}{Origin}, "\n";
   print "Type: ", $Trees{$key}{Type}, "\n";
   print "Hardy: ", $Trees{$key}{Hardy}, "\n\n";
}

#Subroutine to add new species to the %Trees hash
sub add_species {
   my ($name, $sci_name, $orig, $type, $hardy) = @_;
   $Trees{$name} = {
      Scientific_Name => $sci_name,
      Origin => $orig, 
      Type => $type,
      Hardy => $hardy,
   };
}

#Add a new species to %Trees
add_species('Birch', 'Betula Pendula', 'Europe', 'Deciduous', 'Yes');
add_species('Cherry', 'Prunus Avium', 'Central and Northern Europe', 'Deciduous', 'Yes');
add_species('Apple', 'Malus Domestica', 'Central Asia', 'Deciduous', 'Yes');
add_species('Linden', 'Tilia Cordata', 'Northern Hemisphere', 'Deciduous', 'Yes');
add_species('Elm', 'Ulmus Americana', 'Eastern North America', 'Deciduous', 'Yes');
add_species('Holly', 'Ilex Aquifolium', 'Europe, Northern Africa, and Western Asia', 'Evergreen', 'Yes');
add_species('Cedar', 'Cedrus Libani', 'Western Asia', 'Evergreen', 'Yes');
add_species('Spruce', 'Picea Abies', 'Northern Europe and Asia', 'Evergreen', 'Yes');
add_species('Mulberry', 'Morus Alba', 'Warm temperate and subtropical zones', 'Deciduous', 'Yes');
add_species('Redwood', 'Sequoia Sempervirens', 'Northwestern USA', 'Evergreen', 'Yes');

#Print out all of the species stored in %Trees
foreach my $key (keys %Trees) {
   print "$key\n";
   print "Scientific Name: ", $Trees{$key}{Scientific_Name}, "\n";
   print "Origin: ", $Trees{$key}{Origin}, "\n";
   print "Type: ", $Trees{$key}{Type}, "\n";
   print "Hardy: ", $Trees{$key}{Hardy}, "\n\n";
}