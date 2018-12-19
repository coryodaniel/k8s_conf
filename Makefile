.PHONY: all
all:
	mix deps.get
	mix compile
	mix format
	mix coveralls.html
	mix credo
	mix dialyzer
	mix docs
