Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8701F1A924C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 07:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393245AbgDOFQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 01:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393255AbgDOFQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 01:16:23 -0400
X-Greylist: delayed 62419 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Apr 2020 22:16:22 PDT
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FB4C061A0C
        for <linux-i2c@vger.kernel.org>; Tue, 14 Apr 2020 22:16:22 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jOaPM-0003Vy-AM; Wed, 15 Apr 2020 07:16:20 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jOaPL-0005fX-7h; Wed, 15 Apr 2020 07:16:19 +0200
Date:   Wed, 15 Apr 2020 07:16:19 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200415051619.GP27288@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
 <20200409134027.GB1136@ninjato>
 <20200410112914.67a68e32@endymion>
 <20200414115600.GM27288@pengutronix.de>
 <20200414164009.53e70067@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414164009.53e70067@endymion>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:00:20 up 55 days, 12:30, 71 users,  load average: 0.35, 0.15,
 0.11
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 14, 2020 at 04:40:09PM +0200, Jean Delvare wrote:
> On Tue, 14 Apr 2020 13:56:00 +0200, Sascha Hauer wrote:
> > On Fri, Apr 10, 2020 at 11:29:14AM +0200, Jean Delvare wrote:
> > > More importantly I can't see how the ifdef'd members of struct
> > > i2c_algorithm are the cause of the problem mentioned by Sascha. He
> > > seems to be concerned by drivers with *optional* I2C slave support
> > > having ifdefs. Why can't this be solved in these drivers directly? What
> > > prevents these drivers from unconditionally selecting I2C_SLAVE if that
> > > makes their code more simple? This moves the overhead decision to the
> > > device driver instead of forcing it to the whole subsystem across all
> > > architectures.  
> > 
> > The drivers could select I2C_SLAVE when they have I2C slave support and
> > in fact some drivers do this already. This means that we have the
> > overhead of unneeded I2C slave support when we need that driver in the
> > Kernel.
> 
> I can't make sense of this statement, sorry. How is I2C slave support
> "unneeded" if your kernel includes at least one kernel which needs it?

I never used I2C slave 
> 
> It is true that I2C slave support is included in the kernel code as
> soon as any driver selects I2C_SLAVE, even if that driver is not
> currently loaded. The only way around that would be to move the common
> code for it to a separate module and all specific members to different,
> dedicated structures. But that would in turn cause more overhead for
> people who need slave support. The current implementation is the result
> of a trade-off decision I made back then. It is the same design goal
> which explains why I2C_SMBUS is a separate option: many system classes
> do not need it and I did not want to waste memory on these. The
> difference of I2C_SMBUS is that it was large and isolated enough to
> warrant a separate kernel module altogether.
> 
> > I just thought it would be nice to have I2C slave support optional while
> > still allowing to avoid ifdefs in the driver. Particularly this doesn't
> > look nice:
> > 
> >  static const struct i2c_algorithm i2c_imx_algo = {
> >         .master_xfer    = i2c_imx_xfer,
> >         .functionality  = i2c_imx_func,
> > +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> > +       .reg_slave      = i2c_imx_reg_slave,
> > +       .unreg_slave    = i2c_imx_unreg_slave,
> > +#endif
> > }
> 
> Probably a matter of taste, personally I see nothing wrong with it.
> 
> > 
> > The implementation of these functions need ifdefs as well and compile
> > coverage gets worse.
> 
> Sorry but you lost me here. How can I2C slave support be "optional" and
> at the same time going without ifdefs?

static int i2c_imx_reg_slave(struct i2c_client *client)
{
	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
		return -ESOMETHING;
	...
}

The code is gone without CONFIG_I2C_SLAVE enabled, yet the compile coverage
is there.

The patch I sent was a suggestion to do it like that. If that's not
wanted I am fine with that and happily select CONFIG_I2C_SLAVE from the
driver entry in Kconfig, or better, suggest Biwen Li
(https://patchwork.kernel.org/patch/11271067/) to do this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
