import React, { useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";
import {
  Container,
  Grid,
} from "@material-ui/core";

import { useDispatch } from "react-redux";

import { fetchAsyncGetDaily } from "./articleSlice";
import Articles from "./Articles";

const useStyles = makeStyles((theme) => ({
  title: {
    flexGrow: 1,
  },
  content: {
    marginTop: 0,
  },
}));

const Index: React.FC = () => {
  const classes = useStyles();
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchAsyncGetDaily());
  }, [dispatch]);

  return (
    <div>
      <Container className={classes.content}>
        <Grid container spacing={3}>
          <Grid item xs={12} md={12}>
            <Articles />
          </Grid>
        </Grid>
      </Container>
    </div>
  )
}

export default Index
