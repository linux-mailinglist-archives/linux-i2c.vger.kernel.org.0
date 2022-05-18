Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E281252C5A1
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 23:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243241AbiERVhM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 17:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243263AbiERVhH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 17:37:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9C914041B
        for <linux-i2c@vger.kernel.org>; Wed, 18 May 2022 14:37:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrRLY-0006wQ-Lx; Wed, 18 May 2022 23:36:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrRLY-0039y5-0C; Wed, 18 May 2022 23:36:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrRLV-00AcjN-Rg; Wed, 18 May 2022 23:36:41 +0200
Date:   Wed, 18 May 2022 23:36:38 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tudor.Ambarus@microchip.com
Cc:     alexandre.belloni@bootlin.com, ardb@kernel.org,
        Nicolas.Ferre@microchip.com, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de, Claudiu.Beznea@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: Bug in atmel-ecc driver
Message-ID: <20220518213638.tdux5zqheztv6ukc@pengutronix.de>
References: <20220513135954.exewihnibnhdckkn@pengutronix.de>
 <20220517102432.pljcsjkar3oswdnl@pengutronix.de>
 <99a8c7b0-ca73-25a2-f839-9a96cc0989e4@microchip.com>
 <20220517143319.oi7cpgqumv2gn2l6@pengutronix.de>
 <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hncw4q4q4rfj4pvi"
Content-Disposition: inline
In-Reply-To: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hncw4q4q4rfj4pvi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[fixed Ard's email address]

On Wed, May 18, 2022 at 10:07:32AM +0000, Tudor.Ambarus@microchip.com wrote:
> On 5/17/22 17:33, Uwe Kleine-K=F6nig wrote:
> > On Tue, May 17, 2022 at 01:11:22PM +0000, Tudor.Ambarus@microchip.com w=
rote:
> >> On 5/17/22 13:24, Uwe Kleine-K=F6nig wrote:
> >>> On Fri, May 13, 2022 at 03:59:54PM +0200, Uwe Kleine-K=F6nig wrote:
> >>>> TL;DR: when a device bound to the drivers/crypto/atmel-ecc.c driver =
is
> >>>> unbound while tfm_count isn't zero, this probably results in a
> >>>> use-after-free.
> >>>>
> >>>> The .remove function has:
> >>>>
> >>>> 	if (atomic_read(&i2c_priv->tfm_count)) {
> >>>>                 dev_err(&client->dev, "Device is busy\n");
> >>>>                 return -EBUSY;
> >>>>         }
> >>>>
> >>>> before actually calling the cleanup stuff. If this branch is hit the
> >>>> result is likely:
> >>>>
> >>>>  - "Device is busy" from drivers/crypto/atmel-ecc.c
> >>>>  - "remove failed (EBUSY), will be ignored" from the i2c core
> >>>>  - the devm cleanup callbacks are called, including the one kfreeing
> >>>>    *i2c_priv
> >>>>  - at a later time atmel_ecc_i2c_client_free() is called which does
> >>>>    atomic_dec(&i2c_priv->tfm_count);
> >>>>  - *boom*
> >>>>
> >>>> I think to fix that you need to call get_device for the i2c device
> >>>> before increasing tfm_count (and a matching put_device when decreasi=
ng
> >>>> it). Having said that the architecture of this driver looks strange =
to
> >>>> me, so there might be nicer fixes (probably with more effort).
> >>> I tried to understand the architecture a bit, what I found is
> >>> irritating. So the atmel-ecc driver provides a static struct kpp_alg
> >>> atmel_ecdh_nist_p256 which embeds a struct crypto_alg (.base). During
> >>> .probe() it calls crypto_register_kpp on that global kpp_alg. That is,
> >>> if there are two or more devices bound to this driver, the same kpp_a=
lg
> >>> structure is registered repeatedly.  This involves (among others)
> >>>
> >>>  - refcount_set(&atmel_ecdh_nist_p256.base.cra_refcount)
> >>>    in crypto_check_alg()
> >>>  - INIT_LIST_HEAD(&atmel_ecdh_nist_p256.base.cra_users)
> >>>    in __crypto_register_alg()
> >>>
> >>> and then a check about registering the same alg twice which makes the
> >>> call crypto_register_alg() return -EEXIST. So if a second device is
> >>> bound, it probably corrupts the first device and then fails to probe.
> >>>
> >>> So there can always be (at most) only one bound device which somehow
> >>> makes the whole logic in atmel_ecdh_init_tfm ->
> >>> atmel_ecc_i2c_client_alloc to select the least used(?) i2c client amo=
ng
> >>> all the bound devices ridiculous.
> >> It's been a while since I last worked with ateccx08, but as far as I r=
emember
> >> it contains 3 crypto IPs (ecdh, ecdsa, sha) that communicate over the =
same
> >> i2c address. So if someone adds support for all algs and plug in multi=
ple
> >> ateccx08 devices, then the distribution of tfms across the i2c clients=
 may work.
> > It would require to register the crypto backends independent of the
> > .probe() routine though.
> >=20
> >> Anyway, if you feel that the complexity is superfluous as the code is =
now, we
> >> can get rid of the i2c_client_alloc logic and add it later on when/if =
needed.
> > If it's you who acts, do whatever pleases you. If it's me I'd go for a
> > quick and simple solution to get back to what I originally want to do
> > with this driver.
> >=20
> > So I'd go for something like
> >=20
> > diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> > index 333fbefbbccb..e7f3f4793c55 100644
> > --- a/drivers/crypto/atmel-ecc.c
> > +++ b/drivers/crypto/atmel-ecc.c
> > @@ -349,8 +349,13 @@ static int atmel_ecc_remove(struct i2c_client *cli=
ent)
> > =20
> >  	/* Return EBUSY if i2c client already allocated. */
> >  	if (atomic_read(&i2c_priv->tfm_count)) {
> > -		dev_err(&client->dev, "Device is busy\n");
> > -		return -EBUSY;
> > +		/*
> > +		 * After we return here, the memory backing the device is freed.
> > +		 * If there is still some action pending, it probably involves
> > +		 * accessing free'd memory.
>=20
> would be good to explain why i2c core will ignore -EBUSY.

In general it's impossible to do error handling (e.g. retry calling the
remove callback) because the device that is removed might be physically
removed. That mostly doesn't apply to i2c, but that's how the device
model works. So if you look into the i2c core: The remove callback is
called from i2c_device_remove() which is the remove callback for the i2c
bus. It's prototype is:

	static void i2c_device_remove(struct device *dev)

so there is no way to pass an error to the device core layer.
Until fc7a6209d5710618eb4f72a77cd81b8d694ecf89 this wasn't so obvious
and many busses returned an int, that was however ignored by the driver
core. The quest here is to change the bus specific methods to return
void. So the eventual goal here is for i2c:

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..066b541a0d5d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -273,7 +273,7 @@ struct i2c_driver {
=20
 	/* Standard driver model interfaces */
 	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
-	int (*remove)(struct i2c_client *client);
+	void (*remove)(struct i2c_client *client);
=20
 	/* New driver model interface to aid the seamless removal of the
 	 * current probe()'s, more commonly unused than used second parameter.
=20

to don't let i2c driver authors assume they can return an error value.

See

	a0386bba70934d42f586eaf68b21d5eeaffa7bd0
	b2c943e52705b211d1aa0633c9196150cf30be47
	15f83bb0191261adece5a26bfdf93c6eccdbc0bb

for a few more examples.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hncw4q4q4rfj4pvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKFZuMACgkQwfwUeK3K
7AlKoQf/TPfBO0OquYHQT2Gt+vEEbbyZYn82zT84JaH0LbGKwdDQtPnXpORKNWmG
zZS+E/65Vy9LgP3WPL/E/ONM9bVabKNtzl8iJR/k2lY3Tb9XdR26Mbr1mtdRRTYW
rhQLWpSNLyDA1SSAAS+LDGVBmVKzDZI1Wn/PPy905le4R27/kLTXhgTtMFlks5CX
0XhCkbXHGHvVznwyOCBiAykRGVaxodelqS6iSh+4EqbK4KgL4/Stgbhhzbl4moHI
SOIszxpNJLM3VWkfBiuRSN3vTKceB5DqFRGPWwySI7+x3an/9m+BI8csuJZyYFph
rDjKCP/eso5b4i5zAM5j0uRqS1ZkJA==
=wGlk
-----END PGP SIGNATURE-----

--hncw4q4q4rfj4pvi--
