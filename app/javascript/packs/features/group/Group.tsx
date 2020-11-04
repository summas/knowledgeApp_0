import React from 'react';
import { useSelector, useDispatch } from "react-redux";
import { selectGroups } from "./groupSlice";
import { fetchAsyncGetArticles, exportState } from "../article/articleSlice";
import { fetchAsyncSetPage } from "../article/pageSlice";
import { makeStyles } from '@material-ui/core/styles';
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';

const useStyles = makeStyles((theme) => ({
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
  },
  selectEmpty: {
    marginTop: theme.spacing(2),
  },
}));

const Group: React.FC = () => {
  const classes = useStyles();
  const groups = useSelector(selectGroups);
  const dispatch = useDispatch();
  const [selectedGroup, setGroup] = React.useState('');

  const handleChange = (event: React.ChangeEvent<{ value: unknown }>) => {
    setGroup(event.target.value as string);
    dispatch(fetchAsyncSetPage(1))
    const categoryId = (exportState.categoryId !== "") ? exportState.categoryId : "0";
    dispatch(fetchAsyncGetArticles({ categoryId: categoryId, groupId: event.target.value as string }))
  };

  return (
    <FormControl className={classes.formControl}>
      <InputLabel id="simple-select-label">グループ</InputLabel>
      <Select
        labelId="simple-select-label"
        id="simple-select"
        value={selectedGroup}
        onChange={handleChange}
      >
        <MenuItem
          value={""}
          key={0}
        >
          {"--未設定--"}
        </MenuItem>
        {groups.map((group) => (
          <MenuItem
            value={group.id}
            key={group.id}
          >
            {group.name}
          </MenuItem>
        ))}
      </Select>
    </FormControl>
  );
};

export default Group
