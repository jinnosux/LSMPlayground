using System;
using System.Collections.Generic;
using CitizenFX.Core;
using static CitizenFX.Core.Native.API;

namespace teleport
{
	public class teleport : BaseScript
	{

		public teleport()
		{
			// Once the resource has started, FiveM will trigger this event and invoke the method.
			EventHandlers["onClientResourceStart"] += new Action<string>(OnClientResourceStart);
		}

		private void OnClientResourceStart(string resourceName)
		{
			if (GetCurrentResourceName() != resourceName) return;

			Debug.WriteLine($"The resource {resourceName} has been started on the client.");
		}

		public void TeleportToPlayer()
		{

			Ped player = Game.Player.Character;
			var PlayerPedId = World.WaypointPosition;
			

			RegisterCommand("tp", new Action<int, List<object>, string>((source, args, rawCommand) =>
			{
				if (source > 0) 
				{
					Vector3 x = (player.Position = PlayerPedId);
				}
				
				else
				{
					Debug.WriteLine("Player not found.");
				}

			}), false);
		}

	}
}
