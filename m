Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD4557374E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 15:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbiGMNYs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 09:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbiGMNYs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 09:24:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A292E8
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jul 2022 06:24:47 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oBcM3-0003W0-Av; Wed, 13 Jul 2022 15:24:39 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1oBcM1-0004Jl-If; Wed, 13 Jul 2022 15:24:37 +0200
Date:   Wed, 13 Jul 2022 15:24:37 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220713132437.GF24373@pengutronix.de>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220713115750.GA504159@francesco-nb.int.toradex.com>
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

On Wed, Jul 13, 2022 at 01:57:50PM +0200, Francesco Dolcini wrote:
> + oleksandr.suvorov@foundries.io
> 
> Hello all,
> 
> On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini wrote:
> > On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
> > > In which situations does this help? Please mention these in the
> > > commit log.
> > I'll do
> 
> I did some investigation on this, unfortunately we have this change
> laying around since 1 year, it was written by Oleksandr, and in the
> meantime he moved to a new company. I added him to this email thread, so
> he can comment in case he remembers more.
> 
> We introduced this change while working on OV5640 camera sensor on an
> apalis-imx6q evaluation board, without this change we had some sporadic
> i2c communication issues. Unfortunately I do not have any better
> details.
> 
> To me looks like having some (3? 5?) retry as a default is somehow
> more reasonable than to never retry, not sure if this should be
> implemented as a default for all the i2c adapters. From what I was able
> to see that would not be a trivial change (the retry parameter is coming
> from the i2c_imx driver, there is no obvious way to have a default in
> the i2c core).
> 
> Would it work for you to keep the change as it is (just getting rid
> of the useless define) and add a little bit more blurb to the commit
> message to include the various comments collected so far?

I assume, it is related to reset time or other reason where the camera
is not responding. In this case, amount of retries would depend on I2C
CLK speed and host CPU speed.

May be it is worth to investigate real issue and potentially fix camera driver?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
