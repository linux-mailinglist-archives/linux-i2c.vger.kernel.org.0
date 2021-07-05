Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791D33BB753
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 08:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhGEGwp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 02:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhGEGwn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 02:52:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D370DC061574
        for <linux-i2c@vger.kernel.org>; Sun,  4 Jul 2021 23:50:06 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m0IPx-0000W8-T5; Mon, 05 Jul 2021 08:49:21 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m0IPq-0003Kv-Ry; Mon, 05 Jul 2021 08:49:14 +0200
Date:   Mon, 5 Jul 2021 08:49:14 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     cl@rock-chips.com, thierry.reding@gmail.com, robh+dt@kernel.org,
        heiko@sntech.de
Cc:     jagan@amarulasolutions.com, wens@csie.org, uwe@kleine-koenig.org,
        mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org,
        lee.jones@linaro.org, linux-pwm@vger.kernel.org
Subject: Re: [RESEND PATCH v5 1/4] dt-bindings: pwm: rockchip: add
 description for rk3568
Message-ID: <20210705064914.o2neaiwqndjfdyqd@pengutronix.de>
References: <20210622020517.13100-1-cl@rock-chips.com>
 <20210623021303.28015-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h77ynqqu64e6evvv"
Content-Disposition: inline
In-Reply-To: <20210623021303.28015-1-cl@rock-chips.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--h77ynqqu64e6evvv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 10:13:03AM +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
>=20
> add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> a rk3568 platform to pwm-rockchip.yaml.

Looks good to me

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Who is supposed to apply this patch? Does this need blessing by Rob?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--h77ynqqu64e6evvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDiq2IACgkQwfwUeK3K
7Alswgf/S2t8Y0UpADbCraly5vO0IlgBk3eruOuhWsPvl4ytixaHcF2m/IXzJn1F
CTm3Q4Fa8c5K6/tiVQR+LacMzobKgCaFmf5LLNUrhYggBjAgHEPXbuJc4BOUsGfv
GLAQyRKHIUNeGdAc/Gw89sg5f20ieHij6kcgcpvGg5nhXx4r2m020hIToIbiD17u
W+7LrS+IhuELk+mgkauwKBVpjyJ5r9pN5U7UWYPwCZPeF1FPQkTQaNRA2B3Q+7A0
5IYkmJrv53afyC/XzA4/kGwsbGrwdeInvSCmCWnb8BarKh0hERXgSQvBEn9KU/XV
utWTTaMgclkWJIJluRaO4dTAmRjkjQ==
=oHYF
-----END PGP SIGNATURE-----

--h77ynqqu64e6evvv--
