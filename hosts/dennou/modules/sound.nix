{
  hardware.pulseaudio.enable = false;
  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    # jack.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
}
