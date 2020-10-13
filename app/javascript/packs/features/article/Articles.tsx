import React from 'react';
import HOST from '../../appconf';
import { Card, CardContent, Typography, Grid, CardActionArea, Link } from "@material-ui/core";
import { makeStyles, Theme, createStyles } from '@material-ui/core/styles';
import AccessTimeIcon from '@material-ui/icons/AccessTime';

import { useSelector, useDispatch } from "react-redux";
import { selectArticles } from "./articleSlice";
import { selectPage, fetchAsyncSetPage } from "./pageSlice";
import Pagination from '@material-ui/lab/Pagination';

const styles = require('./index.module')

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flexShrink: 0,
      marginLeft: theme.spacing(2.5),
    },
    paginate: {
      '& > *': {
        marginTop: theme.spacing(2),
      },
    },
  }),
);

let getArticle = (val: any) => {

  if (val == null) {
    return (
      < Grid item xs={8} md={4} component={Typography} className={styles.none}  >
      </Grid>
    );
  }

  let str = "articles/show/" + val.id;
  let date = new Date(val.created_at)
  return (
    < Grid item xs={8} md={4} component={Card} className={styles.article} key={val.id} >
      <CardActionArea >
        <CardContent >
          <Link href={`${HOST}/${str}`} >
            <Grid container spacing={2} direction="row" justify="flex-end">
              <Grid item>
                <img src={`${val.image.url}`} width="150" height="120" />
              </Grid>
              <Grid item xs container direction="column" spacing={0}>
                <Grid item>
                  <Typography variant="subtitle1" color="textSecondary" >
                    {val.title}
                  </Typography>
                </Grid>
              </Grid>
            </Grid>
            <div className={styles.postday}>
              <Typography variant="overline" color="textSecondary" >
                <AccessTimeIcon fontSize="inherit" /> {date.toLocaleDateString()}
              </Typography>
            </div>
          </Link>
        </CardContent>
      </CardActionArea >
    </Grid >
  );
}

const Articles: React.FC = () => {
  const articles = useSelector(selectArticles);
  const page: number = useSelector(selectPage);
  const classes = useStyles();
  const [rowsPerPage] = React.useState(5);
  const dispatch = useDispatch();

  const handleChangePage = (event: React.ChangeEvent<unknown>, newPage: number) => {
    dispatch(fetchAsyncSetPage(newPage))
  };

  let arr = [];
  let num: number = 0;
  for (let n in articles) {
    let val = articles[n];
    let val2 = articles[parseInt(n) + 1];
    if (parseInt(n) % 2 === 0) {
      arr[num] = [val, val2];
      num = num + 1;
    }
  }

  return (
    <div className={styles.container}>
      {(rowsPerPage > 0
        ? arr.slice(page * rowsPerPage - rowsPerPage, page * rowsPerPage)
        : arr
      ).map((article) => (
        <Grid container spacing={2} justify="center" key={article[0].id}>
          {getArticle(article[0])}
          {getArticle(article[1])}
        </Grid>
      ))}

      <div className={classes.paginate}>
        <Pagination
          count={Math.ceil(arr.length / rowsPerPage)}
          page={page}
          defaultPage={1}
          onChange={handleChangePage}
        />
      </div>
    </div >
  );
};

export default Articles
