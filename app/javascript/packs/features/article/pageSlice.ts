import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { RootState } from '../../app/store';

type pageState = {
    page: number
};

const initialState: pageState = {
    page: 1,
};

export const fetchAsyncSetPage = createAsyncThunk(
    "page/getPage",
    async (page: number) => {
        const data = page;
        return { Number: data };
    }
);

const pageSlice = createSlice({
    name: "page",
    initialState: initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder.addCase(fetchAsyncSetPage.fulfilled, (state, action) => {
            return {
                ...state,
                page: action.payload.Number
            };
        });
    },
});

export const selectPage = (state: RootState) => state.page.page;
export default pageSlice.reducer;