Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797A7768EF0
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 09:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjGaHgt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 03:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjGaHgP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 03:36:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B441FE9
        for <linux-i2c@vger.kernel.org>; Mon, 31 Jul 2023 00:35:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQNQi-0001B4-MP; Mon, 31 Jul 2023 09:35:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQNQf-0004Ys-Dq; Mon, 31 Jul 2023 09:34:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQNQe-009F7u-OI; Mon, 31 Jul 2023 09:34:56 +0200
Date:   Mon, 31 Jul 2023 09:34:56 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Liao, Chang" <liaochang1@huawei.com>
Cc:     yangyicong@hisilicon.com, linux-i2c@vger.kernel.org,
        festevam@gmail.com, ardb@kernel.org, asmaa@nvidia.com,
        rfoss@kernel.org, florian.fainelli@broadcom.com,
        kblaiech@nvidia.com, bcm-kernel-feedback-list@broadcom.com,
        linux-imx@nxp.com, linux-arm-msm@vger.kernel.org,
        andi.shyti@kernel.org, rjui@broadcom.com, s.hauer@pengutronix.de,
        gcherian@marvell.com, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
        loic.poulain@linaro.org, sbranden@broadcom.com,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
Message-ID: <20230731073456.zqg6adnyogtojyiv@pengutronix.de>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-9-liaochang1@huawei.com>
 <20230728055535.qoqq5syketmtduoy@pengutronix.de>
 <4ae70a67-6421-f1f6-f88f-163ee54b39bb@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pyfpad4lehlzfowq"
Content-Disposition: inline
In-Reply-To: <4ae70a67-6421-f1f6-f88f-163ee54b39bb@huawei.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pyfpad4lehlzfowq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 31, 2023 at 10:16:38AM +0800, Liao, Chang wrote:
> =E5=9C=A8 2023/7/28 13:55, Uwe Kleine-K=C3=B6nig =E5=86=99=E9=81=93:
> > On Fri, Jul 28, 2023 at 09:31:47AM +0800, Liao Chang wrote:
> >> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i=
2c-imx-lpi2c.c
> >> index c3287c887c6f..9021b8064ae4 100644
> >> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> >> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> >> @@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device=
 *pdev)
> >>  		sizeof(lpi2c_imx->adapter.name));
> >> =20
> >>  	ret =3D devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
> >> -	if (ret < 0) {
> >> -		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=3D%d\n", r=
et);
> >> -		return ret;
> >> -	}
> >> +	if (ret < 0)
> >> +		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clo=
ck\n");
> >=20
> > The change looks good, however I wonder why you didn't convert the other
> > dev_err() called by lpi2c_imx_probe() in the same way.
>=20
> Sorry, I am in hurry and don't clean it up as much as.
>=20
> Actually, I am not sure if I should convert all dev_err calls to dev_err_=
probe, or just
> replace the ones that print the 'return value'. I know that dev_err_probe=
 is better
> suited for printing return values, but I am nore sure if it's worth the e=
ffort to convert
> all of the calls, for example, the second dev_err in lpi2c_imx_probe():
>=20
> ret =3D devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0, pdev->name, l=
pi2c_imx);
> if (ret)
>     dev_err(&pdev->dev, "can't claim rqi %d\n", irq);
>     return ret;
> }

I'd say yes. The return value of devm_request_irq() might be interesting
in the error message. Also emitting error messages in a consistent style
is nice.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pyfpad4lehlzfowq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTHZB8ACgkQj4D7WH0S
/k4+Fwf9GXOgcrc1BisdDYY4aHPa+/QvyHxzxLz9S2kTUhEbnzmgpFo5SIOjDBdN
vYqntSAgCP5Si6kBK4tnFj0bLxXLNBYFVS05gxHUUi2nvCAHZmT55b9SWMRCAeM0
Kv99oq1SadaRMUkygPlQ9M6cMsyA1L/40PQGmw2YuPK85+qj9pY6KNKba1Cb688O
1QbwWdSiEJP/t5TcSF113QvoxJomz08NMMkoV1ZgW6pEfxua97ogGAzrS5jUNUrb
G+bP3L5YNRvbV902e/b7reda2HEQZNsiRO+KpHKNitPWlAGQKXP4R5ITq2S1OOEu
90lqHES8qAF3rjZsV+UObyxWZrtwAg==
=ODCp
-----END PGP SIGNATURE-----

--pyfpad4lehlzfowq--
