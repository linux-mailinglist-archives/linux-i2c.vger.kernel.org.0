Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9819E58FC8A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbiHKMlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234280AbiHKMlN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:41:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EA4EE10
        for <linux-i2c@vger.kernel.org>; Thu, 11 Aug 2022 05:41:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oM7UR-0000di-Bh; Thu, 11 Aug 2022 14:40:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oM7UB-003752-GW; Thu, 11 Aug 2022 14:40:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oM7UD-00B0Oa-5L; Thu, 11 Aug 2022 14:40:29 +0200
Date:   Thu, 11 Aug 2022 14:40:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Johannes Holland <johannes.holland@infineon.com>,
        Amir Mizinski <amirmizi6@gmail.com>,
        Alexander Steffen <Alexander.Steffen@infineon.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Christopher Vollo <chris@renewoutreach.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xin Ji <xji@analogixsemi.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     linux-integrity@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Matt Johnston <matt@codeconstruct.com.au>
Subject: Re: [PATCH 0/6] i2c: Make remove callback return void
Message-ID: <20220811124029.usxahk5nvfgqsm42@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220704083947.55ioswcze7r36g44@pengutronix.de>
 <20220716151527.u5vh4lz6ubpqq2tv@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gkhsgi5uufotq4an"
Content-Disposition: inline
In-Reply-To: <20220716151527.u5vh4lz6ubpqq2tv@pengutronix.de>
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


--gkhsgi5uufotq4an
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

just a heads up a few days before I expect -rc1 to be tagged when I will
send the next version of the remove prototype conversion with the goal
to get this into next soon.

For those who are new to this thread: The series discussed here probably
conflicts with one of the patches recently merged into the mainline.
There is no action expected from your side, but you might have a look at
my series.

On Sat, Jul 16, 2022 at 05:15:27PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Jul 04, 2022 at 10:39:47AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jun 28, 2022 at 04:03:06PM +0200, Uwe Kleine-K=F6nig wrote:
> > > as announced in
> > > https://lore.kernel.org/linux-i2c/20220609091018.q52fhowlsdbdkct5@pen=
gutronix.de
> > > I intend to change the remove prototype for i2c drivers to remove voi=
d.
> > >=20
> > > As this touches quite some drivers, the plan is to submit this change
> > > for inclusion after the next merge window and get it quickly into next
> > > that other subsystems have enough time to adapt.
> > >=20
> > > Still to give the opportunity to comment I send the patch set out bas=
ed
> > > on v5.19-rc4. There are still a few patches in next that are required,
> > > namely:
> > >=20
> > > 	d04d46dd82ad iio:magnetometer:mbc150: Make bmc150_magn_remove() retu=
rn void
> > > 	7576bc05b360 iio:light:vcnl4035: Improve error reporting for problem=
s during .remove()
> > > 	ab91da2f2574 iio:light:vcnl4000: Improve error reporting for problem=
s during .remove()
> > > 	5049646718d7 iio:light:us5182d: Improve error reporting for problems=
 during .remove()
> > > 	be9f6004be88 iio:light:pa12203001: Improve error reporting for probl=
ems during .remove()
> > > 	730cd2f54eba iio:chemical:ccs811: Improve error reporting for proble=
ms during .remove()
> > > 	a76209246d9f iio:chemical:atlas: Improve error reporting for problem=
s during .remove()
> > > 	8f760ce7affd iio:adc:ti-ads1015: Improve error reporting for problem=
s during .remove()
> > > 	ffa952e95d8c iio:adc:ina2xx: Improve error reporting for problems du=
ring .remove()
> > > 	48d1ae774099 iio: health: afe4404: Remove duplicated error reporting=
 in .remove()
> > > 	8dc0a72795e4 iio:light:tsl2583: Remove duplicated error reporting in=
 .remove()
> > > 	58a6df5580bb iio:light:stk3310: Remove duplicated error reporting in=
 .remove()
> > > 	44ceb791182a iio:light:opt3001: Remove duplicated error reporting in=
 .remove()
> > > 	f0e34d262567 iio:light:jsa1212: Remove duplicated error reporting in=
 .remove()
> > > 	8d3d6baa4990 iio:light:isl29028: Remove duplicated error reporting i=
n .remove()
> > > 	5004e24a466c iio:light:bh1780: Remove duplicated error reporting in =
=2Eremove()
> > > 	1db6926d611d iio:accel:stk8ba50: Remove duplicated error reporting i=
n .remove()
> > > 	1aec857d50ce iio:accel:stk8312: Remove duplicated error reporting in=
 .remove()
> > > 	aae59bdf2585 iio:accel:mc3230: Remove duplicated error reporting in =
=2Eremove()
> > > 	7df7563b16aa crypto: atmel-ecc - Remove duplicated error reporting i=
n .remove()
> > > 	99ad11e06be8 i2c: dummy: Drop no-op remove function
> > > 	84965cc60e64 ASoC: cs35l45: Make cs35l45_remove() return void
> > > 	fb68cb963bb7 ASoC: da732x: Drop no-op remove function
> > > 	3cce931a5e44 ASoC: lm49453: Drop no-op remove function
> > > 	8a291eebeb63 ASoC: da7219: Drop no-op remove function
> > > 	60391d788a22 ASoC: ak4642: Drop no-op remove function
> > > 	51bd0abd873d extcon: fsa9480: Drop no-op remove function
> > >
> > > I hope and assume they will all be included in v5.20-rc1.

These are all in Linus' tree now.

> > > There are 5 more patches required that didn't made it into next
> > > yet (i.e. patches #1 - #5 of this series).

This didn't change. These are still not in next so I will most probabaly
include them in the next round. Good news is that no new drivers needed
a preparing adaption.

I pushed the current version of the series to

	https://git.pengutronix.de/git/ukl/linux i2c-remove-void

based on current Linus' master
(ffcf9c5700e49c0aee42dcba9a12ba21338e8136). Build tests are running, I
don't expect surprises (and will silently update above tree if
necessary.)

Looking at the range-diff since I submitted v1, the following happend
since then:

 - Several acks and Reviewed-by's added

 - A few drivers don't need adaption any more because they were removed
   or their remove callback war dropped:
    - arch/arm/mach-davinci/board-dm644x-evm.c (dropped in 7dd33764486d)
    - arch/arm/mach-davinci/board-dm646x-evm.c (dropped in b4aed01de486)
    - drivers/gpu/drm/bridge/parade-ps8640.c (.remove dropped in 10e619f1f3=
1c)
    - drivers/hwmon/mcp3021.c (.remove dropped in 03508eea5385)
    - drivers/iio/accel/bma400_i2c.c (.remove dropped in 12c99f859fd3)
    - drivers/leds/leds-is31fl319x.c (.remove dropped in e1af5c815586)
    - sound/soc/codecs/nau8821.c (.remove dropped in 2d86cef353b8)

 - A few new drivers:
    - drivers/char/tpm/tpm_tis_i2c.c (bbc23a07b072)
    - drivers/gpu/drm/bridge/ti-dlpc3433.c (6352cd451ddb)
    - drivers/media/i2c/ar0521.c (852b50aeed15)
    - drivers/tty/serial/max310x.c (Added i2c support, 2e1f2d9a9bdb)
    - drivers/usb/typec/anx7411.c (fe6d8a9c8e64)
    - drivers/usb/typec/ucsi/ucsi_stm32g0.c (72849d4fcee7)

 - A few changes due to (mostly trivial) conflicts with upstream changes
    - drivers/gpu/drm/bridge/ti-sn65dsi83.c (fc8adb13d844)
    - drivers/iio/adc/ad799x.c (078d37b73f05)
    - drivers/iio/gyro/itg3200_core.c (fa55750642d0)
    - drivers/iio/light/bh1750.c (7eff2dcec69c)
    - drivers/iio/light/gp2ap002.c (7b79cda9e297)
    - drivers/iio/light/tsl2563.c (76faa32077b0)
    - drivers/iio/light/us5182d.c (a79163d19ef7)
    - drivers/iio/light/vcnl4000.c (cd4d10b134c2)
    - drivers/iio/light/vcnl4035.c (b904854e14bb)
    - drivers/iio/magnetometer/ak8974.c (74f4595ab7f8)
    - drivers/iio/magnetometer/yamaha-yas530.c (e5933cf48779)
    - sound/soc/codecs/sgtl5000.c (bf2aebccddef)

 - Remove a comment form drivers/net/mctp/mctp-i2c.c that doesn't match
   any more.  (Noticed by Matt Johnston)
 - Removed a stray change to lib/Kconfig.kasan that I needed for build
   testing but that wasn't ment to be included. (Noticed by Andrey
   Ryabinin).

Currently this series conflicts with changes to
drivers/input/keyboard/adp5588-keys.c that are waiting in next to reach
Linus' tree. The conflict resolution looks as follows:

diff --cc drivers/input/keyboard/adp5588-keys.c
index b5666d650994,1a1a05d7cd42..000000000000
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@@ -584,43 -590,21 +590,20 @@@ static int adp5588_probe(struct i2c_cli
 =20
  	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
  	return 0;
-=20
-  err_free_irq:
- 	free_irq(client->irq, kpad);
- 	cancel_delayed_work_sync(&kpad->work);
-  err_unreg_dev:
- 	input_unregister_device(input);
- 	input =3D NULL;
-  err_free_mem:
- 	input_free_device(input);
- 	kfree(kpad);
-=20
- 	return error;
  }
 =20
 -static int adp5588_remove(struct i2c_client *client)
 +static void adp5588_remove(struct i2c_client *client)
  {
- 	struct adp5588_kpad *kpad =3D i2c_get_clientdata(client);
-=20
  	adp5588_write(client, CFG, 0);
- 	free_irq(client->irq, kpad);
- 	cancel_delayed_work_sync(&kpad->work);
- 	input_unregister_device(kpad->input);
- 	adp5588_gpio_remove(kpad);
- 	kfree(kpad);
+=20
+ 	/* all resources will be freed by devm */
 -	return 0;
  }
 =20
- #ifdef CONFIG_PM
- static int adp5588_suspend(struct device *dev)
+ static int __maybe_unused adp5588_suspend(struct device *dev)
  {
- 	struct adp5588_kpad *kpad =3D dev_get_drvdata(dev);
- 	struct i2c_client *client =3D kpad->client;
+ 	struct i2c_client *client =3D to_i2c_client(dev);
 =20
  	disable_irq(client->irq);
- 	cancel_delayed_work_sync(&kpad->work);
-=20
- 	if (device_may_wakeup(&client->dev))
- 		enable_irq_wake(client->irq);
 =20
  	return 0;
  }

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gkhsgi5uufotq4an
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmL0+LcACgkQwfwUeK3K
7AnB5Af/R/nSajdGZFOlbd7vUVXd9lxTGlrPYDj91QPTA2SaIRos+K5QdgZnk2Rj
H3DTfgL8VX/yhVCf7qkpfHcn7CX4Uoyd6sX0cgwb8y5KV11BpggDvbeabDFfF+L7
GJIcD1in2FwsGItnhZJ6RXWY2MpskY2/NH7TOraOzt1jmQk7tjS0f3hNJh9Wka+1
njs3tdw3cKmYGKAAQS/nDVXu1TtKYW+7ctaeMUSuLSZLsMb/sXmJubGg3GEw+4KJ
BOrONAOLKf6l8dNCBRgiJN+NgXoMuEZK2y8jgBEy0zVeBt4ODsgzL8uQAikPTxYe
OMuW/rtznm+wY6lz4n6lXpwFchnJcw==
=Vlb2
-----END PGP SIGNATURE-----

--gkhsgi5uufotq4an--
