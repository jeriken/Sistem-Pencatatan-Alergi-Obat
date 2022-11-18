import Home from "./../../pages/custom/home.vue";

const prefix = process.env.MIX_ADMIN_PANEL_ROUTE_PREFIX
  ? "/" + process.env.MIX_ADMIN_PANEL_ROUTE_PREFIX + "/pages"
  : "/badaso-dashboard";

export default [
  {
    path: prefix + "/home",
    name: "HomeCustom",
    component: Home,
    meta: {
      title: "Home",
    },
  },
];
