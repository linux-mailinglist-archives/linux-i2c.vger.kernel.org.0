Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352CC55EF2D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 22:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbiF1UUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 16:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbiF1UT4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 16:19:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FE8201B3
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jun 2022 13:15:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6Hcf-0000tr-77; Tue, 28 Jun 2022 22:15:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6Hca-003Gkp-55; Tue, 28 Jun 2022 22:15:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6Hcc-001kt3-Tf; Tue, 28 Jun 2022 22:15:42 +0200
Date:   Tue, 28 Jun 2022 22:15:39 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/6] gpio: pca953x: Make platform teardown callback
 return void
Message-ID: <20220628201539.lm6sdkpqu23cnas5@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-6-u.kleine-koenig@pengutronix.de>
 <CAHp75VeqAxPjL9vhY9nL5U0Np=+Ysq2E-fQEdgUgrd-_6jcHVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p3ojebodrntmjpz2"
Content-Disposition: inline
In-Reply-To: <CAHp75VeqAxPjL9vhY9nL5U0Np=+Ysq2E-fQEdgUgrd-_6jcHVQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p3ojebodrntmjpz2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 09:09:09PM +0200, Andy Shevchenko wrote:
> On Tue, Jun 28, 2022 at 4:04 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > All platforms that provide a teardown callback return 0. New users are
> > supposed to not make use of platform support, so there is no
> > functionality lost.
> >
> > This patch is a preparation for making i2c remove callbacks return void.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > Forwarded: id:20220502170555.51183-1-u.kleine-koenig@pengutronix.de
>=20
> What is this tag for? Has it been documented?

No, this is a note to myself and wasn't intended to be sent out.

> However, I prefer to see dropping those callbacks altogether (find the
> way how to use GPIO descriptors / GPIO table / etc instead of ugly
> custom callbacks).

Agreed, but I didn't feel to sort out what happens there. Also I don't
have any of these platforms to test. So I chose the more conservative
approach.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--p3ojebodrntmjpz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK7YWgACgkQwfwUeK3K
7AmPFgf/enbRQLnZV9KDyXiIThcqUdt17zK+oi09lPHiB71xIBmn6pVxix6BK+fd
mHUbmL5r1631CsMxrdTDwJpi6NetBDhcaRTjES+3u7vvvUOYYLU0W7XdBXp9+5SM
LsXhZ0dCWAHUnQ4JSu/C92dd8kkjLtkNwX2eFmGq/2oGW/M5wW92w1UTzpCpu4oz
cHYTGMEc5e2T+Ml9xwcx5ME8bCZhTnhcKS4ddCCgwqXq1raU2LCdEF6KYFRz+uuJ
qtMOFo+R2IQFEx+tmyRvtsDsiFX0a8cBPzdbUuESvMkJDH79edZwHpomco3UucAA
Dos2pxSxB0sXFEWtbwyp17KwLbYZGQ==
=ALYf
-----END PGP SIGNATURE-----

--p3ojebodrntmjpz2--
