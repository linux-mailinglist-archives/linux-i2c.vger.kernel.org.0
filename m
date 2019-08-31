Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9629AA4461
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 14:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfHaMRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 08:17:54 -0400
Received: from sauhun.de ([88.99.104.3]:37824 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbfHaMRy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 08:17:54 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id 137752C0093;
        Sat, 31 Aug 2019 14:17:52 +0200 (CEST)
Date:   Sat, 31 Aug 2019 14:17:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v3 5/9] i2c: at91: add support for digital filtering
Message-ID: <20190831121751.GC1032@ninjato>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <1562678049-17581-6-git-send-email-eugen.hristev@microchip.com>
 <20190831121308.GB1032@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <20190831121308.GB1032@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	dev->enable_dig_filt =3D of_property_read_bool(pdev->dev.of_node,
> > +						     "i2c-dig-filter");
> > +
>=20
> What do you think of the idea to introduce 'flags' to struct i2c_timings
> and parse the bindings in the core, too? Then you'd have sth like:
>=20
> 	if (t->flags & I2C_TIMINGS_ANALOG_FILTER)
>=20
> Would that be useful for you?

Forgot to say, we can also implement this incrementally to make sure
your patches land in 5.4 in case you are currently busy with sth else.


--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qZW8ACgkQFA3kzBSg
KbbcoQ//ZMuUi7Vd6Xj/Gh9IgbGuTbXxjGeoSW+Kts2TbqLIcJHl9A8F8BLOe3OH
QJRwEMB/NVIpI6XTuQKadhBkKHoI/1n+5jhOJX4P239Lar26V3kXG97WLSNH3kJP
RJ4q5ZfPRLKzpxlebefRUWntFCadSWmQvztiji0VyQR5wSY3+eJkVhU7ftIKFEpW
LFMoCI0Gr1eClZM47oZERx9hsilWnacd+y8eLTDoiUmd0yVGx0QO26JNju6zIkuU
zMAfj51/y0aNN63LIHAp3M4uOxVvLxAWZrhg4nGrbfrEwUIFjWMajM27mnuF8C6R
jFaK/CUOBUHO1dRRDvPHmFEJThJo7iQ4gR++2r4+ADeoWDP7geMn6uttEs3xRZEU
HkOvWUDUzxgR0ylv768MU4lUV8eYt5d0kzYEQqcOiBO4eAS7zQ0SaeSLdbrQuIhR
Vx6Msz70pCaBSQqEckJPlKcmN4fm4vp67wVZdy8jEjNuJIY7j7jVsFEQZkJXfdBq
tV8yfRFm0C5HZbq5DR0QSF6xqREW/k40aHsPC/7bmyvyzCuA9GiGe3bZCzxoOeuR
TAmzevIjsE4UfmCrNdqQP/V4E0tZMAbllPgxUlgZYO84EiLn76pKxxlvyt5hp++t
NlMl1rO/Ne51jtwCVcmGgpkoLtlop2ChAKzhPSGZDMn7aAHdJVU=
=YVhT
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
