{
  description = "Dotfiles configuration for https://github.com/KeatonClark/dotfiles.git";

  outputs = { self, nixpkgs }: {
    user = {
      user = "username";
      fullName = "My Name";
      timeZone = "America/Los_Angeles";
      system = "x86_64-linux";
      stateVersion = "25.11";
      email = "my@email.com";
    };
  };
}
