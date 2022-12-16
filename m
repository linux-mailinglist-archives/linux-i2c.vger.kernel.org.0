Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8BAE64EA08
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 12:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiLPLNZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 06:13:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiLPLNX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 06:13:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E9D3720D
        for <linux-i2c@vger.kernel.org>; Fri, 16 Dec 2022 03:13:22 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p68eM-0003CF-7T; Fri, 16 Dec 2022 12:13:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p68eK-004uR2-4X; Fri, 16 Dec 2022 12:13:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p68eK-005WBB-8a; Fri, 16 Dec 2022 12:13:08 +0100
Date:   Fri, 16 Dec 2022 12:13:08 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        upstream@lists.phytec.de, Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Message-ID: <20221216111308.wckibotr5d3q6ree@pengutronix.de>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
 <20221216110227.GA12327@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t5quojaruzjimkrf"
Content-Disposition: inline
In-Reply-To: <20221216110227.GA12327@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t5quojaruzjimkrf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 12:02:27PM +0100, Oleksij Rempel wrote:
> On Fri, Dec 16, 2022 at 11:41:08AM +0100, Primoz Fiser wrote:
> > Hi Marco,
> >=20
> > On 16. 12. 22 10:45, Marco Felsch wrote:
> > > Hi Primoz,
> > >=20
> > > On 22-12-16, Primoz Fiser wrote:
> > > > By default, retries value is set to 0 (no retries). Set retries to =
more
> > > > sensible value of 3 to allow i2c core to re-attempt transfer in cas=
e of
> > > > i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).
> > >=20
> > > apart the fact that the number of retries vary a lot and so the client
> > > driver behaviour can vary a lot which is not good IMHO, why do you th=
ink
> > > that 3 is a sufficient number?
> >=20
> > IMHO it is better than leaving it at 0 (no retries)?
> >=20
> > Setting it to sensible value like 3 will at least attempt to make trans=
fer
> > in case arbitration-loss occurs.
> >=20
> > >=20
> > > If an arbitration loss happen, why do you think that retrying it 3 ti=
mes
> > > changes that?
> >=20
> > I our case, setting retries to non-zero value solves issues with PMIC
> > shutdown on phyboard-mira which in some rare cases fails with "Failed to
> > shutdown (err =3D  -11)" (-EAGAIN).
> >=20
> > To me it makes common sense retries is set to non-zero value especially=
 for
> > such rare conditions/situations.
>=20
> https://lore.kernel.org/all/Ys1bw9zuIwWS+bqw@shikoro/

Also in the same thread there is the question about better setting it in
the i2c core if 3 instead of 0 is a good idea for the imx driver.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t5quojaruzjimkrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOcUsEACgkQwfwUeK3K
7AmZpQf/QPr4vmlMM4tyMO/DysXCLIEhHfw8fw1LDdG9X1mC7X6Wk8imUlftYuOO
/0+/xpvMPv7lPr3CRL5n96At1Q83ir9CNX4xRBtjZ7KbZfMlJekvlXh+lx3IzJFM
hcoaWG1UvuJ3mpsGwmvzg0QxN6PO/gaRi8VXodAIOcQDUsKW/ywqzx278bER03zJ
Shbk0vvTkc3Nds/P57LGPtgjZimuQdfW0k3aPKRsUm3SnLwoYcAffjU9EiYNLDw7
GrF/wlam/n+z2z8dgLtTdCOvFep3qptKoTntg7tQL/iNU78ObU+o4B79y1VBCK+R
rwJjBZqACqAiwJWQADITAWM8DKkc1w==
=h1Rd
-----END PGP SIGNATURE-----

--t5quojaruzjimkrf--
