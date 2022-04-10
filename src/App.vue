<template>

  <div id="container">
    <div id="header-box">
      <div id="header"> Menu </div>
      <button v-on:click="AddItem" id="btn"> {{this.valueBtn}} </button>
    </div>
    <ShowMenu v-if="showMenu" :json="json_value"></ShowMenu>
    <AddMenuItem v-if="showAddMenuItem"></AddMenuItem>
  </div>

</template>

<script>

import AddMenuItem from './components/AddMenuItem'
import ShowMenu from "@/components/ShowMenu";

export default {
  name: 'App',
  components: {
    AddMenuItem,
    ShowMenu
  },
  data() {
    return {
      showAddMenuItem: false,
      showMenu: true,
      valueBtn: "Add"
    }
  },
  methods: {
    AddItem () {
      this.showAddMenuItem = !this.showAddMenuItem;
      this.showMenu = !this.showMenu;
      if (this.valueBtn === "Add") {
        this.valueBtn = ("Close")
      }
      else {
        this.valueBtn = "Add"
      }
    },
  }

}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap');

* {
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
  color: #393a3b;
}

input, select {
  border: 1px solid #cdcdcd;
  border-radius: 4px;
}

input:focus, select:focus {
  outline: none;
  border-color: #09b9ff;
}


  #container {
    width: 500px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
  }

  #header-box {
   display: flex;
    justify-content: center;
    margin-bottom: 20px;
  }

  #header {
    font-size: 24px;
    font-weight: 700;
    text-align: center;
  }

  #btn {
    display:flex;
    padding: 5px 10px;
    border-radius: 4px;
    border: 1px solid #09b9ff;
    position: absolute;
    right: 0;
    background: #09b9ff;
    color: #fff;
    cursor: pointer;
  }


</style>
