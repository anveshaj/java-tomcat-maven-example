<html>
<body>
<h2>Hello World!</h2>
</body>
</html>

<!doctype html>
<html lang="en"><!-- TODO(dbeam): dir="ltr"? -->
<!-- Copyright 2015 The Chromium Authors. All rights reserved.
     Use of this source code is governed by a BSD-style license that can be
     found in the LICENSE file. -->
<head>
  <link rel="stylesheet" href="chrome-search://local-ntp/animations.css"></link>
  <link rel="stylesheet" href="chrome-search://local-ntp/local-ntp-common.css"></link>
  <link rel="stylesheet" href="chrome-search://local-ntp/customize.css"></link>
  <link rel="stylesheet" href="chrome-search://local-ntp/doodles.css"></link>
  <link rel="stylesheet" href="chrome-search://local-ntp/local-ntp.css"></link>
  <link rel="stylesheet" href="chrome-search://local-ntp/theme.css"></link>
  <link rel="stylesheet" href="chrome-search://local-ntp/voice.css"></link>
  
  <meta http-equiv="Content-Security-Policy"
      content="object-src 'none';child-src chrome-search://most-visited/ https://*.google.com/ ;script-src 'strict-dynamic' 'sha256-1+GSDjMMklBjZY0QiWq+tGupCvajw4Xbn46ect2mZgM=' 'sha256-tCDoudW5/J/Alj3FMpQD7Hhf4u9RrSmCJLKqQnUos6g=' 'sha256-HqdPsO6hNmT/mfSeGdcX3eEGrZVva7AKD2Z2+1ujCZ8=' 'sha256-BcnvQDggot04zBRxv6gAGtlSZSQqR8mWXAE88yjPUkY=' 'sha256-IEF9PjeyU0vsr61C8cm3JQOerOYWdBsaGddCSPp6tZs=' 'sha256-RIDhH5uF+ciLoS6AP6ZkoxuwQyczkrTetThxXwVwFJI=' 'sha256-swn6uJCD/hDfzMQu5f7SxdXOcdpBv8xIQjuWN3HCdD0=';">
  <script src="chrome-search://local-ntp/animations.js"
      integrity="sha256-1+GSDjMMklBjZY0QiWq+tGupCvajw4Xbn46ect2mZgM="></script>
  <script src="chrome-search://local-ntp/config.js"
      integrity="sha256-swn6uJCD/hDfzMQu5f7SxdXOcdpBv8xIQjuWN3HCdD0="></script>
  <script src="chrome-search://local-ntp/customize.js"
      integrity="sha256-tCDoudW5/J/Alj3FMpQD7Hhf4u9RrSmCJLKqQnUos6g="></script>
  <script src="chrome-search://local-ntp/doodles.js"
      integrity="sha256-HqdPsO6hNmT/mfSeGdcX3eEGrZVva7AKD2Z2+1ujCZ8="></script>
  <script src="chrome-search://local-ntp/local-ntp.js"
      integrity="sha256-BcnvQDggot04zBRxv6gAGtlSZSQqR8mWXAE88yjPUkY="></script>
  <script src="chrome-search://local-ntp/utils.js"
      integrity="sha256-IEF9PjeyU0vsr61C8cm3JQOerOYWdBsaGddCSPp6tZs="></script>
  <meta charset="utf-8">
  <meta name="google" value="notranslate">
  <meta name="referrer" content="strict-origin">
</head>
<body>
  <div id="custom-bg"></div>
  <div id="custom-bg-preview"></div>
  <!-- Container for the OneGoogleBar HTML. -->
  <div id="one-google"></div>

  <div id="ntp-contents">
    <div id="logo">
      <!-- The logo that is displayed in the absence of a doodle. -->
      <div id="logo-default" title="Google"></div>
      <!-- Logo displayed when theme prevents doodles. Doesn't fade. -->
      <div id="logo-non-white" title="Google"></div>
      <!-- A doodle, if any: its link and image. -->
      <div id="logo-doodle">
        <div id="logo-doodle-container">
          <div id="logo-doodle-wrapper">
            <button id="logo-doodle-button">
              <img id="logo-doodle-image" tabindex="-1"></img>
            </button>
          </div>
        </div>
        <iframe id="logo-doodle-iframe" scrolling="no"></iframe>
        <!-- A spinner, prompting the doodle. Visible on NTPs with customized
             backgrounds. -->
        <button id="logo-doodle-notifier">
          <div class="outer ball0"><div class="inner"></div></div>
          <div class="outer ball1"><div class="inner"></div></div>
          <div class="outer ball2"><div class="inner"></div></div>
          <div class="outer ball3"><div class="inner"></div></div>
        </button>
      </div>
    </div>

    <div id="fakebox-container">
      <div id="fakebox">
        <div id="fakebox-search-icon"></div>
        <div id="fakebox-text"></div>
        <input id="fakebox-input" autocomplete="off" tabindex="-1" type="url"
            aria-hidden="true">
        <div id="fakebox-cursor"></div>
        <button id="fakebox-microphone" hidden></button>
      </div>
    </div>

    <div id="user-content">
      <!-- Search suggestions will be inserted here. -->
      <div id="most-visited">
        <!-- The container for the tiles. The MV iframe goes in here. -->
        <div id="mv-tiles"></div>
      </div>
    </div>

    <!-- Notification shown when the tiles are modified. -->
    <div id="mv-notice-container">
      <div id="mv-notice" class="notice-hide" role="alert">
        <span id="mv-msg"></span>
        <!-- Links in the notification. -->
        <span id="mv-notice-links">
          <span id="mv-undo" class="ripple" tabindex="0" role="button"></span>
          <span id="mv-restore" class="ripple" tabindex="0" role="button"></span>
        </span>
      </div>
    </div>

    <div id="attribution"><div id="attribution-text"></div></div>

    <div id="error-notice-container">
      <div id="error-notice" class="notice-hide" role="alert">
        <span id="error-notice-icon"></span>
        <span id="error-notice-msg"></span>
        <span id="error-notice-link" class="ripple" tabindex="0" role="button"></span>
      </div>
    </div>

    <div id="edit-bg" tabindex="0" role="button" hidden>
      <div id="edit-bg-icon"></div>
      <span id="edit-bg-text">Customize</span>
    </div>

    <a id="custom-bg-attr"></a>
  </div>

  <dialog div id="edit-bg-dialog">
    <div id="edit-bg-menu">
      <div id="edit-bg-title"></div>
      <div id="edit-bg-default-wallpapers" class="bg-option" tabindex="0">
        <div class="bg-option-img"></div>
        <div id="edit-bg-default-wallpapers-text" class="bg-option-text">
        </div>
      </div>
      <div id="edit-bg-upload-image" class="bg-option" tabindex="0">
        <div class="bg-option-img"></div>
        <div id="edit-bg-upload-image-text" class="bg-option-text"></div>
      </div>
      <div id="edit-bg-divider"></div>
      <div id="custom-links-restore-default" class="bg-option bg-option-disabled" tabindex="0">
        <div class="bg-option-img"></div>
        <div id="custom-links-restore-default-text" class="bg-option-text"></div>
      </div>
      <div id="edit-bg-restore-default" class="bg-option bg-option-disabled" tabindex="0">
        <div class="bg-option-img"></div>
        <div id="edit-bg-restore-default-text" class="bg-option-text"></div>
      </div>
    </div>
  </dialog>

  <dialog id="ddlsd">
    <div id="ddlsd-title"></div>
    <button id="ddlsd-close"></button>
    <div id="ddlsd-content">
      <button id="ddlsd-fbb" class="ddlsd-sbtn"></button>
      <button id="ddlsd-twb" class="ddlsd-sbtn"></button>
      <button id="ddlsd-emb" class="ddlsd-sbtn"></button>
      <hr id="ddlsd-hr">
      <div id="ddlsd-link">
        <button id="ddlsd-copy"></button>
        <span id="ddlsd-text-ctr">
          <input type="text" id="ddlsd-text" dir="ltr">
        </span>
      </div>
    </div>
  </dialog>

  <dialog id="bg-sel-menu" class="customize-dialog">
    <div id="bg-sel-title-bar">
    <div id="bg-sel-back-circle" tabindex="0" role="button">
      <div id="bg-sel-back"></div>
    </div>
    <div id="bg-sel-title"></div>
    </div>
    <div id="bg-sel-tiles" tabindex="0"></div>
    <div id="bg-sel-footer">
      <button id="bg-sel-footer-cancel" class="bg-sel-footer-button paper secondary ripple"
          tabindex="0"></button>
      <button id="bg-sel-footer-done" class="bg-sel-footer-button paper primary ripple"
          tabindex="-1"></button>
    </div>
  </dialog>

  <dialog id="customization-menu" class="customize-dialog">
    <div id="menu-nav-panel" role="tablist" aria-label="Customize this page">
      <button id="backgrounds-button" class="menu-option" tabindex="0"
          role="tab" aria-controls="backgrounds-menu backgrounds-image-menu"
          aria-selected="true" aria-labelledby="backgrounds-menu-option"
          title="Background">
        <div class="menu-option-icon-wrapper">
          <div id="backgrounds-icon" class="menu-option-icon"></div>
        </div>
        <div id="backgrounds-menu-option" class="menu-option-label">
          Background
        </div>
      </button>
      <button id="shortcuts-button" class="menu-option" tabindex="0" role="tab"
          aria-controls="shortcuts-menu" aria-selected="false"
          aria-labelledby="shortcuts-menu-option"
          title="Shortcuts">
        <div class="menu-option-icon-wrapper">
          <div id="shortcuts-icon" class="menu-option-icon"></div>
        </div>
        <div id="shortcuts-menu-option" class="menu-option-label">
          Shortcuts
        </div>
      </button>
      <button id="colors-button" class="menu-option" tabindex="0" role="tab"
          aria-controls="colors-menu" aria-selected="false"
          aria-labelledby="colors-menu-option" title="Color and theme">
        <div class="menu-option-icon-wrapper">
          <div id="colors-icon" class="menu-option-icon"></div>
        </div>
        <div id="colors-menu-option" class="menu-option-label">
          Color and theme
        </div>
      </button>
    </div>
    <div id="menu-contents">
      <div id="menu-header">
        <div id="menu-back-circle" tabindex="0" role="button"
            aria-label="Back" title="Back">
          <div id="menu-back"></div>
        </div>
        <div id="menu-title">Customize this page</div>
        <div id="refresh-daily-wrapper">
          <div id="refresh-toggle-wrapper" title="Refresh daily">
            <label class="switch">
              <input id="refresh-daily-toggle" type="checkbox"
                  aria-labelledby="refresh-text"></input>
              <span class="toggle">
                <div class="knob"></div>
                <div class="highlight"></div>
              </span>
            </label>
          </div>
          <div id="refresh-text">Refresh daily</div>
        </div>
      </div>
      <div id="backgrounds-menu" class="menu-panel" tabindex="0"
          role="tabpanel" aria-label="Background">
        <div id="backgrounds-upload" class="bg-sel-tile-bg">
          <div id="backgrounds-upload-icon" class="bg-sel-tile" tabindex="-1"
              role="button" aria-label="Upload from device"
              title="Upload from device" aria-pressed="false">
            <div id="backgrounds-upload-arrow"></div>
            <div id="backgrounds-upload-text">Upload from device</div>
          </div>
        </div>
        <div id="backgrounds-default" class="bg-sel-tile-bg">
          <div id="backgrounds-default-icon" class="bg-sel-tile" tabindex="-1"
              role="button" aria-label="No background"
              title="No background" aria-pressed="false">
            <div class="mini-page">
              <div class="mini-header-colorful"></div>
              <div class="mini-shortcuts"></div>
            </div>
          </div>
          <div class="bg-sel-tile-title">No background</div>
        </div>
      </div>
      <div id="backgrounds-image-menu" class="menu-panel" tabindex="0"
          role="tabpanel" aria-label="Background"></div>
      <div id="shortcuts-menu" class="menu-panel" tabindex="0" role="tabpanel"
          aria-label="Shortcuts">
        <div id="sh-options">
          <div class="sh-option">
            <div id="sh-option-cl" class="sh-option-image" tabindex="-1"
                role="button" aria-pressed="false"
                aria-labelledby="sh-option-cl-title" title="My shortcuts">
              <div class="sh-option-icon"></div>
              <div class="sh-option-mini">
                <div class="mini-page">
                  <div class="mini-header"></div>
                  <div class="mini-shortcuts"></div>
                </div>
              </div>
            </div>
            <div id="sh-option-cl-title" class="sh-option-title">
              My shortcuts
            </div>
            Shortcuts are curated by you
          </div>
          <div class="sh-option">
            <div id="sh-option-mv" class="sh-option-image" tabindex="-1"
                role="button" aria-pressed="false"
                aria-labelledby="sh-option-mv-title" title="Most visited sites">
              <div class="sh-option-icon"></div>
              <div class="sh-option-mini">
                <div class="mini-page">
                  <div class="mini-header"></div>
                  <div class="mini-shortcuts"></div>
                </div>
              </div>
            </div>
            <div id="sh-option-mv-title" class="sh-option-title">
              Most visited sites
            </div>
            Shortcuts are suggested based on websites you visit often
          </div>
        </div>
        <div id="sh-hide">
          <div id="sh-hide-icon"></div>
          <div>
            <div id="sh-hide-title">Hide shortcuts</div>
            Don&#39;t show shortcuts on this page
          </div>
          <div id="sh-hide-toggle-wrapper" title="Hide shortcuts">
            <label class="switch">
              <input id="sh-hide-toggle" type="checkbox" tabindex="-1"
                  aria-labelledby="sh-hide-title"></input>
              <span class="toggle">
                <div class="knob"></div>
                <div class="highlight"></div>
              </span>
            </label>
          </div>
        </div>
      </div>
      <div id="colors-menu" class="menu-panel" tabindex="0" role="tabpanel"
          aria-label="Color and theme">
        <div id="colors-theme" tabindex="0">
            <div id="colors-theme-icon"></div>
            <div>
              <div id="colors-theme-name"></div>
              Current theme you have installed
            </div>
            <a id="colors-theme-link" target="_blank">
              <div id="colors-theme-link-icon" > </div>
            </a>
            <button id="colors-theme-uninstall" class="paper secondary">
              Uninstall
            </button>
        </div>
        <div id="color-picker-container" class="bg-sel-tile-bg">
          <div id="color-picker-tile" class="bg-sel-tile" tabindex="-1"
            aria-label="Select color"
            title="Select color"
            role="button" aria-pressed="false">
            <div id="left-semicircle"></div>
            <div id="color-picker-icon"></div>
            <input id="color-picker" type="color" style="display:none">
            </input>
          </div>
        </div>
        <div id="colors-default" class="bg-sel-tile-bg">
          <div id="colors-default-icon" class="bg-sel-tile" tabindex="-1"
            aria-label="Default"
            title="Default"
            role="button" aria-pressed="false"></div>
        </div>
      </div>
    </div>
    <div id="menu-footer">
      <button id="menu-cancel"
          class="bg-sel-footer-button paper secondary ripple"
          title="Cancel">Cancel</button>
      <button id="menu-done" class="bg-sel-footer-button paper primary ripple"
          title="Done">Done</button>
    </div>
  </dialog>

  <dialog id="voice-overlay-dialog" class="overlay-dialog">
    <div id="voice-overlay" class="overlay-hidden">
      <button id="voice-close-button" class="close-button">&times;</button>
      <div id="voice-outer" class="outer">
        <div class="inner-container">
          <div id="voice-button-container" class="button-container">
            <!-- The audio level animation. -->
            <span id="voice-level" class="level"></span>
            <!-- The microphone button. -->
            <span id="voice-button" class="button">
              <!-- The microphone icon (in CSS). -->
              <div class="microphone">
                <span class="receiver"></span>
                <div class="wrapper">
                  <span class="stem"></span>
                  <span class="shell"></span>
                </div>
              </div>
            </span>
          </div>
          <div id="text-container" aria-live="polite">
            <!-- Low confidence text underneath high confidence text. -->
            <span id="voice-text-i" class="voice-text"></span>
            <!-- High confidence text on top of low confidence text. -->
            <span id="voice-text-f" class="voice-text"></span>
          </div>
        </div>
      </div>
    </div>
  </dialog>

  <div id="one-google-end-of-body"></div>

  <script defer src="chrome-search://local-ntp/voice.js"
      integrity="sha256-RIDhH5uF+ciLoS6AP6ZkoxuwQyczkrTetThxXwVwFJI="></script>
</body>
</html>
