Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93906547FD
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Dec 2022 22:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiLVVmi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 16:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiLVVmh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 16:42:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D50527B16
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 13:42:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8TKd-00074A-KK; Thu, 22 Dec 2022 22:42:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8TKc-0015j5-Mh; Thu, 22 Dec 2022 22:42:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8TKb-007DIZ-Og; Thu, 22 Dec 2022 22:42:25 +0100
Date:   Thu, 22 Dec 2022 22:42:25 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 288/606] leds: turris-omnia: Convert to i2c's .probe_new()
Message-ID: <20221222214225.xed7qi5c5ksjylho@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-289-uwe@kleine-koenig.org>
 <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kbwsbwzrwqgq54kb"
Content-Disposition: inline
In-Reply-To: <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
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


--kbwsbwzrwqgq54kb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Fri, Dec 02, 2022 at 12:12:21PM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 18, 2022 at 11:40:22PM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I didn't get any feedback from your side about this patch set.
>=20
> In case the problem is "only" to get the led patches out of this
> series, I recommend:
>=20
> 	b4 am -l -s -P268-288 20221118224540.619276-1-uwe@kleine-koenig.org

Still no feedback. A big part of the series was applied to the various
trees, but the led patches are not. :-\ Would be great if you queued
them for next after the merge window closed. (Or if you have concerns,
speak up.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kbwsbwzrwqgq54kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOkzz4ACgkQwfwUeK3K
7Am1QAf/Si9QsFZjQ6p5QtJDazGpD1l6mLuH13MzpGBvGGXeKn6S5KsB0hm3tGzJ
6C37LSfwthXLab9LRs3GnMGkYklsRvur1qHWCmQ474DtW9WjCFpt1L80+LtZ4+YQ
j0Bn3C/SKMMKtMzsb0F6R12bUi++DdIWEX493oOKm+YRxJH9lmiFlGARPExcC3+m
l9wUboNXjvXiUm6PgD/qWnztgeqGiqbDyainqSm/FqUyXDXqrvQwjO4ThdKnUJ9S
+NlZpJ7JQ9RIqToaI7uPkQ20O3B+0Rwr4JHggRRSw3zrsN2eUm2ODZZKRJX9no9J
jpHw+uP5x5mzOeQphHgfgTOb2xcq0w==
=4E4Z
-----END PGP SIGNATURE-----

--kbwsbwzrwqgq54kb--
