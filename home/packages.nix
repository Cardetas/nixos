{
  pkgs,
  ...
}:

with pkgs;
[
  # Desktop & Media
  nautilus
  spotify
  mpv
  equibop

  ripgrep
  tree
  nodejs
];

programs.fzf.enable = true;
programs.btop.enable = true;
programs.gh.enable = true; 
 

