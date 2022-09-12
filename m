Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DD15B5B17
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 15:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiILNYi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 09:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiILNYg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 09:24:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C3F60D6
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 06:24:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXjQO-00014f-ES; Mon, 12 Sep 2022 15:24:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXjQO-000JN6-K1; Mon, 12 Sep 2022 15:24:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oXjQM-000Ntt-E1; Mon, 12 Sep 2022 15:24:30 +0200
Date:   Mon, 12 Sep 2022 15:24:28 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [bug report] i2c: imx: Make sure to unregister adapter on
 remove()
Message-ID: <20220912132428.j5gnwmpz3yr7twru@pengutronix.de>
References: <Ywd48/BdaB0Tcwpg@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o6xbrc4lu6ex3ayt"
Content-Disposition: inline
In-Reply-To: <Ywd48/BdaB0Tcwpg@kili>
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


--o6xbrc4lu6ex3ayt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dan,

On Thu, Aug 25, 2022 at 04:28:19PM +0300, Dan Carpenter wrote:
> The patch d98bdd3a5b50: "i2c: imx: Make sure to unregister adapter on
> remove()" from Jul 20, 2022, leads to the following Smatch static
> checker warning:
>=20
> 	drivers/i2c/busses/i2c-imx.c:1586 i2c_imx_remove()
> 	warn: pm_runtime_get_sync() also returns 1 on success
>=20
> drivers/i2c/busses/i2c-imx.c
>     1570 static int i2c_imx_remove(struct platform_device *pdev)
>     1571 {
>     1572         struct imx_i2c_struct *i2c_imx =3D platform_get_drvdata(=
pdev);
>     1573         int irq, ret;
>     1574=20
>     1575         ret =3D pm_runtime_get_sync(&pdev->dev);
>     1576=20
>     1577         hrtimer_cancel(&i2c_imx->slave_timer);
>     1578=20
>     1579         /* remove adapter */
>     1580         dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
>     1581         i2c_del_adapter(&i2c_imx->adapter);
>     1582=20
>     1583         if (i2c_imx->dma)
>     1584                 i2c_imx_dma_free(i2c_imx);
>     1585=20
> --> 1586         if (ret =3D=3D 0) {
>=20
> Probably this should be ret >=3D 0?
>=20
>     1587                 /* setup chip registers to defaults */
>     1588                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
>     1589                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
>     1590                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
>     1591                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
>     1592                 clk_disable(i2c_imx->clk);
>     1593         }
>     1594=20
>     1595         clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_chan=
ge_nb);
>     1596         irq =3D platform_get_irq(pdev, 0);
>     1597         if (irq >=3D 0)
>     1598                 free_irq(irq, i2c_imx);
>     1599=20
>     1600         clk_unprepare(i2c_imx->clk);
>     1601=20
>     1602         pm_runtime_put_noidle(&pdev->dev);
>     1603         pm_runtime_disable(&pdev->dev);
>     1604=20
>     1605         return 0;
>     1606 }

I don't know how automatic you send these reports, but I wonder why you
Cc:d the NXP Linux Team, but not Oleksij (i.e. the maintainer of the
driver, who also Acked the blamed commit) and the Pengutronix Kernel
team (which is included in the driver's MAINTAINER entry).

Apart from that, I just sent a patch for that issue, thanks for your
report.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--o6xbrc4lu6ex3ayt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMfMwkACgkQwfwUeK3K
7AkrUwf/Sl6+v6L/ADMI+TF5CCgWf64Bu7l4z5RMi3vmtaJdZDgrU6uNuDWNa4d7
R/fs3SavzDTK11uLj3YPLVx4zpb3/UBetaCG1mynS7yrXd+nh/rcWS93EnY5wLRX
tDpjynQxWSM+PaEYXUAfn/VlTpvQVbTKZaO391pgxj4OQvhk8AWzxECCpkZNxfHN
AklO8DEvDS6mZfl0hiPO0nd1uriSqVY3mpsnWXIDTLK9xjqJlfTJ2xdtu3FkY8gm
+InTww3gauphz0LBvPx2Pm+bk4UOn3Aja8Ml5OKT4sK+3J6HUON5S/b9/bIeRSpk
ZdOso+nfd7vpyYVugEIOrrqC6y37VQ==
=QkdJ
-----END PGP SIGNATURE-----

--o6xbrc4lu6ex3ayt--
