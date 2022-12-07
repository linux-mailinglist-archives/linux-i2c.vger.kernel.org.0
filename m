Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407B2645872
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 12:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiLGLBR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 06:01:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbiLGLAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 06:00:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBB327156
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 03:00:20 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2s9u-0008Pa-3n; Wed, 07 Dec 2022 12:00:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2s9r-002tug-O9; Wed, 07 Dec 2022 12:00:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2s9o-003GNG-TY; Wed, 07 Dec 2022 12:00:09 +0100
Date:   Wed, 7 Dec 2022 12:00:07 +0100
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
Message-ID: <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
 <Y490W6k4N8iBxLHf@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hofgvycto33rels6"
Content-Disposition: inline
In-Reply-To: <Y490W6k4N8iBxLHf@google.com>
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


--hofgvycto33rels6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Tue, Dec 06, 2022 at 04:56:59PM +0000, Lee Jones wrote:
> > On Tue, Dec 06, 2022 at 04:10:51PM +0000, Lee Jones wrote:
> > > On Tue, 06 Dec 2022, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > > Hey Lee,
> > > >=20
> > > > On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> > > > > On Mon, 21 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > > > >=20
> > > > > > Hello Lee,
> > > > > >=20
> > > > > > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > > > > > On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > > > > > >=20
> > > > > > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > > > > >=20
> > > > > > > > The probe function doesn't make use of the i2c_device_id * =
parameter so it
> > > > > > > > can be trivially converted.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutro=
nix.de>
> > > > > > > > ---
> > > > > > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > > >=20
> > > > > > > After a week or so, please collect-up all the tags you have r=
eceived
> > > > > > > and submit a per-subsystem set for me to hoover up, thanks.
> > > > > >=20
> > > > > > For mfd I'd do:
> > > > > >=20
> > > > > > 	git checkout mfd/for-next
> > > > > > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > > > > > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new=
=2Embx
> > > > > > 	git send-email --to .... --cc .... mfd/for-next
> > > > >=20
> > > > > That's just crazy enough to work.
> > > > >=20
> > > > > Thanks for the tip.
> > > >=20
> > > > On irc you said you'd care for application of these patches ("I pla=
n to
> > > > attempt the b4 solution"), they didn't land in next yet. Do you nee=
d a
> > > > reminder? Something else?
> > >=20
> > > I applied them, but they fail to build and I haven't had time to
> > > investigate.  I guess they depend on some patches that have been
> > > accepted into another (input?) and are now in -next.  Any idea if they
> > > are available on some immutable branch that I can pull from?
> >=20
> > If in your tree i2c_client_get_device_id() is missing, you want to pull
> >=20
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/clie=
nt_device_id_helper-immutable
>=20
> Ideal, thanks.

I see you added my commits to your tree now, however there is a problem:

  $ git log --oneline --graph --boundary linus/master..FETCH_HEAD
  ...
  *   7281458f4396 Merge branches 'ib-i2c-mfd-client_dev_id_helper-6.2' and=
 'ib-mfd-uwes-i2c-probe_new-6.2' into ibs-for-mfd-merged
  |\ =20
  | * c066a1632bc3 mfd: wm8994-core: Convert to i2c's .probe_new()
  | * 0f22cf00762d mfd: wm8400-core: Convert to i2c's .probe_new()
  | * 090f49b250ee mfd: wm8350-i2c: Convert to i2c's .probe_new()
  | * 7174af1be41d mfd: wm831x-i2c: Convert to i2c's .probe_new()
  | ...
  | * 63909fec136e mfd: adp5520: Convert to i2c's .probe_new()
  | * 549d4f3207f8 mfd: act8945a: Convert to i2c's .probe_new()
  | * 623f79babaf1 mfd: aat2870-core: Convert to i2c's .probe_new()
  | * ce41e4ae7cac mfd: 88pm805: Convert to i2c's .probe_new()
  | * 02aa483f1f98 mfd: 88pm800: Convert to i2c's .probe_new()
  * | 662233731d66 i2c: core: Introduce i2c_client_get_device_id helper fun=
ction
  |/
  o 9abf2313adc1 (tag: v6.1-rc1) Linux 6.1-rc1

That means that the commit introducing i2c_client_get_device_id() isn't
an ancestor of the commits that make use of the new function. So
63909fec136e (which is the first commit making use of the new function)
likely won't compile:

	$ git grep i2c_client_get_device_id 63909fec136e
	63909fec136e:drivers/mfd/adp5520.c:     const struct i2c_device_id *id =3D=
 i2c_client_get_device_id(client);

Starting with 7281458f4396 everything is fine again, but still this
hurts a bisection.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hofgvycto33rels6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOQcjQACgkQwfwUeK3K
7AmnXQf+JBTwXlgudhX4rD9hpZef8Y+s9wI4l1NLyop37v2yPigu+AkHwxhMfsvy
N7SGBQpXPMkg0FQywv8X81E8b4RrkotvSb2TUg4r1FwUM7XRs/lQeHqf03knyLjC
W63dQsLq98w6wurqNl64JrKsi2dYQOZHg4wEkwBV/ZDUA5C0ybLS8JEr0L9HpbC5
dZ9s0y/GhqO7YERH0P/ldTWNT5J2+eLdUKraL23O4jNFZi2HX6eLNJIoozZsADSB
C+fXjval/tCqNUKSP0tGsvKCVbYkZrQoM9uuaF/5V6dWBDoIzEHaM7oJuE9V1LAX
39MwM/ogCq1L1RHs85PtuRVPwZpG+A==
=IN5C
-----END PGP SIGNATURE-----

--hofgvycto33rels6--
