local function type(itemId)
    if itemId == "water" then
        return "fluid"
    end
    if itemId == "crude-oil" then
        return "fluid"
    end
    if itemId == "heavy-oil" then
        return "fluid"
    end
    if itemId == "light-oil" then
        return "fluid"
    end
    if itemId == "lubricant" then
        return "fluid"
    end
    if itemId == "petroleum-gas" then
        return "fluid"
    end
    if itemId == "sulfuric-acid" then
        return "fluid"
    end
    return "item"
end

local function ingredient(itemId, count)
    if (count < 1) then
        return {type = type(itemId), name = itemId, probability = count}
    else
        return {type = type(itemId), name = itemId, amount = count}
    end
end

local function items(item1, amount1, item2, amount2, item3, amount3, item4, amount4)
    local result = {}
    if (item1 ~= nil) then table.insert(result, ingredient(item1, amount1)) end
    if (item2 ~= nil) then table.insert(result, ingredient(item2, amount2)) end
    if (item3 ~= nil) then table.insert(result, ingredient(item3, amount3)) end
    if (item4 ~= nil) then table.insert(result, ingredient(item4, amount4)) end
    return result
end

local function recipe(category, duration, recipeId, inputs, outputs)
    return {
        type = "recipe",
        name = recipeId,
        category = category,
        energy_required = duration,
        ingredients = inputs,
        results = outputs,
        allow_as_intermediate = false,
        main_product = outputs[1]["name"]
    }
end

data:extend({
    recipe("advanced-crafting", 30, "ms-material-crystal", items("stone", 10), items("ms-material-crystal", 1)),
    recipe("advanced-crafting", 120, "ms-material-crystal-charged", items("ms-material-crystal", 1), items("ms-material-crystal-charged", 1)),
    recipe("crafting", 1, "ms-material-storage", items("iron-chest", 1, "ms-material-crystal-charged", 10, "ms-memory-module-t1", 1, "electronic-circuit", 5), items("ms-material-storage", 1)),
    recipe("crafting", 1, "ms-material-combinator", items("constant-combinator", 1, "ms-material-crystal-charged", 1), items("ms-material-combinator", 1)),
    recipe("crafting", 1, "ms-material-chest-solar-panel", items("ms-material-crystal-charged", 5, "solar-panel", 10), items("ms-material-chest-solar-panel", 1)),

    recipe("crafting", 1, "ms-memory-module-t1", items("ms-material-crystal-charged", 1, "electronic-circuit", 5, "copper-cable", 10), items("ms-memory-module-t1", 1)),
    recipe("crafting", 1, "ms-memory-module-t2", items("ms-memory-module-t1", 3, "ms-material-crystal-charged", 3, "advanced-circuit", 5), items("ms-memory-module-t2", 1)),
    recipe("crafting", 1, "ms-memory-module-t3", items("ms-memory-module-t2", 3, "ms-material-crystal-charged", 3, "processing-unit", 5), items("ms-memory-module-t3", 1)),

    -- Science T1 / T2
    recipe("crafting", 1, "ms-crafting-card-automation-science-pack", items("automation-science-pack", 200, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-automation-science-pack", 1)),
    recipe("crafting", 1, "ms-smelting-card-copper-plate", items("copper-plate", 100, "electric-furnace", 1, "ms-material-crystal-charged", 1), items("ms-smelting-card-copper-plate", 1)),
    recipe("crafting", 1, "ms-crafting-card-iron-gear-wheel", items("iron-gear-wheel", 100, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-iron-gear-wheel", 1)),
    recipe("crafting", 1, "ms-smelting-card-iron-plate", items("iron-plate", 100, "electric-furnace", 1, "ms-material-crystal-charged", 1), items("ms-smelting-card-iron-plate", 1)),

    recipe("crafting", 1, "ms-crafting-card-logistic-science-pack", items("logistic-science-pack", 200, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-logistic-science-pack", 1)),
    recipe("crafting", 1, "ms-crafting-card-inserter", items("inserter", 50, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-inserter", 1)),
    recipe("crafting", 1, "ms-crafting-card-transport-belt", items("transport-belt", 100, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-transport-belt", 1)),
    recipe("crafting", 1, "ms-crafting-card-electronic-circuit", items("electronic-circuit", 200, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-electronic-circuit", 1)),
    recipe("crafting", 1, "ms-crafting-card-copper-cable", items("copper-cable", 200, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-copper-cable", 1)),

    -- Science T3 / T4
    recipe("crafting", 1, "ms-crafting-card-military-science-pack", items("military-science-pack", 200, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-military-science-pack", 1)),
    recipe("crafting", 1, "ms-crafting-card-grenade", items("grenade", 100, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-grenade", 1)),
    recipe("crafting", 1, "ms-crafting-card-piercing-rounds-magazine", items("piercing-rounds-magazine", 200, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-piercing-rounds-magazine", 1)),
    recipe("crafting", 1, "ms-crafting-card-stone-wall", items("stone-wall", 100, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-stone-wall", 1)),
    recipe("crafting", 1, "ms-crafting-card-firearm-magazine", items("firearm-magazine", 200, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-firearm-magazine", 1)),
    recipe("crafting", 1, "ms-smelting-card-stone-brick", items("stone-brick", 100, "electric-furnace", 1, "ms-material-crystal-charged", 1), items("ms-smelting-card-stone-brick", 1)),

    recipe("crafting", 1, "ms-crafting-card-chemical-science-pack", items("chemical-science-pack", 200, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-chemical-science-pack", 1)),
    recipe("crafting", 1, "ms-crafting-card-advanced-circuit", items("advanced-circuit", 200, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-advanced-circuit", 1)),
    recipe("crafting", 1, "ms-crafting-card-engine-unit", items("engine-unit", 50, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-engine-unit", 1)),
    recipe("crafting", 1, "ms-chemical-card-sulfur", items("sulfur", 100, "chemical-plant", 1, "ms-material-crystal-charged", 1), items("ms-chemical-card-sulfur", 1)),
    recipe("crafting", 1, "ms-chemical-card-plastic-bar", items("plastic-bar", 100, "chemical-plant", 1, "ms-material-crystal-charged", 1), items("ms-chemical-card-plastic-bar", 1)),
    recipe("crafting", 1, "ms-crafting-card-pipe", items("pipe", 100, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-pipe", 1)),
    recipe("crafting", 1, "ms-smelting-card-steel-plate", items("steel-plate", 100, "electric-furnace", 1, "ms-material-crystal-charged", 1), items("ms-smelting-card-steel-plate", 1)),

    -- Science T5 / T6
    recipe("crafting", 1, "ms-crafting-card-production-science-pack", items("production-science-pack", 200, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-production-science-pack", 1)),
    recipe("crafting", 1, "ms-crafting-card-electric-furnace", items("electric-furnace", 50, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-electric-furnace", 1)),
    recipe("crafting", 1, "ms-crafting-card-productivity-module", items("productivity-module", 50, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-productivity-module", 1)),
    recipe("crafting", 1, "ms-crafting-card-rail", items("rail", 100, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-rail", 1)),
    recipe("crafting", 1, "ms-crafting-card-iron-stick", items("iron-stick", 100, "assembling-machine-1", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-iron-stick", 1)),

    recipe("crafting", 1, "ms-crafting-card-utility-science-pack", items("utility-science-pack", 200, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-utility-science-pack", 1)),
    recipe("crafting", 1, "ms-crafting-card-flying-robot-frame", items("flying-robot-frame", 100, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-flying-robot-frame", 1)),
    recipe("crafting", 1, "ms-crafting-card-low-density-structure", items("low-density-structure", 100, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-low-density-structure", 1)),
    recipe("crafting", 1, "ms-crafting-card-processing-unit", items("processing-unit", 200, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-processing-unit", 1)),
    recipe("crafting", 1, "ms-chemical-card-battery", items("battery", 100, "chemical-plant", 1, "ms-material-crystal-charged", 1), items("ms-chemical-card-battery", 1)),
    recipe("crafting", 1, "ms-crafting-card-electric-engine-unit", items("electric-engine-unit", 50, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-electric-engine-unit", 1)),

    -- Rocket
    recipe("crafting", 1, "ms-chemical-card-solid-fuel-1", items("solid-fuel", 100, "chemical-plant", 1, "ms-material-crystal-charged", 1), items("ms-chemical-card-solid-fuel-1", 1)),
    recipe("crafting", 1, "ms-chemical-card-solid-fuel-2", items("solid-fuel", 100, "chemical-plant", 1, "ms-material-crystal-charged", 1), items("ms-chemical-card-solid-fuel-2", 1)),
    recipe("crafting", 1, "ms-chemical-card-solid-fuel-3", items("solid-fuel", 100, "chemical-plant", 1, "ms-material-crystal-charged", 1), items("ms-chemical-card-solid-fuel-3", 1)),
    recipe("crafting", 1, "ms-crafting-card-rocket-control-unit", items("rocket-control-unit", 100, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-rocket-control-unit", 1)),
    recipe("crafting", 1, "ms-crafting-card-rocket-fuel", items("rocket-fuel", 100, "assembling-machine-3", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-rocket-fuel", 1)),
    recipe("crafting", 1, "ms-crafting-card-speed-module", items("speed-module", 50, "assembling-machine-2", 1, "ms-material-crystal-charged", 1), items("ms-crafting-card-speed-module", 1)),

    -- Fluids
    recipe("crafting-with-fluid", 30, "ms-digital-heavy-oil", items("heavy-oil", 1024), items("ms-digital-heavy-oil", 1)),
    recipe("crafting-with-fluid", 30, "ms-digital-light-oil", items("light-oil", 1024), items("ms-digital-light-oil", 1)),
    recipe("crafting-with-fluid", 30, "ms-digital-lubricant", items("lubricant", 1024), items("ms-digital-lubricant", 1)),
    recipe("crafting-with-fluid", 30, "ms-digital-petroleum-gas", items("petroleum-gas", 1024), items("ms-digital-petroleum-gas", 1)),
    recipe("crafting-with-fluid", 30, "ms-digital-sulfuric-acid", items("sulfuric-acid", 1024), items("ms-digital-sulfuric-acid", 1)),
    recipe("crafting-with-fluid", 30, "ms-digital-water", items("water", 1024), items("ms-digital-water", 1)),

    -- TEMPLATES FOR COPY/PASTE
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
    -- recipe("crafting", 1, "", {}, items("", 1)),
})