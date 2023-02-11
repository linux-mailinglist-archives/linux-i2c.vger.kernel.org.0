Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4AE69348F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 00:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjBKXBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Feb 2023 18:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBKXBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Feb 2023 18:01:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B971710
        for <linux-i2c@vger.kernel.org>; Sat, 11 Feb 2023 15:01:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQysC-000178-6g; Sun, 12 Feb 2023 00:01:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQys8-004J11-DQ; Sun, 12 Feb 2023 00:01:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQys8-002mBY-S5; Sun, 12 Feb 2023 00:01:32 +0100
Date:   Sun, 12 Feb 2023 00:01:27 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 596/606] watchdog: ziirave_wdt: Convert to i2c's
 .probe_new()
Message-ID: <20230211230127.gsaixwtfd6squ7ce@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-597-uwe@kleine-koenig.org>
 <20221118225747.GF686528@roeck-us.net>
 <20230127103204.t3k53rqaygxdlvyl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wmhymxh6nxqskys3"
Content-Disposition: inline
In-Reply-To: <20230127103204.t3k53rqaygxdlvyl@pengutronix.de>
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


--wmhymxh6nxqskys3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jan 27, 2023 at 11:32:04AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 18, 2022 at 02:57:47PM -0800, Guenter Roeck wrote:
> > On Fri, Nov 18, 2022 at 11:45:30PM +0100, Uwe Kleine-K=F6nig wrote:
> > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > The probe function doesn't make use of the i2c_device_id * parameter =
so it
> > > can be trivially converted.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>=20
> This patch hasn't made it into next yet. Is it still on your radar?
>=20
> My plans for this series is to complete the conversion after the next
> merge window which should include most patches from this series.
>=20
> So I ask you to either take this patch during the next merge window or
> accept that it will be applied together with the i2c core conversion
> that drops .probe() with the i2c_device_id parameter.

This got Guenter's R-b tag twice now, but the patch didn't appear yet in
next. I'll prepare a series for Wolfram to apply via his i2c tree based
on what is in next during the merge window with the idea to get the
change early into next with an immutable tag. If you get this patch in
during the merge window that would be ideal, but if not, I will take
care of it and as announced will send it together with the i2c change.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wmhymxh6nxqskys3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPoHkQACgkQwfwUeK3K
7AnIDgf/fHKAF8C1Wm4rkkljsA+gi7jbIkRi9VEYkM7wGVUGwvd3pD5V1PVReja4
N0GGdW9sIRVRvNYLCHtQgm71/y9KN2oy+UXnQNEP4NkJa3lkk+FXQvrXLVIQMeLm
7n5xcixeddfX2foFmNYu8Bu/J+E9/KlvQfRJMPw1FOYmuNdxGCRVAmcsRLsYg+ES
+Z9ujYWt6SXDxERt5OcLGVO+Ff3LUIZhljrUm+i79Iu22LDjA7WWyoYa+R/BxJG4
aAvNHh6Fx3zfQoGq6WgQvegfwr7U2aX6JASEKayp6aTeZIWS2G91KYJtKP3EffEs
xb3dDBMyF+VrQvuNCultn75FKXcFQw==
=UZCd
-----END PGP SIGNATURE-----

--wmhymxh6nxqskys3--
