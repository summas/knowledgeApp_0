import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { RootState } from '../../app/store';
import article from "./article.json";
import HOST from '../../appconf';
const apiUrl = "reacts/ajax";

type ARTICLE = typeof article;

type articleState = {
    article: ARTICLE;
};

const initialState: articleState = {
    article: article
};

export const fetchAsyncGetDaily = createAsyncThunk(
    "article/getArticle",
    async () => {
        const { data } = await axios.get<ARTICLE>(`${HOST}/${apiUrl}`);
        return { data: data };
    }
);

const articleSlice = createSlice({
    name: "article",
    initialState: initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder.addCase(fetchAsyncGetDaily.fulfilled, (state, action) => {
            return {
                ...state,
                article: action.payload.data
            };
        });
    },
});

export const selectArticles = (state: RootState) => state.article.article;

export default articleSlice.reducer;