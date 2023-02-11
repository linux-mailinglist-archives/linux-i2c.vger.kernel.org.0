Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82916693442
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Feb 2023 23:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjBKW6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Feb 2023 17:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBKW6a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Feb 2023 17:58:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AC111645
        for <linux-i2c@vger.kernel.org>; Sat, 11 Feb 2023 14:58:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQyp1-0000Zq-Om; Sat, 11 Feb 2023 23:58:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQyoy-004J0G-QI; Sat, 11 Feb 2023 23:58:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pQyoy-002m9u-MF; Sat, 11 Feb 2023 23:58:16 +0100
Date:   Sat, 11 Feb 2023 23:58:11 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Evgeniy Polyakov <zbr@ioremap.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 595/606] w1: ds2482: Convert to i2c's .probe_new()
Message-ID: <20230211225811.uzgyekfsg7ddpz5j@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-596-uwe@kleine-koenig.org>
 <20221222231254.hwexrvmpeu7gg3a7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7kxfihaxnqqnh5at"
Content-Disposition: inline
In-Reply-To: <20221222231254.hwexrvmpeu7gg3a7@pengutronix.de>
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


--7kxfihaxnqqnh5at
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Evgeniy,

On Fri, Dec 23, 2022 at 12:12:54AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 18, 2022 at 11:45:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/w1/masters/ds2482.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
> > index 62c44616d8a9..3d8b51316bef 100644
> > --- a/drivers/w1/masters/ds2482.c
> > +++ b/drivers/w1/masters/ds2482.c
> > @@ -442,8 +442,7 @@ static u8 ds2482_w1_set_pullup(void *data, int dela=
y)
> >  }
> > =20
> > =20
> > -static int ds2482_probe(struct i2c_client *client,
> > -			const struct i2c_device_id *id)
> > +static int ds2482_probe(struct i2c_client *client)
> >  {
> >  	struct ds2482_data *data;
> >  	int err =3D -ENODEV;
> > @@ -553,7 +552,7 @@ static struct i2c_driver ds2482_driver =3D {
> >  	.driver =3D {
> >  		.name	=3D "ds2482",
> >  	},
> > -	.probe		=3D ds2482_probe,
> > +	.probe_new	=3D ds2482_probe,
> >  	.remove		=3D ds2482_remove,
> >  	.id_table	=3D ds2482_id,
> >  };
>=20
> Assuming you don't have any concerns, it would be great if you applied
> this patch for the next merge window.

I plan to create a patch series for Wolfram to apply shortly after the
next merge window closed that changes the .probe() callback to match
=2Eprobe_new(). So please either apply this patch during the next merge
window (my preferred option), or accept (ideally with an Ack) that this
patch will go via the i2c tree together with the patch changing
=2Eprobe().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7kxfihaxnqqnh5at
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPoHX8ACgkQwfwUeK3K
7AkfBgf/egcbiISJA9n3Asp1Flh33s/phW9TXPqLyLd6OAaUchPH7HcHewf6xRHW
tGHBgPFVASmfx9GxEWcqiNKp9Kw+m9TNhtZ2MtxVCTffCbQIdnxq93dC5bW3KTWz
Yx1OYHr8uL66CoodSj2fRWTsFvD+CMC3QBMpCD5QRZsxb3LJXwpup1bWsktfSRWg
Rkha/fbW8B6snFKI4YTBtKFfxAq+EXacOn7jgR1Rn7F0vH1+/Kqre689RQibgahW
Cg0jrLj2JgIPdzqGXCejwWk1zpUgvKUyuo72VwNECLJq6pQ58szgBueNOpZ/vzfU
L6v5tIBGDvHn+oDv/TLUMKJzarXOaw==
=pPCq
-----END PGP SIGNATURE-----

--7kxfihaxnqqnh5at--
