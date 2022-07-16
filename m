Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED1B576FA7
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Jul 2022 17:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiGPPPv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 11:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiGPPPu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 11:15:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CF31A38D
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 08:15:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCjW0-0005St-Rz; Sat, 16 Jul 2022 17:15:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCjVy-001L7h-KS; Sat, 16 Jul 2022 17:15:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCjVy-005ZdW-1F; Sat, 16 Jul 2022 17:15:30 +0200
Date:   Sat, 16 Jul 2022 17:15:27 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Johannes Holland <johannes.holland@infineon.com>,
        Amir Mizinski <amirmizi6@gmail.com>,
        Alexander Steffen <Alexander.Steffen@infineon.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-integrity@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 0/6] i2c: Make remove callback return void
Message-ID: <20220716151527.u5vh4lz6ubpqq2tv@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220704083947.55ioswcze7r36g44@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tp4j3fkdykbndk3l"
Content-Disposition: inline
In-Reply-To: <20220704083947.55ioswcze7r36g44@pengutronix.de>
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


--tp4j3fkdykbndk3l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 04, 2022 at 10:39:47AM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Jun 28, 2022 at 04:03:06PM +0200, Uwe Kleine-K=F6nig wrote:
> > as announced in
> > https://lore.kernel.org/linux-i2c/20220609091018.q52fhowlsdbdkct5@pengu=
tronix.de
> > I intend to change the remove prototype for i2c drivers to remove void.
> >=20
> > As this touches quite some drivers, the plan is to submit this change
> > for inclusion after the next merge window and get it quickly into next
> > that other subsystems have enough time to adapt.
> >=20
> > Still to give the opportunity to comment I send the patch set out based
> > on v5.19-rc4. There are still a few patches in next that are required,
> > namely:
> >=20
> > 	d04d46dd82ad iio:magnetometer:mbc150: Make bmc150_magn_remove() return=
 void
> > 	7576bc05b360 iio:light:vcnl4035: Improve error reporting for problems =
during .remove()
> > 	ab91da2f2574 iio:light:vcnl4000: Improve error reporting for problems =
during .remove()
> > 	5049646718d7 iio:light:us5182d: Improve error reporting for problems d=
uring .remove()
> > 	be9f6004be88 iio:light:pa12203001: Improve error reporting for problem=
s during .remove()
> > 	730cd2f54eba iio:chemical:ccs811: Improve error reporting for problems=
 during .remove()
> > 	a76209246d9f iio:chemical:atlas: Improve error reporting for problems =
during .remove()
> > 	8f760ce7affd iio:adc:ti-ads1015: Improve error reporting for problems =
during .remove()
> > 	ffa952e95d8c iio:adc:ina2xx: Improve error reporting for problems duri=
ng .remove()
> > 	48d1ae774099 iio: health: afe4404: Remove duplicated error reporting i=
n .remove()
> > 	8dc0a72795e4 iio:light:tsl2583: Remove duplicated error reporting in .=
remove()
> > 	58a6df5580bb iio:light:stk3310: Remove duplicated error reporting in .=
remove()
> > 	44ceb791182a iio:light:opt3001: Remove duplicated error reporting in .=
remove()
> > 	f0e34d262567 iio:light:jsa1212: Remove duplicated error reporting in .=
remove()
> > 	8d3d6baa4990 iio:light:isl29028: Remove duplicated error reporting in =
=2Eremove()
> > 	5004e24a466c iio:light:bh1780: Remove duplicated error reporting in .r=
emove()
> > 	1db6926d611d iio:accel:stk8ba50: Remove duplicated error reporting in =
=2Eremove()
> > 	1aec857d50ce iio:accel:stk8312: Remove duplicated error reporting in .=
remove()
> > 	aae59bdf2585 iio:accel:mc3230: Remove duplicated error reporting in .r=
emove()
> > 	7df7563b16aa crypto: atmel-ecc - Remove duplicated error reporting in =
=2Eremove()
> > 	99ad11e06be8 i2c: dummy: Drop no-op remove function
> > 	84965cc60e64 ASoC: cs35l45: Make cs35l45_remove() return void
> > 	fb68cb963bb7 ASoC: da732x: Drop no-op remove function
> > 	3cce931a5e44 ASoC: lm49453: Drop no-op remove function
> > 	8a291eebeb63 ASoC: da7219: Drop no-op remove function
> > 	60391d788a22 ASoC: ak4642: Drop no-op remove function
> > 	51bd0abd873d extcon: fsa9480: Drop no-op remove function
> >=20
> > I hope and assume they will all be included in v5.20-rc1. There are 5
> > more patches required that didn't made it into next yet (i.e. patches #1
> > - #5 of this series).
> >=20
> > There are also two drivers in next that need adaption:
> >=20
> > 	drivers/gpu/drm/bridge/ti-dlpc3433.c
> > 	drivers/tty/serial/max310x.c
>=20
> There is now a third driver in next that is affected:
> drivers/char/tpm/tpm_tis_i2c.c that was added with commit
> 88f3b0f519c068ad29c92e965239a7900a2deea3 to next.
>=20
> A tree containing patched #1 to #5 merges just fine with next/master.
> When merging patch 6 into the result the merge resolution looks as
> follows:

Now there is a forth driver in next that needs adaption:
drivers/media/i2c/ar0521.c adding=20

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index c7bdfc69b9be..c6ab531532be 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1018,7 +1018,7 @@ static int ar0521_probe(struct i2c_client *client)
 	return ret;
 }
=20
-static int ar0521_remove(struct i2c_client *client)
+static void ar0521_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
 	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
@@ -1031,7 +1031,6 @@ static int ar0521_remove(struct i2c_client *client)
 		ar0521_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 	mutex_destroy(&sensor->lock);
-	return 0;
 }
=20
 static const struct dev_pm_ops ar0521_pm_ops =3D {

to the patch needed on top of v5.20-rc1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tp4j3fkdykbndk3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLS1gwACgkQwfwUeK3K
7Alqwwf6A3SFKx5mK9sV+UR870u7oDNMqMIMLaS2XMjhIA6ck1Ml6B4kKV+C25xg
nigQn2p0d1ZymPushddxbzuQPaWWrcnxPWlyH4Yu7NKTlqXcoQIMB05NG/sz5+zA
sdV/C+q/333KnzkgvATvRv0Itq+YKJXxw8ezPameUz5LusPZ7QQbEUeeuelTJKJM
3AJKi0NeVIQJqkUfI4qkdFKa1T3g1tw2Mt5ZEmmbqVBNHy0pAA9qBcYtsyhpRZQV
CtQFJ/56/jtreNB4CFqI86lOrzNv7lTB9QFO917Xwm4ad+PlTtmiX7L8HVFwl3sC
jOj3oJzSRs8ApwYCAGAGcJ6lZE/j6w==
=04Fi
-----END PGP SIGNATURE-----

--tp4j3fkdykbndk3l--
