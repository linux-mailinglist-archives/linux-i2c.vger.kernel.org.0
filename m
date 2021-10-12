Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43D442AAF0
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 19:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhJLRnF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 13:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhJLRnD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Oct 2021 13:43:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5A0C061745
        for <linux-i2c@vger.kernel.org>; Tue, 12 Oct 2021 10:41:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maLll-0005yS-Le; Tue, 12 Oct 2021 19:40:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maLlk-0004oo-Mr; Tue, 12 Oct 2021 19:40:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maLlk-0004px-Li; Tue, 12 Oct 2021 19:40:52 +0200
Date:   Tue, 12 Oct 2021 19:40:52 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Peter Huewe <peterhuewe@gmx.de>, linux-spi@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-integrity@vger.kernel.org
Subject: Re: [PATCH 13/13] tpm: st33zp24: Make st33zp24_remove() return void
Message-ID: <20211012174052.iekzt22ojilca5lc@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
 <20211011132754.2479853-14-u.kleine-koenig@pengutronix.de>
 <4c6974280020118735644679f8498fe86748e648.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n7ytlpbxzxobjzo4"
Content-Disposition: inline
In-Reply-To: <4c6974280020118735644679f8498fe86748e648.camel@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n7ytlpbxzxobjzo4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 07:47:22PM +0300, Jarkko Sakkinen wrote:
> On Mon, 2021-10-11 at 15:27 +0200, Uwe Kleine-K=F6nig wrote:
> > Up to now st33zp24_remove() returns zero unconditionally. Make it return
> > void instead which makes it easier to see in the callers that there is
> > no error to handle.
>=20
> So, void is not a return value.

Hmm, would you be more happy with "Make it return no value"? I think
this is less understandable than "Make it return void". Do you have a
constructive suggestion how to formulate.

> > Also the return value of i2c and spi remove callbacks is ignored anyway.
>                            ~~~     ~~~
> 			   I2C     SPI

I don't agree. "I2C" is fine if you mean the protocol. For the framework
names I consider the small letters better, as it matches the directory
name below drivers/ and also matches the function name prefix and what
is usually used for short log prefixes. Ditto for spi.

> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > =A0drivers/char/tpm/st33zp24/i2c.c=A0=A0=A0=A0=A0 | 5 +----
> > =A0drivers/char/tpm/st33zp24/spi.c=A0=A0=A0=A0=A0 | 5 +----
> > =A0drivers/char/tpm/st33zp24/st33zp24.c | 3 +--
> > =A0drivers/char/tpm/st33zp24/st33zp24.h | 2 +-
> > =A04 files changed, 4 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp2=
4/i2c.c
> > index 7c617edff4ca..3170d59d660c 100644
> > --- a/drivers/char/tpm/st33zp24/i2c.c
> > +++ b/drivers/char/tpm/st33zp24/i2c.c
> > @@ -267,11 +267,8 @@ static int st33zp24_i2c_probe(struct i2c_client *c=
lient,
> > =A0static int st33zp24_i2c_remove(struct i2c_client *client)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct tpm_chip *chip =3D i2c_get_clientdata(cl=
ient);
> > -=A0=A0=A0=A0=A0=A0=A0int ret;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0ret =3D st33zp24_remove(chip);
> > -=A0=A0=A0=A0=A0=A0=A0if (ret)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > +=A0=A0=A0=A0=A0=A0=A0st33zp24_remove(chip);
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
> > diff --git a/drivers/char/tpm/st33zp24/spi.c b/drivers/char/tpm/st33zp2=
4/spi.c
> > index a75dafd39445..ccd9e42b8eab 100644
> > --- a/drivers/char/tpm/st33zp24/spi.c
> > +++ b/drivers/char/tpm/st33zp24/spi.c
> > @@ -384,11 +384,8 @@ static int st33zp24_spi_probe(struct spi_device *d=
ev)
> > =A0static int st33zp24_spi_remove(struct spi_device *dev)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0struct tpm_chip *chip =3D spi_get_drvdata(dev);
> > -=A0=A0=A0=A0=A0=A0=A0int ret;
> > =A0
> > -=A0=A0=A0=A0=A0=A0=A0ret =3D st33zp24_remove(chip);
> > -=A0=A0=A0=A0=A0=A0=A0if (ret)
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> > +=A0=A0=A0=A0=A0=A0=A0st33zp24_remove(chip);
> > =A0
> > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
> > diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st=
33zp24/st33zp24.c
> > index 4ec10ab5e576..2b63654c38d6 100644
> > --- a/drivers/char/tpm/st33zp24/st33zp24.c
> > +++ b/drivers/char/tpm/st33zp24/st33zp24.c
> > @@ -588,10 +588,9 @@ EXPORT_SYMBOL(st33zp24_probe);
> > =A0 * @param: tpm_data, the tpm phy.
> > =A0 * @return: 0 in case of success.
> > =A0 */
> > -int st33zp24_remove(struct tpm_chip *chip)
> > +void st33zp24_remove(struct tpm_chip *chip)
> > =A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0tpm_chip_unregister(chip);
> > -=A0=A0=A0=A0=A0=A0=A0return 0;
> > =A0}
> > =A0EXPORT_SYMBOL(st33zp24_remove);
> > =A0
> > diff --git a/drivers/char/tpm/st33zp24/st33zp24.h b/drivers/char/tpm/st=
33zp24/st33zp24.h
> > index 6747be1e2502..b387a476c555 100644
> > --- a/drivers/char/tpm/st33zp24/st33zp24.h
> > +++ b/drivers/char/tpm/st33zp24/st33zp24.h
> > @@ -34,5 +34,5 @@ int st33zp24_pm_resume(struct device *dev);
> > =A0
> > =A0int st33zp24_probe(void *phy_id, const struct st33zp24_phy_ops *ops,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct device *d=
ev, int irq, int io_lpcpd);
> > -int st33zp24_remove(struct tpm_chip *chip);
> > +void st33zp24_remove(struct tpm_chip *chip);
> > =A0#endif /* __LOCAL_ST33ZP24_H__ */
>=20
> Even though this does not improve things at run-time, this does
> help to understand what the code does,

That is for focus for now. As written in the cover letter the long term
goal is to make struct spi_driver::remove return void, too.

> so in that sense I do
> think that this a sane change to make.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--n7ytlpbxzxobjzo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlyKEACgkQwfwUeK3K
7AnW+gf/a5nHGrPAchY893xZhJwoyYfbuBIXnoZwEk6xNCzG8lR1a+y21yAIduhm
iIjo6CbKPFv/6Fl9vqW7Am7CkXgAEf0bHtek0uN4Vs+yh6hvsoVRABToUqNkeoiV
L+lXNxTrmN6AJ7/wmwP9MKZ5jxgt+fGoQpecGWzyrORCOk2v+brs2Q3ztpQKG6Pf
rOJb7O2s/tYkq1FwtnoumgNnLBNSDYYi7HOuCObhnH4DSOE1t9kDsvk+XHgdB5/d
Hxzd25FmIdITnzdzAR1Rlc6fpcJz4qHJljuvLTo7qTukuSR2rG1G12XAwkNWcgN0
KyVFL4oR5ooEkx3Pgr0i/nxCC0dQqg==
=rm7o
-----END PGP SIGNATURE-----

--n7ytlpbxzxobjzo4--
