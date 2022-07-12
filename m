Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC75571548
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 11:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiGLJFY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 05:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiGLJFX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 05:05:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE0C3207E
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 02:05:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oBBpU-0008DA-Gd; Tue, 12 Jul 2022 11:05:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oBBpT-000Trz-9J; Tue, 12 Jul 2022 11:05:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oBBpS-004goQ-Fv; Tue, 12 Jul 2022 11:05:14 +0200
Date:   Tue, 12 Jul 2022 11:05:14 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pikna3bxscqnknqm"
Content-Disposition: inline
In-Reply-To: <20220712082415.319738-1-francesco.dolcini@toradex.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pikna3bxscqnknqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 10:24:15AM +0200, Francesco Dolcini wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
>=20
> Set the i2c_adapter retries field to a sensible value. This allows
> the i2c core to retry master_xfer()/master_xfer_atomic() when it
> returns -EAGAIN. Currently the i2c-imx driver returns -EAGAIN only
> on Tx arbitration failure (I2SR_IAL).
>=20
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Additional to Marco's questions:

 - I wouldn't have added a define for the constant as IMHO

	i2c_imx->adapter.retries =3D 3;

   is expressive enough. Thoughts?

 - Is it right this is a driver specific setting? I would have expected
   that this setting is in the realm of the i2c core. Grepping through
   the drivers (git grep \\\<retries\\s\*=3D drivers/i2c/) shows a wide
   variety between 0 and 5. (For some drivers you have do some deeper
   checking than that grep because driver authors chose to use a define
   for that; see above.)

 - In which situations does this help? Please mention these in the
   commit log.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pikna3bxscqnknqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLNOUcACgkQwfwUeK3K
7AnXSgf/e+RV34pEaJ4mU1Y8+mBzw13muVo0YaGP4wtqWBJVr2jUGGwFk8k+va2y
uPSMMCrOpR2i7wdxkOqYBYpPfSThsYQ/6A3d9tW8IxmdiqFxlEiAThNpo9ib9H8k
bdBg5ID1MtIlIrtSbLSzJ9xh7YnP/nyUX6xtFDIUVEkHVLd9JZyM8oFnP7seoTIN
JWYIwr1oca0hBs+RbhuT6+q0GEwL4BMuQPiQenDMlxM/qqnVmV7Vz+bP8hxz3l4b
i7IMSNKVYR7XQydZ+AEkyg48b3ytr6tmMQRynmlxYCrWO+IWCQetatIKbQRIGt0D
5+xm8p3sqMzH6V5DorRMwRLMJETKvw==
=yzXs
-----END PGP SIGNATURE-----

--pikna3bxscqnknqm--
