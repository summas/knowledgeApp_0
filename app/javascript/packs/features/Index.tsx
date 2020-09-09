import React, { useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";
import {
    Container,
    Grid,
} from "@material-ui/core";

import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import { Link as RouterLink, LinkProps as RouterLinkProps } from 'react-router-dom';
import { Omit } from '@material-ui/types';

import { useDispatch } from "react-redux";

import { fetchAsyncGetDaily } from "./article/articleSlice";
import { fetchAsyncGetCategory } from "./category/categorySlice";
import Articles from "./article/Articles";
import Category from "./category/Category";

const useStyles = makeStyles((theme) => ({
    title: {
        flexGrow: 1,
    },
    content: {
        marginTop: 0,
    },
}));

interface ListItemLinkProps {
    icon?: React.ReactElement;
    primary: string;
    to: string;
}

function ListItemLink(props: ListItemLinkProps) {
    const { icon, primary, to } = props;

    const renderLink = React.useMemo(
        () =>
            React.forwardRef<any, Omit<RouterLinkProps, 'to'>>((itemProps, ref) => (
                <RouterLink to={to} ref={ref} {...itemProps} />
            )),
        [to],
    );

    return (
        <li>
            <ListItem button component={renderLink}>
                {icon ? <ListItemIcon>{icon}</ListItemIcon> : null}
                <ListItemText primary={primary} />
            </ListItem>
        </li>
    );
}

const Index: React.FC = () => {
    const classes = useStyles();
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchAsyncGetDaily(""));
    }, [dispatch]);

    useEffect(() => {
        dispatch(fetchAsyncGetCategory());
    }, [dispatch]);

    return (
        <div>
            <Container className={classes.content}>
                <Grid container spacing={0}>
                    <Grid item xs={12} md={9}>
                        <Articles />
                    </Grid>
                    <Grid item xs={12} md={3}>
                        <Category />
                    </Grid>
                </Grid>
            </Container>
        </div>
    )
}

export default Index
