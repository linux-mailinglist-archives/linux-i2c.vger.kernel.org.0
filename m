Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B4719E50
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 15:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjFANc7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 09:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjFANcq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 09:32:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44471E5A
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 06:32:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4iPY-0005ti-Bm; Thu, 01 Jun 2023 15:32:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4iPX-004Mj5-9R; Thu, 01 Jun 2023 15:32:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4iPW-00AAUp-Dx; Thu, 01 Jun 2023 15:32:14 +0200
Date:   Thu, 1 Jun 2023 15:32:14 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     carlos.song@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
        haibo.chen@nxp.com, xiaoning.wang@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: fix type char overflow issue when
 calculating the clock cycle
Message-ID: <20230601133214.h3vljetcybttnygo@pengutronix.de>
References: <20230529080251.3614380-1-carlos.song@nxp.com>
 <20230530185036.ggep3pv7booqtb6b@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xmjkv3hz43ym3mcy"
Content-Disposition: inline
In-Reply-To: <20230530185036.ggep3pv7booqtb6b@intel.intel>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xmjkv3hz43ym3mcy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 08:50:36PM +0200, Andi Shyti wrote:
> On Mon, May 29, 2023 at 04:02:51PM +0800, carlos.song@nxp.com wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >=20
> > Claim clkhi and clklo as integer type to avoid possible calculation
> > errors caused by data overflow.
> >=20
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2=
c-imx-lpi2c.c
> > index 40a4420d4c12..7dd33564cbe1 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -211,8 +211,8 @@ static void lpi2c_imx_stop(struct lpi2c_imx_struct =
*lpi2c_imx)
> >  /* CLKLO =3D I2C_CLK_RATIO * CLKHI, SETHOLD =3D CLKHI, DATAVD =3D CLKH=
I/2 */
> >  static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> >  {
> > -	u8 prescale, filt, sethold, clkhi, clklo, datavd;
> > -	unsigned int clk_rate, clk_cycle;
> > +	u8 prescale, filt, sethold, datavd;
> > +	unsigned int clk_rate, clk_cycle, clkhi, clklo;
>=20
> looks OK.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>=20
>=20
> there is, though, another part I would take care of, this bit:
>=20
> 	clklo =3D clk_cycle - clkhi;
> 	if (clklo < 64)
> 		break;
>=20
> It might be unlikely, but if "clk_cycle > clkhi" then all the
> calculation. Do you mind adding a check:
>=20
> 	if (unlikely(clk_cycle > clkhi))
> 		break;

With clk_cycle being unsigned and clkhi =3D DIV_ROUND_UP(clk_cycle, 3)
this will be true unless clk_cycle 0 or 1, so I'd say this is quite
likely to trigger?!

I guess you meant something different than you wrote. (And your sentence
no verb.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xmjkv3hz43ym3mcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR4nd0ACgkQj4D7WH0S
/k4FNQgAkPNYBpRid7OfDU5CbuWfB6NR+0BsFU9ggQr5+3KASlD9t0SqUQoFdoTF
ZnNvkgTt5lAXxvS+LR0FMgMw2+nd1e7XGBjofs8b9Ct1XDQDxKNZCsqdFM4GVDkI
2qx3kO+yj3vinAHDKne/Bjb8j9okLv48gjImJPLQdOTwynPuI9d3P5ILkjxS6j1R
80955a5NH4i7VE6cwl5GHu351i3v8RAN2BzEPmv+C7D4rhcxql8g/WrtGEJY8OKc
krENSlJXNRSC5kR2Qe6oZ0m+HJbEv0opsFnDX8/V4GNWg1oguyM6sCARzaqvnklA
sRrAYGcJXqzQsGwb4CCtH/i4CJpPLQ==
=IT7k
-----END PGP SIGNATURE-----

--xmjkv3hz43ym3mcy--
