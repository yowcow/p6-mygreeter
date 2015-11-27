use v6;

unit class MyGreeter;

has DateTime $!dt;

submethod BUILD(:$!dt = DateTime.now) { }

method greet() returns Str {
       0  <= $!dt.hour < 12 ?? 'Good morning!'
    !! 12 <= $!dt.hour < 18 ?? 'Good afternoon!'
    !!                         'Good evening!';
}
