import { createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import HOST from './appconf';

const apiUrl = `${HOST}/articles/ajax`

export const fetchAsyncGetDaily = createAsyncThunk(
  "article/getArticles",
  async () => {
    const { data } = await axios.get(`${apiUrl}`);
    return { data: data };
  }
);
