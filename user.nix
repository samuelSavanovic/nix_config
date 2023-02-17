{pkgs, ...}:
{
# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.samuel = {
  isNormalUser = true;
  description = "samuel";
  extraGroups = [ "networkmanager" "wheel" ];
  packages = with pkgs; [
      firefox
      kate
      gitAndTools.gitFull
      htop 
      zsh
      python310 
      python310Packages.pip 
      pipenv
      vscode-fhs
      neofetch
      google-cloud-sdk
    ];
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
  programs.git.enable = true;
  users.users.samuel.shell = pkgs.zsh;
  programs.nano.nanorc = ''
    set nowrap
    set tabstospaces
    set tabsize 2
  '';	
}
