Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69129642C54
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 16:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbiLEP4z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 10:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiLEP4w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 10:56:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C27213E92
        for <linux-i2c@vger.kernel.org>; Mon,  5 Dec 2022 07:56:52 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2Dpi-00011Z-NZ; Mon, 05 Dec 2022 16:56:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2Dpf-002VLp-O6; Mon, 05 Dec 2022 16:56:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2Dpf-002oje-K2; Mon, 05 Dec 2022 16:56:39 +0100
Date:   Mon, 5 Dec 2022 16:56:39 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 047/606] i2c: mux: pca9541: Convert to i2c's .probe_new()
Message-ID: <20221205155639.4dgyoiafmmn5xehp@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-48-uwe@kleine-koenig.org>
 <Y4296PEnzgtNyAo6@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ucoddo5mjexf4xpk"
Content-Disposition: inline
In-Reply-To: <Y4296PEnzgtNyAo6@ninjato>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ucoddo5mjexf4xpk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 10:46:16AM +0100, Wolfram Sang wrote:
> On Fri, Nov 18, 2022 at 11:36:21PM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Found an older patch doing the same, but still thanks!

Yeah, sorry for the duplicates. I started on mainline instead of next +
my patchstack when creating this series.

Thanks for picking these up
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ucoddo5mjexf4xpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOOFLQACgkQwfwUeK3K
7AnKKwf+LhM5BfMzD9oZF6YPSQv53xEbXW0QpUnyDugIGUxa4hRvNfqMXBHPWKGv
sAjM215hlWhdC/d1tAmf1Pr/Xer3W6LWsGU+1hReP/xqetBV6tYVBLFrgCCJuvGf
KapQZXY2l0RIDsEPdGdMdKUTXho5FOk6jQnSEUkXnbxtMnclOr2Gjgs8J/ocibK/
IWHZAxNTw+rFp19hSv5+rm4jnu8MBc+7tdsXabrQ8ptbBxYsRUduaCRKQmVG0Cep
6oSqpCUa+dITqJ+C4Uybq8hQHHtvBeelVZA9/J6v+knK7TW4jzSsAlV/b8F7BExF
S7RBwelxYwrzg3/7KCgcsiIHVCCN3A==
=Gy7X
-----END PGP SIGNATURE-----

--ucoddo5mjexf4xpk--
