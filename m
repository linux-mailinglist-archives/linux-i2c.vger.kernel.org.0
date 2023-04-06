Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7489F6D916B
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 10:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235849AbjDFIYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 04:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbjDFIYK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 04:24:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C417A9A
        for <linux-i2c@vger.kernel.org>; Thu,  6 Apr 2023 01:24:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pkKuT-0006zt-8j; Thu, 06 Apr 2023 10:23:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pkKuR-009L2f-71; Thu, 06 Apr 2023 10:23:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pkKuQ-00AzQf-G5; Thu, 06 Apr 2023 10:23:54 +0200
Date:   Thu, 6 Apr 2023 10:23:54 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: [PATCH] i2c: omap: Improve error reporting for problems during
 .remove()
Message-ID: <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
 <ZC5qUU4JLI9Negyi@sai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nsmp2sx53qt2rvps"
Content-Disposition: inline
In-Reply-To: <ZC5qUU4JLI9Negyi@sai>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nsmp2sx53qt2rvps
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If pm_runtime_get() fails in .remove() the driver used to return the
error to the driver core. The only effect of this (compared to returning
zero) is a generic warning that the error value is ignored.

So emit a better warning and return zero to suppress the generic (and
little helpful) message. Also disable runtime PM in the error case.

This prepares changing platform device remove callbacks to return void.

Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---
On Thu, Apr 06, 2023 at 08:44:33AM +0200, Wolfram Sang wrote:
>=20
> > > So if there is some clk handling necessary before the register access,
> > > I'm not aware where it's hidden. Is there some bus or omap specific c=
ode
> > > that ensures clk handling?
> >=20
> > I think the missing part is that the runtime PM calls in the i2c driver
> > cause the parent ti-sysc interconnect target module device to get enabl=
ed
> > and clocked before accessing the i2c registers.
>=20
> So, this patch is not needed?

The patch as is is wrong. For my quest to drop the return value of
platform driver's remove callbacks, I need this patch instead:

 drivers/i2c/busses/i2c-omap.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f9ae520aed22..2b4e2be51318 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1525,14 +1525,17 @@ static int omap_i2c_remove(struct platform_device *=
pdev)
 	int ret;
=20
 	i2c_del_adapter(&omap->adapter);
-	ret =3D pm_runtime_resume_and_get(&pdev->dev);
+
+	ret =3D pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		return ret;
+		dev_err(omap->dev, "Failed to resume hardware, skip disable\n");
+	else
+		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
=20
-	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
=20

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
--=20
2.39.2


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nsmp2sx53qt2rvps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQugZkACgkQj4D7WH0S
/k6e1QgAgMnr2q6+pOqsrux2OQmK4cmDqgLRGQhbp6quxKBbs7BiVJcK2NqGKE+8
YHELGSWPVwNz/Hd6V0YxaBKbFQvPJlSJdVhELTuBiWLQ1pnUkt6DcF5zbxpLw5NT
1qd8i621AKmq3kWowz/uoz1XqtsFo9jYrLwqj/jutbbIuUcmr3pXY8DRv4x4fb82
+oTUpMjvUyJhsdebnQ3T+NeAdNtobO4Iy73/eBSZedvmMecH3XlRx1Y9ZGiJx4Hb
DG0+QqVIeWQJawHYVFKSo2DP2w074A1dMI5+dMd/szvn7an7pa/cT6w24iDKFXHd
9tQji5xY/yCxCt6ZJkpL9v+rwG9iaQ==
=3J10
-----END PGP SIGNATURE-----

--nsmp2sx53qt2rvps--
