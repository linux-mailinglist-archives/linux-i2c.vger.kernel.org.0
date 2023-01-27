Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DE467E1B1
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 11:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbjA0Kcl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 05:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjA0Kck (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 05:32:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085A077DCF
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 02:32:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLM1j-0002YC-7L; Fri, 27 Jan 2023 11:32:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLM1g-000lOQ-R1; Fri, 27 Jan 2023 11:32:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLM1f-00GGyF-1K; Fri, 27 Jan 2023 11:32:07 +0100
Date:   Fri, 27 Jan 2023 11:32:04 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 596/606] watchdog: ziirave_wdt: Convert to i2c's
 .probe_new()
Message-ID: <20230127103204.t3k53rqaygxdlvyl@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-597-uwe@kleine-koenig.org>
 <20221118225747.GF686528@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ixntberfnebndc6r"
Content-Disposition: inline
In-Reply-To: <20221118225747.GF686528@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ixntberfnebndc6r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 18, 2022 at 02:57:47PM -0800, Guenter Roeck wrote:
> On Fri, Nov 18, 2022 at 11:45:30PM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

This patch hasn't made it into next yet. Is it still on your radar?

My plans for this series is to complete the conversion after the next
merge window which should include most patches from this series.

So I ask you to either take this patch during the next merge window or
accept that it will be applied together with the i2c core conversion
that drops .probe() with the i2c_device_id parameter.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ixntberfnebndc6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPTqCAACgkQwfwUeK3K
7AlcHAf/c8PSrnAE7LbfWC7iyj5a9yPrCJwnVkJbDTtTfEio99x974hP6bmdO4Qj
lbiC3IBkE6zVlleC1A5B1+ODLo0DAP36uAGisB3wdMgg6HOeVsXG579OnFe0HHEv
aO2alrl+c3TQ/UOfWwmkp9/AJ8zFih4S797lMVpFdeGuP7ONRFxcTAkUoRPaKkij
R7cNOnnwTVzLd0j8hjpL0i37cuzuBqlHM6NkAMoPykt/6PCR3pvG57GItHjMc4GL
vdYSDf759o1tEowv5ptnBtFvxTRQNHNLvXbl8jwwkafNnOHUkAyzby2gJfoH3cMP
+jNsUEYyAMDpxGogmjYVLOMXozE4Wg==
=OArg
-----END PGP SIGNATURE-----

--ixntberfnebndc6r--
