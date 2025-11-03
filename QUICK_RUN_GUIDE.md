# 🏃 Quick Run Guide - See Your App in Action!

## ⚡ Fastest Way to See the UI (Mac)

### Step 1: Install Flutter (5-10 minutes)

#### Option A: Using Homebrew (Recommended)
```bash
# Install Homebrew if you don't have it
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Flutter
brew install --cask flutter

# Verify installation
flutter doctor
```

#### Option B: Manual Installation
```bash
# Download Flutter SDK
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable

# Add to PATH (add this to your ~/.zshrc or ~/.bash_profile)
export PATH="$PATH:$HOME/development/flutter/bin"

# Reload shell
source ~/.zshrc

# Verify
flutter doctor
```

### Step 2: Accept Licenses
```bash
flutter doctor --android-licenses
# Press 'y' for all prompts
```

### Step 3: Install Dependencies
```bash
cd /Users/htcuser/Documents/passion/booking/packages/core
flutter pub get

cd /Users/htcuser/Documents/passion/booking/user_app
flutter pub get
```

### Step 4: Run on iOS Simulator

```bash
# Open iOS Simulator
open -a Simulator

# Run the app
cd /Users/htcuser/Documents/passion/booking/user_app
flutter run
```

### Step 5: Run on Chrome (Web - Fastest to see UI!)

```bash
cd /Users/htcuser/Documents/passion/booking/user_app

# Enable web support
flutter config --enable-web

# Run on Chrome
flutter run -d chrome
```

## 🎯 Alternative: See UI Without Installing Flutter

You can preview the screens I created for you:

### User App Screens:
1. **Splash Screen** - Purple gradient with app logo
2. **Login Page** - Email/password with Google sign-in option
3. **Register Page** - Full registration form
4. **Home Page** - Dashboard with welcome card and quick actions
5. **Bookings Page** - List of all bookings
6. **Create Booking Page** - Form to create new booking
7. **Profile Page** - User profile with settings

### Admin App Screens:
1. **Admin Login** - Professional card-based login
2. **Dashboard** - Stats cards with metrics
3. **Bookings Management** - Table view with filters
4. **Users Management** - User list and details
5. **Analytics** - Charts and reports
6. **Settings** - Configuration panels

## 🚀 Quick Commands Reference

```bash
# Check Flutter status
flutter doctor

# Run on iOS Simulator
flutter run -d ios

# Run on Android Emulator
flutter run -d android

# Run on Chrome (fastest!)
flutter run -d chrome

# Hot reload (while app is running)
# Press 'r' in terminal

# Hot restart (while app is running)
# Press 'R' in terminal

# Quit
# Press 'q' in terminal
```

## 📱 What You'll See

### User App Features:
- ✨ Beautiful purple gradient theme
- 🔐 Complete authentication flow
- 🏠 Modern home dashboard
- 📅 Booking creation and management
- 👤 User profile
- 🔔 Notification support

### Admin App Features:
- 💼 Professional blue admin theme
- 📊 Dashboard with statistics
- 📋 Booking management table
- 👥 User management
- 📈 Analytics and charts
- ⚙️ Settings panels

## 🎨 UI Highlights

### Colors:
- **User App**: Purple (#6366F1) - Modern and friendly
- **Admin App**: Blue (#1E40AF) - Professional and trustworthy

### Design:
- Material Design 3
- Google Fonts (Inter)
- Rounded corners
- Elevation shadows
- Smooth animations

## ⚡ Fastest Way to See Something NOW

If you want to see the UI immediately without installing Flutter:

### Run on Chrome (Web):
```bash
# 1. Install Flutter (takes 5 min)
brew install --cask flutter

# 2. Enable web
flutter config --enable-web

# 3. Navigate and run
cd /Users/htcuser/Documents/passion/booking/user_app
flutter pub get
flutter run -d chrome
```

This will open the app in Chrome browser in about 2 minutes after Flutter installs!

## 🐛 Troubleshooting

### Command not found: flutter
```bash
# Make sure Flutter is in your PATH
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

### iOS Simulator not found
```bash
# Install Xcode from App Store first
# Then install command line tools
xcode-select --install
```

### Android emulator issues
```bash
# Install Android Studio from:
# https://developer.android.com/studio
```

## 💡 Pro Tips

1. **Use Chrome first** - Fastest way to see the UI
2. **Hot reload** - Press 'r' while app is running to see changes instantly
3. **DevTools** - Flutter has amazing debugging tools
4. **VS Code** - Best editor for Flutter development

## 🎉 Expected Result

After running `flutter run -d chrome`, you'll see:

1. **Splash screen** with purple gradient
2. **Login page** with:
   - Email and password fields
   - Google sign-in button
   - Register link
3. **Beautiful UI** with:
   - Modern cards
   - Smooth animations
   - Responsive layout
   - Professional design

## ⏱️ Time Estimate

- Install Flutter: 5-10 minutes
- Install dependencies: 2-3 minutes
- First run: 3-5 minutes (build time)
- **Total**: ~15-20 minutes to see your app running!

---

**Ready? Let's see that beautiful UI! 🚀**

