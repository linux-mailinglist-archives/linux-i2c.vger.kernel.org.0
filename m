Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D97D1B0169
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 08:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgDTGND (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 02:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725959AbgDTGND (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 02:13:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D379EC061A0F
        for <linux-i2c@vger.kernel.org>; Sun, 19 Apr 2020 23:13:02 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jQPfv-0007eD-CK; Mon, 20 Apr 2020 08:12:59 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1jQPfu-0003f9-CV; Mon, 20 Apr 2020 08:12:58 +0200
Date:   Mon, 20 Apr 2020 08:12:58 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200420061258.GA1694@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
 <20200409134027.GB1136@ninjato>
 <20200410112914.67a68e32@endymion>
 <20200414115600.GM27288@pengutronix.de>
 <20200414164009.53e70067@endymion>
 <20200415051619.GP27288@pengutronix.de>
 <20200417160014.5604a16a@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417160014.5604a16a@endymion>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:59:12 up 60 days, 13:29, 71 users,  load average: 0.02, 0.08,
 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 17, 2020 at 04:00:14PM +0200, Jean Delvare wrote:
> One last thing I meant to mention but forgot...
> 
> On Wed, 15 Apr 2020 07:16:19 +0200, Sascha Hauer wrote:
> > static int i2c_imx_reg_slave(struct i2c_client *client)
> > {
> > 	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> > 		return -ESOMETHING;
> > 	...
> > }
> > 
> > The code is gone without CONFIG_I2C_SLAVE enabled, yet the compile coverage
> > is there.
> 
> Compile coverage is nice but it comes at a cost. With the approach
> above, the code will be built, then discarded. When the code is
> #ifdef'd out, it isn't built at all. This means that your approach,
> although it has advantages, increases the build time.
> 
> And don't tell me "you only build once", we live at the time of
> continuous integration so we keep building kernels. As a support
> engineer, I build kernels daily, and even though I have access to a
> powerful build farm for that purpose, it still takes 30 to 60 minutes
> to get my kernel built each time. Obviously most of that time isn't
> spent on the i2c-imx driver ;-) but if every piece of code does the
> same, build time will inevitably increase.

Well often enough I spend more time building Kernels than actually
running them, so don't tell me.

Yes, build time increases when we do things in C rather than in CPP,
but each #ifdef doubles the number of builds necessary to let the
compiler go though all paths. I've sent and received more than enough
patches that fix #ifdefs for the more unlikely cases which were not
compile tested.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
