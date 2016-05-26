gcc -o pty_nif.so -fPIC -shared pty_nif.c -I /usr/local/Cellar/erlang/18.2.1/lib/erlang/usr/include/ -lUtil -flat_namespace -undefined suppress
mkdir -p ../priv/bin
mv pty_nif.so ../priv/bin
