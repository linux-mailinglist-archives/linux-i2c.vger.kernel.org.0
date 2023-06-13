Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED2172DA55
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 09:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240034AbjFMHCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 03:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234080AbjFMHCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 03:02:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D290110F4
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jun 2023 00:02:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8y34-0005QD-UI; Tue, 13 Jun 2023 09:02:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8y34-0073yL-7A; Tue, 13 Jun 2023 09:02:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8y33-00DmrH-LX; Tue, 13 Jun 2023 09:02:37 +0200
Date:   Tue, 13 Jun 2023 09:02:37 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] w1: ds2482: Switch back to use struct i2c_driver's
 .probe()
Message-ID: <20230613070237.srqd3sy2c3lp7u5p@pengutronix.de>
References: <20230612072807.839689-1-u.kleine-koenig@pengutronix.de>
 <6d76105f-daa1-1cd0-35b3-1727aa967bcc@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gwtzb2qs7pphebd5"
Content-Disposition: inline
In-Reply-To: <6d76105f-daa1-1cd0-35b3-1727aa967bcc@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gwtzb2qs7pphebd5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Mon, Jun 12, 2023 at 10:10:30PM +0200, Krzysztof Kozlowski wrote:
> On 12/06/2023 09:28, Uwe Kleine-K=F6nig wrote:
> > After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> > call-back type"), all drivers being converted to .probe_new() and then
> > commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> > convert back to (the new) .probe() to be able to eventually drop
> > .probe_new() from struct i2c_driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/w1/masters/ds2482.c | 2 +-
>=20
> Thank you for the patch.
> It is too late in the cycle for me to pick it up. I will take it after
> the merge window.

This is one of only 19 patches that are still needed on top of what is
currently in next before I can drop .probe_new() which I intended to
tackle after the upcoming merge window. I expect that most of these 19
patches will still be picked up and go into v6.5-rc1.

Assuming there are only less than 10 patches remaining on top of
v6.5-rc1, I intend to create a pull request for Wolfram with the
remaining bits and a patch doing

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 13a1ce38cb0c..3b2434812611 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -237,7 +237,6 @@ enum i2c_driver_flags {
  * struct i2c_driver - represent an I2C device driver
  * @class: What kind of i2c device we instantiate (for detect)
  * @probe: Callback for device binding
- * @probe_new: Transitional callback for device binding - do not use
  * @remove: Callback for device unbinding
  * @shutdown: Callback for device shutdown
  * @alert: Alert callback, for example for the SMBus alert protocol
@@ -272,16 +271,8 @@ enum i2c_driver_flags {
 struct i2c_driver {
 	unsigned int class;
=20
-	union {
 	/* Standard driver model interfaces */
-		int (*probe)(struct i2c_client *client);
-		/*
-		 * Legacy callback that was part of a conversion of .probe().
-		 * Today it has the same semantic as .probe(). Don't use for new
-		 * code.
-		 */
-		int (*probe_new)(struct i2c_client *client);
-	};
+	int (*probe)(struct i2c_client *client);
 	void (*remove)(struct i2c_client *client);
=20
=20
early after v6.5-rc1.

So an ack from your side would be very welcome.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gwtzb2qs7pphebd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSIFIwACgkQj4D7WH0S
/k77cggAsrjnKEFgLyzawuPUM3fefd1zwwELumSXZXeM8cQPq5W05Ip049k6yh4s
VnXOmC/4cYo+19vEkUGYvfV0gAdseGmiOMw5lZkc3kHnwU0DH+zlp3Tswqlk8Zqi
eN6d8THTYrzrMDZ1Af3kjznCs26mRMZLIIggUBo9Gbk6/bjX6TObAVwB9SF1gtyL
lPY4UFDjI8ONpmxlHWORVheY5Grdc7KbE5z/MT232eJWP25d8HQlXaG8zCJC0bdK
+ttW3+mWGI4ONOiB3k1MPeK1RKlDaCykyPhNz8CkZbaPF6FmYV4wAtlCGQEzBvPE
neWXH95hJLsqp731IO0jBZwOYZN93Q==
=OFMn
-----END PGP SIGNATURE-----

--gwtzb2qs7pphebd5--
