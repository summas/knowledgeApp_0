import React from 'react';
import styles from "./index.module.css";
import HOST from '../../appconf';
import { Card, CardContent, Typography, Grid, CardActionArea, Link } from "@material-ui/core";

import { makeStyles, useTheme, Theme, createStyles } from '@material-ui/core/styles';

import Table from '@material-ui/core/Table';
import TableContainer from '@material-ui/core/TableContainer';
import TableFooter from '@material-ui/core/TableFooter';
import TablePagination from '@material-ui/core/TablePagination';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import IconButton from '@material-ui/core/IconButton';
import FirstPageIcon from '@material-ui/icons/FirstPage';
import KeyboardArrowLeft from '@material-ui/icons/KeyboardArrowLeft';
import KeyboardArrowRight from '@material-ui/icons/KeyboardArrowRight';
import LastPageIcon from '@material-ui/icons/LastPage';

import { useSelector } from "react-redux";
import { selectArticles } from "./articleSlice";


const useStyles1 = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flexShrink: 0,
      marginLeft: theme.spacing(2.5),
    },
  }),
);

const useStyles2 = makeStyles({
  table: {
    minWidth: 500,
  },
});

interface TablePaginationActionsProps {
  count: number;
  page: number;
  rowsPerPage: number;
  onChangePage: (event: React.MouseEvent<HTMLButtonElement>, newPage: number) => void;
}

function TablePaginationActions(props: TablePaginationActionsProps) {
  const classes = useStyles1();
  const theme = useTheme();
  const { count, page, rowsPerPage, onChangePage } = props;

  const handleFirstPageButtonClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    onChangePage(event, 0);
  };

  const handleBackButtonClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    onChangePage(event, page - 1);
  };

  const handleNextButtonClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    onChangePage(event, page + 1);
  };

  const handleLastPageButtonClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    onChangePage(event, Math.max(0, Math.ceil(count / rowsPerPage) - 1));
  };

  return (
    <div className={classes.root}>
      <IconButton
        onClick={handleFirstPageButtonClick}
        disabled={page === 0}
        aria-label="first page"
      >
        {theme.direction === 'rtl' ? <LastPageIcon /> : <FirstPageIcon />}
      </IconButton>
      <IconButton onClick={handleBackButtonClick} disabled={page === 0} aria-label="previous page">
        {theme.direction === 'rtl' ? <KeyboardArrowRight /> : <KeyboardArrowLeft />}
      </IconButton>
      <IconButton
        onClick={handleNextButtonClick}
        disabled={page >= Math.ceil(count / rowsPerPage) - 1}
        aria-label="next page"
      >
        {theme.direction === 'rtl' ? <KeyboardArrowLeft /> : <KeyboardArrowRight />}
      </IconButton>
      <IconButton
        onClick={handleLastPageButtonClick}
        disabled={page >= Math.ceil(count / rowsPerPage) - 1}
        aria-label="last page"
      >
        {theme.direction === 'rtl' ? <FirstPageIcon /> : <LastPageIcon />}
      </IconButton>
    </div>
  );
}

let getArticle = (val: any) => {

  if (val == null) {
    return (
      < Grid item xs={8} md={4} component={Typography} className={styles.none}  >
      </Grid>
    );
  }

  var str = "articles/show/" + val.id;
  var date = new Date(val.created_at)
  return (

    < Grid item xs={8} md={4} component={Card} className={styles.infected} key={val.id} >
      <CardActionArea >
        <CardContent >
          <Link href={`${HOST}/${str}`} >
            <Grid container spacing={2} direction="row" justify="flex-end">
              <Grid item>
                <img src={`${HOST}/${val.image.url}`} width="150" height="120" />
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
                投稿日: {date.toLocaleDateString()}
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

  const classes = useStyles2();
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);

  const handleChangePage = (event: React.MouseEvent<HTMLButtonElement> | null, newPage: number) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>,
  ) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  let arr = [];
  let arr0 = [];
  let num: number = 0;
  for (let n in articles) {
    let val = articles[n];
    let val2 = articles[parseInt(n) + 1];
    if (parseInt(n) % 2 === 0) {

      arr.push(
        <TableRow key={val.id} style={{ width: '100%' }}>
          {getArticle(val)}
          {getArticle(val2)}
        </TableRow>
      );
      arr0[num] = [val, val2];
      num = num + 1;
    }
  }
  // const emptyRows = rowsPerPage - Math.min(rowsPerPage, arr0.length - page * rowsPerPage);
  return (
    <div className={styles.container}>
      {(rowsPerPage > 0
        ? arr0.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
        : arr0
      ).map((article) => (
        <Grid container spacing={1} justify="center">
          {getArticle(article[0])}
          {getArticle(article[1])}
        </Grid>
      ))}

      <TableContainer component={Paper}>
        <Table className={classes.table} aria-label="custom pagination table">
          <TableFooter>
            <TableRow>
              <TablePagination
                rowsPerPageOptions={[5, 10, 25, { label: 'All', value: -1 }]}
                colSpan={3}
                count={arr0.length}
                rowsPerPage={rowsPerPage}
                page={page}
                SelectProps={{
                  inputProps: { 'aria-label': 'rows per page' },
                  native: true,
                }}
                onChangePage={handleChangePage}
                onChangeRowsPerPage={handleChangeRowsPerPage}
                ActionsComponent={TablePaginationActions}
              />
            </TableRow>
          </TableFooter>
        </Table>
      </TableContainer>
    </div >
  );
};

export default Articles
