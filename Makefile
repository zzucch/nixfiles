all: switch

.PHONY: clean
clean:
	@sudo nix-collect-garbage -d
	@nix-collect-garbage -d

.PHONY: switch
switch:
	@sudo nixos-rebuild switch --flake .

.PHONY: update
update:
	@nix flake update
	@make switch
