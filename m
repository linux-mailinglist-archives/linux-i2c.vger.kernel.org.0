Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B18F67E11C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 11:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbjA0KKz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 05:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232538AbjA0KKx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 05:10:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A1377539
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 02:10:51 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLLgk-0007Ty-D4; Fri, 27 Jan 2023 11:10:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLLgk-000lKa-4u; Fri, 27 Jan 2023 11:10:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLLgi-00GGT2-ES; Fri, 27 Jan 2023 11:10:28 +0100
Date:   Fri, 27 Jan 2023 11:10:25 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-serial@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Message-ID: <20230127101025.evefhpwpfikahd3k@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
 <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
 <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
 <0bfea903-5efd-a76d-5944-16a2c9362adb@kernel.org>
 <20221123080912.lbmfgnco67psdu27@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i5ziuturpean4nw6"
Content-Disposition: inline
In-Reply-To: <20221123080912.lbmfgnco67psdu27@pengutronix.de>
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


--i5ziuturpean4nw6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 23, 2022 at 09:09:12AM +0100, Uwe Kleine-K=F6nig wrote:
> On Wed, Nov 23, 2022 at 07:36:52AM +0100, Jiri Slaby wrote:
> > On 21. 11. 22, 8:07, Uwe Kleine-K=F6nig wrote:
> > > On Mon, Nov 21, 2022 at 07:03:41AM +0100, Jiri Slaby wrote:
> > > > On 18. 11. 22, 23:45, Uwe Kleine-K=F6nig wrote:
> > > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > >=20
> > > > > .probe_new() doesn't get the i2c_device_id * parameter, so determ=
ine
> > > > > that explicitly in the probe function.
> > > >=20
> > > > I wonder why -- is this a new approach to probe functions? Or is on=
ly i2c
> > > > affected? And why? Could you point to the commit introducing and de=
scribing
> > > > the change in the i2c core?
> > >=20
> > > I didn't sent the cover letter to all recipents of the individual
> > > patches, so flow of information is a bit rough. Sorry about that.
> > >=20
> > > You can find it at
> > > https://lore.kernel.org/lkml/20221118224540.619276-1-uwe@kleine-koeni=
g.org/,
> > > it should answer your question.
> >=20
> > Yes, I looked up that beforehand, but was no more clever after reading =
it.
> >=20
> > > The short version is: The i2c framework does a more or less expensive
> > > lookup for each call to .probe() to provide the id parameter. A relev=
ant
> > > part of the drivers however doesn't use this parameter, so the idea is
> > > to let the drivers who actually need it, determine it themselves.
> > >=20
> > > Statistics for the current state of this series in my tree:
> > > Among the 602 converted drivers, 404 don't make use of the parameter.
> >=20
> > So doesn't it make sense to provide both probe with no id and "probe_id"
> > then? 200 is quite a few (a third to be precise).
>=20
> Having the probe callback with the id parameter is only temporary. As
> soon as all drivers are converted, the variant with the id parameter
> will go away.
>=20
> > BTW is this a performance issue? I.e. does it slow down the boot?
>=20
> I don't know the start motivation for Lee (who triggered the conversion
> in b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> type")).
> Looking at the git history, he created 1e98dcd77970 ("mfd: 88pm860x:
> Move over to new I2C device .probe() call") converting a driver that
> doesn't benefit immensely. The lookup is more expensive for drivers with
> big .id_table, the converted driver has only one entry.
>=20
> I think in the end is a mixture between:
>=20
>  - A big part of the drivers doesn't benefit from the lookup.
>  - For most other busses the probe function only gets a device parameter
>    and no id (spi, platform, i3c). There are counter examples though:
>    amba, usb. Didn't check further.

The discussion somehow ended here without a real result.

As of today's next master there are only 9 drivers left using .probe().
So I'd like to stop this discussion and ask to apply the conversion for
the sc16is7xx driver to be able to complete the conversion.

My plan is to drop the .probe callback as it is today after the next
merge window. So I ask the serial maintainers to either take the patch
under discussion for the next merge window or accept that the conversion
is done together with the patch that drops .probe() that probably will
go in via the i2c tree.

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--i5ziuturpean4nw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPTow4ACgkQwfwUeK3K
7AkDjgf/bGlrPS14Vrw528SZq8vdldQzanU2poJRJqgQYinIcKWTSMqXJHrz234b
QByNemRKfQZZ0RAdu8+yiVkID9M+vGjrBkHC1p8gCqRpJWkvUELqsXt9CcYVZIf/
dTR6jfjESsuZRdWPt1i0lW982YvY+zR6479je/oc11qxmdiak5tNYEaCzP86uHae
sT4qTOkz2fW+8p4NO9WuHFKN14e54XED6MLIiEsB0YnPLLedXXq8cCpPLP5xi6Pg
F8D/FkD4Wm3aHYK6joOYAE5zKOBbJooEJ75l4sRsmsiNlC3K4FC39YhbAqxqiEbj
goKrY6Kw49aZs/ritMnPFEQDghHY7Q==
=Q545
-----END PGP SIGNATURE-----

--i5ziuturpean4nw6--
