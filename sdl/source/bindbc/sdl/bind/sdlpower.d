module bindbc.sdl.bind.sdlpower;

import bindbc.sdl.config;

enum SDL_PowerState {
    SDL_POWERSTATE_UNKNOWN,
    SDL_POWERSTATE_ON_BATTERY,
    SDL_POWERSTATE_NO_BATTERY,
    SDL_POWERSTATE_CHARGING,
    SDL_POWERSTATE_CHARGED
}
mixin(expandEnum!SDL_PowerState);

version(BindSDL_Static) {
    extern(C) @nogc nothrow {
        alias pSDL_GetPowerInfo = SDL_PowerState function(int*,int*);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pSDL_GetPowerInfo = SDL_PowerState function(int*,int*);
    }

    __gshared {
        pSDL_GetPowerInfo SDL_GetPowerInfo;
    }
}