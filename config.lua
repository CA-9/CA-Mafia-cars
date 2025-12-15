Config = {}
Config.UseTarget = true
Config.fuelscript = "lc_fuel" -- "cdn-fuel", "lc_fuel", "LegacyFuel"
Config.MafiaName = "godfather" -- "godfather", "mafia" (It Should Be a Gang!)

-------------------------------------------------------------------
------------------------ Tanks | الدبابات ----------------------
-------------------------------------------------------------------

Config.Peds = {
    MafiaTanks1 = {model = "s_m_y_blackops_01", location = vector4(-941.12, -2953.99, 13.95, 147.48)},
}

Config.SpawnLocation = vector4(-961.06, -2965.58, 13.95, 58.64) 

Config.TanksLocation = {
    vector4(-994.66, -2970.1, 13.62, 59.74),
    vector4(-982.32, -2976.9, 13.62, 61.14),
    vector4(-971.5, -2982.87, 13.62, 61.11), 
    vector4(-960.56, -2988.98, 13.62, 60.81),
    vector4(-1000.14, -2979.62, 13.62, 61.98),
    vector4(-987.35, -2986.44, 13.62, 61.96),
    vector4(-978.51, -2991.15, 13.62, 61.93),
    vector4(-968.73, -2996.37, 13.62, 61.93),
    vector4(-1003.3, -2990.72, 13.62, 61.42),
    vector4(-992.82, -2996.44, 13.61, 61.41),
    vector4(-982.29, -3002.18, 13.61, 61.39),
    vector4(-971.42, -3008.12, 13.62, 61.36),
}

Config.WAR_TANKS = {
    tank = {
        mafia = {
            { name = 'uralbug', model = 'uralbug', price = 0 },
            { name = 'abrams', model = 'abrams', price = 0 },
            { name = 'abrams2', model = 'abrams2', price = 0 },
            { name = 'brad', model = 'brad', price = 0 },
            { name = 'brad2', model = 'brad2', price = 0 },
            { name = 'bspec', model = 'bspec', price = 0 },
            { name = 'hasrad', model = 'hasrad', price = 0 },
            { name = 'hmvs', model = 'hmvs', price = 0 },
            { name = 'lav25ifv', model = 'lav25ifv', price = 0 },
            { name = 'lavadadv', model = 'lavadadv', price = 0 },
            { name = 'm142as', model = 'm142as', price = 0 },
            { name = 'm1128s', model = 'm1128s', price = 0 },
            { name = 'mrap', model = 'mrap', price = 0 },
            { name = 'unarmed1', model = 'unarmed1', price = 0 },
            { name = 'unarmed2', model = 'unarmed2', price = 0 },
            { name = 'uparmor', model = 'uparmor', price = 0 },
            { name = 'uparmorw', model = 'uparmorw', price = 0 },
        }
    },
}

Config.Actions = {
    tank = {
        label = "Tanks Spawner",
        type = "tank"
    },
}

Config.WarTanks = {
    Tank = {
        Military = {
            { name = 'uralbug', model = 'uralbug', price = 0 },
            { name = 'abrams', model = 'abrams', price = 0 },
            { name = 'abrams2', model = 'abrams2', price = 0 },
            { name = 'brad', model = 'brad', price = 0 },
            { name = 'brad2', model = 'brad2', price = 0 },
            { name = 'bspec', model = 'bspec', price = 0 },
            { name = 'hasrad', model = 'hasrad', price = 0 },
            { name = 'hmvs', model = 'hmvs', price = 0 },
            { name = 'lav25ifv', model = 'lav25ifv', price = 0 },
            { name = 'lavadadv', model = 'lavadadv', price = 0 },
            { name = 'm142as', model = 'm142as', price = 0 },
            { name = 'm1128s', model = 'm1128s', price = 0 },
            { name = 'mrap', model = 'mrap', price = 0 },
            { name = 'unarmed1', model = 'unarmed1', price = 0 },
            { name = 'unarmed2', model = 'unarmed2', price = 0 },
            { name = 'uparmor', model = 'uparmor', price = 0 },
            { name = 'uparmorw', model = 'uparmorw', price = 0 },
        },
    },
}


Config.Mafia = {
    boss = {
        cars = {
            { name = 'Bmw M5 Competition', model = 'bmwm5', price = 0 },
            { name = 'Dodge Charger', model = '7mood', price = 0 },
        },
    },
}