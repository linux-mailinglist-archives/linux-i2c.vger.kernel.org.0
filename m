Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4056469E0
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 08:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiLHHvW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 02:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiLHHvU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 02:51:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A405C3FB8B
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 23:51:19 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p3BgU-0003Dz-SH; Thu, 08 Dec 2022 08:51:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p3BgS-0035oC-HE; Thu, 08 Dec 2022 08:51:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p3BgS-003TQ0-ML; Thu, 08 Dec 2022 08:51:08 +0100
Date:   Thu, 8 Dec 2022 08:51:02 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 288/606] leds: turris-omnia: Convert to i2c's .probe_new()
Message-ID: <20221208075102.qumdzncjglpdrq35@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-289-uwe@kleine-koenig.org>
 <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
 <Y5D34yLLJ+d7sDbi@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p7efjmlg2zhegoce"
Content-Disposition: inline
In-Reply-To: <Y5D34yLLJ+d7sDbi@duo.ucw.cz>
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


--p7efjmlg2zhegoce
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

On Wed, Dec 07, 2022 at 09:30:27PM +0100, Pavel Machek wrote:
> > On Fri, Nov 18, 2022 at 11:40:22PM +0100, Uwe Kleine-K=F6nig wrote:
> > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > The probe function doesn't make use of the i2c_device_id * parameter =
so it
> > > can be trivially converted.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > I didn't get any feedback from your side about this patch set.
> >=20
> > In case the problem is "only" to get the led patches out of this
> > series, I recommend:
> >=20
> > 	b4 am -l -s -P268-288 20221118224540.619276-1-uwe@kleine-koenig.org
>=20
> Yeah, well, I guess:
>=20
> # A part of the patches depend on commit 662233731d66 ("i2c: core:
> # Introduce i2c_client_get_device_id helper function"), there is a branch=
 that
> # you can pull into your tree to get it:
>=20
> this is a bit of a problem because Linus will be unhappy if I pull
> into my for-next branch.

I wonder if it's you or me who has a wrong expectation about Linus here.
IIUC he is unhappy if you pull some random tree (e.g. his own) for no
better reason than to update, but an immutable tag/branch to get a
dependency right should be fine. That's the whole idea about immutable
tags and branches, isn't it?

Looking at today's next, there are several merges of this immutable branch:

 - 3d94887aca09 ("Merge branch 'i2c/client_device_id_helper-immutable' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into next")
   by Dmitry Torokhov for branch 'next' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/dtor/input.git
 - 719c547c6551 ("Merge branch 'i2c/client_device_id_helper-immutable' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux")
   by Herbert Xu for branch 'master' of git://git.kernel.org/pub/scm/linux/=
kernel/git/herbert/cryptodev-2.6.git
 - 963c7fe6cdbf ("Merge branch i2c/client_device_id_helper-immutable of wsa=
/linux into next")
   by Michael Ellerman for branch 'next' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/powerpc/linux.git
 - 06fa87fc9311 ("Merge branch 'i2c/client_device_id_helper-immutable' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into gpio/for-next=
")
   by Bartosz Golaszewski for branch 'gpio/for-next' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/brgl/linux.git
 - 2f88b7050d67 ("Merge 'i2c/client_device_id_helper-immutable'")
   by Sebastian Reichel for branch 'for-next' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/sre/linux-power-supply.git
 - b15654dd11e6 ("Merge remote-tracking branch 'i2c/i2c/client_device_id_he=
lper-immutable' into togreg")
   by Jonathan Cameron for branch 'char-misc-next' of git://git.kernel.org/=
pub/scm/linux/kernel/git/gregkh/char-misc.git
 - 149f52664bb3 ("Merge branch 'i2c/client_device_id_helper-immutable' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into regulator-6.2=
")
   by Mark Brown for branch 'for-next' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/broonie/regulator.git
 - e0c7800a5530 ("Merge branch 'i2c/client_device_id_helper-immutable' into=
 i2c/for-mergewindow")
   by Wolfram Sang for branch 'i2c/for-next' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/wsa/linux.git
 - 4cb55a9a1ab7 ("Merge branch 'i2c/client_device_id_helper-immutable' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into HEAD")
   by Mark Brown for branch 'for-next' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/broonie/sound.git
 - c43c0e589e69 ("Merge branch 'i2c/client_device_id_helper-immutable' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux")
   by Jakub Kicinski for branch 'master' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net-next.git
 - 41948bd9cf01 ("Merge branch 'i2c/client_device_id_helper-immutable' of h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into spi-6.2")
   by Mark Brown for branch 'for-next' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/broonie/spi.git

mfd and backlight just started stacking on top of 662233731d66cf41e7494e532=
e702849c8ce18f3.

So you should be in good company at least if Linus gets angry :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--p7efjmlg2zhegoce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmORl2EACgkQwfwUeK3K
7AleJAf/UEPqNbZFQjdQN2ZGCsACyJSUDwz0MILVRHDJFmgs30JLP3JSz6KA5nul
046t7c+cQgBYXjDtBotpeKtPrzgEv+vPDfOPtj/B7SAWdMEMUZUE8BoLbOLq55RH
RlvotEUpF4vBC7uOX7G7VUsSsfqT/QbLbg3/b7CuubA1w8FYM4gI5d0Oajoc4TH5
qfLgwJfL5kkiv364sgNv6un/iDTuoKUG1py5P2ztbHndFCr1W85PnekJvJ8I8yX3
DH/JR/CWSan0+FUrG5uw8TbAhYJW36bIGE4BeLMDcIBsWGGlad337TiAXiPv5FrH
fHp96wpwbfAsUo0vdaBJ3qeTWIj3+A==
=JqHu
-----END PGP SIGNATURE-----

--p7efjmlg2zhegoce--
