const Searching =()=>{
    const ele = document.getElementById("textSearching");
    const text = document.getElementById("searching");
    if(ele.style.display == "block"){
        ele.style.display = "none";
        text.innerHTML = "Поиск";
    }
    else{
        ele.style.display = "block";
        text.innerHTML = "Скрыть";
    }
}