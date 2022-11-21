Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98938632799
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 16:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbiKUPOw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 10:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiKUPOM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 10:14:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E67CCFB86
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 07:09:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox8Po-0002S9-BK; Mon, 21 Nov 2022 16:08:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox8Pm-005frj-7u; Mon, 21 Nov 2022 16:08:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox8Pm-000bEb-7V; Mon, 21 Nov 2022 16:08:54 +0100
Date:   Mon, 21 Nov 2022 16:08:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <20221121150854.3mwczqtbusawho4m@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p5ojcz3xuvysnogu"
Content-Disposition: inline
In-Reply-To: <Y3tvypIDVdCYxAVB@google.com>
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


--p5ojcz3xuvysnogu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> On Fri, 18 Nov 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/mfd/khadas-mcu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> After a week or so, please collect-up all the tags you have received
> and submit a per-subsystem set for me to hoover up, thanks.

For mfd I'd do:

	git checkout mfd/for-next
	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
	git send-email --to .... --cc .... mfd/for-next

to accomplish that. I can do that, but feel free to do it yourself at a
moment that suits you (of course without the send-email part and maybe
adding -l and -s to b4 am).

For backlight the patch range is 585-593.

Cheers,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--p5ojcz3xuvysnogu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN7lIMACgkQwfwUeK3K
7AmS1gf/YEGBTS5ayE/EOyPU3hXmMOhVXdOaQuQZ42Du6c9FfpQiZ8xL5NOdJCQp
cPqinv55VE8CeMWUvPty4S1NqJD7XD5SEOobLCwM5lxyfnMwjQ+xZTufnqFr2Dev
xP7a3eRkj9t2prnIBkeKqLosulBdk3V2l0NUBSLDnnIm5DILE/5mUclvIKlsJhKq
SK2UGwG2sLPkkvE+biOVxNGvEPN7JsZcVKHeriq5G0BKiPyYe+MTL9Uo+hPJSEnY
iEahy2aFzmFCSRgc51YS0Ubeou3wkvhbTdiZq9l855P/xW08tc70ysdnTPFlK70O
CuN/EWg40LnpzHD7vQ9eQf+g1m7A0w==
=AYjL
-----END PGP SIGNATURE-----

--p5ojcz3xuvysnogu--
