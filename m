Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA85B645B9A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 14:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiLGN52 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 08:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiLGN5P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 08:57:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E8F5BD50
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 05:57:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2uv4-0007VL-LE; Wed, 07 Dec 2022 14:57:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2uv2-002vut-QL; Wed, 07 Dec 2022 14:57:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p2uv2-003I87-Ta; Wed, 07 Dec 2022 14:57:04 +0100
Date:   Wed, 7 Dec 2022 14:57:04 +0100
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
Message-ID: <20221207135704.oxyu2gfm6wrns5t4@pengutronix.de>
References: <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
 <Y490W6k4N8iBxLHf@google.com>
 <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
 <Y5B3otGG06QCjldc@google.com>
 <Y5CWSZpndGi4mU5e@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="444ob3jqs3mc3uhm"
Content-Disposition: inline
In-Reply-To: <Y5CWSZpndGi4mU5e@google.com>
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


--444ob3jqs3mc3uhm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Wed, Dec 07, 2022 at 01:34:01PM +0000, Lee Jones wrote:
> On Wed, 07 Dec 2022, Lee Jones wrote:
> > On Wed, 07 Dec 2022, Uwe Kleine-K=F6nig wrote:
> > > I see you added my commits to your tree now, however there is a probl=
em:
> > >=20
> > >   [...]
> > >=20
> > > That means that the commit introducing i2c_client_get_device_id() isn=
't
> > > an ancestor of the commits that make use of the new function. So
> > > 63909fec136e (which is the first commit making use of the new functio=
n)
> > > likely won't compile:
> > >=20
> > > 	$ git grep i2c_client_get_device_id 63909fec136e
> > > 	63909fec136e:drivers/mfd/adp5520.c:     const struct i2c_device_id *=
id =3D i2c_client_get_device_id(client);
> > >=20
> > > Starting with 7281458f4396 everything is fine again, but still this
> > > hurts a bisection.
> >=20
> > Fair point - I'll rebase the my topic branch on top of Wolfram's.
>=20
> Okay, try now.

Looks good now, thanks!

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--444ob3jqs3mc3uhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOQm60ACgkQwfwUeK3K
7AnwYwf7BJNhpOShM+y1sPNPmv1EtCLVMQ5BRS5kTzzqK8U3WDaJ4h+0gqiakqR6
q/SUJSzkLtGDo3uzt3CxEeUXk++AyWt6izQKjYIRoGGM6/aIEKJGoNvthphjH5C3
ex7x4QUrSZIApKlQmiHa4yUhogpGjD8p/WJsw6kO6VlIsK4gyn0UVdwP1XuReucA
mY/MnyLv4X/IE4JFwfKeyxgUmhzKUSi2zl4JuZP0RCNK+uV9ZknKs+9wnqxF1JJ4
xXr/1Ft9OLfs3dnEmyKyIOCgac5BHQL8jEE6LF10qWxlsX4N6sf9Uv5A3B/rXCLL
IdHOr0s6H4PFD7LBaA0Mrl3QPcs5Uw==
=JuPy
-----END PGP SIGNATURE-----

--444ob3jqs3mc3uhm--
