Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F92654829
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Dec 2022 23:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiLVWDc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 17:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbiLVWD3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 17:03:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7714DEFE
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 14:03:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8Ten-0000SO-8j; Thu, 22 Dec 2022 23:03:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8Tel-0015md-46; Thu, 22 Dec 2022 23:03:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8Tek-007DlZ-By; Thu, 22 Dec 2022 23:03:14 +0100
Date:   Thu, 22 Dec 2022 23:03:14 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Corey Minyard <cminyard@mvista.com>,
        Petr Machata <petrm@nvidia.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 304/606] media: dvb-frontends/dvb-pll: Convert to i2c's
 .probe_new()
Message-ID: <20221222220314.lygfdyawowbwsudv@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-305-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tpwvpvzahlnwe6nl"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-305-uwe@kleine-koenig.org>
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


--tpwvpvzahlnwe6nl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 18, 2022 at 11:40:38PM +0100, Uwe Kleine-K=F6nig wrote:
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

A part of the media patches in this series were applied by Hans in the
current merge window. I think it's the part of the patches that don't
depend on i2c_client_get_device_id().

Now that the function is available in Linus' tree (commit 662233731d66
("i2c: core: Introduce i2c_client_get_device_id helper function")), it
would be great if you picked the remaining patches for the next merge
window. You can use e.g.

	b4 am -l -P 304,308,309,320,328,332,340,342,349,351,355,360,368,369,374,38=
1,382,390,407 20221118224540.619276-1-uwe@kleine-koenig.org

to achieve that.

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tpwvpvzahlnwe6nl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOk1BwACgkQwfwUeK3K
7AnpFQgAisk75FImzX10EQmVXYIt+nPqwvJDZOg+he2D35o3p4wPPTtf4ldA0k2F
CJaI2giKRG+c8EcspeI04/YXGJdMw1MQBVHFZn1pE4ogeLyuekojZy+2ysKBkvhi
UBT9yoN4k5WCbE5V7raazIBO0hBM2z2O50oPCXfjqOisnVrRLhEwGD7wFsIFVPQ9
EOFz9Ay92W2plb33NUxUhd3Kam4coiXBz90oraIWlRJA5u0klQGJRB1+l7Uf93gL
sDKBgO7nRP7uOZQSwRnqcpWKgfJsXge4Tp4d/XIl7uFsejjjQ5NaMZsrNGQ0HJD2
rD1nDwmjLwsWHRYXuX1VjmftKWSP3w==
=62Jw
-----END PGP SIGNATURE-----

--tpwvpvzahlnwe6nl--
