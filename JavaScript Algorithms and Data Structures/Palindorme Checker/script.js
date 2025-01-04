document.getElementById("check-btn").addEventListener("click", function () {
    const inputElement = document.getElementById("text-input");
    const resultElement = document.getElementById("result");
    const text = inputElement.value.trim();

    if (!text) {
        alert("Please input a value");
        return;
    }

    function isPalindrome(str) {
        const cleaned = str.replace(/[^a-zA-Z0-9]/g, "").toLowerCase();
        return cleaned === cleaned.split("").reverse().join("");
    }

    if (isPalindrome(text)) {
        resultElement.textContent = `${text} is a palindrome`;
    } else {
        resultElement.textContent = `${text} is not a palindrome`;
    }
});