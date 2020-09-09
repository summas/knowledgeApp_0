import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { RootState } from '../../app/store';
import category from "./category.json";
import HOST from '../../appconf';
const apiUrl = "reacts/category";

type CATEGORY = typeof category;

type categoryState = {
  category: CATEGORY;
};

const initialState: categoryState = {
  category: category,
};

export const fetchAsyncGetCategory = createAsyncThunk(
  "category/getCategory",
  async () => {
    const { data } = await axios.get<CATEGORY>(`${HOST}/${apiUrl}`);
    return { data: data };
  }
);

const categorySlice = createSlice({
  name: "cates",
  initialState: initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchAsyncGetCategory.fulfilled, (state, action) => {
      return {
        ...state,
        category: action.payload.data
      };
    });
  },
});

export const selectCategories = (states: RootState) => states.category.category;

export default categorySlice.reducer;
