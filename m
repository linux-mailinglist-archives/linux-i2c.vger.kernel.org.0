Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD0E665837
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jan 2023 10:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238625AbjAKJzc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Jan 2023 04:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238588AbjAKJzA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Jan 2023 04:55:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19E111C27
        for <linux-i2c@vger.kernel.org>; Wed, 11 Jan 2023 01:52:09 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pFXln-0000dV-R2; Wed, 11 Jan 2023 10:51:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pFXlm-005GmE-Vb; Wed, 11 Jan 2023 10:51:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pFXlm-00BvnM-As; Wed, 11 Jan 2023 10:51:42 +0100
Date:   Wed, 11 Jan 2023 10:51:42 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-gpio@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 510/606] pinctrl: mcp23s08: Convert to i2c's .probe_new()
Message-ID: <20230111095142.2i36vjytm6wthntl@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-511-uwe@kleine-koenig.org>
 <CACRpkdaViC8T5qFRW+=+rGST=nr9beQJqTP7d42OoYUnhPhqig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hvyl6ihtxdsh2466"
Content-Disposition: inline
In-Reply-To: <CACRpkdaViC8T5qFRW+=+rGST=nr9beQJqTP7d42OoYUnhPhqig@mail.gmail.com>
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


--hvyl6ihtxdsh2466
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

On Tue, Jan 10, 2023 at 09:01:04AM +0100, Linus Walleij wrote:
> On Fri, Nov 18, 2022 at 11:48 PM Uwe Kleine-K=F6nig <uwe@kleine-koenig.or=
g> wrote:
>=20
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Patch applied!

Thanks. Is there a reason you picked #510 but not #511 other than having
missed there is a 2nd pinctrl patch in my series?

If it's only that

	b4 am -P 511 -s -l CACRpkdaViC8T5qFRW+=3D+rGST=3Dnr9beQJqTP7d42OoYUnhPhqig=
@mail.gmail.com

is your friend.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hvyl6ihtxdsh2466
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO+hqsACgkQwfwUeK3K
7AlHnwf/TbGJWR2hDoaYrpK6CTPARmRCm5WNQtzAFNu2siduND/0E9n8wiML+9nR
J9N+0xdzITnMueybK+FiEoWjLxkV3qtqRqT17lgSfa2fRHilvOJpt5AnAy/yCYyh
+qN9cNwmykvCIz8vOfK/3UxwCYqtwByyeY9aSYk9prC2xl3LvOXTnWyGr+unijSN
axTWsK4hrqFfdSD6EN6C3Jv5SeZObZgNinEyavYRlqRaQh5ZM5SStgjfAnMgxFbK
WNeWVIMpuY1VHpD7/QiemKWL0HdB7c/mJsV8SLrYSKi3vtgFz8NENfYhW0BdBMa5
UXHv12L3pB5VA/eeV/bSDfFGvs210Q==
=uONG
-----END PGP SIGNATURE-----

--hvyl6ihtxdsh2466--
