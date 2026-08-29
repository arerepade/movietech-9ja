function hexval(ch,   d) {
  d = index("0123456789abcdef", tolower(ch));
  return d - 1;
}
function chan(h, i,   hi, lo) {
  hi = hexval(substr(h, i, 1)); lo = hexval(substr(h, i+1, 1));
  return hi * 16 + lo;
}
function lin(c,   cs) {
  cs = c / 255.0;
  if (cs <= 0.03928) return cs / 12.92;
  return ((cs + 0.055) / 1.055) ^ 2.4;
}
function lum(h) {
  gsub(/#/, "", h);
  return 0.2126*lin(chan(h,1)) + 0.7152*lin(chan(h,3)) + 0.0722*lin(chan(h,5));
}
function ratio(a, b,   la, lb, hi, lo) {
  la = lum(a); lb = lum(b);
  hi = (la > lb) ? la : lb; lo = (la > lb) ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}
NF >= 3 && $1 ~ /^#[0-9A-Fa-f]{6}$/ {
  r = ratio($1, $2);
  tier = $3;
  req = (tier == "A") ? 7.0 : (tier == "B") ? 4.5 : 3.0;
  status = (r >= req) ? "PASS" : "FAIL";
  printf "%-9s on %-9s  tier %s  need %.1f  got %5.2f  %s   %s\n", $1, $2, tier, req, r, status, $4;
}
