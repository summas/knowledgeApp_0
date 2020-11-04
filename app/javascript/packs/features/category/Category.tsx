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
import { fetchAsyncSetCateName } from "../catename/cateNameSlice";
import { fetchAsyncGetArticles, exportState } from "../article/articleSlice";
import { fetchAsyncSetPage } from "../article/pageSlice";
import FiberManualRecordIcon from '@material-ui/icons/FiberManualRecord';

const useStyles = makeStyles((theme) => ({
  root: {
    width: 200,
    marginTop: 12,
  },
}));

const Category: React.FC = () => {
  const classes = useStyles();
  const categories = useSelector(selectCategories);
  const dispatch = useDispatch();
  const [selectedIndex, setSelectedIndex] = React.useState(0);

  const chgCategory = (
    event: React.MouseEvent<HTMLDivElement, MouseEvent>,
    index: number,
    categoryId: String,
    categoryName: String) => {
    setSelectedIndex(index);
    dispatch(fetchAsyncSetPage(1))
    const categoryIdForArticles = (categoryId !== "") ? categoryId : "0";
    dispatch(fetchAsyncGetArticles({ categoryId: categoryIdForArticles, groupId: exportState.groupId }))
    dispatch(fetchAsyncSetCateName(categoryName))
  }

  return (
    <MemoryRouter initialEntries={['/drafts']} initialIndex={0} >
      <div className={classes.root} style={{ textAlign: "center" }} >
        <Paper elevation={0}>
          <ListItem
            button
            onClick={(event) => chgCategory(event, 0, "", "")}
          >
            <ListItemText primary="カテゴリ" />
          </ListItem>
          <Divider />
          <List aria-label="secondary mailbox ">
            {categories.map((category) => (
              <ListItem
                button
                selected={selectedIndex === category.id}
                onClick={(event) => chgCategory(event, category.id, String(category.id), category.name)}
                key={category.id}
              >
                <FiberManualRecordIcon fontSize="inherit" />
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
