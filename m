Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46377575BCC
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jul 2022 08:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiGOGtr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jul 2022 02:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiGOGtq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jul 2022 02:49:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F36528AD
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 23:49:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCF8n-0008VT-TM; Fri, 15 Jul 2022 08:49:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCF8m-0013ru-1f; Fri, 15 Jul 2022 08:49:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCF8l-005IP7-Ck; Fri, 15 Jul 2022 08:49:31 +0200
Date:   Fri, 15 Jul 2022 08:49:31 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220715064931.dvbzcufa3l3ojug4@pengutronix.de>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
 <20220713202541.GA532546@francesco-nb.int.toradex.com>
 <20220714070705.GH24373@pengutronix.de>
 <20220714073408.GA542904@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fe76be4jgemjeozb"
Content-Disposition: inline
In-Reply-To: <20220714073408.GA542904@francesco-nb.int.toradex.com>
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


--fe76be4jgemjeozb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Francesco,

On Thu, Jul 14, 2022 at 09:34:08AM +0200, Francesco Dolcini wrote:
> On Thu, Jul 14, 2022 at 09:07:05AM +0200, Oleksij Rempel wrote:
> > On Wed, Jul 13, 2022 at 10:25:41PM +0200, Francesco Dolcini wrote:
> > > Hello Oleksij,
> > >=20
> > > On Wed, Jul 13, 2022 at 05:57:23PM +0200, Oleksij Rempel wrote:
> > > > On Wed, Jul 13, 2022 at 03:43:29PM +0200, Francesco Dolcini wrote:
> > > > > On Wed, Jul 13, 2022 at 03:24:37PM +0200, Oleksij Rempel wrote:
> > > > > > On Wed, Jul 13, 2022 at 01:57:50PM +0200, Francesco Dolcini wro=
te:
> > > > > > > + oleksandr.suvorov@foundries.io
> > > > > > >=20
> > > > > > > Hello all,
> > > > > > >=20
> > > > > > > On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini w=
rote:
> > > > > > > > On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-K=C3=
=B6nig wrote:
> > > > > > > > > In which situations does this help? Please mention these =
in the
> > > > > > > > > commit log.
> > > > > > > > I'll do
> > > > > > >=20
> > > > > > > I did some investigation on this, unfortunately we have this =
change
> > > > > > > laying around since 1 year, it was written by Oleksandr, and =
in the
> > > > > > > meantime he moved to a new company. I added him to this email=
 thread, so
> > > > > > > he can comment in case he remembers more.
> > > > > > >=20
> > > > > > > We introduced this change while working on OV5640 camera sens=
or on an
> > > > > > > apalis-imx6q evaluation board, without this change we had som=
e sporadic
> > > > > > > i2c communication issues. Unfortunately I do not have any bet=
ter
> > > > > > > details.
> > > > > > >=20
> > > > > > > To me looks like having some (3? 5?) retry as a default is so=
mehow
> > > > > > > more reasonable than to never retry, not sure if this should =
be
> > > > > > > implemented as a default for all the i2c adapters. From what =
I was able
> > > > > > > to see that would not be a trivial change (the retry paramete=
r is coming
> > > > > > > from the i2c_imx driver, there is no obvious way to have a de=
fault in
> > > > > > > the i2c core).
> > > > > > >=20
> > > > > > > Would it work for you to keep the change as it is (just getti=
ng rid
> > > > > > > of the useless define) and add a little bit more blurb to the=
 commit
> > > > > > > message to include the various comments collected so far?
> > > > > >=20
> > > > > > I assume, it is related to reset time or other reason where the=
 camera
> > > > > > is not responding. In this case, amount of retries would depend=
 on I2C
> > > > > > CLK speed and host CPU speed.
> > > > > >=20
> > > > >=20
> > > > > The retry on the I2C IMX driver would trigger only on tx arbitrat=
ion
> > > > > failure, that would be the SDA being tied low by the slave in an
> > > > > unexpected moment, correct?=20
> > > >=20
> > > > If it is the case, it is better to understand why. Are there some
> > > > special timing requirements?
> > > >=20
> > > > > If the camera does not respond it will just
> > > > > not ack the transaction and that would not be recovered by the re=
try
> > > > > in this change.
> > > > >=20
> > > > > Can this just a layout/cabling issue with some noise on the SDA l=
ine? We
> > > > > are talking about somehow long board to board cables with various
> > > > > signals on it. This is an issue that we had for sure in the past,
> > > > > however I do have record of this only on a different camera.
> > > >=20
> > > > If it is cabling issue, then I would take a look at pinmux
> > > > configuration. If it is so noisy, that some errors are expected, th=
en it would
> > > > affect camera configuration as well. I mean, system is potentially
> > > > writing trash to the config register.
> > >=20
> > > I do not think that this is possible in the way you defined, if SDA is
> > > low when the master is driving it high the master will just stop
> > > transmitting and an arbitration lost interrupt is raised. I guess this
> > > is just the same for any I2C controller, anyway is defined in
> > > `35.7.4 I2C Status Register (I2Cx_I2SR)` in the i.MX6QDL reference ma=
nual.
> > >=20
> > > I guess it would be still theoretically possible that the master read
> > > garbage from the slave, I'm not aware of any mechanism to avoid it.
> > >=20
> > > Said that I do not have more details, for some unfortunate reason this
> > > change was laying in our downstream kernel since too long.
> > >=20
> > > Anyway, let's look at this in a different way, from what I was able to
> > > understand digging on this topic retrying on I2C arbitration lost is
> > > just the normal thing to do and the I2C core provides support for this
> > > since ever, the comment in i2c-core is
> > > /* Retry automatically on arbitration loss */.
> > >=20
> > > Setting retries to something like 3 or 5 is just very common, various
> > > drivers have this value in the first commit or had it added later on =
(as
> > > Uwe already commented)
> > >=20
> > > To me it seems like the most sensible thing to do, is there any reason
> > > why the i2c_imx driver should not do it?
> >=20
> > Here we go:
> > https://www.i2c-bus.org/i2c-primer/analysing-obscure-problems/master-re=
ports-arbitration-lost/
> > "Possible reasons are the same as the ones described in =E2=80=9CNo Ack=
nowledge
> > From I2C Slave=E2=80=9D"
> >=20
> > So, lets see what it can be:
> > https://www.i2c-bus.org/i2c-primer/analysing-obscure-problems/no-acknow=
ledge-from-i2c-slave/
> > "Possible reasons are:
> >=20
> > - The I2C slave could not correctly interpret the data on SDA because t=
he SDA
> >   high or low-level voltages do not reach its appropriate input
> >   thresholds.
> > - The I2C slave missed an SCL cycle because the SCL high or low-level v=
oltages
> >   do not reach its appropriate input thresholds.
> > - The I2C slave accidently interpreted a spike etc. as an SCL cycle.
> >=20
> > With adequate serial resistors between master and slave, an analog shot
> > of the signals at the slave=E2=80=99s SDA and SCL pins provides a clue =
whether
> > the slave acknowledges and to which SCL clock pulse. The different SDA
> > low levels due to the serial resistor make it possible to distinguish
> > acknowledges from the slave from data bits from the master. "
> >=20
> > I interpret it, that setting retry count on any non zero value is an
> > workaround for brocken circuit. It means, on HW development phase we
> > won't be able to detect HW issue, if retry count will be not 0.
> >=20
> > IMHO, it board specific configuration and should not be set by driver.
>=20
> Got your point, and in contrast to what you wrote, according to the I2C
> spec, a master is required ("must") to restart the transaction in case
> the arbitration is lost.
>=20
> From I2C-bus specification and user manual [1], 3.1.8 Arbitration:
>=20
> ```
> No information is lost during the arbitration process. A controller that =
loses the arbitration
> can generate clock pulses until the end of the byte in which it loses the=
 arbitration and
> must restart its transaction when the bus is free.
> ```

I'd interpret that differently. IMHO this is not "After a arbitration
loss it's obligatory that the (previously aborted) message is repeated",
but more "On an arbitration loss, the master's transfer had no effect on
the slave, so if the message is still to be sent, it must be repeated
=66rom its very beginning."

Otherwise I'm on Oleksij's side: Unless you have a multi-controller
setup an arbitration loss is a problem with the signal integrity. And
increasing the retry count is only a work around.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fe76be4jgemjeozb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLRDfgACgkQwfwUeK3K
7AlhAAf9G4i5YqVhbJff8evhH6ZoR2KgtG+aOxAxqCn/WOn8+ii2EayRtu2qGJbu
m0EnOjREqwXYaAMyqSCR9eHa9p57NfZNjvwfDWHWN9EkRquNeOzAhhjL1jNZ7pLA
P3MH0K/WdbqW9Qg199+SIrEfOzzprszSSd/NBWvsOD3Vjk7reW3Pq8d/WiIvdIcT
u9VXMu/hj20JGJx5y+he+WgGqFryVsTkNa/ww/sFbn6DJaa3TxMH6KWporRCwkB+
+M1cfm6RwWbVn2KMQgLti9x8hZBvGUbDuJDFqc2zJNjUQ1LkhgU//rpqn+POl63F
5t+fhOiAX1Rll5D0FbPOu053oF0R3Q==
=0S0o
-----END PGP SIGNATURE-----

--fe76be4jgemjeozb--
