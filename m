Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E5F6B2F77
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 22:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjCIVUa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 16:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCIVU3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 16:20:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEF7F8E4B
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 13:20:27 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1paNfy-0008M4-6q; Thu, 09 Mar 2023 22:19:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1paNfo-0032DX-LN; Thu, 09 Mar 2023 22:19:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1paNfn-003das-UG; Thu, 09 Mar 2023 22:19:39 +0100
Date:   Thu, 9 Mar 2023 22:19:39 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
        Crt Mori <cmo@melexis.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean Delvare <jdelvare@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/9] i2c: Switch .probe() to not take an id parameter
Message-ID: <20230309211939.un626kr6g2k35mbi@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
 <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
 <ZApLrpD9Op59FgnB@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wjc75gu3bek7grdu"
Content-Disposition: inline
In-Reply-To: <ZApLrpD9Op59FgnB@shikoro>
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


--wjc75gu3bek7grdu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 10:12:14PM +0100, Wolfram Sang wrote:
>=20
> > So this series is ready to be applied once Linus cuts -rc1.
>=20
> I applied it to for-current now and plan to have it in -rc2. Thank you!

Great, this is even quicker than I anticipated. I thought this will go
into next first and into mainline only during the next merge window.

If you can convince Linus to take that for -rc2, fine for me.

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wjc75gu3bek7grdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQKTWgACgkQwfwUeK3K
7Amd9ggAnkPYgOLH8nXWAWn3gLt7YS/0TUTOTB61F6rwzHDIsXwQHdGInPjMXeEe
GTl9iZUcGCZVhXkpG1qSdbxqDefK9ysZVVvE4Mldiw7RlRcT4tm1AuX3Z4kSMvk2
6BaAqZ08nlpy8foNYj0SSMaobPMiNdlM/rfuntJ3L8pnVrd2zEWJDA58cyoNO6J8
1PGDByNC2ivf36/QlzATU+0woDT3JzbEs5UFIbI0hMetphMyDzfhahRp68YGBtfn
jLhWnVHc9x20CJOUZ5PU8Qv4YFQXtactIjrQcLDp2sp24KusYGYj0zDgLQaANyoO
Xs5TU2VfyI0xm5feCKooso6WyI+7uw==
=2Qsh
-----END PGP SIGNATURE-----

--wjc75gu3bek7grdu--
