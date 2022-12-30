Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65CC659AAA
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Dec 2022 17:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiL3Qrr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Dec 2022 11:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiL3Qrq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Dec 2022 11:47:46 -0500
Received: from smtp-out-03.comm2000.it (smtp-out-03.comm2000.it [212.97.32.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1952860D5;
        Fri, 30 Dec 2022 08:47:44 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id DD4DEB430A9;
        Fri, 30 Dec 2022 17:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1672418862;
        bh=c3P4lCjJNZBw8UIuQuy6pV3vXeur7ECF48PTfAAiNCw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=rVSovNySFghkv9kL++eKyzGJ+d8OQYzt5dflvSRL1J9vJlCiFFQkDsJaVo897dXFf
         z/B9wmQuRabQihyOkxLmWiE50OQ8Z6E8CoJ7Sv1TB+pAlw+QF6ZkDy1S2VCbsviIyC
         nedHX8JoS8QAywy9oe9upqaadxA+IfSgR+TQOrs3tMolDUyRenNpzXZJD79YuXJwHu
         SXNhfB+Sp0pgAe8e5aj1oWb1VcXrb02F9KpgJXHAttdtQ0rTaqM7ryHwiPedkS7jLj
         h2MJpAd81VrVHwpzIblCwNJPaO7vK4VVFBfPCTWJwSuqzYF/gqQOsicdmtzEyh0Bwl
         pGT+ctGOjFvaQ==
Date:   Fri, 30 Dec 2022 17:47:21 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
        Primoz Fiser <primoz.fiser@norik.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
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
Message-ID: <Y68WGcdQNQkD0vfa@francesco-nb.int.toradex.com>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
 <20221216110227.GA12327@pengutronix.de>
 <20221216111308.wckibotr5d3q6ree@pengutronix.de>
 <5c2e0531-e7c3-1b37-35ed-c8e9795a0d18@norik.com>
 <Y5xpt6J01Boec6Xr@francesco-nb.int.toradex.com>
 <41991ce2-3e88-5afc-6def-6e718d624768@norik.com>
 <Y674eoNsHtAeG7IP@francesco-nb.int.toradex.com>
 <20221230161209.GA14776@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230161209.GA14776@pengutronix.de>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 30, 2022 at 05:12:09PM +0100, Oleksij Rempel wrote:
> On Fri, Dec 30, 2022 at 03:40:58PM +0100, Francesco Dolcini wrote:
> > +Wolfram
> > 
> > On Wed, Dec 28, 2022 at 09:01:46AM +0100, Primoz Fiser wrote:
> > > On 16. 12. 22 13:51, Francesco Dolcini wrote:
> > > > On Fri, Dec 16, 2022 at 01:23:29PM +0100, Primoz Fiser wrote:
> > > > > The only solid point in the thread seems to be that in that case we are not
> > > > > covering up the potential i2c hardware issues?
> > > > 
> > > > I believe that in this case we should just have a warning in the kernel.
> > > > The retry potentially work-around a transient issue and we do not hide any hardware
> > > > issue at the same time. It seems an easy win-win solution.
> > > 
> > > I would agree about throwing a warning message in retry case.
> > > 
> > > Not sure how would it affect other i2c bus drivers using retries > 0.
> > > Retries might be pretty rare with i2c-imx but some other drivers set this to
> > > 5 for example. At least using _ratelimited printk is a must using this
> > > approach.
> > 
> > Wolfram, Uwe, Oleksij
> > 
> > Would it be acceptable to have a warning when we have I2C retries, and
> > with that in place enabling retries on the imx driver?
> > 
> > It exists hardware that requires this to work correctly,
> 
> Well, this is persistent confusion in this monolog. It will not make it
> correctly.
> 
> > and at a
> > minimum setting the retry count from user space is not going to solve
> > potential issues during initial driver probe.
> 
> I assume it is not clear from programmer point of view. Lets try other way:
> 
> - The I2C slave could not correctly interpret the data on SDA because the SDA
>   high or low-level voltages do not reach its appropriate input
>   thresholds.
> 
> This means:
> 
> You have this:
> 
>     /-\    /-\ ----- 2.5Vcc
> ___/   \__/   \___
> 
> Instead of this:
> 
>      /-\     /-\ ----- 3.3Vcc
>     /  \    /   \
> ___/    \__/     \___
> 
> This is bad, because master or slave will not be able to interpret the pick level
> correctly. It may see some times 0 instead of 1. This means, what ever we are
> writing we are to the slave or reading from the slave is potentially corrupt
> and only __sometimes__ the master was able to detect it. 
> 
> - The I2C slave missed an SCL cycle because the SCL high or low-level voltages
>   do not reach its appropriate input thresholds.
> 
> This means, the bus frequency is too high for current configured or physical PCB
> designed. So, you will have different kind of corruptions and some times they
> will be detected. 
> 
> - The I2C slave accidently interpreted a spike etc. as an SCL cycle.
> 
> This means the noise level is to high. The driver strange should be increased
> or PCB redesign should be made. May be there are more options. If not done,
> data corruption can be expected.
> 
> None of this issue can be "fixed" by retries or made more "robust".
> Doing more retries means: we do what ever we do until the system was not able to
> detect the error.

Hello Oleksij,
thanks for the detailed explanation, appreciated.

Given that is it correct that the i2c imx driver return EAGAIN in such a
case (arbitration error)? You made it crystal clear that there is no
such thing as try again for this error, I would be inclined to prepare a
patch to fix this.

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cf5bacf3a488..a2a581c8ae07 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -492,7 +492,7 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
                /* check for arbitration lost */
                if (temp & I2SR_IAL) {
                        i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
-                       return -EAGAIN;
+                       return -EIO;
                }

                if (for_busy && (temp & I2SR_IBB)) {


In addition to that is there any valid use case of the i2c retry
mechanism? Is possible for an I2C controller to report anything that can
be recovered with a retry?

Francesco

