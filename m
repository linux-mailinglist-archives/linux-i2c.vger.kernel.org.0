Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974A6592BE8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Aug 2022 12:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiHOIus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Aug 2022 04:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiHOIun (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Aug 2022 04:50:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD107679
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 01:50:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNVny-0001cz-M4; Mon, 15 Aug 2022 10:50:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNVno-003stj-7e; Mon, 15 Aug 2022 10:50:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNVnp-00Bozk-H7; Mon, 15 Aug 2022 10:50:29 +0200
Date:   Mon, 15 Aug 2022 10:50:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Crt Mori <cmo@melexis.com>, Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Corey Minyard <cninyard@mvista.com>,
        Jean Delvare <jdelvare@suse.de>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Machata <petrm@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        kernel@pengutronix.de, Luca Ceresoli <luca@lucaceresoli.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 6/6] i2c: Make remove callback return void
Message-ID: <20220815085029.y7k3e5yg22dby2c7@pengutronix.de>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t6mwomgobwe3vpbz"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-7-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t6mwomgobwe3vpbz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Aug 15, 2022 at 10:02:30AM +0200, Uwe Kleine-K=F6nig wrote:
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>=20
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>=20
> [...]
> ---
> [...]
>  619 files changed, 646 insertions(+), 1733 deletions(-)

There seems to be a 300k limit for mails on vger.kernel.org, so this
patch didn't make it to the list. Please get it from

	https://git.pengutronix.de/git/ukl/linux i2c-remove-void

or

	https://git.pengutronix.de/cgit/ukl/linux/commit/?h=3Di2c-remove-void

or send me a (private) mail, then I can bounce you the message to
properly reply to it. (Or if that is enough for you: The Message-Id is
<20220815080230.37408-7-u.kleine-koenig@pengutronix.de>.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t6mwomgobwe3vpbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmL6CNIACgkQwfwUeK3K
7AmEHQf8D1V+sYnTezbvOibSuKcnpG16rCu3Jb78ZoqmCgUovjeS9QULOFtAIP3j
RNGJi5Fb/N965oDqcqkPyf+c2yUtn0incUIS+eg7ab5QbLFcszgyU9iK3DGZOw3J
pvh8laNPFXhWpYnRemFSeRt4PiT2SXFCV3mGcxrNGRC5YydAN+MpYD0jJaxKCDco
IsIw39rOOb9/jZuNBi9qVBDxBW8lrYd7JanO0vCosGJOytN2E5r8pPj/T6GZse35
tbd1kZ3tci8n/mTtIhKfdtqVjI17BhgK+0Wm64zMRivOknePZ32YV76MWvV9eBHy
3lgu1TqF+y4JexBUwUfe7P8vbeuMgg==
=1poy
-----END PGP SIGNATURE-----

--t6mwomgobwe3vpbz--
