window.addEventListener('message', function(event) {
    if (event.data.type === "show") {
        document.getElementById("scare-image").src = event.data.image;
        document.getElementById("jumpscare").style.display = "flex";
        
        setTimeout(() => {
            document.getElementById("jumpscare").style.display = "none";
        }, 5000);
    }
});
