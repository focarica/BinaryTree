<template>
  <div class="inputs">
    <div class="data">
      <input
        type="text"
        name="numberInput"
        id="inputNumber"
        class="input"
        placeholder="Digite um valor"
        @keyup.enter="submitElement()"
      />
      <button class="button" id="submit" @click="submitElement()">
        Enviar
      </button>
      <button class="button" @click="getMin()">Valor Minimo</button>
      <button class="button" @click="getMax()">Valor Maximo</button>
      <button class="button" @click="getHeight()">Altura da Arvore</button>
      <button class="button" @click="getSize()">Tamanho da Arvore</button>
      <button class="button" @click="getLength()">Comprimento Interno</button>
    </div>
    <div class="tranverse">
      <button class="button" @click="inOrderT()">Percurso Em-Ordem</button>
      <button class="button" @click="preOrderT()">Percurso Pre-Ordem</button>
      <button class="button" @click="postOrderT()">Percurso Pos-Ordem</button>
      <button class="button" @click="levelOrderT()">
        Percurso por Nivel (LevelOrder)
      </button>
      <button class="button" @click="isBalanced()">Arvore Balanceada?</button>
      <button class="button" id="resetButton" @click="resetTree()">Reiniciar Árvore</button>
    </div>
  </div>
</template>
<script>
import BinaryTree from "../assets/modules/BST.js";
export default {
  name: "Inputs",
  emits: [
    "minData",
    "maxData",
    "heightData",
    "sizeData",
    "inOrderData",
    "preOrderData",
    "postOrderData",
    "levelOrderData",
    "isBalancedData",
    "lengthData",
    "treeFeedback",
  ],
  data() {
    return {
      binaryTree: null,
      data: [],
    };
  },
  methods: {
    submitElement() {
      if (this.binaryTree == null) {
        this.binaryTree = new BinaryTree();
      }
      var inputElement = document.getElementById("inputNumber").value;

      if (
        inputElement == null ||
        inputElement == undefined ||
        inputElement.length == 0 ||
        !inputElement.match(/^[a-z0-9 çãõéí]+$/i)
      ) {
        window.alert("Insira um valor válido.");
        return;
      }

      if (!isNaN(inputElement)) {
        inputElement = Number(inputElement);
      }

      if (this.binaryTree.size() == 0) {
        this.binaryTree.type = typeof inputElement;
        // window.alert(
        //   "Como o valor " + inputElement + " foi adicionado o tipo da árvore está definido como " + this.binaryTree.type +
        //   ". Para aceitar tipos diferentes, será necessário reiniciar a árvore.");
      }

      if (this.binaryTree.contains(inputElement)) {
        window.alert("Valor já inserido na árvore. Insira um valor diferente.");
        return;
      }

      if (this.binaryTree.type != typeof inputElement) {
        window.alert(
          "Valor inserido não é do tipo da árvore. Insira um valor do tipo " +
            this.binaryTree.type +
            " ou reinicie a árvore."
        );
        return;
      }

      document.getElementById("inputNumber").value = null;
      this.binaryTree.insert(inputElement);
      this.$emit("treeFeedback", this.binaryTree);
    },
    getMin() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      let min = this.binaryTree.min();
      this.data = [];
      this.data.push(min);
      this.$emit("minData", this.data[0].data);
    },
    getMax() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      let max = this.binaryTree.max();
      this.data = [];
      this.data.push(max);
      this.$emit("maxData", this.data[0].data);
    },
    getHeight() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      let height = this.binaryTree.height() - 1;
      this.data = [];
      this.data.push(height);
      this.$emit("heightData", this.data[0]);
    },
    getSize() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      let size = this.binaryTree.size();
      this.data = [];
      this.data.push(size);

      this.$emit("sizeData", Number(this.data));
    },
    inOrderT() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      this.data = [];
      this.binaryTree.inOrderTranverse((data) => {
        this.data.push(data.data);
      });
      this.$emit("inOrderData", this.data);
    },
    preOrderT() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      this.data = [];
      this.binaryTree.preOrderTranverse((data) => {
        this.data.push(data.data);
      });
      this.$emit("preOrderData", this.data);
    },
    postOrderT() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      this.data = [];
      this.binaryTree.postOrderTranverse((data) => {
        this.data.push(data.data);
      });
      this.$emit("postOrderData", this.data);
    },
    levelOrderT() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      this.data = [];
      this.binaryTree.levelOrderTranverse((data) => {
        this.data.push(data.data);
      });
      this.$emit("levelOrderData", this.data);
    },
    isBalanced() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      let isBalanced = this.binaryTree.isBalanced();
      this.$emit("isBalancedData", isBalanced > 0);
    },
    getLength() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      this.data = [];
      this.data.push(this.binaryTree.internalLength());
      this.$emit("lengthData", this.data[0]);
    },
    resetTree() {
      try {
        if (this.binaryTree.root == null) {
          window.alert("Árvore vazia");
          return;
        }
      } catch {
        window.alert("Árvore vazia");
        return;
      }
      document.getElementById("inputNumber").value = null;
      this.binaryTree = new BinaryTree();
      this.$emit("treeFeedback", this.binaryTree);
    },
  },
};
</script>
