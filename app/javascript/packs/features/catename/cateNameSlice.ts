import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { RootState } from '../../app/store';

type cateState = {
  cateName: String
};

const initialState: cateState = {
  cateName: "",
};

export const fetchAsyncSetCateName = createAsyncThunk(
  "page/getCateName",
  async (cateName: String) => {
    const data = cateName;
    return { String: data };
  }
);

const cateSlice = createSlice({
  name: "cateName",
  initialState: initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchAsyncSetCateName.fulfilled, (state, action) => {
      return {
        ...state,
        cateName: action.payload.String
      };
    });
  },
});


export const selectCateName = (state: RootState) => state.cateName.cateName;

export default cateSlice.reducer;
