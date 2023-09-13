Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6BC079E2AF
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239120AbjIMIyZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239119AbjIMIyZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:54:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A13E73;
        Wed, 13 Sep 2023 01:54:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FAEC433CB;
        Wed, 13 Sep 2023 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694595261;
        bh=mbTrXGy+BmzVd7CtF/AdU2G0DxQ0H/p3mfygzm64JKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J8WoxwuK8V6FCY1n+mWYy5+bCOyAkqFcWG7BUD1FOR7ndl3sYlHIJqhcyMdAyhIh+
         rhZ+P8w4Labhf5IKwVpf7oLKiqvvpo+MpotQqsBHPK6eOgzt4FWzemPdBBaNO3cUVU
         M/SlxWAYs1gbyTzGgzFT2tUgf3sLvbI86418mb5L0dHI7l4v8cdpvHpnzSiHRPlR1C
         Xp06dWUaAT/0cPmKViYar1GvKLtmEZJyVSvAEZKSFHdq+CbgNtmSPjpmVB2LtGKaIu
         hyNspj6lqwtRGQO+6RNIV4v6Mtd1cCwHytO0FJgw3pT24fjKTe21wXYXzlyiSup/ao
         FEUmh9UmrSBzw==
Date:   Wed, 13 Sep 2023 10:54:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Make I2C_ATR invisible
Message-ID: <ZQF4uGd5C4l+7iWo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5akU66tpM0r/Hmp3"
Content-Disposition: inline
In-Reply-To: <588d302477cb7e6b30b52ee6448807324c57b88a.1692113321.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5akU66tpM0r/Hmp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 05:29:11PM +0200, Geert Uytterhoeven wrote:
> I2C Address Translator (ATR) support is not a stand-alone driver, but a
> library.  All of its users select I2C_ATR.  Hence there is no need for
> the user to enable this symbol manually, except when compile-testing.
>=20
> Fixes: a076a860acae77bb ("media: i2c: add I2C Address Translator (ATR) su=
pport")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Fixed checkpatch warning:

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<titl=
e line>")' - ie: 'Fixes: a076a860acae ("media: i2c: add I2C Address Transla=
tor (ATR) support")'

and applied to for-current, thanks!


--5akU66tpM0r/Hmp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBeLgACgkQFA3kzBSg
Kbbfzw/+Pl0XcrN3b1g2c2tE73qzJMxRO0iP5G7qQci8sYchHs1G3zm6wbtT1uAl
0vfrArR4+HO/AyUMg5tTVk3uRHdaMClkr/IaslTYIOgZmaA9HsAorbLWgrNMW1v4
CDmh6xq+UIhka8Edii7xY52S/0mtHlwYPijvueVjlQ9dggdWmkPzEn180N4rQCsq
2CQnDcEGf4/lQwlfhcfmm4W1F032PppPTSRsN0Qp6MK0+wF8hybzZsRQkZuPUJhW
FRqW/vY1EvZMvnEfIFiN4WFCq+894/GfWGH51FhslYgFuL58N9Dj1H8oLohfIEiS
smm+KWGzglj1Wyd3GfQ0FeQkGj/hyZSQjLgYYlg1idaTgs3y1Y45EvguM7FOUm48
IkFYXgBZG6i/SYPKsQcAA2vK11j1tuz12uqAu0GMgKC+oZM4nuyourf911sTKAZq
ozzK4LVqjY5U0mYVIha7/HBlMQzUT7u5qSIgpzjtcbDJ1unA4S9Fw2981Oe/XSWk
A1X5LUFWLlWJWEE3/P8qHfIhgJVyccaoJPzSS9YxhLFoGV9IQrt2+vbwB2eKXvv1
P2aNL8tSW+sTJk0gfxqIL5Fn+ABBFbGlgO4zhQHBRV98l+SDDxBaF4t14CesZpVi
AyKDryX5oW5w7K8xlHjimpxQ+uG4xQLNhfdMSdhU7nCnIpNw+3w=
=u8AL
-----END PGP SIGNATURE-----

--5akU66tpM0r/Hmp3--
