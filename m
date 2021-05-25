Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555F838F7E8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 04:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhEYCJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 May 2021 22:09:57 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:36574 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhEYCJ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 May 2021 22:09:56 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14P1tNUP007863;
        Tue, 25 May 2021 09:55:23 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 10:08:20 +0800
Date:   Tue, 25 May 2021 10:08:18 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Zev Weiss <zweiss@equinix.com>
CC:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        Steven Lee <steven_lee@aspeedtech.com>,
        ChiaWei Wang <chiawei_wang@aspeedtech.com>,
        Troy Lee <troy_lee@aspeedtech.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of
 AST2600
Message-ID: <20210525020817.GB2489@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
 <YKVg2Kfbex3DYbNI@packtop>
 <20210524020846.GB2591@aspeedtech.com>
 <YKwXnPH0XyYLRtfa@packtop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YKwXnPH0XyYLRtfa@packtop>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P1tNUP007863
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 05/24/2021 21:16, Zev Weiss wrote:
> On Sun, May 23, 2021 at 09:08:47PM CDT, Jamin Lin wrote:
> >The 05/19/2021 19:02, Zev Weiss wrote:
> >> On Wed, May 19, 2021 at 03:04:27AM CDT, Jamin Lin wrote:
> >> >The register definition between AST2600 A2 and A3 is different.
> >> >This patch avoid new registers definition of AST2600 to use
> >> >this driver. We will submit the path for the new registers
> >> >definition of AST2600.
> >> >
> >> >Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> >> >---
> >> > drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
> >> > 1 file changed, 22 insertions(+)
> >> >
> >> >diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> >> >index 724bf30600d6..007309077d9f 100644
> >> >--- a/drivers/i2c/busses/i2c-aspeed.c
> >> >+++ b/drivers/i2c/busses/i2c-aspeed.c
> >> >@@ -19,14 +19,20 @@
> >> > #include <linux/irqchip/chained_irq.h>
> >> > #include <linux/irqdomain.h>
> >> > #include <linux/kernel.h>
> >> >+#include <linux/mfd/syscon.h>
> >> > #include <linux/module.h>
> >> > #include <linux/of_address.h>
> >> > #include <linux/of_irq.h>
> >> > #include <linux/of_platform.h>
> >> > #include <linux/platform_device.h>
> >> >+#include <linux/regmap.h>
> >> > #include <linux/reset.h>
> >> > #include <linux/slab.h>
> >> >
> >> >+/* I2C Global Registers */
> >> >+/* 0x0c : I2CG Global Control Register (AST2500)  */
> >> >+#define ASPEED_I2CG_GLOBAL_CTRL_REG			0x0c
> >> >+
> >> > /* I2C Register */
> >> > #define ASPEED_I2C_FUN_CTRL_REG				0x00
> >> > #define ASPEED_I2C_AC_TIMING_REG1			0x04
> >> >@@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> >> > 	struct resource *res;
> >> > 	int irq, ret;
> >> >
> >> >+	if (of_device_is_compatible(pdev->dev.of_node,
> >> >+				    "aspeed,ast2600-i2c-bus")) {
> >> >+		u32 global_ctrl;
> >> >+		struct regmap *gr_regmap;
> >> >+
> >> >+		gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c-global");
> >> >+
> >> >+		if (IS_ERR(gr_regmap)) {
> >> >+			ret = PTR_ERR(gr_regmap);
> >> >+		} else {
> >> >+			regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
> >> >+			if (global_ctrl & BIT(2))
> >> >+				return -EIO;
> >>
> >> A macro definition might be a bit nicer than a raw BIT(2) here I'd
> >> think.
> >Will modify
> >>
> >> Also, it seems a bit unfortunate to just bail on the device entirely if
> >> we find this bit set (seems like a good way for a bootloader to
> >> inadvertently DoS the kernel), though I guess poking global syscon bits
> >> in the bus probe function might not be ideal.  Could/should we consider
> >> some module-level init code to ensure that bit is cleared?
> >>
> >>
> >We use syscon API to get the global register of i2c not the specific i2c
> >bus.
> >Can you describe it more detail?
> 
> Sure -- I just meant that if for whatever reason the kernel is booting
> on a system that's had that syscon bit set to enable the new register
> access mode (e.g. by a newer bootloader or something), it seems like
> we'd just give up entirely on enabling any i2c busses, when as far as I
> know there shouldn't be anything stopping us from resetting the bit back
> to be in the state this driver needs it to be in (old register mode) and
> then continuing along normally.
> 
> 
> Zev

Thanks for your suggestion. I will submit the new i2c driver for
AST2600.
Jamin
