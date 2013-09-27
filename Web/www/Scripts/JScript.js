//Select CheckBox
function LinhaSelecionada(chkB) {
    var IsChecked = chkB.checked;
    if (IsChecked) {
        chkB.parentElement.parentElement.style.backgroundColor = '#818181';
        chkB.parentElement.parentElement.style.color = 'white';
    } else {
        chkB.parentElement.parentElement.style.backgroundColor = '#F7F6F3';
        chkB.parentElement.parentElement.style.color = '#333333';
    }
}