const ErrorMessages = {
  firstName: 'This field is required.',
  lastName: 'This field is required.',
  email: 'Must be a valid email.',
  password: 'Password must include at least 10 characters.',
  phone: 'Phone number must be in correct format.',    
};

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let fields = document.querySelector('#fields');
  let submit = document.querySelector('[type="submit"]');

  let submissionError = document.createElement('H2');
  submissionError.classList.add('error');
  submissionError.textContent = 'Fix errors before submitting form.'

  let firstName = document.querySelector('[name="firstName"]');
  let lastName = document.querySelector('[name="lastName"]');
  let email = document.querySelector('[name="email"]');
  let password = document.querySelector('[name="password"]');
  let phone = document.querySelector('[name="phone"]');
  
  let allInputsValid = () => [firstName, lastName, email, password, phone].every(elem => elem.validity.valid);

  fields.addEventListener('focusout', event => {
    if (allInputsValid()) {
      submissionError.remove();
    }

    if (event.target.tagName !== 'INPUT') {
      return;
    }

    let input = event.target;
    if (!input.validity.valid) {
      input.classList.add('invalid');
      input.insertAdjacentHTML('afterend', `<span class="error">${ErrorMessages[input.name]}</span>`);
    } else {
      input.classList.remove('invalid');
    }
  });

  fields.addEventListener('focusin', event => {
    if (event.target.tagName !== 'INPUT') {
      return;
    }
    
    let input = event.target;
    if (input.nextElementSibling) {
      input.nextElementSibling.remove()
    }
  });

  form.addEventListener('submit', event => {
    event.preventDefault();

    if (allInputsValid()) {
      alert('Submitted!');
    } else {
      form.parentElement.insertBefore(submissionError, form);
    }
  });
});