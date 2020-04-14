Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58761A7A2A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 13:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439697AbgDNL4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 07:56:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37323 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439703AbgDNL4G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 07:56:06 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jOKAb-00006X-JU; Tue, 14 Apr 2020 13:56:01 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jOKAa-0005IN-HU; Tue, 14 Apr 2020 13:56:00 +0200
Date:   Tue, 14 Apr 2020 13:56:00 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200414115600.GM27288@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
 <20200409134027.GB1136@ninjato>
 <20200410112914.67a68e32@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410112914.67a68e32@endymion>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:40:16 up 54 days, 19:10, 93 users,  load average: 0.46, 0.35,
 0.22
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 10, 2020 at 11:29:14AM +0200, Jean Delvare wrote:
> Hi Wolfram, Sascha,
> 
> On Thu, 9 Apr 2020 15:40:27 +0200, Wolfram Sang wrote:
> > On Wed, Dec 04, 2019 at 10:53:48AM +0100, Sascha Hauer wrote:
> > > Always add the (un)reg_slave hooks to struct i2c_algorithm, even when
> > > I2C slave support is disabled. With the cost of some binary space I2C
> > > drivers with optional I2C slave support no longer have to #ifdef
> > > the hooks. For the same reason add a stub for i2c_slave_event and make
> > > enum i2c_slave_event present without I2C slave support.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>  
> > 
> > This kind of reverts d5fd120e7860 ("i2c: Only include slave support if
> > selected"), so adding Jean here for more discussion.
> 
> That commit made sense then as there was only exactly 1 kernel driver
> needing this. This might be revisited when more drivers need it.
> 
> That being said, as far as I can see only 8 drivers need it today, which
> isn't that many, and more importantly, several architectures will
> typically not include support for any of them (i386, x86_64 and s390x
> for example).
> 
> > I don't mind the additional bytes used in i2c_algorithm, so I am in
> > favor of this approach.
> 
> I find it questionable to increase the memory footprint on all x86_64
> systems out there for a feature they do not need. Sure it's only 16
> bytes in one structure, but if every subsystem does the same on a
> regular basis, it adds up.
> 
> More importantly I can't see how the ifdef'd members of struct
> i2c_algorithm are the cause of the problem mentioned by Sascha. He
> seems to be concerned by drivers with *optional* I2C slave support
> having ifdefs. Why can't this be solved in these drivers directly? What
> prevents these drivers from unconditionally selecting I2C_SLAVE if that
> makes their code more simple? This moves the overhead decision to the
> device driver instead of forcing it to the whole subsystem across all
> architectures.

The drivers could select I2C_SLAVE when they have I2C slave support and
in fact some drivers do this already. This means that we have the
overhead of unneeded I2C slave support when we need that driver in the
Kernel.

I just thought it would be nice to have I2C slave support optional while
still allowing to avoid ifdefs in the driver. Particularly this doesn't
look nice:

 static const struct i2c_algorithm i2c_imx_algo = {
        .master_xfer    = i2c_imx_xfer,
        .functionality  = i2c_imx_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+       .reg_slave      = i2c_imx_reg_slave,
+       .unreg_slave    = i2c_imx_unreg_slave,
+#endif
}

The implementation of these functions need ifdefs as well and compile
coverage gets worse.

Yes, we could select I2C_SLAVE from the driver and I don't really care
which way we choose, the space overhead is marginal either way.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
