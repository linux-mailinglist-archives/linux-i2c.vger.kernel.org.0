Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404E96441BA
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 12:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbiLFLAT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 06:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiLFK7k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 05:59:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0CC24F00
        for <linux-i2c@vger.kernel.org>; Tue,  6 Dec 2022 02:59:17 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2VfK-0005ym-O2; Tue, 06 Dec 2022 11:59:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2VfJ-002fzi-29; Tue, 06 Dec 2022 11:59:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2VfI-0030Pn-WD; Tue, 06 Dec 2022 11:59:09 +0100
Date:   Tue, 6 Dec 2022 11:59:08 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <20221206105908.jzcdnast3yw22eel@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hvvxc4ne753xzl2h"
Content-Disposition: inline
In-Reply-To: <Y3usiUm1K+5xCWhY@google.com>
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


--hvvxc4ne753xzl2h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lee,

On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> On Mon, 21 Nov 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > Hello Lee,
> >=20
> > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > >=20
> > > > The probe function doesn't make use of the i2c_device_id * paramete=
r so it
> > > > can be trivially converted.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > ---
> > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >=20
> > > After a week or so, please collect-up all the tags you have received
> > > and submit a per-subsystem set for me to hoover up, thanks.
> >=20
> > For mfd I'd do:
> >=20
> > 	git checkout mfd/for-next
> > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > 	git send-email --to .... --cc .... mfd/for-next
>=20
> That's just crazy enough to work.
>=20
> Thanks for the tip.

On irc you said you'd care for application of these patches ("I plan to
attempt the b4 solution"), they didn't land in next yet. Do you need a
reminder? Something else?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hvvxc4ne753xzl2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOPIHkACgkQwfwUeK3K
7AmjoQf/R+Cz88Y6JYJaJNiuO2BsSVbordLmmvYb2tbJ7oPvvlbQHPNrsbAJM5Tj
w3pD7D1b1cWANAudg2jXWP62kOP2TSisMBDipdXp0WpCMx2iCCd4cb6FbRCNu9Us
hgqJY/MjNglBbmo3fYVt/aA+k4IJDN/LywG5ADmHA/tWpGrSNcDv79dnoG06FD83
4GLB+Pap3eaS5iYD7x7g/JKBi6SFlyYv0zs7tFTJ4E3+M80gYqMKrqE9rWsJ6HQN
whwLW1MXg5hXyZgx3zrBahCCtoMclmMamZYo6YCsK5NsJlFd3RmrD0oAmTN9+Ukw
h1V49+VNTFz/84aK29CnYgi82dZmuA==
=uRDQ
-----END PGP SIGNATURE-----

--hvvxc4ne753xzl2h--
