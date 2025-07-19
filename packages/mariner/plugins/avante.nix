{ lib, ... }:
{
  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "ollama";
        providers.ollama = {
          model = "qwen2.5-coder:3b";
          endpoint = "http://localhost:11434";
        };
      };
    };
  };
}
