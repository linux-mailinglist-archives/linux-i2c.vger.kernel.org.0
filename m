Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E585F640589
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 12:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbiLBLMi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Dec 2022 06:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiLBLMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Dec 2022 06:12:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3E260E5
        for <linux-i2c@vger.kernel.org>; Fri,  2 Dec 2022 03:12:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p13xv-0008Bz-78; Fri, 02 Dec 2022 12:12:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p13xt-001maX-8B; Fri, 02 Dec 2022 12:12:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p13xt-0021qp-5V; Fri, 02 Dec 2022 12:12:21 +0100
Date:   Fri, 2 Dec 2022 12:12:21 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 288/606] leds: turris-omnia: Convert to i2c's .probe_new()
Message-ID: <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-289-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fa7mmlvm437yiure"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-289-uwe@kleine-koenig.org>
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


--fa7mmlvm437yiure
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Fri, Nov 18, 2022 at 11:40:22PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I didn't get any feedback from your side about this patch set.

In case the problem is "only" to get the led patches out of this
series, I recommend:

	b4 am -l -s -P268-288 20221118224540.619276-1-uwe@kleine-koenig.org

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fa7mmlvm437yiure
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOJ3ZEACgkQwfwUeK3K
7AnKngf9GBKD2FJTsoIxVtNAqIxb7XJiF2rkhbmOFAf4wwfvpzkSHYe5AJMSmejH
HLi+8RdUhvk1vKCpp8QJkvQ1y6UxrGhc+KiLIeyjcREm0m4ozrU27h/H0DZo1coM
CY31crVxSNO9Rz1cCwO6q4ZvAZeH+1mbrPng0/NwVuH8k8ak/GypqdXvNAqi6crQ
ApHC00x3uMGjdy3lNV+CKZYXh7nsM4Q66h6zjYjK0M9NzJ8MtBPFEWuUwo0m/MDj
ANEpNtEj9/Fj9BdzP5UJHM9dDNACPJhEb7SIVyvbMVCGAZzYHjKwF/5FfBhk2g7I
KUyBBgCapX8b0/BZB0cfVWUT02N/PQ==
=pEKn
-----END PGP SIGNATURE-----

--fa7mmlvm437yiure--
