Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210BB64420C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 12:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbiLFLYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 06:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbiLFLYE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 06:24:04 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF0C27934
        for <linux-i2c@vger.kernel.org>; Tue,  6 Dec 2022 03:23:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2W38-0001av-0n; Tue, 06 Dec 2022 12:23:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2W36-002gTW-7h; Tue, 06 Dec 2022 12:23:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2W35-0030yd-U1; Tue, 06 Dec 2022 12:23:43 +0100
Date:   Tue, 6 Dec 2022 12:23:43 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 132/606] iio: light: max44009: Convert to i2c's
 .probe_new()
Message-ID: <20221206112343.no64esqurdozwuqo@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-133-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ygtnf37jzf6rhatj"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-133-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ygtnf37jzf6rhatj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jonathan,

On Fri, Nov 18, 2022 at 11:37:46PM +0100, Uwe Kleine-K=F6nig wrote:
>  drivers/iio/light/max44009.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

all iio patches from my series but this one are applied in next now. I
wonder what happend to that one, my best guess is that this patch was
dropped by accident?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ygtnf37jzf6rhatj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOPJjwACgkQwfwUeK3K
7Ak9nQf/blRXvHALR/PNIrvRqIiMs9KCA81D690ImfGf+YVZ85mt9V/SnAHQNaLv
4LpzuxS0pKNXjRzwt6sYDVVXHmX1836Ix+4LSnuY0CCDXxgk3Scrlc25QpwKJWxO
OaQYaFp3MK3VCoaAXsk0KfIPn+vnN7mUJDj4W2r9FgHWGzMUyxQc4KxiwLEy7WJW
XNOY6zvmiVDyCxamnfdXfiGOn8T2I5J5VfklFSkPrVfeGmundNyQNach43XKe5F1
0dmt6h1tGPP05dw/DKxxqpEbRk2hqbrAZHG3KbG8aMjmCNWd59L/U3enHMVs59b7
ED2/s/jNFYvfjxqqUnSEJoVxDd9SlQ==
=ropm
-----END PGP SIGNATURE-----

--ygtnf37jzf6rhatj--
