<template>
    <table>
      <tr>
        <th>
          Name
        </th>
        <th>
          Price
        </th>
        <th>
          Country
        </th>
        <th>
          Category
        </th>
      </tr>
      <tr v-for="menuItem in menuItems" :key="menuItem[menuItemId]">
        <td>
          {{menuItem.name}}
        </td>
        <td>
          {{menuItem.price}}
        </td>
        <td>
          {{menuItem.MenuItemCountry}}
        </td>
        <td>
          {{menuItem.MenuItemCategory}}
        </td>
      </tr>
    </table>
</template>

<script>
import {default as axios} from "axios";

const apiUri = 'http://localhost:3000/';

export default {
  name: "ShowMenu",
  data() {
    return {
      menuItems: null,
      mounted_ex: false
    }
  },
  created () {
    axios
        .get(apiUri + 'menuItems')
        .then(response => (this.menuItems = response["data"]));
  },
}
</script>

<style scoped>
  table {
    width: 100%;
    text-align: center;
    border-collapse: collapse;
    border: 1px solid grey;
  }

  td, th {
    width: 25%;
    border: 1px solid grey;
  }

  th {
    font-weight: 700;
  }


</style>