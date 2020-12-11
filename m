Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E512D7421
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 11:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgLKKor (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 05:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393125AbgLKKoL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Dec 2020 05:44:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DA4C0613CF
        for <linux-i2c@vger.kernel.org>; Fri, 11 Dec 2020 02:43:30 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1knftZ-00072b-8Q; Fri, 11 Dec 2020 11:43:29 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1knftY-0003pY-Pm; Fri, 11 Dec 2020 11:43:28 +0100
Date:   Fri, 11 Dec 2020 11:43:28 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] i2c: Warn when device removing fails
Message-ID: <20201211104328.3h5of6kegwcbhob2@pengutronix.de>
References: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
 <20201210201044.GB11120@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="csivnhfymequdwft"
Content-Disposition: inline
In-Reply-To: <20201210201044.GB11120@kunai>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--csivnhfymequdwft
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Wolfram,

On Thu, Dec 10, 2020 at 09:10:44PM +0100, Wolfram Sang wrote:
> On Thu, Nov 26, 2020 at 08:23:30AM +0100, Uwe Kleine-K=F6nig wrote:
> > The driver core ignores the return value of struct bus_type::remove. So
> > warn if there is an error that went unnoticed before and return 0
> > unconditionally in i2c_device_remove().
>=20
> I wondered about the "return 0" part...
>=20
> >=20
> > This prepares changing struct bus_type::remove to return void.
>=20
> ... until I read this. You are working on that?

Yes, I'm not paid for it, but it serves as an idle cleanup task for me.
Greg even assists, see 8142a46c50d2dd8160c42284e1044eed3bec0d18. :-)

>=20
> >  	if (driver->remove) {
> > +		int status =3D 0;
>=20
> No need to initialize to 0, or?

Right, this comes straight from:
-	int status =3D 0;

=66rom the current version of i2c_device_remove, where it was still
relevant. I don't feel strong here, and if you do I can resend or you
can fixup while applying.

> > +
> >  		dev_dbg(dev, "remove\n");
> > +
> >  		status =3D driver->remove(client);
> > +		if (status)
> > +			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(sta=
tus));
>=20
> The rest and patch 2 look good.

Great.

Liebe Gr=FC=DFe aus Freiburg!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--csivnhfymequdwft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/TTU0ACgkQwfwUeK3K
7Am8oQf8CU9TGpeEYJcwm+qZMiXrOmSsy/nxABH5tmI/IW1ZbFr2yUwC+qTkPIHX
hosYRRf0goO5xFDTX2Qa/7iAi51866qUiagcSsqFx49p+45LY9TpQIio2u707aMQ
TGQgOnWzBY1PeOWUay0gVLwPJXvTfHVdJzB3AmywE4GNoQjVMAmrUmFaZnsMl0zO
eIYuI5i7RfS769cN3JhMlzJYpFrxDHT1ggwq6IgMpYDIWzp4Yf7KvwCzbTHFin6f
MjVHEV15M8d8wRt+3sDjFtDukfAy1bPqgOsR19JpzJYSt8L4rTwcPVUuk7OR3cYW
jxEb0EtmalYUtFzG0/kGXnusLQhN8g==
=xJ1I
-----END PGP SIGNATURE-----

--csivnhfymequdwft--
