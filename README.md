# Mosh Cookbook

Cookbook to install [mosh](http://mosh.mit.edu/), the "Mobile Shell" from source.

Follows a generic Chef [install-from-source method](http://stackoverflow.com/a/8642173).

# Requirements

Requires the following packages on Ubuntu:

  * pkgconf
  * libncurses5-dev
  * libprotobuf-dev
  * protobuf-compiler
  * libutempter-dev
  * libssl-dev

Note: Only tested under Ubuntu 14.04 LTS 64-bit.


# Attributes

  * version - Version of mosh to install.
  * url - URL to pull mosh source from.
  * configure_options - Arguments passed to `configure`.
  * make_options - Arguments passed to `make`.
  * install_options - Arguments passed to `make install`.

# Author

Jonathan Werrett (<jonathan@werrett.hk>)
