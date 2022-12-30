Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B10659A6E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Dec 2022 17:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbiL3QMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Dec 2022 11:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbiL3QMf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Dec 2022 11:12:35 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294ACB6B
        for <linux-i2c@vger.kernel.org>; Fri, 30 Dec 2022 08:12:35 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pBHzS-0006uc-RL; Fri, 30 Dec 2022 17:12:14 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pBHzN-0000y1-JX; Fri, 30 Dec 2022 17:12:09 +0100
Date:   Fri, 30 Dec 2022 17:12:09 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     Primoz Fiser <primoz.fiser@norik.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        upstream@lists.phytec.de, Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        francesco.dolcini@toradex.com, wsa@kernel.org
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Message-ID: <20221230161209.GA14776@pengutronix.de>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
 <20221216110227.GA12327@pengutronix.de>
 <20221216111308.wckibotr5d3q6ree@pengutronix.de>
 <5c2e0531-e7c3-1b37-35ed-c8e9795a0d18@norik.com>
 <Y5xpt6J01Boec6Xr@francesco-nb.int.toradex.com>
 <41991ce2-3e88-5afc-6def-6e718d624768@norik.com>
 <Y674eoNsHtAeG7IP@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y674eoNsHtAeG7IP@francesco-nb.int.toradex.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 30, 2022 at 03:40:58PM +0100, Francesco Dolcini wrote:
> +Wolfram
> 
> On Wed, Dec 28, 2022 at 09:01:46AM +0100, Primoz Fiser wrote:
> > On 16. 12. 22 13:51, Francesco Dolcini wrote:
> > > On Fri, Dec 16, 2022 at 01:23:29PM +0100, Primoz Fiser wrote:
> > > > The only solid point in the thread seems to be that in that case we are not
> > > > covering up the potential i2c hardware issues?
> > > 
> > > I believe that in this case we should just have a warning in the kernel.
> > > The retry potentially work-around a transient issue and we do not hide any hardware
> > > issue at the same time. It seems an easy win-win solution.
> > 
> > I would agree about throwing a warning message in retry case.
> > 
> > Not sure how would it affect other i2c bus drivers using retries > 0.
> > Retries might be pretty rare with i2c-imx but some other drivers set this to
> > 5 for example. At least using _ratelimited printk is a must using this
> > approach.
> 
> Wolfram, Uwe, Oleksij
> 
> Would it be acceptable to have a warning when we have I2C retries, and
> with that in place enabling retries on the imx driver?
> 
> It exists hardware that requires this to work correctly,

Well, this is persistent confusion in this monolog. It will not make it
correctly.

> and at a
> minimum setting the retry count from user space is not going to solve
> potential issues during initial driver probe.

I assume it is not clear from programmer point of view. Lets try other way:

- The I2C slave could not correctly interpret the data on SDA because the SDA
  high or low-level voltages do not reach its appropriate input
  thresholds.

This means:

You have this:

    /-\    /-\ ----- 2.5Vcc
___/   \__/   \___

Instead of this:

     /-\     /-\ ----- 3.3Vcc
    /  \    /   \
___/    \__/     \___

This is bad, because master or slave will not be able to interpret the pick level
correctly. It may see some times 0 instead of 1. This means, what ever we are
writing we are to the slave or reading from the slave is potentially corrupt
and only __sometimes__ the master was able to detect it. 

- The I2C slave missed an SCL cycle because the SCL high or low-level voltages
  do not reach its appropriate input thresholds.

This means, the bus frequency is too high for current configured or physical PCB
designed. So, you will have different kind of corruptions and some times they
will be detected. 

- The I2C slave accidently interpreted a spike etc. as an SCL cycle.

This means the noise level is to high. The driver strange should be increased
or PCB redesign should be made. May be there are more options. If not done,
data corruption can be expected.

None of this issue can be "fixed" by retries or made more "robust".
Doing more retries means: we do what ever we do until the system was not able to
detect the error.

> To me the only reasonable solution is to have the retry enabled with a
> sensible number (3? 5?), however there is a concern that this might
> hide real hardware issues.
 
There is real hardware issue. 

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
