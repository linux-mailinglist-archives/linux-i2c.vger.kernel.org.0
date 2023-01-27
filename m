Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526B467E66A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 14:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbjA0NSv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 08:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234740AbjA0NSe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 08:18:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2382BEDB
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:18:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLOc8-0005NA-Go; Fri, 27 Jan 2023 14:17:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLOc8-000nON-Mw; Fri, 27 Jan 2023 14:17:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLOc6-00GIml-MS; Fri, 27 Jan 2023 14:17:54 +0100
Date:   Fri, 27 Jan 2023 14:17:51 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        Grant Likely <grant.likely@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Message-ID: <20230127131751.gupnp7l6wyrutpmw@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
 <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
 <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
 <0bfea903-5efd-a76d-5944-16a2c9362adb@kernel.org>
 <20221123080912.lbmfgnco67psdu27@pengutronix.de>
 <20230127101025.evefhpwpfikahd3k@pengutronix.de>
 <Y9O5cMnC+uKrPToz@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="46nfdfxvgk3lrnx2"
Content-Disposition: inline
In-Reply-To: <Y9O5cMnC+uKrPToz@kroah.com>
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


--46nfdfxvgk3lrnx2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Fri, Jan 27, 2023 at 12:45:52PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 27, 2023 at 11:10:25AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 23, 2022 at 09:09:12AM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Wed, Nov 23, 2022 at 07:36:52AM +0100, Jiri Slaby wrote:
> > > > BTW is this a performance issue? I.e. does it slow down the boot?
> > >=20
> > > I don't know the start motivation for Lee (who triggered the conversi=
on
> > > in b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> > > type")).
> > > Looking at the git history, he created 1e98dcd77970 ("mfd: 88pm860x:
> > > Move over to new I2C device .probe() call") converting a driver that
> > > doesn't benefit immensely. The lookup is more expensive for drivers w=
ith
> > > big .id_table, the converted driver has only one entry.
> > >=20
> > > I think in the end is a mixture between:
> > >=20
> > >  - A big part of the drivers doesn't benefit from the lookup.
> > >  - For most other busses the probe function only gets a device parame=
ter
> > >    and no id (spi, platform, i3c). There are counter examples though:
> > >    amba, usb. Didn't check further.
> >=20
> > The discussion somehow ended here without a real result.
> >=20
> > As of today's next master there are only 9 drivers left using .probe().
> > So I'd like to stop this discussion and ask to apply the conversion for
> > the sc16is7xx driver to be able to complete the conversion.
> >=20
> > My plan is to drop the .probe callback as it is today after the next
> > merge window. So I ask the serial maintainers to either take the patch
> > under discussion for the next merge window or accept that the conversion
> > is done together with the patch that drops .probe() that probably will
> > go in via the i2c tree.
>=20
> I don't see the patch anymore,

If you want to take a look:

	b4 am 20221118224540.619276-572-uwe@kleine-koenig.org

or

	https://lore.kernel.org/lkml/20221118224540.619276-572-uwe@kleine-koenig.o=
rg

> so I have no objection for it going through the i2c tree.

Can I interpret that as an Ack? :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--46nfdfxvgk3lrnx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPTzvwACgkQwfwUeK3K
7AkAwgf9Fx60NOgH3yW2FQbiLJACN/TBhnZ4fdN5jAMHVI3MxreW97xJW3JlbVbf
3zVac3iG0qOhmkhHAMRRROkE6/mS+GdrmBtmautpT9KcZRCUY0Y7XWiYkB6gO/Vq
SUwHSRtfjCAXln8NtDRmVBVGp7KYRHy+Iz+QbqZxk2jeGOZ8YpLZi99SVl1ggGaP
eRdjsttemW4Uilcx/e9wy1HsFBp7Qlrsx6uv6bwvo7MHkNQLKbRaTLl1ph7Kfzm9
4aP8fc6KZ3OW+ChlcSsJFk8xa+HuSpyKJyQiOQ8rKz8RGaQQc/igVPeF1wnxnbxM
dQtiiQ9clCYa12LheOzWMsRkTEeR/w==
=EQP+
-----END PGP SIGNATURE-----

--46nfdfxvgk3lrnx2--
