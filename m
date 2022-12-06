Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B50644964
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 17:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbiLFQgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 11:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbiLFQfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 11:35:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD24B2E
        for <linux-i2c@vger.kernel.org>; Tue,  6 Dec 2022 08:35:26 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2auc-0004XL-Gn; Tue, 06 Dec 2022 17:35:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2aua-002jqL-PL; Tue, 06 Dec 2022 17:35:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2aua-0034l9-Mn; Tue, 06 Dec 2022 17:35:16 +0100
Date:   Tue, 6 Dec 2022 17:35:16 +0100
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
Message-ID: <20221206163516.i6rzewxts7do75y5@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dy4m535lwp7336za"
Content-Disposition: inline
In-Reply-To: <Y49pi54DKsvLOzvb@google.com>
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


--dy4m535lwp7336za
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2022 at 04:10:51PM +0000, Lee Jones wrote:
> On Tue, 06 Dec 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > Hey Lee,
> >=20
> > On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> > > On Mon, 21 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > >=20
> > > > Hello Lee,
> > > >=20
> > > > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > > > On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
> > > > >=20
> > > > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > > >=20
> > > > > > The probe function doesn't make use of the i2c_device_id * para=
meter so it
> > > > > > can be trivially converted.
> > > > > >=20
> > > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.=
de>
> > > > > > ---
> > > > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > After a week or so, please collect-up all the tags you have recei=
ved
> > > > > and submit a per-subsystem set for me to hoover up, thanks.
> > > >=20
> > > > For mfd I'd do:
> > > >=20
> > > > 	git checkout mfd/for-next
> > > > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > > > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > > > 	git send-email --to .... --cc .... mfd/for-next
> > >=20
> > > That's just crazy enough to work.
> > >=20
> > > Thanks for the tip.
> >=20
> > On irc you said you'd care for application of these patches ("I plan to
> > attempt the b4 solution"), they didn't land in next yet. Do you need a
> > reminder? Something else?
>=20
> I applied them, but they fail to build and I haven't had time to
> investigate.  I guess they depend on some patches that have been
> accepted into another (input?) and are now in -next.  Any idea if they
> are available on some immutable branch that I can pull from?

If in your tree i2c_client_get_device_id() is missing, you want to pull

	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_d=
evice_id_helper-immutable

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dy4m535lwp7336za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOPb0EACgkQwfwUeK3K
7AnRqAf+LxdBinNoKRDwKyG1d4vGoUEdNxDR448xVYkZ81KrXKW9ulHcHNNcx/7U
b7qyJvNhTfA//k7WoWrFOVfEXpZp7yKSriTTETQbWYV986JbtmaU6OzEIzgKAyPi
ZRSw7tPJMSrBQZa59yywjqAVL1pIbUuXkmaU8FSnPjYjkiULkb9xplydn7VPAHDY
GFK0EJAVM95cVSsuBaYV3T6dXNyKoYgKU1dVQUUlDKU/f7pxy4umQnABy5tFV61r
HLfivemcoBKWLdygJ4B79JhVMN6JPzn8ltOqq3+xDoznG8qNYUkhHGwC2IunUzTy
HDkvn8uUEqSwBqCTsJ3x3qreawsrWA==
=tLOm
-----END PGP SIGNATURE-----

--dy4m535lwp7336za--
