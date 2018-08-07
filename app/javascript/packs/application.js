import './application.css';
import 'bootstrap';
import { initMap } from 'components/map';
import { initslider } from 'components/slides';
import { initDatepicker } from 'components/flatpickr';
import { showDates } from 'components/flatpickr';

initMap();
initslider();
initDatepicker();
showDates();
