# SAR-1: Rescue Operations  
*A Search-and-Rescue Drone Simulation — Proof of Concept*

## 🎯 Overview
**SAR-1: Rescue Operations** is a 3D search-and-rescue drone simulation created in Godot 4.5.  
The player pilots an autonomous rescue drone across a large forest environment to locate a stranded survivor, tag their position, and return to base.

This Proof of Concept demonstrates:

- Drone flight controls (3D movement, yaw, pitch tilt)
- Thermal vision detection
- Survivor interaction system
- Objective completion loop
- Battery drain mechanic
- Main menu, settings menu, pause menu
- Mission complete scene

---

## 🎬 Trailer
Watch the gameplay trailer: https://www.loom.com/share/58c8958c913248f2b781baaef0be5cdd

## 🎮 Core Gameplay Loop

1. **Launch the drone** from the rescue station (the tent).
2. **Search the environment** using normal or thermal vision.
3. **Locate the survivor**—a heat-signature object detectable via thermal mode.
4. **Approach and interact** (press **F**) to tag the survivor’s location.
5. **Return to the station** before the battery drains.
6. Enter the tent area to **complete the mission**.

---

## 🛰 Drone Controls

### Keyboard
| Action | Default Key |
|--------|-------------|
| Move Forward | **W** |
| Move Back | **S** |
| Move Left | **A** |
| Move Right | **D** |
| Ascend | **Space** |
| Descend | **Shift** |
| Turn Left | **Q** |
| Turn Right | **E** |
| Tilt Camera Up | **Up Arrow** |
| Tilt Camera Down | **Down Arrow** |
| Toggle Thermal Vision | **T** |
| Interact / Tag Survivor | **F** |
| Pause | **Esc** |

### Gamepad
- Left Stick: Movement  
- Right Stick: Turn + Tilt  
- D-Pad Up: Toggle Thermal  
- South Button (A): Interact  

---

## 🔥 Thermal Vision System
The drone is equipped with a **thermal imaging overlay** that highlights heat sources.  
When thermal mode is activated:

- The survivor becomes more visible  
- The normal HUD dims  
- A shader intensifies bright heat signatures  

Toggling thermal is essential to find the survivor hidden in the forest.

---

## 🧍 Survivor Interaction
Survivors are placed in the environment with:

- A 3D mesh  
- A detection **Area3D**  
- A glowing thermal material for heat detection  

When the drone enters the detection area:

- A UI prompt appears:  
  **PRESS F TO TAG SURVIVOR**
- Pressing **F** triggers a reported coordinate ping.

Once tagged, the survivor is considered **found**.

---

## ⛺ Tent (Rescue Station)
The tent acts as:

- The **spawn point**  
- The **mission completion trigger**

After tagging the survivor, returning to the tent will:

- Complete the mission  
- Transition to the **Mission Complete screen**

If the player returns early, the game warns that the survivor hasn't been tagged yet.

---

## 🔋 Battery System
The drone battery drains **only while moving**, encouraging quick and efficient search patterns.

Displayed at the top-left HUD:

```
Battery: 97%
```

If the battery reaches 0%, the drone cannot continue the mission (future feature: forced landing).

---

## 📋 Scenes Included

| Scene | Purpose |
|--------|----------|
| **mainmenu.tscn** | Start, Settings, Exit |
| **world.tscn** | Main gameplay world |
| **survivor.tscn** | Survivor interaction logic |
| **tent.tscn** | Mission completion trigger |
| **pause_menu.tscn** | In-game pause UI |
| **settings / controls_menu.tscn** | Shows all input bindings |
| **mission_complete.tscn** | End-of-mission screen |

---

## 🛠 Technology & Features
- Built using **Godot Engine 4.5**
- GDScript-based drone controller
- 3D physics using `CharacterBody3D`
- Custom camera pitch system
- Dynamic UI prompts using groups and Area3D
- Thermal shader overlay
- Audio crossfading for drone idle/moving sounds
- Modular, reusable survivor prefab
- Full controller support (keyboard/gamepad)

---

## 📦 Deliverables Included
- Windows executable build (`.exe` + `.pck`)
- Full Godot project folder
- 2–5 minute gameplay demonstration video
- Markdown game description (this file)

---

## 🏁 Summary
**SAR-1: Rescue Operations** successfully demonstrates a functional search-and-rescue drone prototype with:

- Navigation  
- Detection  
- Interaction  
- Mission completion  

All core mechanics needed for a PoC are implemented, polished, and validated.
