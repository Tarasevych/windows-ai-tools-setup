# Synthetic acceptance tests

Each provider test must use only its own child directory, create uniquely named
temporary files, record no secrets, and remove only processes/files created by
that exact test.
