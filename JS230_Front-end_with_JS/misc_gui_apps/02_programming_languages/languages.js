const languages = [
  {
    name: 'Ruby',
    description: 'Ruby is a dynamic, reflective, object-oriented, ' +
    'general-purpose programming language. It was designed and developed in the mid-1990s ' +
    'by Yukihiro Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, ' +
    'Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, ' +
    'including functional, object-oriented, and imperative. It also has a dynamic type ' +
    'system and automatic memory management.'
  },

  {
    name: 'JavaScript',
    description: 'JavaScript is a high-level, dynamic, untyped, and interpreted ' +
    'programming language. It has been standardized in the ECMAScript language ' +
    'specification. Alongside HTML and CSS, JavaScript is one of the three core ' +
    'technologies of World Wide Web content production; the majority of websites employ ' +
    'it, and all modern Web browsers support it without the need for plug-ins. JavaScript ' +
    'is prototype-based with first-class functions, making it a multi-paradigm language, ' +
    'supporting object-oriented, imperative, and functional programming styles.'
  },

  {
    name: 'Lisp',
    description: 'Lisp (historically, LISP) is a family of computer programming languages ' +
    'with a long history and a distinctive, fully parenthesized prefix notation. ' +
    'Originally specified in 1958, Lisp is the second-oldest high-level programming ' +
    'language in widespread use today. Only Fortran is older, by one year. Lisp has changed ' +
    'since its early days, and many dialects have existed over its history. Today, the best '+
    'known general-purpose Lisp dialects are Common Lisp and Scheme.'
  },

  {
    name: 'Brainf#@k',
    description: 'Why would you even?',
  }
];

document.addEventListener('DOMContentLoaded', () => {
  let main = document.querySelector('main');
  
  languages.forEach(language => {
    let article = document.createElement('article');
    article.dataset.name = language.name;
    article.insertAdjacentHTML('beforeend', `<h2>${language.name}</h2>`);
    
    let shortDescription = language.description.slice(0, 120);
    article.insertAdjacentHTML('beforeend', `<p>${shortDescription}</p>`)
    
    if (!(shortDescription === language.description)) {
      article.querySelector('p').textContent = shortDescription + ' ...';
      article.insertAdjacentHTML('beforeend', `<button data-type='more'>Show More</button>`);
    }

    main.appendChild(article);
  });

  main.addEventListener('mouseup', event => {
    if (event.target.tagName !== 'BUTTON') {
      return;
    }

    let article = event.target.closest('article');
    let paragraph = article.querySelector('p');
    let button = article.querySelector('button');
    let language = languages.filter(({name}) => name === article.dataset.name)[0];

    let buttonType = event.target.dataset.type;
    
    if (buttonType === 'more') {
      paragraph.textContent = language.description;
      button.textContent = "Show Less";
      event.target.dataset.type = 'less';
    } else if (buttonType === 'less') {
      paragraph.textContent = language.description.slice(0, 120) + ' ...';
      button.textContent = "Show More";
      event.target.dataset.type = 'more';
    }
  });
});