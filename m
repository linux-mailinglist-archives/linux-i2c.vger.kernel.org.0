Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823387663CE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 07:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjG1F4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 01:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjG1F4P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 01:56:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B59119BA
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 22:56:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qPGS0-0000hF-3c; Fri, 28 Jul 2023 07:55:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qPGRu-002dev-MD; Fri, 28 Jul 2023 07:55:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qPGRt-008QNG-PH; Fri, 28 Jul 2023 07:55:37 +0200
Date:   Fri, 28 Jul 2023 07:55:35 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     andi.shyti@kernel.org, florian.fainelli@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
Message-ID: <20230728055535.qoqq5syketmtduoy@pengutronix.de>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-9-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u5yvvpqys3zvr2vr"
Content-Disposition: inline
In-Reply-To: <20230728013148.1720978-9-liaochang1@huawei.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u5yvvpqys3zvr2vr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jul 28, 2023 at 09:31:47AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
>=20
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index c3287c887c6f..9021b8064ae4 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *p=
dev)
>  		sizeof(lpi2c_imx->adapter.name));
> =20
>  	ret =3D devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=3D%d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\=
n");

The change looks good, however I wonder why you didn't convert the other
dev_err() called by lpi2c_imx_probe() in the same way.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--u5yvvpqys3zvr2vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTDWFYACgkQj4D7WH0S
/k4I2wf/eI0u/N5T1PYKnxNXv78Ur25Zop7D3UxjTLXWIpFQyXb9SYi3YxeRI+Yg
MA7Kd/4uHuZuPCSFiiSZQyzqReMBW+hDp1b1NV6lFGIr7CEXTWnM9l9iWOTF6zkH
eipX6d7fRKAnSaedWwYZxDQUn0MFra+kS6zdCrcxqEpGOXo1/x4kdhB0aBndYeuk
J4fy4hLnxAmorYnIKMoDXvtRJonV7+xTzRO6xf+zOAwvvyGF7jRqdOjn6u43GCte
5PFpoBQtMkPPpzKHPl0Bh1Q6oAJp1FtyQt5Vq1v3hlqJKRiYI8UWZ0el/qUh7RJt
ab6qZ9yIp1T29962caCRtn2Lo52/+g==
=mqMn
-----END PGP SIGNATURE-----

--u5yvvpqys3zvr2vr--
