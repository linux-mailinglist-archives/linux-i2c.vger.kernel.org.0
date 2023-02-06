Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C10568C233
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 16:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjBFPvM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 10:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBFPvL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 10:51:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F1A6589
        for <linux-i2c@vger.kernel.org>; Mon,  6 Feb 2023 07:51:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP3ls-0001ay-Nv; Mon, 06 Feb 2023 16:51:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP3lq-0035nw-RB; Mon, 06 Feb 2023 16:51:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pP3lr-001KRz-2k; Mon, 06 Feb 2023 16:51:07 +0100
Date:   Mon, 6 Feb 2023 16:51:07 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <20230206155107.qwf5tbrqsbvv4hln@pengutronix.de>
References: <20230118134940.240102-1-brgl@bgdev.pl>
 <Y9DpbChLZfDONHPz@ninjato>
 <Y9GpL9RBNM8H2ZSL@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ol763elobegcycbx"
Content-Disposition: inline
In-Reply-To: <Y9GpL9RBNM8H2ZSL@shikoro>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URI_DOTEDU autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ol763elobegcycbx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

ah, this is the mail I missed before.

On Wed, Jan 25, 2023 at 11:11:59PM +0100, Wolfram Sang wrote:
>=20
> > So, this code handled all my stress-testing well so far. I'll try to
> > think of some more ideas until this evening, but likely I will apply it
> > later. Nonetheless, more review eyes are still welcome!
>=20
> Ah yes, I now recalled why I had the gut feeling that this solution is
> not complete. See this mail thread from 2015:
>=20
> https://lkml.iu.edu/hypermail/linux/kernel/1501.2/01700.html
>=20
> There are still drivers using i2c_del_adapter()+kfree(), so removing the
> completion could cause use-after-free there, or?

There is also a strange construct in spi that I understand at one point
in time, but I failed to swap it in quickly. It's about commit
794aaf01444d4e765e2b067cba01cc69c1c68ed9. I think there should be a
nicer solution than to track if the controller was allocated using devm,
but I don't remember the details. But before addressing the i2c problem
it might be worth to invest some time into that spi issue to not make
the same mistake for i2c.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ol763elobegcycbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPhId4ACgkQwfwUeK3K
7AmVZAgAl3Faq9I+XvDqrdflU2pn5514NuWK8YOXY2AZDQ6EWYK9+qv/U1nf6+cS
rvmqPv/0yoQ/MGcVOPY1dFnPMCRyjgt/dC75VYP0qBOFaJ4xm/xvHKV9QTmsDLhN
+vkwKMAUZkKW/MbIL+rjril1w+GuFhrFp0RoCM4NXF3t+Jo0XwRn3JE/lwvSBL+c
0SS1w1LykId2Wo6tTSqP9U54OnCc0QiYJ5WyjD+HXmAB0oWx6ZOvx27zNr+0HPSn
XcTyDTPiBgu8ssss4xyWMGqTGvaBtv2P3nncO8GZsC0ejpWYVd63aJTngB1zwY00
ugxdHWQpnYOIpiPbE9PipLyu3PEHBQ==
=quCD
-----END PGP SIGNATURE-----

--ol763elobegcycbx--
