use std::fs;
use std::thread;
use std::time::Duration;

fn main() {
    println!("Aura Drive Daemon started...");
    loop {
        // Watch for new drives
        let mounts = fs::read_dir("/dev").unwrap();
        for entry in mounts {
            if let Ok(e) = entry {
                let name = e.file_name().into_string().unwrap_or_default();
                if name.starts_with("sd") || name.starts_with("nvme") {
                    println!("Aura: Found drive {}", name);
                    // Create Aura HD entry
                }
            }
        }
        // Refresh desktop icons every 3 sec
        thread::sleep(Duration::from_secs(3));
    }
}
