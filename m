Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C711630F57
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 17:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbiKSQIz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 11:08:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbiKSQIy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 11:08:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 143571839D
        for <linux-i2c@vger.kernel.org>; Sat, 19 Nov 2022 08:08:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owQOJ-0006jh-VP; Sat, 19 Nov 2022 17:08:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owQOE-005I6I-10; Sat, 19 Nov 2022 17:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owQOE-000B3I-39; Sat, 19 Nov 2022 17:08:22 +0100
Date:   Sat, 19 Nov 2022 17:08:18 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        wangjianli <wangjianli@cdjrlc.com>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>, kernel@pengutronix.de,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Grant Likely <grant.likely@linaro.org>,
        Dmitry Rokosov <DDRokosov@sberdevices.ru>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 054/606] iio: accel: kxcjk-1013: Convert to i2c's
 .probe_new()
Message-ID: <20221119160818.zft3xhuwz3gm6oeg@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-55-uwe@kleine-koenig.org>
 <Y3jGHufAJVxZp1f0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fzajp72vidmhqheg"
Content-Disposition: inline
In-Reply-To: <Y3jGHufAJVxZp1f0@smile.fi.intel.com>
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


--fzajp72vidmhqheg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Sat, Nov 19, 2022 at 02:03:42PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 18, 2022 at 11:36:28PM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
>=20
> Since there is no split on per subsystem basis (I mean, as a series targe=
ting
> only, let's say, IIO subsystem with cover letter), I'm answering here tha=
t all
> IIO patches are good to me, thanks, Uwe!
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

Does this include the three patches:

	staging: iio: adt7316: Convert to i2c's .probe_new()
	staging: iio: ad5933: Convert to i2c's .probe_new()
	staging: iio: ade7854: Convert to i2c's .probe_new()

?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fzajp72vidmhqheg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN4/3AACgkQwfwUeK3K
7AlBbgf/VdCmGxE5p4WJBUVZ+DQrgE1H86TeDTZ2w+zWM3wA9/kHjrtrEuoEtnfD
EgU2wlCKpII2vBUFBQCOH23CyUAiFMN//1kCD98poRXowoV1brNdxcLE6hR4ORsW
PFBSI068CVRecB54XASUxIUN1MzGTyBpXpfAUdIVpyUSS0D1fQEpLucKfTo8rDsF
9034bo8xvDA3g4qDztC6/Lj9pmma5c8UmB2mBn3P/jPEhUeg+3Jz5c0ZkJ636YNQ
BwgI7vXDnKXp4nzrKOWBf5snc++Eb7KugMwcTUwPBPwkMewlTAIpXX+GDQRfYaME
yZN+2yr31DTQntFeff080hjXeXsGlQ==
=8K2+
-----END PGP SIGNATURE-----

--fzajp72vidmhqheg--
