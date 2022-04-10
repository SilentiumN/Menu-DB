<template>
  <form name="addMenuItem" id="addMenuItem">
    <div>
      <label for="name">Name: </label>
      <input
          type="text"
          id="name"
          name="name"
          required
      />
    </div>
    <div>
      <label for="price">Price: </label>
      <input
          type="number"
          id="price"
          name="price"
          required
      />
    </div>
    <div>
      <label for="MenuItemCountry_input">Country: </label>
      <input
          type="hidden"
          id="MenuItemCountry_input"
          name="MenuItemCountry"
      />
      <select id="MenuItemCountry">
        <option v-for="country in countries" :key="country[countryId]"> {{country.name}} </option>
      </select>
    </div>
    <div>
      <label for="MenuItemCategory_input">Category: </label>
      <input
          type="hidden"
          id="MenuItemCategory_input"
          name="MenuItemCategory"
      />
      <select id="MenuItemCategory">
        <option v-for="category in categories" :key="category[categoryId]"> {{category.name}} </option>
      </select>
    </div>

    <input type="submit" v-on:click="onSubmit" id="btn" value="Send">
    <div id="result">{{this.result}}</div>
  </form>

</template>

<script>

const axios = require('axios').default;
const apiUri = 'http://localhost:3000/';
var $ = require( "jquery" );

export default {
  created () {
      axios
          .get(apiUri + 'country')
          .then(response => (this.countries = response["data"]));
      axios
          .get(apiUri + 'categories')
          .then(response => (this.categories = response["data"]));
  },
  name: 'AddMenuItem',
  data(){
    return{
      countries: null,
      categories: null,
      formData: {
        name: '',
        price: '',
        MenuItemCountry: '',
        MenuItemCategory: ''
      },
      result:'',
    }
  },
  methods: {
    onSubmit (evt) {
      this.formData['name'] = $("#name").val(),
      this.formData['price'] = $("#price").val(),
      this.formData['MenuItemCountry'] = $("#MenuItemCountry").val(),
      this.formData['MenuItemCategory'] = $("#MenuItemCategory").val()
      evt.preventDefault()
      axios
          .post(apiUri + 'menuItems', this.formData)
          .then(response => (this.result = response["data"]));
      $("#name").val('');
      $("#price").val('');
    }

  }
}
</script>

<style scoped>


  #addMenuItem {
    width: 100%;
    dislay: flex;
    flex-direction: column;
  }

  #addMenuItem div {
    display: flex;
    flex-direction: row;
    margin-bottom: 10px;
  }

  #addMenuItem div label {
    display:block;
    width: 150px;
    font-weight: 700;
  }

  #addMenuItem div input, #addMenuItem div select {
    width: 350px;
    font-weight: 400;
  }
</style>