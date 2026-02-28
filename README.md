# GSoC 2026: Flutter DevTools Network Profiler Enhancement
## Project: Add WebSocket/gRPC Support to Flutter DevTools

### 🚀 Overview
This repository serves as a technical proof-of-concept and environment setup for my **Google Summer of Code 2026** application. As a 2nd-year Computer Engineering student at **Boğaziçi University**, I am focusing on enhancing the **Flutter DevTools Network Panel** to support real-time inspection of WebSocket frames and gRPC streams.

### 🔍 The Problem Statement
Currently, Flutter DevTools excels at capturing discrete HTTP Request-Response cycles. However, there is a significant visibility gap when it comes to persistent connections like WebSockets:
1. **Handshake Visibility:** DevTools captures the initial HTTP 101 Switching Protocols handshake.
2. **Frame Invisibility:** Individual data frames (messages) sent or received over the established socket are **not logged** in the Network tab, despite being successfully processed by the Dart VM.

### 🛠 Tech Stack
- **Language:** Dart / Flutter
- **Core Library:** `dart:io` (for low-level networking)
- **Tooling:** Flutter DevTools, VS Code Debug Console
- **Platform:** Windows Desktop (Development Environment)

### 🧪 Technical Experiment & Proof
I implemented a dual-protocol test suite to demonstrate this gap:

#### 1. HTTP Control Group (`fetchData`)
- **Action:** Sent a GET request to JSONPlaceholder API.
- **Result:** Successfully traced in DevTools with full visibility of the JSON response body.

#### 2. WebSocket Experimental Group (`testWebSocket`)
- **Action:** Established a connection to `wss://echo.websocket.org` and sent a text frame.
- **Result:**
    - **Console:** The message was confirmed as received via `print` logs in the Debug Console.
    - **DevTools:** The Network tab showed the connection but failed to display the individual message payload ("Hello GSoC!").



### 📈 Current Progress
- [x] Windows development environment configured (Visual Studio, CMake).
- [x] Successful HTTP network tracing verified.
- [x] WebSocket frame visibility gap identified and documented.
- [x] Integration with `dart:io` for persistent connection management.

### 🎓 About Me
I am **Nisanur Doğan**, a Computer Engineering student at Boğaziçi University. I am passionate about Generative AI, Flutter development, and system-level performance tools. I was recently accepted to the **Insider One AI Weekend** event, further fueling my interest in scalable AI and developer tooling.

---
*This project is part of my preparation for the GSoC 2026 program. Feel free to explore the code!*
