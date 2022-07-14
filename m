Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9B4574574
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 09:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiGNHHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 03:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiGNHHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 03:07:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DA72CCBD
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 00:07:18 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oBswF-0007Pf-PS; Thu, 14 Jul 2022 09:07:07 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oBswD-0000Nz-Mq; Thu, 14 Jul 2022 09:07:05 +0200
Date:   Thu, 14 Jul 2022 09:07:05 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220714070705.GH24373@pengutronix.de>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
 <20220713134329.GA495155@francesco-nb.int.toradex.com>
 <20220713155723.GG24373@pengutronix.de>
 <20220713202541.GA532546@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220713202541.GA532546@francesco-nb.int.toradex.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
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

Hello Francesco,

On Wed, Jul 13, 2022 at 10:25:41PM +0200, Francesco Dolcini wrote:
> Hello Oleksij,
> 
> On Wed, Jul 13, 2022 at 05:57:23PM +0200, Oleksij Rempel wrote:
> > On Wed, Jul 13, 2022 at 03:43:29PM +0200, Francesco Dolcini wrote:
> > > On Wed, Jul 13, 2022 at 03:24:37PM +0200, Oleksij Rempel wrote:
> > > > On Wed, Jul 13, 2022 at 01:57:50PM +0200, Francesco Dolcini wrote:
> > > > > + oleksandr.suvorov@foundries.io
> > > > > 
> > > > > Hello all,
> > > > > 
> > > > > On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini wrote:
> > > > > > On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
> > > > > > > In which situations does this help? Please mention these in the
> > > > > > > commit log.
> > > > > > I'll do
> > > > > 
> > > > > I did some investigation on this, unfortunately we have this change
> > > > > laying around since 1 year, it was written by Oleksandr, and in the
> > > > > meantime he moved to a new company. I added him to this email thread, so
> > > > > he can comment in case he remembers more.
> > > > > 
> > > > > We introduced this change while working on OV5640 camera sensor on an
> > > > > apalis-imx6q evaluation board, without this change we had some sporadic
> > > > > i2c communication issues. Unfortunately I do not have any better
> > > > > details.
> > > > > 
> > > > > To me looks like having some (3? 5?) retry as a default is somehow
> > > > > more reasonable than to never retry, not sure if this should be
> > > > > implemented as a default for all the i2c adapters. From what I was able
> > > > > to see that would not be a trivial change (the retry parameter is coming
> > > > > from the i2c_imx driver, there is no obvious way to have a default in
> > > > > the i2c core).
> > > > > 
> > > > > Would it work for you to keep the change as it is (just getting rid
> > > > > of the useless define) and add a little bit more blurb to the commit
> > > > > message to include the various comments collected so far?
> > > > 
> > > > I assume, it is related to reset time or other reason where the camera
> > > > is not responding. In this case, amount of retries would depend on I2C
> > > > CLK speed and host CPU speed.
> > > > 
> > > 
> > > The retry on the I2C IMX driver would trigger only on tx arbitration
> > > failure, that would be the SDA being tied low by the slave in an
> > > unexpected moment, correct? 
> > 
> > If it is the case, it is better to understand why. Are there some
> > special timing requirements?
> > 
> > > If the camera does not respond it will just
> > > not ack the transaction and that would not be recovered by the retry
> > > in this change.
> > > 
> > > Can this just a layout/cabling issue with some noise on the SDA line? We
> > > are talking about somehow long board to board cables with various
> > > signals on it. This is an issue that we had for sure in the past,
> > > however I do have record of this only on a different camera.
> > 
> > If it is cabling issue, then I would take a look at pinmux
> > configuration. If it is so noisy, that some errors are expected, then it would
> > affect camera configuration as well. I mean, system is potentially
> > writing trash to the config register.
> 
> I do not think that this is possible in the way you defined, if SDA is
> low when the master is driving it high the master will just stop
> transmitting and an arbitration lost interrupt is raised. I guess this
> is just the same for any I2C controller, anyway is defined in
> `35.7.4 I2C Status Register (I2Cx_I2SR)` in the i.MX6QDL reference manual.
> 
> I guess it would be still theoretically possible that the master read
> garbage from the slave, I'm not aware of any mechanism to avoid it.
> 
> Said that I do not have more details, for some unfortunate reason this
> change was laying in our downstream kernel since too long.
> 
> Anyway, let's look at this in a different way, from what I was able to
> understand digging on this topic retrying on I2C arbitration lost is
> just the normal thing to do and the I2C core provides support for this
> since ever, the comment in i2c-core is
> /* Retry automatically on arbitration loss */.
> 
> Setting retries to something like 3 or 5 is just very common, various
> drivers have this value in the first commit or had it added later on (as
> Uwe already commented)
> 
> To me it seems like the most sensible thing to do, is there any reason
> why the i2c_imx driver should not do it?

Here we go:
https://www.i2c-bus.org/i2c-primer/analysing-obscure-problems/master-reports-arbitration-lost/
"Possible reasons are the same as the ones described in “No Acknowledge
From I2C Slave”"

So, lets see what it can be:
https://www.i2c-bus.org/i2c-primer/analysing-obscure-problems/no-acknowledge-from-i2c-slave/
"Possible reasons are:

- The I2C slave could not correctly interpret the data on SDA because the SDA
  high or low-level voltages do not reach its appropriate input
  thresholds.
- The I2C slave missed an SCL cycle because the SCL high or low-level voltages
  do not reach its appropriate input thresholds.
- The I2C slave accidently interpreted a spike etc. as an SCL cycle.

With adequate serial resistors between master and slave, an analog shot
of the signals at the slave’s SDA and SCL pins provides a clue whether
the slave acknowledges and to which SCL clock pulse. The different SDA
low levels due to the serial resistor make it possible to distinguish
acknowledges from the slave from data bits from the master. "

I interpret it, that setting retry count on any non zero value is an
workaround for brocken circuit. It means, on HW development phase we
won't be able to detect HW issue, if retry count will be not 0.

IMHO, it board specific configuration and should not be set by driver.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
