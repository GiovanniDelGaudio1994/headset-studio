# Headset Studio — Early UI Sample

This directory contains a **small, independent Flutter example**, created to show how a first iteration of the Headset Studio dashboard can be structured.

> **Transparency:** This is an illustrative reconstruction of an early-stage UI, not an archived historical build and not the complete application. All connection and volume values in this sample are **simulated**.

## What reviewers can inspect

- A Material 3 desktop-friendly dashboard
- Immutable UI state and explicit updates via `setState`
- Connected/disconnected UI handling
- A volume slider with disabled behavior when disconnected
- A constrained, scrollable layout

## Run it

Requires Flutter with a configured desktop or other supported development target.

```bash
cd examples/early-ui
flutter pub get
flutter run -d macos
```

For Windows, use `flutter run -d windows` on a configured Windows development machine. The UI sample does not perform platform-specific operations.

## Scope and limitations

This example does **not** scan or connect to Bluetooth devices, display real battery telemetry, change system volume, or implement advanced audio processing. Those features require separate native/platform integrations and testing.

The full application and its internal native integrations are **not** part of this public sample. This independent snippet is provided for review and learning; no third-party brand affiliation is claimed.
