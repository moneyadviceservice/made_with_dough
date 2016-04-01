# Working with Dough

This is the example website for our Dough components. It is available online at [http://www.madewithdough.org.uk](http://www.madewithdough.org.uk).

## Local setup

In order to run this project locally, install dependencies, and start a Rails server.
```sh
$ bundle install
$ bowndler install
$ rails s
```
## Deployment and hosting

The live site (madewithdough.org.uk) is hosted on Heroku.

To make a new deployment follow the standard Heroku instructions but you must specify a custom buildpack **before** pushing code to the Heroku git repository:

```sh
$ heroku buildpacks:set https://github.com/moneyadviceservice/heroku-buildpack-ruby-bowndler
```

## How Dough works in a nutshell

Dough components use data attributes to initialise themselves on page load. This is handled by [ComponentLoader](https://github.com/moneyadviceservice/dough/blob/master/assets/js/lib/componentLoader.js). It looks for markup that is stamped with these attributes:

```html
<div data-dough-component="ModuleName">
	<!-- Markup sent to browsers, which is then progressively enhanced by Dough's JS. -->
</div>
```

All Dough components extend from [DoughBaseComponent.js](https://github.com/moneyadviceservice/dough/blob/master/assets/js/components/DoughBaseComponent.js)

A simple example of a dough component is [ClearInput.js](https://github.com/moneyadviceservice/frontend/blob/master/app/assets/javascripts/components/ClearInput.js), which is used in the frontend project (the MAS responsive website at www.moneyadviceservice.org.uk).

Dough components all have a default configuration which can be overridden from a data attribute:

```html
<div data-dough-component="module1" data-dough-module1-config="{ 'property': 'value' }">
</div>
```

## CSS

We use Sass (with sass rails) - Dough provides the base layer (https://github.com/moneyadviceservice/dough/tree/master/assets/stylesheets) which you can override with a [dough_theme](https://github.com/moneyadviceservice/frontend/tree/master/app/assets/stylesheets/components/dough_theme). 

We favour creating a `component_name` directory per component, containing a `_settings.scss` (variables the component will use), `_component_name.scss` (styling the component itself) and an `_all.scss` to pull them together.

At the Money Advice Service, we have some shared Sass mixins and variable across the websites. Although not technically part of Dough, we wrap these up in a simple bower module called [Yeast](https://github.com/moneyadviceservice/yeast). More information is available on the repo itself.

## Tests

All the JS tests for the frontend project (MAS responsive website) are here: https://github.com/moneyadviceservice/frontend/tree/master/spec/javascripts

We use karma http://karma-runner.github.io/0.12/index.html to run tests, and our JS unit tests use [mocha](http://mochajs.org/), [chai](http://chaijs.com/) and [sinon](http://sinonjs.org/).

## How the MadeWithDough website works

This pulls in Dough itself, which contain [docs and example code](https://github.com/moneyadviceservice/dough/tree/master/docs). We simply render the docs (markdown), along with the example code which is then 'executed', meaning the component itself is actually rendered.

Therefore, to update any of the component documentation, please fork and update the docs in Dough itself. This site is simply here to lay them out.

## Other notes

We do have a ‘slider’ (range) dough component which isn’t actually listed in the madewithdough site, but is being used on our pensions_calculator project. You can see this on the Pensions Calculator itself: https://www.moneyadviceservice.org.uk/en/tools/pension-calculator

This is how you use the component: https://github.com/moneyadviceservice/dough/blob/master/docs/helpers/RangeInput.erb
