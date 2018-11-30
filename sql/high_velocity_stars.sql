/* Directly copied from bottom of Gaia Data Release 2 Paper */
SELECT phot_g_mean_mag+5*log10(parallax)-10 AS mg, bp_rp FROM gaiadr2.gaia_source 
WHERE parallax_over_error > 10 
AND phot_g_mean_flux_over_error>50 
AND phot_rp_mean_flux_over_error>20 
AND phot_bp_mean_flux_over_error>20 
AND phot_bp_rp_excess_factor < 1.3+0.06*power(phot_bp_mean_mag-phot_rp_mean_mag,2) 
AND phot_bp_rp_excess_factor > 1.0+0.015*power(phot_bp_mean_mag-phot_rp_mean_mag,2) 
AND visibility_periods_used>8 
AND astrometric_chi2_al/(astrometric_n_good_obs_al-5) <1.44*greatest(1,exp(-0.4*(phot_g_mean_mag-19.5)))

/* With interpretation of filters for Figure 20, panel C. (Total Velocity>200km/s) */
SELECT phot_g_mean_mag+5*log10(parallax)-10 AS mg, bp_rp FROM gaiadr2.gaia_source 
WHERE parallax_over_error > 10 
AND phot_g_mean_flux_over_error>50 
AND phot_rp_mean_flux_over_error>20 
AND phot_bp_mean_flux_over_error>20 
AND phot_bp_rp_excess_factor < 1.3+0.06*power(phot_bp_mean_mag-phot_rp_mean_mag,2) 
AND phot_bp_rp_excess_factor > 1.0+0.015*power(phot_bp_mean_mag-phot_rp_mean_mag,2) 
AND visibility_periods_used>8 
AND astrometric_chi2_al/(astrometric_n_good_obs_al-5) <1.44*greatest(1,exp(-0.4*(phot_g_mean_mag-19.5)))
AND power(radial_velocity,2) + power((4.74/parallax),2)*(power(pmra,2) + power(pmdec,2)) > 40000

/* Extinction Value Filter */
FROM gaiadr2.gaia_source AS g   
  JOIN user_hkiani.ism AS ism ON ism.ll=round(g.l) AND ism.bb=round(g.b)   
  WHERE  (ism.ww < 0 OR ism.ww<parallax)


/* With Extinction Value Filter Incorporated */
SELECT phot_g_mean_mag+5*log10(parallax)-10 AS mg, bp_rp FROM gaiadr2.gaia_source AS g 
JOIN user_hkiani.ism AS ism ON ism.ll=round(g.l) AND ism.bb=round(g.b) 
WHERE (ism.ww < 0 OR ism.ww 10 AND g.phot_g_mean_flux_over_error>50 
AND g.phot_rp_mean_flux_over_error>20 
AND g.phot_bp_mean_flux_over_error>20 
AND g.phot_bp_rp_excess_factor < 1.3+0.06*power(g.phot_bp_mean_mag-g.phot_rp_mean_mag,2) 
AND g.phot_bp_rp_excess_factor > 1.0+0.015*power(g.phot_bp_mean_mag-g.phot_rp_mean_mag,2) 
AND g.visibility_periods_used>8 
AND g.astrometric_chi2_al/(g.astrometric_n_good_obs_al-5) <1.44*greatest(1,exp(-0.4*(g.phot_g_mean_mag-19.5))) 
AND power(g.radial_velocity,2) + power((4.74/g.parallax),2)*(power(g.pmra,2) + power(g.pmdec,2)) > 40000



/* With interpretation of filters for Figure 21, panel C. (Tangential Velocity>200km/s) */
SELECT phot_g_mean_mag+5*log10(parallax)-10 AS mg, bp_rp FROM gaiadr2.gaia_source 
WHERE parallax_over_error > 10 
AND phot_g_mean_flux_over_error>50 
AND phot_rp_mean_flux_over_error>20 
AND phot_bp_mean_flux_over_error>20 
AND phot_bp_rp_excess_factor < 1.3+0.06*power(phot_bp_mean_mag-phot_rp_mean_mag,2) 
AND phot_bp_rp_excess_factor > 1.0+0.015*power(phot_bp_mean_mag-phot_rp_mean_mag,2) 
AND visibility_periods_used>8 
AND astrometric_chi2_al/(astrometric_n_good_obs_al-5) <1.44*greatest(1,exp(-0.4*(phot_g_mean_mag-19.5)))
AND 4.74/parallax * sqrt(power(pmra,2) + power(pmdec,2)) > 200 
AND e_bp_min_rp_val < 0.015