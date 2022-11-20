Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB5D4631657
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Nov 2022 21:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiKTUao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 15:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiKTUan (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 15:30:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178862983D
        for <linux-i2c@vger.kernel.org>; Sun, 20 Nov 2022 12:30:42 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owqxS-0007So-8g; Sun, 20 Nov 2022 21:30:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owqxP-005WVD-QO; Sun, 20 Nov 2022 21:30:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owqxP-000Pmo-U1; Sun, 20 Nov 2022 21:30:27 +0100
Date:   Sun, 20 Nov 2022 21:30:23 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 561/606] rtc: isl1208: Convert to i2c's .probe_new()
Message-ID: <20221120203023.7ovrabaep7ya4ibz@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-562-uwe@kleine-koenig.org>
 <Y3lttA22QlR46RXz@mail.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iroxzsru4bx4wlf3"
Content-Disposition: inline
In-Reply-To: <Y3lttA22QlR46RXz@mail.local>
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


--iroxzsru4bx4wlf3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On Sun, Nov 20, 2022 at 12:58:44AM +0100, Alexandre Belloni wrote:
> On 18/11/2022 23:44:55+0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> >=20
>=20
> This is already done later on in the function, please check the rtc
> patches as I took your previous series.

huh, sorry I missed that. In this previous series you refused to take
the ds1307 patch. The one from this series is better.

I dropped the other rtc patches from my queue.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iroxzsru4bx4wlf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN6jlwACgkQwfwUeK3K
7AmXgggAhHbPUzMA+WKU+kjYHD2L1B7//ep5XOhktSGgOf7dAmrK9tUikXWz6YjM
0Nt5PFLUkvM1sUYU0obkdi1oa06hfLo0AP4D/lxI9/seQ66zoiXRL+wAdQe19AM3
M4GtRe2/9/NcsLwzNU4Nt8knMFCC7W1J7mPhrV93YiWwKFkDUAq6lOVIFYuWHKJA
tYfdG9QgVYoFNYigBPk+XBYahIVlgdtDN0KWFfHlPS2hdCKYEOWuW5HtV3eacwzw
rfPX1YUYgm11dktnc3AQWbKxLU0zh4Oh+/f10tKIe/lzh6POOpUw+b9qp/jh7ToQ
h9xZDliByO8JeSOFoPaIFOlEw7WNOQ==
=xGWZ
-----END PGP SIGNATURE-----

--iroxzsru4bx4wlf3--
