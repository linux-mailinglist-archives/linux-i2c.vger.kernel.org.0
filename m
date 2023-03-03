Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300D96AA4A5
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 23:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjCCWkg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 17:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjCCWjY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 17:39:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2C040E3
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 14:38:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYDaM-0007X5-7q; Fri, 03 Mar 2023 23:09:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYDaF-001eHQ-77; Fri, 03 Mar 2023 23:08:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYDaE-001xZG-GT; Fri, 03 Mar 2023 23:08:58 +0100
Date:   Fri, 3 Mar 2023 23:08:56 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jphhkeygsgtmhvzu"
Content-Disposition: inline
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
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


--jphhkeygsgtmhvzu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Feb 26, 2023 at 11:26:45PM +0100, Uwe Kleine-K=F6nig wrote:
> this is v2 of the series. I send it a bit earlier than I planned to do th=
at
> initially because I failed to send v1 completely to the linux-i2c list.
>=20
> Changes since (implicit) v1:
>  - Added Acks for patches #5, #6 and #8
>  - Fixed kernel doc as pointed out by Luca Ceresoli (patch #7)
>  - Send all patches to linux-i2c mailing list
>  - Rebased to current Linus' tree.
>    This reduces the list of prerequisite patches to two.
>=20
> I updated
>=20
> 	https://git.pengutronix.de/git/ukl/linux i2c-probe-new
>=20
> accordingly.

Linus tree now contains all patches that are a prerequisite for this
series. I rebased the above branch again on top of linus/master and now
it contains only the change sets included in this series.

Also no unexpected new usages of .probe() appeared in Linus's tree (nor
in next). Also there are no changes to any of the files touched by this
series in next.

So this series is ready to be applied once Linus cuts -rc1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jphhkeygsgtmhvzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQCb/UACgkQwfwUeK3K
7AkuXgf/SMwWwnMqZjGgBPUDM9VgxnIlfQtagDo9nbprjQzoh3Ib5rPoV0hS3hvB
47qsOgOL5iA240b8zcxn8IatQDJaPiDl7F06lLmWFEvMrhA233m84hU/U/O/0xbY
0WuHom/ABjZwJ2JEl+qFUiE1Cm5r89LhYCw4UEXTG6Wn1dtuUb5Roq+uVAVjQxSS
0aAP77IklhKDSPlpdnGXgiY1NrMiWmJWpFEyTLhNeqI7l9djO5tHLbezUcb2E4nU
Xsz0eWpOmh85Eq8BhIFPY8CigES8ePIragUO4rxneI1ewhYWpvjEklysWIC0SO98
Z9CJvnehDyeveIhwgTJsgtK21N7mxA==
=QY8V
-----END PGP SIGNATURE-----

--jphhkeygsgtmhvzu--
