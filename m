Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46D32D8596
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Dec 2020 11:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437965AbgLLKCx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Dec 2020 05:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388294AbgLLJyn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Dec 2020 04:54:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF48C0611CA
        for <linux-i2c@vger.kernel.org>; Sat, 12 Dec 2020 01:09:47 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1knz4S-00071V-FD; Sat, 12 Dec 2020 08:12:00 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1knz4R-0008PJ-AJ; Sat, 12 Dec 2020 08:11:59 +0100
Date:   Sat, 12 Dec 2020 08:11:59 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Kevin Herbert <kph@platinasystems.com>
Cc:     Biwen Li <biwen.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Jiafei Pan <jiafei.pan@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [v10] i2c: imx: support slave mode for imx I2C driver
Message-ID: <20201212071159.mxylwo3jk725k7kq@pengutronix.de>
References: <20201111113255.28710-1-biwen.li@oss.nxp.com>
 <20201202151033.GC874@kunai>
 <CABP=6zZcmsFUVwUaAH7f2-RqFHz71GLDnSfLreUo5GA3Y58HYA@mail.gmail.com>
 <20201209170948.GA2249@kunai>
 <CABP=6zbKxu7ruGRi59k8+JbX5UB9jfP=C76-Pd4Q39Mc0yOTrA@mail.gmail.com>
 <DB6PR0401MB2438F3FF50B601295BBE7F378FCB0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <CABP=6zahhQSXwG2MzR+ry9h8MCRqjyS=ysdvF1UYuejZd-0RkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABP=6zahhQSXwG2MzR+ry9h8MCRqjyS=ysdvF1UYuejZd-0RkQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:09:39 up 9 days, 21:16,  5 users,  load average: 0.00, 0.01, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 11, 2020 at 09:57:19AM -0800, Kevin Herbert wrote:
> Thanks for the tip. I attempted to see if the register was implemented
> on the i.mx6, and it doesn't appear to be. I'll reach out to my FAE. I
> found the datasheet and the register definitely isn't documented
> there.
> 
> I was thinking of a patch that would keep track of state, and
> synthesize the I2C_SLAVE_STOP on the next interrupt if it was a new
> transaction. Does this seem too hacky to you? What are your thoughts?

I would say, send patches :)
Please provide in to the commit message enough description to understand and
reproduce your issue.
 
> 
> On Wed, Dec 9, 2020 at 6:16 PM Biwen Li <biwen.li@nxp.com> wrote:
> >
> > Hi Kevin,
> >
> >
> >
> > After enabling idle interrupts, the i2c register will generate an idle interrupts(whatever read or write) when i2c bus enter idle status. Then get I2C_SLAVE_STOP event.
> >
> > But don’t have the IBIC register(Maybe it’s a hidden register) in imx. You can query about the AE of imx about this.
> >
> > static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
> >
> > {
> >
> >         if (is_vf610_i2c(i2c_imx)) {
> >
> >                 unsigned int temp;
> >
> >
> >
> >                 temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_IBIC);
> >
> >                 temp |= IBIC_BIIE;
> >
> >                 imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_IBIC);
> >
> >         }
> >
> > }
> >
> >
> >
> > Best Regards,
> >
> > Biwen Li
> >
> > From: Kevin Herbert <kph@platinasystems.com>
> > Sent: 2020年12月10日 1:18
> > To: Wolfram Sang <wsa@the-dreams.de>; Kevin Herbert <kph@platinasystems.com>; Biwen Li (OSS) <biwen.li@oss.nxp.com>; Leo Li <leoyang.li@nxp.com>; linux@rempel-privat.de; kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com; Aisheng Dong <aisheng.dong@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>; o.rempel@pengutronix.de; linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Jiafei Pan <jiafei.pan@nxp.com>; Xiaobo Xie <xiaobo.xie@nxp.com>; linux-arm-kernel@lists.infradead.org; Biwen Li <biwen.li@nxp.com>
> > Subject: [EXT] Re: [v10] i2c: imx: support slave mode for imx I2C driver
> >
> >
> >
> > Caution: EXT Email
> >
> > Even on an operation like writing a byte, I get I2C_SLAVE_WRITE_REQUESTED followed by I2C_SLAVE_WRITE_RECEIVED, but no I2C_SLAVE_STOP. If I do a I2C write of multiple bytes, I get I2c_SLAVE_WRITE_REQUESTED followed by multiple I2C_SLAVE_WRITE_RECEIVED.
> >
> >
> >
> > Kevin
> >
> >
> >
> > On Wed, Dec 9, 2020 at 9:10 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> > On Wed, Dec 09, 2020 at 09:03:50AM -0800, Kevin Herbert wrote:
> > > What is the protocol for the I2C_SLAVE_STOP event? I am working on my own
> > > backend, and I've only tried it with this i.mx driver, and I do not receive
> > > I2C_SLAVE_STOP at the end of every I2C transaction. It was my expectation
> > > I'd receive this event at the end of every frame. In my testing, I've never
> > > received this event at all.
> > >
> > > Where are the I2C registers on the i.mx documented? My board is an i.mx6sx.
> >
> > Hmm, from a glimpse, it looks the STOP event is only sent after a write
> > and not after a read? Does this match your findings?
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
