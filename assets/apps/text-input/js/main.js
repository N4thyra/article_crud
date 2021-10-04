import AppsManager from 'apps-manager';
import App from './TextInput.svelte'

// instantiate the component
function constructor(element, props) {
  new App({
    // mount it to `document.body`
    target: element,
  
    // pass some props (optional)
    props: props
  })
}
AppsManager.register("text-input", constructor);