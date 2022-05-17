Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56EDC52A4EF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 16:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349004AbiEQOdp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 10:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiEQOdk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 10:33:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E280F26136
        for <linux-i2c@vger.kernel.org>; Tue, 17 May 2022 07:33:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nqyGK-0000vx-JO; Tue, 17 May 2022 16:33:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nqyGK-002tMI-Vi; Tue, 17 May 2022 16:33:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nqyGI-00AK2F-Vy; Tue, 17 May 2022 16:33:22 +0200
Date:   Tue, 17 May 2022 16:33:19 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tudor.Ambarus@microchip.com
Cc:     alexandre.belloni@bootlin.com, ard.biesheuvel@linaro.org,
        Nicolas.Ferre@microchip.com, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de, Claudiu.Beznea@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: Bug in atmel-ecc driver
Message-ID: <20220517143319.oi7cpgqumv2gn2l6@pengutronix.de>
References: <20220513135954.exewihnibnhdckkn@pengutronix.de>
 <20220517102432.pljcsjkar3oswdnl@pengutronix.de>
 <99a8c7b0-ca73-25a2-f839-9a96cc0989e4@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bgupnwbm6q7iq7pz"
Content-Disposition: inline
In-Reply-To: <99a8c7b0-ca73-25a2-f839-9a96cc0989e4@microchip.com>
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


--bgupnwbm6q7iq7pz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 17, 2022 at 01:11:22PM +0000, Tudor.Ambarus@microchip.com wrote:
> On 5/17/22 13:24, Uwe Kleine-K=F6nig wrote:
> > On Fri, May 13, 2022 at 03:59:54PM +0200, Uwe Kleine-K=F6nig wrote:
> >> TL;DR: when a device bound to the drivers/crypto/atmel-ecc.c driver is
> >> unbound while tfm_count isn't zero, this probably results in a
> >> use-after-free.
> >>
> >> The .remove function has:
> >>
> >> 	if (atomic_read(&i2c_priv->tfm_count)) {
> >>                 dev_err(&client->dev, "Device is busy\n");
> >>                 return -EBUSY;
> >>         }
> >>
> >> before actually calling the cleanup stuff. If this branch is hit the
> >> result is likely:
> >>
> >>  - "Device is busy" from drivers/crypto/atmel-ecc.c
> >>  - "remove failed (EBUSY), will be ignored" from the i2c core
> >>  - the devm cleanup callbacks are called, including the one kfreeing
> >>    *i2c_priv
> >>  - at a later time atmel_ecc_i2c_client_free() is called which does
> >>    atomic_dec(&i2c_priv->tfm_count);
> >>  - *boom*
> >>
> >> I think to fix that you need to call get_device for the i2c device
> >> before increasing tfm_count (and a matching put_device when decreasing
> >> it). Having said that the architecture of this driver looks strange to
> >> me, so there might be nicer fixes (probably with more effort).
> > I tried to understand the architecture a bit, what I found is
> > irritating. So the atmel-ecc driver provides a static struct kpp_alg
> > atmel_ecdh_nist_p256 which embeds a struct crypto_alg (.base). During
> > .probe() it calls crypto_register_kpp on that global kpp_alg. That is,
> > if there are two or more devices bound to this driver, the same kpp_alg
> > structure is registered repeatedly.  This involves (among others)
> >=20
> >  - refcount_set(&atmel_ecdh_nist_p256.base.cra_refcount)
> >    in crypto_check_alg()
> >  - INIT_LIST_HEAD(&atmel_ecdh_nist_p256.base.cra_users)
> >    in __crypto_register_alg()
> >=20
> > and then a check about registering the same alg twice which makes the
> > call crypto_register_alg() return -EEXIST. So if a second device is
> > bound, it probably corrupts the first device and then fails to probe.
> >=20
> > So there can always be (at most) only one bound device which somehow
> > makes the whole logic in atmel_ecdh_init_tfm ->
> > atmel_ecc_i2c_client_alloc to select the least used(?) i2c client among
> > all the bound devices ridiculous.
>=20
> It's been a while since I last worked with ateccx08, but as far as I reme=
mber
> it contains 3 crypto IPs (ecdh, ecdsa, sha) that communicate over the same
> i2c address. So if someone adds support for all algs and plug in multiple
> ateccx08 devices, then the distribution of tfms across the i2c clients ma=
y work.

It would require to register the crypto backends independent of the
=2Eprobe() routine though.

> Anyway, if you feel that the complexity is superfluous as the code is now=
, we
> can get rid of the i2c_client_alloc logic and add it later on when/if nee=
ded.

If it's you who acts, do whatever pleases you. If it's me I'd go for a
quick and simple solution to get back to what I originally want to do
with this driver.

So I'd go for something like

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 333fbefbbccb..e7f3f4793c55 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -349,8 +349,13 @@ static int atmel_ecc_remove(struct i2c_client *client)
=20
 	/* Return EBUSY if i2c client already allocated. */
 	if (atomic_read(&i2c_priv->tfm_count)) {
-		dev_err(&client->dev, "Device is busy\n");
-		return -EBUSY;
+		/*
+		 * After we return here, the memory backing the device is freed.
+		 * If there is still some action pending, it probably involves
+		 * accessing free'd memory.
+		 */
+		dev_emerg(&client->dev, "Hell is about to break loose, expect memory cor=
ruption.\n");
+		return 0;
 	}
=20
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);

because I'm not in yacc-shaving mood.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bgupnwbm6q7iq7pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKDsisACgkQwfwUeK3K
7Al2Vgf8CfAKHRZam68ITA4P6icvgd9nGZCJMHKglR31hgW+gbRhyXbebPtd6aDN
5RYa9llhoy5Vtnokj4+VPOHj4yZar8o0gJoMtltSc6RkfUFNOk3gkOWacaWQFdBZ
UO5a87Uc3yMP+JwGlMbXifdXZ+tChkQ2C6l1VD1po+z1m5kpDD509aglXkNMt2VT
PIpbKNFg5+sqK0dYjHpjGU+8HWt3KOxxUyRrPnMljwxpEZUghnBsrorc9C+OtHVW
+hv3QXe05E4wGRr8slgcyXB4Or8WCRQGvitbQrG7XPsq+r/84UUecMvipNfHcpJ3
+KoMXpS+uTs8FFV9/Xmu2oJXpWo4+g==
=QNLN
-----END PGP SIGNATURE-----

--bgupnwbm6q7iq7pz--
