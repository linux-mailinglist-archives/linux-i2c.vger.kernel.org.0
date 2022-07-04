Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6359564FDD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jul 2022 10:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiGDIj6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jul 2022 04:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiGDIj6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jul 2022 04:39:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5B3B4B7
        for <linux-i2c@vger.kernel.org>; Mon,  4 Jul 2022 01:39:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o8HcT-000163-Ia; Mon, 04 Jul 2022 10:39:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o8HcO-004Kpb-OZ; Mon, 04 Jul 2022 10:39:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o8HcR-002u9x-L3; Mon, 04 Jul 2022 10:39:47 +0200
Date:   Mon, 4 Jul 2022 10:39:47 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Johannes Holland <johannes.holland@infineon.com>,
        Amir Mizinski <amirmizi6@gmail.com>,
        Alexander Steffen <Alexander.Steffen@infineon.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH 0/6] i2c: Make remove callback return void
Message-ID: <20220704083947.55ioswcze7r36g44@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y5aw2syq7mhf2y53"
Content-Disposition: inline
In-Reply-To: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
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


--y5aw2syq7mhf2y53
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 04:03:06PM +0200, Uwe Kleine-K=F6nig wrote:
> as announced in
> https://lore.kernel.org/linux-i2c/20220609091018.q52fhowlsdbdkct5@pengutr=
onix.de
> I intend to change the remove prototype for i2c drivers to remove void.
>=20
> As this touches quite some drivers, the plan is to submit this change
> for inclusion after the next merge window and get it quickly into next
> that other subsystems have enough time to adapt.
>=20
> Still to give the opportunity to comment I send the patch set out based
> on v5.19-rc4. There are still a few patches in next that are required,
> namely:
>=20
> 	d04d46dd82ad iio:magnetometer:mbc150: Make bmc150_magn_remove() return v=
oid
> 	7576bc05b360 iio:light:vcnl4035: Improve error reporting for problems du=
ring .remove()
> 	ab91da2f2574 iio:light:vcnl4000: Improve error reporting for problems du=
ring .remove()
> 	5049646718d7 iio:light:us5182d: Improve error reporting for problems dur=
ing .remove()
> 	be9f6004be88 iio:light:pa12203001: Improve error reporting for problems =
during .remove()
> 	730cd2f54eba iio:chemical:ccs811: Improve error reporting for problems d=
uring .remove()
> 	a76209246d9f iio:chemical:atlas: Improve error reporting for problems du=
ring .remove()
> 	8f760ce7affd iio:adc:ti-ads1015: Improve error reporting for problems du=
ring .remove()
> 	ffa952e95d8c iio:adc:ina2xx: Improve error reporting for problems during=
 .remove()
> 	48d1ae774099 iio: health: afe4404: Remove duplicated error reporting in =
=2Eremove()
> 	8dc0a72795e4 iio:light:tsl2583: Remove duplicated error reporting in .re=
move()
> 	58a6df5580bb iio:light:stk3310: Remove duplicated error reporting in .re=
move()
> 	44ceb791182a iio:light:opt3001: Remove duplicated error reporting in .re=
move()
> 	f0e34d262567 iio:light:jsa1212: Remove duplicated error reporting in .re=
move()
> 	8d3d6baa4990 iio:light:isl29028: Remove duplicated error reporting in .r=
emove()
> 	5004e24a466c iio:light:bh1780: Remove duplicated error reporting in .rem=
ove()
> 	1db6926d611d iio:accel:stk8ba50: Remove duplicated error reporting in .r=
emove()
> 	1aec857d50ce iio:accel:stk8312: Remove duplicated error reporting in .re=
move()
> 	aae59bdf2585 iio:accel:mc3230: Remove duplicated error reporting in .rem=
ove()
> 	7df7563b16aa crypto: atmel-ecc - Remove duplicated error reporting in .r=
emove()
> 	99ad11e06be8 i2c: dummy: Drop no-op remove function
> 	84965cc60e64 ASoC: cs35l45: Make cs35l45_remove() return void
> 	fb68cb963bb7 ASoC: da732x: Drop no-op remove function
> 	3cce931a5e44 ASoC: lm49453: Drop no-op remove function
> 	8a291eebeb63 ASoC: da7219: Drop no-op remove function
> 	60391d788a22 ASoC: ak4642: Drop no-op remove function
> 	51bd0abd873d extcon: fsa9480: Drop no-op remove function
>=20
> I hope and assume they will all be included in v5.20-rc1. There are 5
> more patches required that didn't made it into next yet (i.e. patches #1
> - #5 of this series).
>=20
> There are also two drivers in next that need adaption:
>=20
> 	drivers/gpu/drm/bridge/ti-dlpc3433.c
> 	drivers/tty/serial/max310x.c

There is now a third driver in next that is affected:
drivers/char/tpm/tpm_tis_i2c.c that was added with commit
88f3b0f519c068ad29c92e965239a7900a2deea3 to next.

A tree containing patched #1 to #5 merges just fine with next/master.
When merging patch 6 into the result the merge resolution looks as
follows:

diff --cc drivers/gpu/drm/bridge/parade-ps8640.c
index 31e88cb39f8a,a09d1828d8e1..000000000000
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
diff --cc drivers/gpu/drm/bridge/ti-sn65dsi83.c
index dc26640e7d9b,8f93e374848c..000000000000
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@@ -712,8 -731,7 +712,6 @@@ static void sn65dsi83_remove(struct i2c
  	struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
 =20
  	drm_bridge_remove(&ctx->bridge);
-=20
- 	return 0;
 -	of_node_put(ctx->host_node);
  }
 =20
  static struct i2c_device_id sn65dsi83_id[] =3D {
diff --cc drivers/iio/accel/bma400_i2c.c
index 1ba2a982ea73,90c99ab8c8f2..000000000000
--- a/drivers/iio/accel/bma400_i2c.c
+++ b/drivers/iio/accel/bma400_i2c.c
diff --cc drivers/input/keyboard/adp5588-keys.c
index 1a1a05d7cd42,b5666d650994..000000000000
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@@ -590,21 -584,43 +590,20 @@@ static int adp5588_probe(struct i2c_cli
 =20
  	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
  	return 0;
 -
 - err_free_irq:
 -	free_irq(client->irq, kpad);
 -	cancel_delayed_work_sync(&kpad->work);
 - err_unreg_dev:
 -	input_unregister_device(input);
 -	input =3D NULL;
 - err_free_mem:
 -	input_free_device(input);
 -	kfree(kpad);
 -
 -	return error;
  }
 =20
- static int adp5588_remove(struct i2c_client *client)
+ static void adp5588_remove(struct i2c_client *client)
  {
 -	struct adp5588_kpad *kpad =3D i2c_get_clientdata(client);
 -
  	adp5588_write(client, CFG, 0);
 -	free_irq(client->irq, kpad);
 -	cancel_delayed_work_sync(&kpad->work);
 -	input_unregister_device(kpad->input);
 -	adp5588_gpio_remove(kpad);
 -	kfree(kpad);
 +
 +	/* all resources will be freed by devm */
- 	return 0;
  }
 =20
 -#ifdef CONFIG_PM
 -static int adp5588_suspend(struct device *dev)
 +static int __maybe_unused adp5588_suspend(struct device *dev)
  {
 -	struct adp5588_kpad *kpad =3D dev_get_drvdata(dev);
 -	struct i2c_client *client =3D kpad->client;
 +	struct i2c_client *client =3D to_i2c_client(dev);
 =20
  	disable_irq(client->irq);
 -	cancel_delayed_work_sync(&kpad->work);
 -
 -	if (device_may_wakeup(&client->dev))
 -		enable_irq_wake(client->irq);
 =20
  	return 0;
  }
diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index 8e0686fe4eb1..5299e30657b8 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -351,13 +351,12 @@ static int tpm_tis_i2c_probe(struct i2c_client *dev,
 				 NULL);
 }
=20
-static int tpm_tis_i2c_remove(struct i2c_client *client)
+static void tpm_tis_i2c_remove(struct i2c_client *client)
 {
 	struct tpm_chip *chip =3D i2c_get_clientdata(client);
=20
 	tpm_chip_unregister(chip);
 	tpm_tis_remove(chip);
-	return 0;
 }
=20
 static const struct i2c_device_id tpm_tis_i2c_id[] =3D {
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/=
ti-dlpc3433.c
index 06e519798ac5..c1b94bc183e6 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -378,14 +378,12 @@ static int dlpc3433_probe(struct i2c_client *client)
 	return ret;
 }
=20
-static int dlpc3433_remove(struct i2c_client *client)
+static void dlpc3433_remove(struct i2c_client *client)
 {
 	struct dlpc *dlpc =3D i2c_get_clientdata(client);
=20
 	drm_bridge_remove(&dlpc->bridge);
 	of_node_put(dlpc->host_node);
-
-	return 0;
 }
=20
 static const struct i2c_device_id dlpc3433_id[] =3D {
diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index e162bfb44080..8a4d0defa0cb 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1616,11 +1616,9 @@ static int max310x_i2c_probe(struct i2c_client *clie=
nt)
 			     regmaps, client->irq);
 }
=20
-static int max310x_i2c_remove(struct i2c_client *client)
+static void max310x_i2c_remove(struct i2c_client *client)
 {
 	max310x_remove(&client->dev);
-
-	return 0;
 }
=20
 static struct i2c_driver max310x_i2c_driver =3D {

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y5aw2syq7mhf2y53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLCp1AACgkQwfwUeK3K
7AmRiwf7B7O29fr8DKJCvZjXFEoU2tVCodsP0mcqFRYgTyI6KPOHcX7hAXc9rllJ
rL+Z1fAHAnZJEcVGwaUtgoAzNuN2zP3t0l23Nf+g2rQkeROulFZyjTCeqWEhiaFB
kdp0ZkJywd3lYzPEZPcRL0RCAGGzx7wdDsCunip+MGfDK9dUQ9oEFTqv/mDSlcbQ
+P0twM0lKTQYzshZ7Y+t7pilTa3VawWzjfI+dg1MypcKWN9K2a/XbDQ4bEiriMk6
ZI0DccfbmfhYIKDf4MsgFV9EmkRVwQbA1NzHxkhuSoWfAtuBMc6MtasoD71IGQ/G
Oc44rn9JQzTvl/RNv2e++dwSdsx2Ng==
=Drmq
-----END PGP SIGNATURE-----

--y5aw2syq7mhf2y53--
