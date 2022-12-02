Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5FD640548
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 11:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbiLBKxy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Dec 2022 05:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233375AbiLBKxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Dec 2022 05:53:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8207E85669
        for <linux-i2c@vger.kernel.org>; Fri,  2 Dec 2022 02:52:53 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p13eg-0004YW-0w; Fri, 02 Dec 2022 11:52:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p13ed-001mWF-Pm; Fri, 02 Dec 2022 11:52:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p13ed-0021O6-Sr; Fri, 02 Dec 2022 11:52:27 +0100
Date:   Fri, 2 Dec 2022 11:52:27 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 192/606] Input: adp5588-keys - Convert to i2c's
 .probe_new()
Message-ID: <20221202105227.r3qhia3lgd6ee765@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-193-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4u56ty2gk3gztmkf"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-193-uwe@kleine-koenig.org>
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


--4u56ty2gk3gztmkf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Fri, Nov 18, 2022 at 11:38:46PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I didn't get any feedback from your side about this patch set.

In case the problem is "only" to get the input patches out of this
series, I recommend:

	b4 am -l -s -P191-267 20221118224540.619276-1-uwe@kleine-koenig.org

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4u56ty2gk3gztmkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOJ2OYACgkQwfwUeK3K
7AmuDwf9EU/c8aaqKZsgGGXKTOEM0T7yn1l4lrVm0DFY+GsrW8FkLcAQ9pc1mSNM
nhiDEokbAYDh57HLw6jQA3lIpvFoeSJjotPnovyL7ig+9P3AkQGcDWufc4b/8snM
D5RjDfTHKq/vwJpUwGmQ6xx07RO2Gpos8cQBF+3ZGMebmar3pPdLundZenT9ZEu0
RW+OIMjCmebqLEWA4W+EUHO1KGjOWhzuFdwrPFfxYxfLZeGNLk9Bn4hOpdw88nPt
8919PiRx5WRM/W7Mel84lprIRybvBS6SJ7nkM1GWlkxO2ddQV9GHyk/Np6HKqsSY
1dBpiKKoyIaPN4FdmF8fTjE2INwm8w==
=NmZX
-----END PGP SIGNATURE-----

--4u56ty2gk3gztmkf--
