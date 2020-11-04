import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { RootState } from '../../app/store';
import article from "./article.json";
import HOST from '../../appconf';
const apiUrl = "reacts/ajax";

type ARTICLE = typeof article;

type articleState = {
    article: ARTICLE;
    categoryId: String;
    groupId: String;
};

const initialState: articleState = {
    article: article,
    categoryId: "",
    groupId: "",
};

export let exportState: articleState = {
    article: article,
    categoryId: "",
    groupId: "",
};

export const fetchAsyncGetArticles = createAsyncThunk(
    "article/getArticle",
    async ({categoryId, groupId} : {categoryId: String, groupId: String}) => {
        exportState.categoryId = categoryId;
        exportState.groupId = groupId;
        //パスにカテゴリIDを設定
        let addpath = (categoryId !== "") ? ("/" + categoryId): "";
        //パスにグループIDを設定
        addpath = ((addpath !== "") && (groupId !== "")) ? (addpath + "/" + groupId): addpath;
        const { data } = await axios.get<ARTICLE>(`${HOST}/${apiUrl}${addpath}`);
        return { data: data, categoryId: categoryId , groupId: groupId };
    }
);

const articleSlice = createSlice({
    name: "article",
    initialState: initialState,
    reducers: {},
    extraReducers: (builder) => {
        builder.addCase(fetchAsyncGetArticles.fulfilled, (state, action) => {
            return {
                ...state,
                article: action.payload.data
            };
        });
    },
});

export const selectArticles = (state: RootState) => state.article.article;

export default articleSlice.reducer;