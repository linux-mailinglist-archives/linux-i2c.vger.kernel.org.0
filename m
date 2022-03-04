Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B02E4CD510
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Mar 2022 14:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiCDNV3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Mar 2022 08:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiCDNV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Mar 2022 08:21:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5924D4FC40
        for <linux-i2c@vger.kernel.org>; Fri,  4 Mar 2022 05:20:41 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nQ7rK-00073v-W1; Fri, 04 Mar 2022 14:20:38 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nQ7rJ-0003YJ-Qv; Fri, 04 Mar 2022 14:20:37 +0100
Date:   Fri, 4 Mar 2022 14:20:37 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Ian Dannapel <Ian.Dannapel@iris-sensing.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: i2c-imx.c: Unnecessary delay slowing down i2c communication
Message-ID: <20220304132037.GA15901@pengutronix.de>
References: <D783F898DE87F646B39A5F514F7A514C672EC8@ERDE.irisgmbh.local>
 <D783F898DE87F646B39A5F514F7A514C672F0E@ERDE.irisgmbh.local>
 <YiE0FnKL4+4RXEaY@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YiE0FnKL4+4RXEaY@shikoro>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:07:24 up 83 days, 19:52, 84 users,  load average: 0.40, 0.34,
 0.23
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

Hi Ian,

On Thu, Mar 03, 2022 at 10:33:10PM +0100, Wolfram Sang wrote:
> On Thu, Mar 03, 2022 at 03:19:00PM +0000, Ian Dannapel wrote:
> > Hello I²C Driver Maintainers,
> 
> Adding the i2c-imx maintainer to CC.
> 
> > 
> > please excuse me if I am not following the right steps to report a question. I did not find consensus between all instructions that I read.
> > 
> > We noted that on the IMX i2c driver, at the i2c_imx_start funtion, some sleep/delay was introduced without any apparent reason:
> > Line 448 at:  https://github.com/Freescale/linux-fslc/commit/3a5ee18d2a32bda6b9a1260136f6805848e3839d

In case of atomic use, for example on poweroff or system panic, we can't
schedule, polling the register at CPU speed makes no sense too. May be
this part can be optimized. I assume you don't care about atomic path. Correct?

> > Line 528 at:  https://github.com/Freescale/linux-fslc/commit/2b899f34e1db9adef8716d07e872a800dfa60790

This commit provides enough description in the commit log. But I assume, you
refer more to the next commit. Since this commit is changing only existing
sleep.

> > Line 200 at:  https://github.com/Freescale/linux-fslc/commit/43309f3b521302bb66c4c9e66704dd3675e4d725

Good question. We have "Enable I2C controller" instruction and next step
is "Wait controller to be stable". It looks like some SoC/IP specific
workaround.

Different iMX* documentation say:
....
Master mode is not aware that the bus is busy, so when a START cycle is
initiated, the current bus cycle can become corrupted and cause either
the current bus master or the I2C module to lose arbitration, after
which bus operation returns to normal.
...

In this case it would make no real sense to start, but the question is,
In what case should we care and can we optimize it?

> > This sleep causes a pretty big latency overhead on I²C writes and no
> > IMX8MP document states the need of this delay on the controller.

I would be careful using one SoC and apply same rule to all of them. 

> > NXP Support also informed that this delay might not be needed.  Some
> > early tests with removing this delay completely showed a great
> > reduction on the write latency and no problems with the
> > communication.

I assume, the test was done on iMX8MP only with only one use case?

> > But since we want a stable and fast communication, I ask here again
> > if someone knows the reason or the need for this delay when starting
> > to communicate on the I2C bus.

Since this delay was added as part of completely different functionality
it is hard to say, what issue it is addressing.

Removing this sleep may affect different devices. We can disable it SoC
by SoC or disable it for all SoC and wait for the feedback. Last option
is probably only way to get usable results. So, please send patches and
be ready to respond on possible regressions.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
