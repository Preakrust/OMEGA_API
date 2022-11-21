--UTILITIES_API is a rich Roblox api devlopped by PreaKrust#9749--

--[PLEASE ONLY USE THESE IN SERVER AS THOSE FUNCTION MAY NOT WORK ON CLIENT]--
local module = {}
--{Values}--
local GROUP_SERVICE = game:GetService("GroupService");

local INSTANCE_CONSTRUCTOR = Instance.new;

--{Group based function}--
function module.API_RETURN_GROUPS (self)
  local USER_GROUP_LIST = GROUP_SERVICE:GetGroupsAsync(self.UserId); 
  return USER_GROUP_LIST;
end

function module.API_GET_GROUP_INFO (self)
  local GROUP_INFO = GROUP_SERVICE:GetGroupInfoAsync(self);
  return GROUP_INFO;
end

function module.USER_IS_IN_GROUP (self, GROUP)
  local USER_GROUP_LIST = GROUP_SERVICE:GetGroupsAsync(self.UserId);
  for i, USER_GROUPS in pairs (USER_GROUP_LIST) do
    if USER_GROUPS.Id == GROUP then
      return true;
      else
      return false;
  end
end

function module.GET_ROLE_IN_GROUP(self, GROUP_ID)
    return self:GetRoleInGroup(GROUP_ID);
end

function module.GET_RANK_IN_GROUP(self, GROUP_ID)
    return self:GetRankInGroup(GROUP_ID);
end
--{Instance Based function}--
function module.CREATE_INSTANCE (InstanceType, Parent, Name)
    local A = INSTANCE_CONSTRUCTOR(InstanceType, Parent);
    A.Name = Name;
    return A;
end

function module.DESTROY (Instance_To_Destroy)
         Instance_To_Destroy:Destroy();
end
  
function module.CREATE_INSTANCE_IN (InstanceType, Parent, Name, CREATE_IN)
    coroutine.wrap(function()
        wait(CREATE_IN);
        local A = INSTANCE_CONSTRUCTOR(InstanceType, Parent);
        A.Name = Name;
        return A;
    end)()
end

function module.DESTROY_IN (Instance_To_Destroy, DESTROY_IN)
     coroutine.wrap(function()
        wait(CREATE_IN);
        Instance_To_Destroy:Destroy();
    end)()
end
--{Moderation}--
function module.KICK_USER (self, Message)
    self:Kick(Message);
end
  
function module.RESPAWN (self)
    self:LoadCharacter();
end
  
function +
function module.KILL (self)
    self:WaitForChild("Humanoid").Health = 0;
end
return module
