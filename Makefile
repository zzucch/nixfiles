all: generate

.PHONY: clean
clean:
	@sudo nix-collect-garbage -d
	@nix-collect-garbage -d

.PHONY: generate
generate:
	@sudo nixos-rebuild switch --flake .

.PHONY: update
update:
	@nix flake update
	@make switch
