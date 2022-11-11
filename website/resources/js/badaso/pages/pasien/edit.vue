<template>
  <div>
    <template v-if="!isMaintenance">
      <badaso-breadcrumb-row full> </badaso-breadcrumb-row>
      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('edit', dataType)">
        <vs-col vs-lg="6">
          <vs-card>
            <div slot="header">
              <h3>
                {{
                  $t("crudGenerated.edit.title", {
                    tableName: dataType.displayNameSingular,
                  })
                }}
              </h3>
            </div>
            <vs-row>
              <vs-col vs-lg="12" vs-xs="12" v-if="!isValid">
                <p class="is-error">No fields have been filled</p>
              </vs-col>
              <badaso-text
                v-model="dataType.dataRows[5].value"
                size="12"
                :label="dataType.dataRows[5].displayName"
                placeholder="Supriyati"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[5].field)
                  ]
                "
              ></badaso-text>
              <badaso-select
                :label="dataType.dataRows[4].displayName"
                placeholder="Pilih rumah sakit"
                v-model="dataType.dataRows[4].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[4].field)
                  ]
                "
                :items="
                  relationData.rs
                    ? relationData.rs
                    : []
                "
              ></badaso-select>
              <badaso-text
                v-model="dataType.dataRows[6].value"
                size="12"
                :label="dataType.dataRows[6].displayName"
                placeholder="Banjarnegara"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[6].field)
                  ]
                "
              ></badaso-text>
              <badaso-date
                :label="dataType.dataRows[7].displayName"
                :placeholder="dataType.dataRows[7].displayName"
                v-model="dataType.dataRows[7].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[7].field)
                  ]
                "
              ></badaso-date>
              <badaso-date
                :label="dataType.dataRows[15].displayName"
                v-model="dataType.dataRows[15].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[15].field)
                  ]
                "
              ></badaso-date>
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="6" vs-xs="12" class="pr-0">
          <vs-card>
            <div slot="header">
              <h3></h3>
            </div>
            <vs-row>
              <badaso-number
                :label="dataType.dataRows[10].displayName"
                placeholder="33041707XXXXXXXXXX"
                v-model="dataType.dataRows[10].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[10].field)
                  ]
                "
              ></badaso-number>
              <badaso-select
                :label="dataType.dataRows[13].displayName"
                placeholder="Pilih jenis kelamin"
                v-model="dataType.dataRows[13].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[13].field)
                  ]
                "
                :items="
                  dataType.dataRows[13].details.items
                    ? dataType.dataRows[13].details.items
                    : []
                "
              ></badaso-select>
              <badaso-select
                :label="dataType.dataRows[9].displayName"
                placeholder="Pilih golongan darah"
                v-model="dataType.dataRows[9].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[9].field)
                  ]
                "
                :items="
                  dataType.dataRows[9].details.items
                    ? dataType.dataRows[9].details.items
                    : []
                "
              ></badaso-select>
              <badaso-textarea
                :label="dataType.dataRows[8].displayName"
                placeholder="Wanayasa RT 02/01
                Wanayasa
                Banjarnegara"
                v-model="dataType.dataRows[8].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[8].field)
                  ]
                "
              ></badaso-textarea>
              <badaso-textarea
                :label="dataType.dataRows[14].displayName"
                placeholder="Catatan Tambahan"
                v-model="dataType.dataRows[14].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[14].field)
                  ]
                "
              ></badaso-textarea>
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="4" vs-xs="12" class="pr-0">
          <vs-card>
            <div slot="header">
              <h3>KTP</h3>
            </div>
            <vs-row v-if="dataType.dataRows[1].value">
              <vs-col vs-lg="3"> {{ dataType.dataRows[1].value }} </vs-col
              ><vs-col vs-lg="4">
                <vs-button
                  color="warning"
                  type="border"
                  :to="{
                    path:
                      '/dashboard/general/ktp/' +
                      dataType.dataRows[1].value +
                      '/edit',
                  }"
                  >Ubah</vs-button
                >
              </vs-col>
            </vs-row>
            <vs-row v-else>
              <vs-button
                size="default"
                type="border"
                icon="add"
                :to="{
                  path: '/dashboard/general/ktp/add',
                  query: { ids: dataType.dataRows[0].value },
                }"
                >Tambah</vs-button
              >
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="4" vs-xs="12" class="pr-0">
          <vs-card>
            <div slot="header">
              <h3>BPJS</h3>
            </div>
            <vs-row v-if="dataType.dataRows[2].value">
              <vs-col vs-lg="3"> {{ dataType.dataRows[2].value }} </vs-col
              ><vs-col vs-lg="4">
                <vs-button
                  color="warning"
                  type="border"
                  :to="{
                    path:
                      '/dashboard/general/bpjs/' +
                      dataType.dataRows[2].value +
                      '/edit',
                  }"
                  >Ubah</vs-button
                >
              </vs-col>
            </vs-row>
            <vs-row v-else>
              <vs-button
                size="default"
                type="border"
                icon="add"
                :to="{
                  path: '/dashboard/general/bpjs/add',
                  query: { ids: dataType.dataRows[0].value },
                }"
                >Tambah</vs-button
              >
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="4" vs-xs="12" class="pr-0">
          <vs-card>
            <div slot="header">
              <h3>Alergi</h3>
            </div>
            <vs-row v-if="dataType.dataRows[3].value">
              <vs-col vs-lg="3"> {{ dataType.dataRows[3].value }} </vs-col
              ><vs-col vs-lg="4">
                <vs-button
                  type="border"
                  color="warning"
                  :to="{
                    path:
                      '/dashboard/general/alergi/' +
                      dataType.dataRows[3].value +
                      '/edit',
                  }"
                  >Ubah</vs-button
                >
              </vs-col>
            </vs-row>
            <vs-row v-else>
              <vs-button
                size="default"
                type="border"
                icon="add"
                :to="{
                  path: '/dashboard/general/alergi/add',
                  query: { ids: dataType.dataRows[3].value },
                }"
                >Tambah</vs-button
              >
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="12">
          <vs-card class="action-card">
            <vs-row>
              <vs-col vs-lg="12">
                <vs-button color="primary" type="relief" @click="submitForm">
                  <vs-icon icon="save"></vs-icon>
                  {{ $t("crudGenerated.edit.button") }}
                </vs-button>
                <vs-button
                  :to="{
                    name: 'DataPendingEditRead',
                    params: {
                      urlBase64: base64PathName,
                    },
                  }"
                  v-if="dataLength > 0 && !isOnline"
                  color="success"
                  type="relief"
                >
                  <vs-icon icon="history"></vs-icon>
                  <strong>{{ $t("offlineFeature.dataUpdatePending") }}</strong>
                </vs-button>
              </vs-col>
            </vs-row>
          </vs-card>
        </vs-col>
      </vs-row>
      <vs-row v-else>
        <vs-col vs-lg="12">
          <vs-card>
            <vs-row>
              <vs-col vs-lg="12">
                <h3>
                  {{
                    $t("crudGenerated.warning.notAllowedToEdit", {
                      tableName: dataType.displayNameSingular,
                    })
                  }}
                </h3>
              </vs-col>
            </vs-row>
          </vs-card>
        </vs-col>
      </vs-row>
    </template>
    <template v-if="isMaintenance">
      <badaso-breadcrumb-row full> </badaso-breadcrumb-row>

      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('edit', dataType)">
        <vs-col vs-lg="12">
          <div class="badaso-maintenance__container">
            <img :src="`${maintenanceImg}`" alt="Maintenance Icon" />
            <h1 class="badaso-maintenance__text">
              We are under <br />maintenance
            </h1>
          </div>
        </vs-col>
      </vs-row>
    </template>
  </div>
</template>

<script>
// eslint-disable-next-line no-unused-vars
import * as _ from "lodash";

export default {
  name: "CrudGeneratedEdit",
  components: {},
  data: () => ({
    isValid: true,
    errors: {},
    dataType: {},
    relationData: {},
    dataLength: 0,
    pathname: location.pathname,
    isMaintenance: false,
  }),
  mounted() {
    this.getDetailEntity();
    this.getRelationDataBySlug();
    this.requestObjectStoreData();
  },
  methods: {
    submitForm() {
      // init data row
      const dataRows = {};
      for (const row of this.dataType.dataRows) {
        if (row && row.value) {
          dataRows[row.field] = row.value;
        }
      }

      // validate values in data rows must not equals 0
      if (Object.values(dataRows).length == 0) {
        this.isValid = false;
        return;
      }

      this.$openLoader();
      this.$api.badasoEntity
        .edit({
          slug: this.$route.params.slug,
          data: dataRows,
        })
        .then((response) => {
          this.$closeLoader();
          this.$router.push({
            name: "CrudGeneratedBrowse",
            params: {
              slug: this.$route.params.slug,
            },
          });
        })
        .catch((error) => {
          this.requestObjectStoreData();
          this.$closeLoader();
          this.$vs.notify({
            title: this.$t("alert.danger"),
            text: error.message,
            color: "danger",
          });
        });
    },
    async getDetailEntity() {
      this.$openLoader();

      try {
        const response = await this.$api.badasoEntity.read({
          slug: this.$route.params.slug,
          id: this.$route.params.id,
        });

        const {
          data: { dataType },
        } = await this.$api.badasoTable.getDataType({
          slug: this.$route.params.slug,
        });

        this.$closeLoader();

        this.dataType = dataType;
        this.record = response.data;
        const dataRows = this.dataType.dataRows.map((data) => {
          try {
            data.add = data.add == 1;
            data.edit = data.edit == 1;
            data.read = data.read == 1;
            data.details = JSON.parse(data.details);

            if (
              data.type == "upload_image_multiple" ||
              data.type == "upload_file_multiple" ||
              data.type == "checkbox" ||
              data.type == "select_multiple"
            ) {
              const val =
                this.record[this.$caseConvert.stringSnakeToCamel(data.field)];
              if (val) {
                data.value = val.split(",");
              }
            } else if (data.type == "switch") {
              data.value = this.record[
                this.$caseConvert.stringSnakeToCamel(data.field)
              ]
                ? this.record[this.$caseConvert.stringSnakeToCamel(data.field)]
                : false;
            } else if (data.type == "slider") {
              data.value = parseInt(
                this.record[this.$caseConvert.stringSnakeToCamel(data.field)]
              );
            } else if (data.type == "datetime") {
              data.value = this.record[
                this.$caseConvert.stringSnakeToCamel(data.field)
              ]
                ? this.record[
                    this.$caseConvert.stringSnakeToCamel(data.field)
                  ].replace(" ", "T")
                : null;
            } else if (data.value == undefined && data.type == "hidden") {
              data.value = data.details.value ? data.details.value : "";
            } else if (
              data.type == "text" ||
              data.type == "hidden" ||
              data.type == "url" ||
              data.type == "search" ||
              data.type == "password"
            ) {
              data.value = this.record[
                this.$caseConvert.stringSnakeToCamel(data.field)
              ]
                ? this.record[this.$caseConvert.stringSnakeToCamel(data.field)]
                : "";
            } else {
              data.value =
                this.record[this.$caseConvert.stringSnakeToCamel(data.field)];
            }
          } catch (error) {}
          return data;
        });
        this.dataType.dataRows = JSON.parse(JSON.stringify(dataRows));
      } catch (error) {
        if (error.status == 503) {
          this.isMaintenance = true;
        }
        this.$closeLoader();
        this.$vs.notify({
          title: this.$t("alert.danger"),
          text: error.message,
          color: "danger",
        });
      }
    },
    getRelationDataBySlug() {
      this.$openLoader();
      this.$api.badasoTable
        .relationDataBySlug({
          slug: this.$route.params.slug,
        })
        .then((response) => {
          this.$closeLoader();
          this.relationData = response.data;
        })
        .catch((error) => {
          if (error.status == 503) {
            this.isMaintenance = true;
          }
          this.$closeLoader();
          this.$vs.notify({
            title: this.$t("alert.danger"),
            text: error.message,
            color: "danger",
          });
        });
    },
    requestObjectStoreData() {
      this.$readObjectStore(this.pathname).then((store) => {
        if (store.result) {
          this.dataLength = store.result.data.length;
        }
      });
    },
  },
  computed: {
    isOnline: {
      get() {
        const isOnline = this.$store.getters["badaso/getGlobalState"].isOnline;
        return isOnline;
      },
    },
    base64PathName() {
      return window.btoa(location.pathname);
    },
    maintenanceImg() {
      const config = this.$store.getters["badaso/getConfig"];
      return config.maintenanceImage;
    },
  },
};
</script>
