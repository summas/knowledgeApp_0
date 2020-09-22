import React from 'react';
import { makeStyles } from "@material-ui/core/styles";
import { Typography } from "@material-ui/core";
import { useSelector } from "react-redux";
import { selectCateName } from "./cateNameSlice";
import FolderOpenIcon from '@material-ui/icons/FolderOpen';

const useStyles = makeStyles((theme) => ({
  root: {
    width: 200,
    marginLeft: 120,
  },
  catename: {
    marginLeft: 8,
  },

}));

const Catename: React.FC = () => {
  const classes = useStyles();
  const catename = useSelector(selectCateName);
  let folderIcon;

  if (catename != "") {
    folderIcon = <FolderOpenIcon fontSize="small" />
  } else {
    folderIcon = "";
  }

  return (
    <Typography className={classes.root} style={{ textAlign: "left" }}>
      {folderIcon}
      <span className={classes.catename}>
        {catename}
      </span>
    </Typography>
  );
};

export default Catename
