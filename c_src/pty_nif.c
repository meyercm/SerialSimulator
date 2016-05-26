#include "erl_nif.h"
#include "util.h"
#include "unistd.h"

static ERL_NIF_TERM allocate_pty_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int master;
    int slave;
    char* name;
    openpty(&master, &slave, NULL, NULL, NULL);
    name = ttyname(slave);
    return enif_make_tuple3(env, enif_make_int(env, master), enif_make_string(env, name, ERL_NIF_LATIN1));
}

static ErlNifFunc nif_funcs[] = {
    {"allocate_pty", 0, allocate_pty_nif}
};

ERL_NIF_INIT(pty, nif_funcs, NULL, NULL, NULL, NULL)
