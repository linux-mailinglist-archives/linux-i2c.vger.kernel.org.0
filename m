Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B233575D9F
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 10:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbiGOIeT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jul 2022 04:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbiGOIeS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 04:34:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC712C106
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jul 2022 01:34:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCGlx-0005lJ-JO; Fri, 15 Jul 2022 10:34:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCGlv-0014qI-QB; Fri, 15 Jul 2022 10:34:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCGlu-005JQq-PQ; Fri, 15 Jul 2022 10:34:02 +0200
Date:   Fri, 15 Jul 2022 10:34:00 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220715083400.q226rrwxsgt4eomp@pengutronix.de>
References: <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
 <20220713202541.GA532546@francesco-nb.int.toradex.com>
 <20220714070705.GH24373@pengutronix.de>
 <20220714073408.GA542904@francesco-nb.int.toradex.com>
 <20220715064931.dvbzcufa3l3ojug4@pengutronix.de>
 <20220715072432.GA562594@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3kwwohxhoryn7ujp"
Content-Disposition: inline
In-Reply-To: <20220715072432.GA562594@francesco-nb.int.toradex.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3kwwohxhoryn7ujp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Francesco,

On Fri, Jul 15, 2022 at 09:24:32AM +0200, Francesco Dolcini wrote:
> On Fri, Jul 15, 2022 at 08:49:31AM +0200, Uwe Kleine-K=F6nig wrote:
> > Unless you have a multi-controller setup an arbitration loss is a
> > problem with the signal integrity. And increasing the retry count is
> > only a work around.
> Fair enough.
>=20
> Regarding your comment, I was wondering:
>=20
> 1. There is currently no easy way to enable the retry on arbitration
> lost at system level in case the I2C bus is multimaster. Unless we
> consider setting the retries value using I2C_RETRIES ioctl the way to
> go. Not my specific problem, but I wonder if this situation is relevant
> in practice.

I think multi-controller is quite unusual. I never saw one, but that
might just be my bubble.

> 2. We do have an I2C bus recovery mechanism implemented to recover from
> a stuck bus, isn't this a workaround as retrying on arbitration lost in a
> non-multimaster setup?

It depends, if you do it to recover after a transfer failure, it would
indeed consider it a work around covering the real problem. But
sometimes there is no practical way around such work arounds. I happens
=66rom time to time that the reason for problem is known, but fixing the
hardware is no option, then you need such workrounds. (This applies to
both, retrying the transfers and resetting the bus.)

Note that even without signal integrity problems an i2c bus can get
stuck. E.g. if the controller resets in the middle of a transfer.

> I guess this discussion is no longer about the original patch I sent,
> but from my point of view still interesting, real-life I2C is not
> perfect sometimes ...=20

:-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3kwwohxhoryn7ujp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLRJnUACgkQwfwUeK3K
7AlCDQf9EkCCVjOTpDE1ODdZ4lNrIQWhu4Xx4eGCPXTjpanxNV3qbSZEnsZ4GH+E
ktVJX45x3JYJBIWBm47rEypfK3hkbVVdH7Nc8EfJ1vdwS+U2KOQqyghGUD9rF71o
bL9HhgIqRwlTcensidNvIK3ZAmllRzwMBsMgsBeTAatDGMjk1iBEjk+uI76o1lpY
rx6cXeSnA0dOAf9dAUBvsdx8VQC5MTT63PRs6YG6M71OhAwALWVBNUx0KnP+nnOr
9zS42UEBMbYRprnlJCpb4lAxf5CAMiOODB5idYXdLOOYN+sI+/dieiExLORxsRhQ
mZUv/BJ1HiFh5hp2B4Dni8NK/NFCtw==
=bEwT
-----END PGP SIGNATURE-----

--3kwwohxhoryn7ujp--
