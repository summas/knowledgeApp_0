import { configureStore, ThunkAction, Action } from '@reduxjs/toolkit'
import articleReducer from "../features/article/articleSlice"
import categoryReducer from "../features/category/categorySlice"
import pageReducer from "../features/article/pageSlice"
import cateNameReducer from "../features/catename/cateNameSlice"
import groupReducer from "../features/group/groupSlice"

export const store = configureStore({
  reducer: {
    article: articleReducer,
    category: categoryReducer,
    page: pageReducer,
    cateName: cateNameReducer,
    group: groupReducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;

export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;
