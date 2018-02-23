var inTextArea = document.getElementsByClassName('main__profile__new__text')[0];
var textAreas = document.getElementsByClassName('main__profile__history__content');

var btnStartEdit = document.getElementsByClassName('main__profile__history__content__start_edit');
var btnCancelEdit = document.getElementsByClassName('main__profile__history__content_edit_cancel');
var btnStartDelete = document.getElementsByClassName('main__profile__history__content_start_delete');
var btnCancelDelete = document.getElementsByClassName('main__profile__history__content_delete_cancel');
// Profile page's load events
window.onload = () => {
  // get textAreas sized right
  textareaGrow();

  // initial sizing of top text area
  if (inTextArea) {
    inTextArea.addEventListener('change', inTextAreaGrow);
    inTextArea.addEventListener('keydown', inTextAreaGrow);
    inTextArea.addEventListener('mouseup', inTextAreaGrow);
    window.addEventListener('resize', inTextAreaGrow);
  }
  // get historic text boxes ready for events and properties
  [].forEach.call(textAreas, element => {
    element.addEventListener('change', textareaGrow);
    element.addEventListener('keydown', textareaGrow);
    element.addEventListener('mouseup', textareaGrow);
    window.addEventListener('resize', textareaGrow);
    element.readOnly = true; // prevent historic posts from being edited by default
  });

  // create the events for all the button options
  // console.log(startEdit);
  [].forEach.call(btnStartEdit, ea_edit_button => {
    ea_edit_button.addEventListener('click', startEditClick);
  });

  [].forEach.call(btnCancelEdit, ea_edit_cancel_button => {
    ea_edit_cancel_button.addEventListener('click', editCancelClick);
  });
  
  [].forEach.call(btnStartDelete, ea_delete_button => {
    ea_delete_button.addEventListener('click', startDeleteClick);
  });

  [].forEach.call(btnCancelDelete, ea_delete_cancel_button => {
    ea_delete_cancel_button.addEventListener('click', deleteCancelClick);
  });
};

// *****************************************
// event functions
// *****************************************

function inTextAreaGrow () {
  // change top most text area
  inTextArea.style.height = '5px'; // need small first to et scrollbar height
  inTextArea.setAttribute('style', 'height:' + inTextArea.scrollHeight * 1.1 + 'px');
}

function textareaGrow () {
  [].forEach.call(textAreas, element => {
    element.style.height = '5px'; // need small first to et scrollbar height
    element.setAttribute('style', 'height:' + element.scrollHeight * 1.1 + 'px');
  });
}

function startEditClick (clickEvent) {
  // get the elements to show or hide for specific post only
  let editStartContainer = clickEvent.target.parentElement;
  let postClicked = editStartContainer.getAttribute('data-postid');
  let editConfirmContainer = document.querySelectorAll('.main__profile__history__content_editchoice[data-postid="' + postClicked + '"]')[0];
  let thisTextArea = document.querySelectorAll('.main__profile__history__content[data-postid="' + postClicked + '"]')[0];

  // hide start edit dom
  editStartContainer.style.display = 'none';
  // show confirm edit
  editConfirmContainer.style.display = 'inline-block';
  // change style to editable one
  thisTextArea.readOnly = false;
  thisTextArea.classList.add('main__profile__history__content_editable');
  thisTextArea.setAttribute('data-backup', thisTextArea.value);
}

function editCancelClick (clickEvent) {
  // get the elements to show or hide for specific post only
  let editCancelContainer = clickEvent.target.parentElement;
  let postClicked = editCancelContainer.getAttribute('data-postid');
  let editStartContainer = document.querySelectorAll('.main__profile__history__buttons__start[data-postid="' + postClicked + '"]')[0];
  let thisTextArea = document.querySelectorAll('.main__profile__history__content[data-postid="' + postClicked + '"]')[0];

  // hide start edit dom
  editCancelContainer.style.display = 'none';
  // show confirm edit
  editStartContainer.style.display = 'inline-block';
  // change style to editable one
  thisTextArea.readOnly = true;
  thisTextArea.classList.remove('main__profile__history__content_editable');
  thisTextArea.value = thisTextArea.getAttribute('data-backup');
  textareaGrow();
}

function startDeleteClick (clickEvent) {
  // get the elements to show or hide for specific post only
  let deleteStartContainer = clickEvent.target.parentElement;
  let postClicked = deleteStartContainer.getAttribute('data-postid');
  let deleteConfirmContainer = document.querySelectorAll('.main__profile__history__content_deletechoice[data-postid="' + postClicked + '"]')[0];
  // let thisTextArea = document.querySelectorAll('.main__profile__history__content[data-postid="' + postClicked + '"]')[0];

  // hide start edit dom
  deleteStartContainer.style.display = 'none';
  // show confirm edit
  deleteConfirmContainer.style.display = 'inline-block';
  // change style to editable one
  // thisTextArea.readOnly = false;
  // thisTextArea.classList.add('main__profile__history__content_editable');
  // thisTextArea.setAttribute('data-backup', thisTextArea.value);
}

function deleteCancelClick (clickEvent) {
  // get the elements to show or hide for specific post only
  let deleteCancelContainer = clickEvent.target.parentElement;
  let postClicked = deleteCancelContainer.getAttribute('data-postid');
  let deleteConfirmContainer = document.querySelectorAll('.main__profile__history__buttons__start[data-postid="' + postClicked + '"]')[0];
  // let thisTextArea = document.querySelectorAll('.main__profile__history__content[data-postid="' + postClicked + '"]')[0];

  // hide start edit dom
  deleteConfirmContainer.style.display = 'inline-block';
  // show confirm edit
  deleteCancelContainer.style.display = 'none';
  // change style to editable one
  // thisTextArea.readOnly = false;
  // thisTextArea.classList.add('main__profile__history__content_editable');
  // thisTextArea.setAttribute('data-backup', thisTextArea.value);
}

console.log('profile.js loaded');
