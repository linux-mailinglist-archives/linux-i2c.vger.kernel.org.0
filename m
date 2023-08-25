Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B464A78901B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 23:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjHYVHe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 17:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjHYVHW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 17:07:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C392139
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 14:07:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA2C462CC9
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 21:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8E0C433C8;
        Fri, 25 Aug 2023 21:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692997639;
        bh=AfwgcpgMJ3ts5+daIGnYlmv38YNu2CUhdi9Z7+mMO34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCOgoWC3wfKwG2sZ6tqsHoUGBKyWZO5pVLHYB3hNbiNe4cu4m5lqi7OlzpSGReipL
         Nkl1ttVVRuI78ChJA+LO1vUKmtklXfhsixTsguPq4qbdFDrC5skQcdN7EfTq1EkVrQ
         3WZL3Dpn5OAXKLDFHGtuaWZBv4YVX7KkyUXZddFUfnhA4OXiHb+439sU5/kqMDeb0T
         5iZ47KbZt5rzJHPGHKxUnLMUs4m19YKpPgrR30ydn03Gi3BBs5pW/0yryzjsK6ecmi
         XL7ny58PV6s5UvPO8VN2FUI9BVzHhkp0LpJGJngermNGWUOVlJWgCa7KktaPQl9+x9
         QUL/NCmfYtAZA==
Date:   Fri, 25 Aug 2023 23:07:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux@armlinux.org.uk, linus.walleij@linaro.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH -next v3] I2C: Make return value check more accurate and
 explicit for devm_pinctrl_get()
Message-ID: <ZOkYA9UO6nDqQD3h@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
        linus.walleij@linaro.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20230821032914.1976317-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBWPSrDkDaaAxt7q"
Content-Disposition: inline
In-Reply-To: <20230821032914.1976317-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DBWPSrDkDaaAxt7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 11:29:14AM +0800, Jinjie Ruan wrote:
> If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> recovery can't work, because we can't switch the I2C pins between the
> I2C controller and GPIO. So, it is quite correct to print
> "can't get pinctrl, bus recovery not supported" because the I2C bus
> can't be recovered without pinctrl.
>=20
> The PTR_ERR() is also fine - because if pinctrl is not present and
> returns NULL, we'll end up returning zero, which is exactly what we
> want.
>=20
> However, open code that with a more accurate message will be more explicit
> for NULL case when CONFIG_PINCTRL is not defined.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>

Applied to for-next, thanks!


--DBWPSrDkDaaAxt7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpF/8ACgkQFA3kzBSg
KbYfLw/8CPpUq5HQ48s50MZyWKNfih7hLAG6WGOHo3cgPZgn1Ln1T0aYnAB6D1SH
imuYX4dUMTQJIlhUWaCG0ocitkYxmqhsMQ7zvxqXtEyR1q3dDhnLpuIUFzuhfSJU
oG7ss2I6H9dqrCF4K6SLAKYadtQk+VApok//JnLxWVd8/DDf1172I7/bODwrGvB0
7eR/PgQuY+nfqenwR8QtmjLIn+kuCITMuZyD3RYQHLWzHooTAKbAVkvG9cEZ/uLK
kPGPlhDTNQgi9b2xRG+oQWNHI/P9l+CkJoYJuLQlgYij/8dIA4zHISR5bhYgmNOu
hmWf99e7MXPygNznASWNmcSDat9a1iLl2Oic7OxeL6/tN6TwgyfbxnI3YM1PPEYw
kJhsN6Cy/k6BkkJzEYbv96XKJuh+kW4ekDvnOSW3fcy/Bhw5SAjgK0fBhGJ/nQsg
sBF3ahZqniotSelyIAxg8C/e+oVmo2OesNuQqDkZwbKDrJ+xHkIFiSp5WgaSq+NN
XH+Hs/ewcUGtxBIJkwlpiLdsdFSIdkt1sC5y4lvDVTjVF/u0RNJGO2C/S63VZV1w
sPLl/1of5/ijUZ2hNGNeVLAMepgzyDpZgqSNT/qwpzyuz6IKkTEgSyXBe1/UqkgO
BHeOKM/4Er8v6/4v8zKRX0d7v2odptwaCD4oKBFIMooO8A0Y2V0=
=KaV8
-----END PGP SIGNATURE-----

--DBWPSrDkDaaAxt7q--
