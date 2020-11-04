import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { RootState } from '../../app/store';
import group from "./group.json";
import HOST from '../../appconf';
const apiUrl1 = "reacts/group";

type GROUP = typeof group;

type groupState = {
  group: GROUP;
};

const initialState: groupState = {
  group: group,
};

export const fetchAsyncGetGroup = createAsyncThunk(
  "group/getGroup",
  async () => {
    const { data } = await axios.get<GROUP>(`${HOST}/${apiUrl1}`);
    return { data: data };
  }
);

const groupSlice = createSlice({
  name: "group",
  initialState: initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchAsyncGetGroup.fulfilled, (state, action) => {
      return {
        ...state,
        group: action.payload.data
      };
    });
  },
});

export const selectGroups = (states: RootState) => states.group.group;

export default groupSlice.reducer;
