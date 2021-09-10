JEKYLL := bundle exec jekyll

.PHONY: site
site: jekyll

.PHONY: clean
clean:
	rm -rf public/**
	rm -f examples/**.pdf

public:
	mkdir -p $@

EXAMPLESILS := $(wildcard examples/*.sil)
EXAMPLEPDFS := $(addsuffix .pdf,$(basename $(EXAMPLESILS)))

.PHONY: examples
examples: $(EXAMPLEPDFS)

$(EXAMPLEPDFS): %.pdf: %.sil
	sile $< -o $@

.PHONY: jekyll
jekyll: examples | public
	$(JEKYLL) build --incremental
	rsync -av _site/ public/

public/CNAME: | public
	echo sile-typesetter.org > $@

docker: Dockerfile
	docker build ./
