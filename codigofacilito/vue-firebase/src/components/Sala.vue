<template>

<b-container>
  <div class="pantalla">
    <p class="text-white font-weight-bold">Pantalla</p>
  </div>

  <div class="asientos">
    <b-row>
      <b-col
        class="asiento"
        v-for="asiento in asientos"
        :key="asiento.id"
        :id="asiento.id"
        :class="{'bg-success': asiento.disponible, 'bg-danger': !asiento.disponible, pointer: asientoDisponible(asiento)}"
        @click="seleccionarAsiento">
        {{ asiento.id }}
      </b-col>
    </b-row>
  </div>

  <div class="botones">
    <b-button variant="success" @click="guardar" :disabled="contador == 0">Guardar</b-button>
    <b-button class="ml-2" variant="danger" @click="cancelar" :disabled="contador == 0">Cancelar</b-button>
    <b-button class="ml-2" @click="liberar">Liberar</b-button>
  </div>

  <div class="mt-2">
    <strong>Asientos seleccionados {{contador}}</strong>
  </div>
</b-container>

</template>

<script>
import firebase from 'firebase'

const path = 'salas'
const pathId = '1'

export default {
  created() {
    // this.actualizarElementos()
    this.id = firebase.database().ref('/users').push().key

    firebase.database()
    .ref(path)
    .child(pathId)
    .on('value', snapshot => this.cargarElementos(snapshot.val()))
  },
  data() {
    return {
      id: '',
      contador: 0,
      asientos: []
    }
  },
  methods: {
    seleccionarAsiento(event) {
      let asiento = this.asientos.find(asiento => asiento.id == event.target.id)
      
      if (asiento.adquirido || (asiento.user_id != null && asiento.user_id != this.id)) {
        this.$notify({ group: 'foo', type: 'error', title: 'Error', text: 'No es posible seleccionar el asiento ' + asiento.id })
      } else {
        asiento.disponible = !asiento.disponible
        
        if (asiento.user_id) asiento.user_id = null
        else asiento.user_id = this.id

        this.actualizarElementos()

        this.contador = this.asientosSeleccionados().length
      }
    },
    actualizarElementos() {
      firebase.database()
      .ref(path)
      .child(pathId)
      .set(this.asientos)
    },
    validarRespuesta(error, committed, snapshot) {
      if (error) {
        this.$notify({ group: 'foo', type: 'error', title: 'Error', text: 'No es posible completar la operación' })
      }
      
      if (committed) {
        this.$notify({ group: 'foo', type: 'success', title: 'Éxito', text: 'Asientos adquiridos exitosamente' })
      }

      // eslint-disable-next-line
      console.log(snapshot.val())
    },
    cargarElementos(data) {
      this.asientos = data
    },
    guardar() {
      firebase.database()
      .ref(path)
      .child(pathId)
      .transaction(
        valoresDB => this.validarCompra(valoresDB),
        (error, committed, snapshot) => this.validarRespuesta(error, committed, snapshot)
      )
      this.contador = 0
    },
    validarCompra(valoresDB) {
      this.asientosSeleccionados().forEach(asiento => {
        if (valoresDB.find(a => a.id == asiento.id).adquirido) {
          return
        }
        asiento.adquirido = true
      })

      console.log(this.asientos)

      return this.asientos
    },
    cancelar() {
      this.asientosSeleccionados().forEach(asiento => {
        asiento.user_id = null
        asiento.disponible = true
      })
      this.actualizarElementos()
      this.contador = 0
    },
    validarAsientos() {
      this.asientosSeleccionados().forEach(asiento => {
        asiento.adquirido = true
      });
    },
    asientoDisponible(asiento) {
      return !asiento.adquirido && (asiento.user_id == null || asiento.user_id == this.id)
    },
    asientosSeleccionados() {
      return this.asientos.filter(asiento => !asiento.disponible && !asiento.adquirido)
    },
    liberar() {
      this.asientos.forEach(asiento => {
        asiento.adquirido = false
        asiento.disponible = true
        asiento.user_id = null
        this.contador = 0
      })
      this.actualizarElementos()
    }
  },
}
</script>

<style lang="css" scoped>

.pantalla {
  background-color: #2B6282;
}
.pantalla p {
  font-size: 18px;
}
.asientos {
  margin-top: 60px;
}
.asiento {
  color: white;
  margin: 3px;
  font-weight: bold;
}
.pointer {
  cursor: pointer;
}
.disponible {
  background-color: #2D4D86;
}
.ocupado {
  background-color: #73264F;
}
.botones { 
  margin-top: 60px;
}

</style>