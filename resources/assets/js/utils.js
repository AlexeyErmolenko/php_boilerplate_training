/**
 * Formats data size.
 * @param {int} bytes - Size in bytes
 * @return {string} Formatted size
 */
export function bytesToSize(bytes) {
  if (bytes === 0) {
    return '0 B';
  }
  const sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
  const i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)), 10);
  // eslint-disable-next-line no-magic-numbers
  return `${Math.round((bytes * 100) / (1024 ** i)) / 100} ${sizes[i]}`;
}

/**
 * Base name for given file path.
 * @param {string} str - path
 * @return {string} Base name
 */
export function baseName(str) {
  let base = str.substring(str.lastIndexOf('/') + 1);
  if (base.lastIndexOf('.') !== -1) {
    base = base.substring(0, base.lastIndexOf('.'));
  }
  return base;
}

/**
 * File extension for given file path.
 * @param {string} str - path
 * @return {string} Base name
 */
export function fileExtension(str) {
  const idx = str.lastIndexOf('.');
  if (idx !== -1) {
    return str.substring(idx + 1);
  }
  return '';
}

// common callbacks for JSDocs
/**
 * @callback observable
 * @param {*=}
 * @returns {void|*}
 */
/**
 * @callback observableArray
 * @param {Array=}
 * @returns {void|Array}
 */
/**
 * @callback observable_string
 * @param {string=}
 * @returns {void|string}
 */
/**
 * @callback observable_int
 * @param {int=}
 * @returns {void|int}
 */
/**
 * @callback observable_bool
 * @param {boolean=}
 * @returns {void|boolean}
 */
/**
 * @callback observable_object
 * @param {object=}
 * @returns {void|object}
 */

/**
 * String sanitizer
 * @param {string} string - string to quote
 * @return {string} - quoted string
 */
export function escapeHtml(string) {
  const entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    '\'': '&#39;',
    '/': '&#x2F;',
  };
  return String(string).replace(/[&<>"'/]/g, s => entityMap[s]);
}
