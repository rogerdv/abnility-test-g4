extends Resource
class_name base_item

#Base class for items. Shared properties reside here

@export var id:String = "id"
@export var type:int = 0		#A weapon? Armor? Etc
@export var coin_price:int = 0		#price in coins
@export var dmd_price:int = 0		#price in diamonds, for premium items
@export var mesh:Resource
@export var use_anim:String	#Use animation
@export var UseTime:float 	#time required to use the item
@export var AttachPoint:String
@export var equip_slot:int
@export var icon:Texture
@export var stackable:bool = false

#item types
const IT_WEAPON=1
const IT_ARMOR=2
const IT_SHIELD=3
const IT_POTION=4

#equip slot
const SLOT_WEAPON=0
const SLOT_ARMOR=1
const SLOT_SHIELD=3

var properties = []		#item properties: 
# {"type":Damage,"subtype":DmgNormal,"value":100} 
# {"type":Attribute,"subtype":character.STR,"value":1} 

#Item properties
#property types
const DAMAGE = 1
const PROTECTION = 2
const RESTORE = 3		#Restores life, energy, whatever
const ATTRIBUTE = 4

#Damage types
const DMG_NORMAL = 0
const DMG_FIRE = 1
const DMG_ICE = 2
const DMG_LIGHTNING = 3

#Call when the item is equipped
func equip(owner:Node):
	print("Base equipping")

#CAll when the ite is removed
func unequip(owner:Node):
	pass

#Call to use by owner on target
func use(owner, target):
	pass
