Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DB018742D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 21:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732542AbgCPUnd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 16:43:33 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49531 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732537AbgCPUnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Mar 2020 16:43:33 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jDwa3-0006n7-SB; Mon, 16 Mar 2020 21:43:23 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jDwa2-0007Vh-2S; Mon, 16 Mar 2020 21:43:22 +0100
Date:   Mon, 16 Mar 2020 21:43:22 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Stefan Lengfeld <contact@stefanchrist.eu>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: at91: support atomic write xfer
Message-ID: <20200316204322.GB17716@pengutronix.de>
References: <c05f76f74cd6a7ec2735c96861f9d5933631c112.1584296795.git.mirq-linux@rere.qmqm.pl>
 <9924dd54-dd8b-d130-9607-2bbbc65675d5@gmail.com>
 <20200316144221.GC19141@qmqm.qmqm.pl>
 <20200316172003.lguso2fczz5imh6g@porty>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316172003.lguso2fczz5imh6g@porty>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:08:32 up 24 days,  7:25, 51 users,  load average: 0.31, 0.28,
 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20-03-16 18:20, Stefan Lengfeld wrote:
> Hi Michał,
> 
> On Mon, Mar 16, 2020 at 03:42:21PM +0100, Michał Mirosław wrote:
> > On Sun, Mar 15, 2020 at 11:46:33PM +0300, Dmitry Osipenko wrote:
> > > 15.03.2020 21:27, Michał Mirosław пишет:
> > > > Implement basic support for atomic write - enough to get a simple
> > > > write to PMIC on shutdown. Only for chips having ALT_CMD register,
> > > > eg. SAMA5D2.
> > > > 
> > > > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > > > ---
> > > 
> > > Hello Michał,
> > > 
> > > ...
> > > > +	ret = pm_runtime_get_sync(dev->dev);
> > > > +	if (ret < 0)
> > > > +		goto out;
> > > 
> > > Runtime PM can't be used while interrupts are disabled, unless
> > > pm_runtime_irq_safe() is used and driver's RPM callback is IRQ-safe.
> > 
> > I didn't get any warnings from lockdep and friends, but I'll double
> > check if this is by luck.
> 
> You can have a look at the I2C atomic patch for the imx-driver. See
> 
>    https://patchwork.ozlabs.org/patch/1225802/
> 
> In that patch Marco Felsch is using clk_enable() and clk_disable() calls.

Yep because we need to handle the runtime_pm stuff by our-self. So for
the imx case we need to handle the clk en-/disable stuff. Runtime pm is
using a workqueue which can't be used in that late case.

Regards,
  Marco

> > > ...
> > > > +	timeout = jiffies + (2 + msg->len) * HZ/1000;
> > > > +	for (;;) {
> > > > +		stat = at91_twi_read(dev, AT91_TWI_SR);
> > > > +		if (stat & AT91_TWI_TXCOMP)
> > > > +			break;
> > > > +		if (time_after(jiffies, timeout)) {
> > > > +			ret = -ETIMEDOUT;
> > > > +			goto out;
> > > > +		}
> > > > +		udelay(100);
> > > > +	}
> > > 
> > > Jiffies can't be used with the disabled interrupts because jiffies are
> > > updated by timer's interrupt.
> > > 
> > > Either ktime() API or iterator-based loop should be used.
> > 
> > Thanks for the pointers. In my use-case power is cut from the CPU at this
> > point so it didn't matter that the loop was infinite.
> 
> Here again you can have a look at Marco Felsch's patch. He used the
> function readb_poll_timeout_atomic(). So the loop can potentially
> replaced by a single line.
> 
> Kind regards,
> Stefan
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
