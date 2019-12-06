Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48E1C114CB0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2019 08:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfLFHiZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Dec 2019 02:38:25 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38211 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfLFHiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Dec 2019 02:38:24 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1id8Bx-0001yw-23; Fri, 06 Dec 2019 08:38:21 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1id8Bw-0007V9-1B; Fri, 06 Dec 2019 08:38:20 +0100
Date:   Fri, 6 Dec 2019 08:38:20 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Biwen Li <biwen.li@nxp.com>, shawnguo@kernel.org,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        wsa@the-dreams.de, leoyang.li@nxp.com, aisheng.dong@nxp.com,
        xiaoning.wang@nxp.com, xiaobo.xie@nxp.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jiafei.pan@nxp.com, linux-arm-kernel@lists.infradead.org,
        laurentiu.tudor@nxp.com
Subject: Re: [v6] i2c: imx: support slave mode for imx I2C driver
Message-ID: <20191206073819.lntjjxpcjm5yrb7y@pengutronix.de>
References: <20191203114809.21226-1-biwen.li@nxp.com>
 <20191204100005.r56huywxa7h3c6zr@pengutronix.de>
 <9a1a00c1-e9fa-36a1-0e79-3492d9b98d9f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a1a00c1-e9fa-36a1-0e79-3492d9b98d9f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:32:55 up 151 days, 13:43, 140 users,  load average: 0.05, 0.13,
 0.13
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 05, 2019 at 12:43:46PM +0100, Oleksij Rempel wrote:
> Hi,
> 
> On 04.12.19 11:00, Sascha Hauer wrote:
> > Hi,
> > 
> > The patch looks ok to me now, but I still do not like the #ifdeffery
> > around CONFIG_I2C_SLAVE. With the patch I just sent (You are on Cc:)
> > we could apply the following on your patch which makes it more readable
> > and increases compile coverage.
> > 
> > Wolfram, Biwen, what do you think?
> 
> 
> RCAR depends on slave:
> config I2C_RCAR
> 
>         tristate "Renesas R-Car I2C Controller"
> 
>         depends on ARCH_RENESAS || COMPILE_TEST
> 
>         select I2C_SLAVE
> see:
> drivers/i2c/busses/i2c-rcar.c
> 
> So, I would suggest to do the same in imx.

I suggested that to v1 of this patch. If we agree though that I2C slave
support deserves an extra Kconfig option we should also make the drivers
cope with that situation. Otherwise we would better make I2C slave
support non optional.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
