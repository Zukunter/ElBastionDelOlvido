// Permitir montar y desmontar sistemas de archivos sin sudo
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount" ||
         action.id == "org.freedesktop.udisks2.filesystem-unmount-others") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});

// Permitir abrir NetworkManager TUI (nmtui) sin sudo
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.NetworkManager.settings.modify.system" ||
         action.id == "org.freedesktop.NetworkManager.enable-disable-wifi" ||
         action.id == "org.freedesktop.NetworkManager.enable-disable-network") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});