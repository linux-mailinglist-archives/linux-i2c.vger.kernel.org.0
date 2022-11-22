Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1561A633DCE
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 14:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbiKVNgN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 08:36:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbiKVNfy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 08:35:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2154C65852
        for <linux-i2c@vger.kernel.org>; Tue, 22 Nov 2022 05:35:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxTR4-0004Q1-Ha; Tue, 22 Nov 2022 14:35:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxTR1-005rZK-1b; Tue, 22 Nov 2022 14:35:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxTR1-000o5d-AE; Tue, 22 Nov 2022 14:35:35 +0100
Date:   Tue, 22 Nov 2022 14:35:34 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 567/606] staging: iio: ad5933: Convert to i2c's
 .probe_new()
Message-ID: <20221122133534.zoosrjjszpgmgb64@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-568-uwe@kleine-koenig.org>
 <Y3y/DxNp+cYu7GTH@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ulcjetf4btcckz7d"
Content-Disposition: inline
In-Reply-To: <Y3y/DxNp+cYu7GTH@kroah.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ulcjetf4btcckz7d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Tue, Nov 22, 2022 at 01:22:39PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 18, 2022 at 11:45:01PM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/staging/iio/impedance-analyzer/ad5933.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/=
staging/iio/impedance-analyzer/ad5933.c
> > index f177b20f0f2d..b3152f7153fb 100644
> > --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> > +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> > @@ -674,9 +674,9 @@ static void ad5933_clk_disable(void *data)
> >  	clk_disable_unprepare(st->mclk);
> >  }
> > =20
> > -static int ad5933_probe(struct i2c_client *client,
> > -			const struct i2c_device_id *id)
> > +static int ad5933_probe(struct i2c_client *client)
> >  {
> > +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>=20
> Breaks the build in my tree as this function is not in Linus's tree yet
> :(

As pointed out in the cover letter[1] you want to make sure that

	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_d=
evice_id_helper-immutable

is part of your tree first. So either pull that into your tree, or wait
until this hits Linus's tree.

Best regards
Uwe

[1] https://lore.kernel.org/linux-kernel/20221118224540.619276-1-uwe@kleine=
-koenig.org
    (It wasn't sent to every thread participant because that would have
    been too many.)

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ulcjetf4btcckz7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN80CAACgkQwfwUeK3K
7Al35ggAnqzvJT6O1dZcuSdZThRtBdo5YPsZq63WDB/TRDChLUiYlceIBo9rzETz
t3nH4M6MjjxnOWepddEk/P2hqOl7Bw6h9oarQZvWf2sYdHtoqRkPoSthUjz+glrB
UWDIIA5F4SeaXakKujDbz4YcIHsEXnnnWuut10edAIkeMWgwIvZzN/sJNXF2pvrh
QVU7kpB5yWmp0O5ieU3itSPAHwWb4FQFWWi35AS0tJOYQpOuKoHT+HrcYBWKq/mf
nK3ijGYIRwRVgIDlS6F9tRtoU3eAFJ4ctnztSwoNcZ0giVZbHWoCOIK0WaAlDqNS
JSXk/So3urvJXWDkg+4T7xEuwZVfxA==
=mV0I
-----END PGP SIGNATURE-----

--ulcjetf4btcckz7d--
