AddCSLuaFile()
ENT.Type = "ai"
ENT.Base = "base_entity"

function ENT:Initialize()
    self:SetRenderMode(RENDERMODE_TRANSALPHA)
end

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    self:Draw()
end

function ENT:AcceptInput(key,activator,caller,data)
	if activator == self then
		if IsValid(self:GetOwner()) then -- pill ent is valid?
			if self:GetOwner().formTable and self:GetOwner().formTable.events then
				self:GetOwner().formTable.events(self:GetOwner():GetPillUser(), self:GetOwner(), key)
			end
		end
	end
end