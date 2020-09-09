import { configureStore, ThunkAction, Action } from '@reduxjs/toolkit';
import articleReducer from "../features/article/articleSlice"
import categoryReducer from "../features/category/categorySlice"
import pageReducer from "../features/article/pageSlice"

export const store = configureStore({
  reducer: {
    article: articleReducer,
    category: categoryReducer,
    page: pageReducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>;
