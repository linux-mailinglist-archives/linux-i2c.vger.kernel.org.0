Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE2E6319FF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 08:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiKUHIQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 02:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiKUHIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 02:08:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648C81742A
        for <linux-i2c@vger.kernel.org>; Sun, 20 Nov 2022 23:08:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox0uO-0005Q3-QR; Mon, 21 Nov 2022 08:08:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox0uM-005bpK-3y; Mon, 21 Nov 2022 08:07:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox0uM-000VV4-Bf; Mon, 21 Nov 2022 08:07:58 +0100
Date:   Mon, 21 Nov 2022 08:07:57 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Message-ID: <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
 <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qzaz4p2qzqthzohs"
Content-Disposition: inline
In-Reply-To: <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
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


--qzaz4p2qzqthzohs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jiri,

On Mon, Nov 21, 2022 at 07:03:41AM +0100, Jiri Slaby wrote:
> On 18. 11. 22, 23:45, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
>=20
> I wonder why -- is this a new approach to probe functions? Or is only i2c
> affected? And why? Could you point to the commit introducing and describi=
ng
> the change in the i2c core?

I didn't sent the cover letter to all recipents of the individual
patches, so flow of information is a bit rough. Sorry about that.

You can find it at
https://lore.kernel.org/lkml/20221118224540.619276-1-uwe@kleine-koenig.org/,
it should answer your question.

The short version is: The i2c framework does a more or less expensive
lookup for each call to .probe() to provide the id parameter. A relevant
part of the drivers however doesn't use this parameter, so the idea is
to let the drivers who actually need it, determine it themselves.

Statistics for the current state of this series in my tree:
Among the 602 converted drivers, 404 don't make use of the parameter.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qzaz4p2qzqthzohs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN7I8oACgkQwfwUeK3K
7AkwfQgAoRAltu+HeVF+TW0b2G9bVqHBdeedC31HXHdW/6GgLkeD/WAn1EYXYXZ1
PX+bTgPfossqMEBTJEp+LhOwtPdtouMo1U3jzN7kyXkClA3saOuOugsnH805nV7i
Yxw8ff/4MMVkKuEOacPJs9YOt5D7jSvkUJrPlKp54e9IfjFjJy0j4KDuHhhxsCfC
SsPKRif3bwMvFHa71kQmtK+/29RC1mI6Om1WtvRcjUpKE7plf6s5cPRBLIyUDJ5E
pkuIx1bHRLGSwhNXDpRbyULSvQ2J8m5XFptxDe6T7AlvBS/Io74AXfRRG+9wM16Z
b/n6ZuqbMLZPq95cvCzyKDE63B/JHw==
=XAQK
-----END PGP SIGNATURE-----

--qzaz4p2qzqthzohs--
