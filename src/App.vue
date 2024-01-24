<template>
  <header class="header">
    <h1><span id="border"> Binary Tree</span></h1>
  </header>
  <main class="mainContainer">
    <Inputs
      @minData="(data) => handleMin(data)"
      @maxData="(data) => handleMax(data)"
      @heightData="(data) => handleHeight(data)"
      @sizeData="(data) => handleSize(data)"
      @inOrderData="(data) => handleInOrderData(data)"
      @preOrderData="(data) => handlePreOrderData(data)"
      @postOrderData="(data) => handlePostOrderData(data)"
      @levelOrderData="(data) => handleLevelOrderData(data)"
      @isBalancedData="(data) => handleIsBalancedData(data)"
      @lengthData="(data) => handleLengthData(data)"
      @treeFeedback="(data) => handleTreeFeedback(data)"
    ></Inputs>
  </main>
  <div class='outputContainerWrapper'>
    <div class="outputContainer" v-if="this.show">
      <transition mode="out-in" name="fade">
        <h2 :key="type">
          {{ type }}
        </h2>
      </transition>

      <transition name="fade" mode="out-in">
        <ul class="outputList" :key="this.data">
          <li v-for="num in this.data" class="outputItem">
            <h2>
              <span>
                {{ num }}
                <span v-if="num != this.data[this.data.length - 1]">
                  ->
                </span></span
              >
            </h2>
          </li>
        </ul>
      </transition>
    </div>
  </div>

  <transition name="fade" mode="out-in">
    <Tree
      :root="this.binaryTree.root"
      v-if="showTree"
      :key="this.showTree"
    ></Tree>
  </transition>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'
import Inputs from "./components/Inputs.vue";
import Tree from "./components/Tree.vue";
import Node from "./components/Node.vue";
export default {
  name: "App",
  components: {
    Inputs,
    Tree,
    Node,
  },
  data() {
    return {
      data: [],
      type: "",
      show: false,
      showTree: false,
      binaryTree: {},
    };
  },
  methods: {
    handleMin(data) {
      this.data = [data];
      this.type = "Minimum Value ";
      this.show = true;
    },
    handleMax(data) {
      this.data = [data];
      this.type = "Maximum Value ";
      this.show = true;
    },
    handleHeight(data) {
      this.data = [data];
      this.type = "Tree Height ";
      this.show = true;
    },
    handleSize(data) {
      this.data = [data];
      this.type = "Tree Size ";
      this.show = true;
    },
    handleInOrderData(data) {
      this.data = [];
      data.forEach((data) => {
        this.data.push(data);
      });
      this.type = "In-Order Tranverse ";
      this.show = true;
    },
    handlePreOrderData(data) {
      this.data = [];
      data.forEach((data) => {
        this.data.push(data);
      });
      this.type = "Pre-Order Tranverse ";
      this.show = true;
    },
    handlePostOrderData(data) {
      this.data = [];
      data.forEach((data) => {
        this.data.push(data);
      });
      this.type = "Post-Order Tranverse ";
      this.show = true;
    },
    handleLevelOrderData(data) {
      this.data = [];
      data.forEach((data) => {
        this.data.push(data);
      });
      this.type = "Level-Order Tranverse ";
      this.show = true;
    },
    handleIsBalancedData(data) {
      this.data = [];

      if (data) {
        this.data.push("The tree is balanced");
      } else {
        this.data.push("The tree is not balanced");
      }

      this.type = "";
      this.show = true;
    },
    handleLengthData(data) {
      this.data = [data];
      this.type = "Tree Internal Length";
      this.show = true;
    },
    handleTreeFeedback(data) {
      this.binaryTree = data;
      this.showTree = true;
    },
    showTreeC() {
      this.showTree = true;
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
