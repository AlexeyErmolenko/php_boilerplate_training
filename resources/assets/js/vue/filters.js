import Vue from 'vue';
import moment from 'moment';

function formatDate(date, format, timezoneOffset = false) {
  if (date) {
    const momentDate = ((moment.isMoment(date)) ? date : moment(date));
    if (timezoneOffset) {
      momentDate.utc(true);
      momentDate.utcOffset(timezoneOffset);
    }
    return momentDate.format(format);
  }
  return 'N/A';
}

Vue.filter(
  'date',
  (date, timezoneOffset = false) => formatDate(date, 'MMM DD, YYYY', timezoneOffset),
);
Vue.filter(
  'datetime',
  (date, timezoneOffset = false) => formatDate(date, 'MM/DD/YYYY hh:mmA', timezoneOffset),
);
Vue.filter(
  'userDate',
  (date, timezoneOffset = false) => formatDate(date, 'MMM DD, YYYY (hh:mma)', timezoneOffset),
);
Vue.filter(
  'formatDate',
  (date, format, timezoneOffset = false) => formatDate(date, format, timezoneOffset),
);

Vue.filter('percent', num => `${Math.round(num * 100)}%`); // eslint-disable-line no-magic-numbers
Vue.filter('capitalize', string => string.charAt(0).toUpperCase() + string.slice(1));
Vue.filter(
  'currency',
  floatNumber => floatNumber.toLocaleString('en-US', { maximumFractionDigits: 2 }),
);
Vue.filter('nl2br', (str, isXhtml) => {
  const breakTag = (isXhtml || typeof isXhtml === 'undefined') ? '<br />' : '<br>';
  return String(str).replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, `$1${breakTag}$2`);
});
