{
  pkgs,
  ...
}:

with pkgs;
[
  nautilus
  spotify
  firefox
  mpv
  equibop

  fastfetch
  ripgrep
  tree
  nodejs
];

programs.fzf.enable = true;
programs.btop.enable = true;
programs.gh.enable = true; 
 

