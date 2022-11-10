import { makeStyles } from '@material-ui/core/styles';

const useStyles = makeStyles(() => ({
  root: {
    height: 42,
    minWidth: 200,
    display: 'flex',
    alignItems: 'center',
    boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
    background: 'linear-gradient(45deg, #1E90FF 30%, #87CEEB 90%)',
    margin: 10,
    paddingLeft: 10,
    paddingRight: 10,
    justifyContent: 'center',
  },
}));

export default useStyles;
