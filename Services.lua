
local Services = {};

function Services:Get(...)
    local allServices = {};

    for _, service in next, {...} do
        table.insert(allServices, self[service]);
    end

    return unpack(allServices);
end;

setmetatable(Services, {
    __index = function(self, p)

        local service = game:GetService(p);
        if (p == 'VirtualInputManager') then
            service.Name = 'VirtualInputManager ';
        end;

        rawset(self, p, service);
        return rawget(self, p);
    end,
});

return Services;
