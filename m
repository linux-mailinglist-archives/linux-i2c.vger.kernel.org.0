Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4F0760AB5
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 08:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjGYGpG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 02:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjGYGpF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 02:45:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A178410E2
        for <linux-i2c@vger.kernel.org>; Mon, 24 Jul 2023 23:45:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOBmz-0007LV-JG; Tue, 25 Jul 2023 08:44:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOBmy-001wA6-CV; Tue, 25 Jul 2023 08:44:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOBmx-007bNn-K9; Tue, 25 Jul 2023 08:44:55 +0200
Date:   Tue, 25 Jul 2023 08:44:55 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     carlos.song@nxp.com
Cc:     festevam@gmail.com, andi.shyti@kernel.org, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        haibo.chen@nxp.com, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v3] i2c: imx-lpi2c: add error message when i2c peripheral
 clk doesn't work
Message-ID: <20230725064455.i5oq5y2jvjatxesc@pengutronix.de>
References: <20230725021108.1977494-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b6jp4mteey4pklrp"
Content-Disposition: inline
In-Reply-To: <20230725021108.1977494-1-carlos.song@nxp.com>
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


--b6jp4mteey4pklrp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 10:11:08AM +0800, carlos.song@nxp.com wrote:
> From: Gao Pan <pandy.gao@nxp.com>
>=20
> Output error log when i2c peripheral clk rate is 0, then
> directly return -EINVAL.
>=20
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Changes for V2:
> - adjust the Subject from "debug message" to "error message"
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index e93ff3b5373c..12b4f2a89343 100644

I wonder which tree you based this on. The object e93ff3b5373c is
neither in v6.5-rc1 nor next nor in Wolfram's tree. (Probably not
critical for this patch. But if you base your patch on a public tree,
you're making things easier for the build bots. Related to that I
recommend git format-patch --base=3D...)

> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -214,6 +214,11 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct =
*lpi2c_imx)
>  	lpi2c_imx_set_mode(lpi2c_imx);
> =20
>  	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> +	if (!clk_rate) {
> +		dev_err(&lpi2c_imx->adapter.dev, "clk_per rate is 0\n");
> +		return -EINVAL;
> +	}

I'm not sure this is a good idea. In my book error messages in functions
that might be called often (and triggered by user space) do more harm
than good as they flood the kernel log buffer and so might make it hard
to find the original cause of the problem. I'd say returning an error
code should be enough here.

Having said that I wonder if you're fixing a real issue? (i.e. did it
happen to you that clk_rate was 0? Did this result in a div-by-zero? Or
a hardware hang? Or a too fast (or too slow) bus speed?) Or is this just
addressing a warning by some static checker?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--b6jp4mteey4pklrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS/b2YACgkQj4D7WH0S
/k4AtwgAnWdBN9C8LwJ0yYXMN8PnMVmyg4UBVX5QyM1ukqipSzqykb1L6gMtukGL
LM+gyck7D9Cm0T30wta/8BHB9pD6niAbeyWhzdjstr2wThxtlUf6V9YH1mm3Oc7g
brELmPRYoNwzx6OTER6ZJyrOGCMsfg4YmiZ2Yv50fffhgnYSFY/WNe3Qn2ziTDFy
ubWIXUtKVaS7hv0irHPUin2W1xpY3wpFqtm+CFMH8GOS+57SaZkEynxQ7EN532QC
JiUEJ3jdFNznBN5qWMMhh+maFBMhfPUdA/4+tLXoUd0bBvzEgwutSiAcujgNfUS8
vFP6RIwlNaZQTvJ4CL3DLHO1mL5/xw==
=PJNp
-----END PGP SIGNATURE-----

--b6jp4mteey4pklrp--
