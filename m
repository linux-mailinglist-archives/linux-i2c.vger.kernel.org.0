Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC57F942
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 14:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbfD3Mu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 08:50:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36873 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfD3Muz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Apr 2019 08:50:55 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hLSDe-00022T-2M; Tue, 30 Apr 2019 14:50:46 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <sha@pengutronix.de>)
        id 1hLSDb-0001O9-43; Tue, 30 Apr 2019 14:50:43 +0200
Date:   Tue, 30 Apr 2019 14:50:43 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Chuanhua Han <chuanhua.han@nxp.com>
Cc:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, festevam@gmail.com, linux-imx@nxp.com,
        wsa+renesas@sang-engineering.com, u.kleine-koenig@pengutronix.de,
        eha@deif.com, linux@rempel-privat.de, l.stach@pengutronix.de,
        peda@axentia.se, sumit.batra@nxp.com
Subject: Re: [PATCH 1/2] i2c: imx: I2C Driver doesn't consider I2C_IPGCLK_SEL
 RCW bit when using ls1046a SoC
Message-ID: <20190430125043.weqwzim4gpsvtkfe@pengutronix.de>
References: <20190430044719.30720-1-chuanhua.han@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430044719.30720-1-chuanhua.han@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:47:42 up 42 days, 23:58, 86 users,  load average: 1.11, 1.13,
 1.10
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 12:47:18PM +0800, Chuanhua Han wrote:
> The current kernel driver does not consider I2C_IPGCLK_SEL (424 bit
> of RCW) in deciding  i2c_clk_rate in function i2c_imx_set_clk()
> { 0 Platform clock/4, 1 Platform clock/2}.
> 
> When using ls1046a SoC, this populates incorrect value in IBFD register
> if I2C_IPGCLK_SEL = 0, which generates half of the desired Clock.
> 
> Therefore, if ls1046a SoC is used, we need to set the i2c clock
> according to the corresponding RCW.

So the clock driver reports the wrong clock. Please fix the clock driver
then.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
