// This is a workaround because npm-watch does not work on Macos https://github.com/M-Zuber/npm-watch/issues/35

const fs = require('fs'),
    spawn = require('child_process').spawn;

fs.watch('app/src', {
    recursive: true // watch everything in the directory
}, (e, file) => {
    // Use the extension of the file as the npm script name
    const script = file.split('.').pop();

    if (['elm'].includes(script)) {
        // Spawn the process
        const p = spawn('npm', ['run', 'develop'], {
            stdio: 'inherit' // pipe output to the console
        });
        // Print something when the process completes
        p.on('close', code => {
            if (code === 1) {
                console.error(`✖ "npm run ${script}" failed.`);
            } else {
                console.log('watching for changes...');
            }
        });
    }
});

console.log('watching for changes...');
