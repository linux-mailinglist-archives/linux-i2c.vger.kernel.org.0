Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA9236E06E1
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 08:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjDMGZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 02:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjDMGY5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 02:24:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A474F8681
        for <linux-i2c@vger.kernel.org>; Wed, 12 Apr 2023 23:24:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmqNw-0001qX-U7; Thu, 13 Apr 2023 08:24:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmqNt-00AuLl-Vo; Thu, 13 Apr 2023 08:24:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmqNs-00Cnvp-VO; Thu, 13 Apr 2023 08:24:40 +0200
Date:   Thu, 13 Apr 2023 08:24:40 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Improve error reporting for problems during
 .remove()
Message-ID: <20230413062440.yixne5wqed4zrva4@pengutronix.de>
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
 <ZC5qUU4JLI9Negyi@sai>
 <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
 <20230413051222.GA9837@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vcwo334wi5pnp43v"
Content-Disposition: inline
In-Reply-To: <20230413051222.GA9837@atomide.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vcwo334wi5pnp43v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tony,

On Thu, Apr 13, 2023 at 08:12:22AM +0300, Tony Lindgren wrote:
> * Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> [230406 08:23]:
> > --- a/drivers/i2c/busses/i2c-omap.c
> > +++ b/drivers/i2c/busses/i2c-omap.c
> > @@ -1525,14 +1525,17 @@ static int omap_i2c_remove(struct platform_devi=
ce *pdev)
> >  	int ret;
> > =20
> >  	i2c_del_adapter(&omap->adapter);
> > -	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> > +
> > +	ret =3D pm_runtime_get_sync(&pdev->dev);
>=20
> It's better to use pm_runtime_resume_and_get() nowadays in general as
> it does pm_runtime_put_noidle() on errors.

Sticking to pm_runtime_resume_and_get() complicates the change however,
because the function calls pm_runtime_put_sync() already. So with
pm_runtime_resume_and_get() I'd need

	if (ret >=3D 0)
		pm_runtime_put_sync(&pdev->dev);

instead of a plain

	pm_runtime_put_sync(&pdev->dev);

=2E

> Not sure if there are changes needed here, maybe warn and return early
> if needed?

The idea of "return early" in a remove callback is exactly what I want
to get rid of.

See
https://lore.kernel.org/linux-spi/20230317084232.142257-3-u.kleine-koenig@p=
engutronix.de
for an example.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vcwo334wi5pnp43v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ3oCcACgkQj4D7WH0S
/k5y6wf/c0iWurebAhMmfkRzk5aa8IetbdhXT0gCQLmV2trIcXmCWBOtuMMuag5Q
GNiA9JtFKdlB6EIKfs1hMyU1qpo3Gyjwty8/JOP/E1+QnzRDJzl5orz4ujGVmkpP
iTFRCHwGjZEWIMhfkteRf7svYcBXsKZeyGoNI8ZlRYB6z5d9RzEvAyPGQ8806yKw
kkbpXsWj2bWJmMJ63iSWVes3NM0gfUTkNcanamGz2ln5FzCb9rRF9qT8B3lMy0O2
qpI/zrcBSg0tRhya1ObNjFUrXAtoqtAgFg9NSUC1jgYcOrd0UO9LpRHPZZl3VKOR
m8A7HZoIk7KQJ/MUkmb7zF5CE1yL7w==
=8aUg
-----END PGP SIGNATURE-----

--vcwo334wi5pnp43v--
