import React from 'react';
import { makeStyles } from "@material-ui/core/styles";

import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import Paper from '@material-ui/core/Paper';
import ListItemText from '@material-ui/core/ListItemText';
import Divider from '@material-ui/core/Divider';
import { MemoryRouter } from 'react-router';
import { useSelector, useDispatch } from "react-redux";
import { selectCategories } from "./categorySlice";
import { fetchAsyncGetDaily } from "../article/articleSlice";
import { fetchAsyncSetPage } from "../article/pageSlice";

const useStyles = makeStyles((theme) => ({
  root: {
    width: 200,
    marginTop: 12,
  },
}));

const chgCategory = (category_id: String, dispatch: any) => {
  dispatch(fetchAsyncSetPage(1))
  dispatch(fetchAsyncGetDaily(String(category_id)))
}

const Category: React.FC = () => {
  const classes = useStyles();
  const categories = useSelector(selectCategories);
  const dispatch = useDispatch();

  return (
    <MemoryRouter initialEntries={['/drafts']} initialIndex={0} >
      <div className={classes.root} style={{ textAlign: "center" }} >
        <Paper elevation={0}>
          <ListItem
            button
            onClick={(event) => chgCategory("", dispatch)}
          >
            <ListItemText primary="カテゴリ" />
          </ListItem>
          <Divider />
          <List aria-label="secondary mailbox ">
            {categories.map((category) => (
              <ListItem
                button
                onClick={(event) => chgCategory(String(category.id), dispatch)}
              >
                <ListItemText primary={category.name} />
              </ListItem>
            ))}
          </List>
        </Paper>
      </div>
    </MemoryRouter >
  );
};

export default Category
