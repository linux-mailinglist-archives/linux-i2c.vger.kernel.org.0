Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DA78BE34
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbfHMQVV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:21 -0400
Received: from mout.gmx.net ([212.227.15.15]:57365 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727942AbfHMQVV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713258;
        bh=5xXNcJdFFZ+S5gMLdTGBWr3vJj0SZHQ8AcRblKnTVeU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=EbATM02FOCfvXPWBnBkMRhnaydp4mWxrBXt7ou4r9FoqFeB552RUKlgliXFeMellE
         Lj8KrLLWMHUDJOKq9M1e/Ynw28R/QLszKfd+rUQKSFwodOlkFpDA/oYk0lsG9+ji3g
         caCS7FvKqiO7unS22ecn8Rh4QOlbeR7oEOcdzq+U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MirjS-1iTM3q1nee-00ex2O; Tue, 13 Aug 2019 18:20:58 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 04/13] clk: bcm2835: Introduce SoC specific clock registration
Date:   Tue, 13 Aug 2019 18:20:39 +0200
Message-Id: <1565713248-4906-5-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:RIDVhXcRVT4isap/NHV18ZbXIRl4PZQYl/I/rIYxiG9A7ehl427
 3kVmWfiib5gaikqyVfbLyq0lsEc/WLD3LLNLykaODIbGmsDBeLx2iv+Dv6+FA5Ln+lRenpw
 fU5WfotMBSzHqufBzr+L6gmIxYGWoTzXyt7pG7TqyZhAzlH+0QoEo0ucRmURyo4V3PMIrTG
 ZuHYpPFakG1TytZo3c9BA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZioBv5AE/w0=:IEVBt3pQxg3/xXQKcqRslG
 DFZoXp5Vk4oSjyHrQw6BLkTJ3Q1qjo6YO7jnpkR1o9QBC0hav9TKzJ307U4LNSBLNH+M8H0/6
 aS2Ty8bWXg3pY10W9jdCLYqrpy579+sz2D4G1/5H4UTnlZ7NmqhkZuq5bZwpB/mv1G/dXtGZa
 mx/OzUXqzFHn02VL9NajC21qiW1IcYW3OYUMwVZCJ/QNGZAAnTxJXINl3rA+q/If9kXdIoTJl
 UIDC6Na13lgvGcoiS7yTmBppNJhCGQlAY2M9C+Mz/vbb9fn3e+xffClHWEICzgz7S7tthAbwQ
 G+AS4LEfzwrzRPw0OUrIHJnN0cpuJlljv8S02+/FLMYN8CuzfXlKZAQSLmnZGLdd3qfzGg3Q9
 EaxLzKmLHI7sFWIE7WCJjj5CnxMgCdQZlGVd3fsATgDKsya5Rgp1TG4UvMHBOqsuGE6bqw35t
 Iba6fEb9FoUor3cqvCOOLaH+z6q7BwJxEasfKf/qscpPr/F5WlzXkOcangGqFUmL2uMEVWxbP
 sKcc/AoXkwdmT51fJJlgwd2EN+BvvoDTXJGJifzQOb0LNDxSMAeRNg4di6nvZ012md7jc9t56
 r/fPgFMnTh8Y6gE6akdJ8gMH0A5HpNnHnfkvRFh0JRmJIo6GopIivW6eHW2LG0yPjO5gC7SII
 R8HzEJocOBihBjPd+yYS6j4iL0frKVNOA+yvpI0kLanG21CmGfgZVPcpQsTrB+R2iYK6H9zpw
 KUhIc8lCceCKDyyS23Ru3KVvJIZivm3w4OJhoq22EQOvUeE+CHzNuT88lRGHaGVJlLGjgmqKk
 QlBZ7uBSEl208+WEvLq/4CYWdu99WWJyqpfa1IF7upTdSlRPYqYnsyRzjZsA2KO+P+sX4ZuVw
 lW8PZ60AXTq9BvvdCQlFX4rfunXcnW6NbUnqTcv0T6IgDyg0Z5sZx3y1UcMLW3jtcdlpQlJjk
 5t3t+BvUkCLdm9i++22setfjtel3bU9AxBALBlDc8Z81oxoCo32qe8D2x25YIkd+ES6L4GFHM
 X242SroQNCbfOimrAgVDL9aGHbpXEVYh/w6tNVdzKAeP40CO8lMZAnICI+Xu1RW5qBYMO/k7+
 +d+KyiEGihy7q2NC3qVsGKq5nY9WNU2UddUE7JKxx8T2P8yp7LCkqiFGg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to support SoC specific clocks (e.g. emmc2 for BCM2711), we
extend the description with a SoC support flag. This approach avoids long
and mostly redundant lists of clock IDs. Since only PLLH is specific to
BCM2835, we register the rest of the clocks as common to all SoC.

Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 113 +++++++++++++++++++++++++++++++++++--=
-----
 1 file changed, 96 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 867ae3c..21cd952 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -31,7 +31,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <dt-bindings/clock/bcm2835.h>
@@ -289,6 +289,9 @@
 #define LOCK_TIMEOUT_NS		100000000
 #define BCM2835_MAX_FB_RATE	1750000000u

+#define SOC_BCM2835		BIT(0)
+#define SOC_ALL			(SOC_BCM2835)
+
 /*
  * Names of clocks used within the driver that need to be replaced
  * with an external parent's name.  This array is in the order that
@@ -320,6 +323,10 @@ struct bcm2835_cprman {
 	struct clk_hw_onecell_data onecell;
 };

+struct cprman_plat_data {
+	unsigned int soc;
+};
+
 static inline void cprman_write(struct bcm2835_cprman *cprman, u32 reg, u=
32 val)
 {
 	writel(CM_PASSWORD | val, cprman->regs + reg);
@@ -1451,22 +1458,28 @@ typedef struct clk_hw *(*bcm2835_clk_register)(str=
uct bcm2835_cprman *cprman,
 					       const void *data);
 struct bcm2835_clk_desc {
 	bcm2835_clk_register clk_register;
+	unsigned int supported;
 	const void *data;
 };

 /* assignment helper macros for different clock types */
-#define _REGISTER(f, ...) { .clk_register =3D (bcm2835_clk_register)f, \
-			    .data =3D __VA_ARGS__ }
-#define REGISTER_PLL(...)	_REGISTER(&bcm2835_register_pll,	\
+#define _REGISTER(f, s, ...) { .clk_register =3D (bcm2835_clk_register)f,=
 \
+			       .supported =3D s,				\
+			       .data =3D __VA_ARGS__ }
+#define REGISTER_PLL(s, ...)	_REGISTER(&bcm2835_register_pll,	\
+					  s,				\
 					  &(struct bcm2835_pll_data)	\
 					  {__VA_ARGS__})
-#define REGISTER_PLL_DIV(...)	_REGISTER(&bcm2835_register_pll_divider, \
-					  &(struct bcm2835_pll_divider_data) \
-					  {__VA_ARGS__})
-#define REGISTER_CLK(...)	_REGISTER(&bcm2835_register_clock,	\
+#define REGISTER_PLL_DIV(s, ...) _REGISTER(&bcm2835_register_pll_divider,=
 \
+					   s,				  \
+					   &(struct bcm2835_pll_divider_data) \
+					   {__VA_ARGS__})
+#define REGISTER_CLK(s, ...)	_REGISTER(&bcm2835_register_clock,	\
+					  s,				\
 					  &(struct bcm2835_clock_data)	\
 					  {__VA_ARGS__})
-#define REGISTER_GATE(...)	_REGISTER(&bcm2835_register_gate,	\
+#define REGISTER_GATE(s, ...)	_REGISTER(&bcm2835_register_gate,	\
+					  s,				\
 					  &(struct bcm2835_gate_data)	\
 					  {__VA_ARGS__})

@@ -1480,7 +1493,8 @@ static const char *const bcm2835_clock_osc_parents[]=
 =3D {
 	"testdebug1"
 };

-#define REGISTER_OSC_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_OSC_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_osc_parents),	\
 	.parents =3D bcm2835_clock_osc_parents,				\
 	__VA_ARGS__)
@@ -1497,7 +1511,8 @@ static const char *const bcm2835_clock_per_parents[]=
 =3D {
 	"pllh_aux",
 };

-#define REGISTER_PER_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_PER_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_per_parents),	\
 	.parents =3D bcm2835_clock_per_parents,				\
 	__VA_ARGS__)
@@ -1522,7 +1537,8 @@ static const char *const bcm2835_pcm_per_parents[] =
=3D {
 	"-",
 };

-#define REGISTER_PCM_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_PCM_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_pcm_per_parents),		\
 	.parents =3D bcm2835_pcm_per_parents,				\
 	__VA_ARGS__)
@@ -1541,7 +1557,8 @@ static const char *const bcm2835_clock_vpu_parents[]=
 =3D {
 	"pllc_core2",
 };

-#define REGISTER_VPU_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_VPU_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_vpu_parents),	\
 	.parents =3D bcm2835_clock_vpu_parents,				\
 	__VA_ARGS__)
@@ -1577,12 +1594,14 @@ static const char *const bcm2835_clock_dsi1_parent=
s[] =3D {
 	"dsi1_byte_inv",
 };

-#define REGISTER_DSI0_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_DSI0_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_dsi0_parents),	\
 	.parents =3D bcm2835_clock_dsi0_parents,				\
 	__VA_ARGS__)

-#define REGISTER_DSI1_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_DSI1_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_dsi1_parents),	\
 	.parents =3D bcm2835_clock_dsi1_parents,				\
 	__VA_ARGS__)
@@ -1602,6 +1621,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLA]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "plla",
 		.cm_ctrl_reg =3D CM_PLLA,
 		.a2w_ctrl_reg =3D A2W_PLLA_CTRL,
@@ -1616,6 +1636,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 2400000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLA_CORE]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_core",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1625,6 +1646,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_per",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1634,6 +1656,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_DSI0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_dsi0",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1642,6 +1665,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.hold_mask =3D CM_PLLA_HOLDDSI0,
 		.fixed_divider =3D 1),
 	[BCM2835_PLLA_CCP2]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_ccp2",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1663,6 +1687,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLC]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "pllc",
 		.cm_ctrl_reg =3D CM_PLLC,
 		.a2w_ctrl_reg =3D A2W_PLLC_CTRL,
@@ -1677,6 +1702,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 3000000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLC_CORE0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core0",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1686,6 +1712,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_CORE1]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core1",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1695,6 +1722,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_CORE2]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core2",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1704,6 +1732,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_per",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1720,6 +1749,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLD]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "plld",
 		.cm_ctrl_reg =3D CM_PLLD,
 		.a2w_ctrl_reg =3D A2W_PLLD_CTRL,
@@ -1734,6 +1764,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 2400000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLD_CORE]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_core",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1743,6 +1774,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_per",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1752,6 +1784,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_DSI0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_dsi0",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1760,6 +1793,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.hold_mask =3D CM_PLLD_HOLDDSI0,
 		.fixed_divider =3D 1),
 	[BCM2835_PLLD_DSI1]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_dsi1",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1775,6 +1809,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * It is in the HDMI power domain.
 	 */
 	[BCM2835_PLLH]		=3D REGISTER_PLL(
+		SOC_BCM2835,
 		"pllh",
 		.cm_ctrl_reg =3D CM_PLLH,
 		.a2w_ctrl_reg =3D A2W_PLLH_CTRL,
@@ -1789,6 +1824,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 3000000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLH_RCAL]	=3D REGISTER_PLL_DIV(
+		SOC_BCM2835,
 		.name =3D "pllh_rcal",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1798,6 +1834,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 10,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_AUX]	=3D REGISTER_PLL_DIV(
+		SOC_BCM2835,
 		.name =3D "pllh_aux",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1807,6 +1844,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_PIX]	=3D REGISTER_PLL_DIV(
+		SOC_BCM2835,
 		.name =3D "pllh_pix",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1822,6 +1860,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* One Time Programmable Memory clock.  Maximum 10Mhz. */
 	[BCM2835_CLOCK_OTP]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "otp",
 		.ctl_reg =3D CM_OTPCTL,
 		.div_reg =3D CM_OTPDIV,
@@ -1833,6 +1872,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * bythe watchdog timer and the camera pulse generator.
 	 */
 	[BCM2835_CLOCK_TIMER]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "timer",
 		.ctl_reg =3D CM_TIMERCTL,
 		.div_reg =3D CM_TIMERDIV,
@@ -1843,12 +1883,14 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
 	 * Generally run at 2Mhz, max 5Mhz.
 	 */
 	[BCM2835_CLOCK_TSENS]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "tsens",
 		.ctl_reg =3D CM_TSENSCTL,
 		.div_reg =3D CM_TSENSDIV,
 		.int_bits =3D 5,
 		.frac_bits =3D 0),
 	[BCM2835_CLOCK_TEC]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "tec",
 		.ctl_reg =3D CM_TECCTL,
 		.div_reg =3D CM_TECDIV,
@@ -1857,6 +1899,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* clocks with vpu parent mux */
 	[BCM2835_CLOCK_H264]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "h264",
 		.ctl_reg =3D CM_H264CTL,
 		.div_reg =3D CM_H264DIV,
@@ -1864,6 +1907,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 1),
 	[BCM2835_CLOCK_ISP]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "isp",
 		.ctl_reg =3D CM_ISPCTL,
 		.div_reg =3D CM_ISPDIV,
@@ -1876,6 +1920,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * in the SDRAM controller can't be used.
 	 */
 	[BCM2835_CLOCK_SDRAM]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "sdram",
 		.ctl_reg =3D CM_SDCCTL,
 		.div_reg =3D CM_SDCDIV,
@@ -1883,6 +1928,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 3),
 	[BCM2835_CLOCK_V3D]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "v3d",
 		.ctl_reg =3D CM_V3DCTL,
 		.div_reg =3D CM_V3DDIV,
@@ -1896,6 +1942,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * in various hardware documentation.
 	 */
 	[BCM2835_CLOCK_VPU]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "vpu",
 		.ctl_reg =3D CM_VPUCTL,
 		.div_reg =3D CM_VPUDIV,
@@ -1907,6 +1954,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* clocks with per parent mux */
 	[BCM2835_CLOCK_AVEO]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "aveo",
 		.ctl_reg =3D CM_AVEOCTL,
 		.div_reg =3D CM_AVEODIV,
@@ -1914,6 +1962,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 38),
 	[BCM2835_CLOCK_CAM0]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "cam0",
 		.ctl_reg =3D CM_CAM0CTL,
 		.div_reg =3D CM_CAM0DIV,
@@ -1921,6 +1970,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 14),
 	[BCM2835_CLOCK_CAM1]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "cam1",
 		.ctl_reg =3D CM_CAM1CTL,
 		.div_reg =3D CM_CAM1DIV,
@@ -1928,12 +1978,14 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 15),
 	[BCM2835_CLOCK_DFT]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dft",
 		.ctl_reg =3D CM_DFTCTL,
 		.div_reg =3D CM_DFTDIV,
 		.int_bits =3D 5,
 		.frac_bits =3D 0),
 	[BCM2835_CLOCK_DPI]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dpi",
 		.ctl_reg =3D CM_DPICTL,
 		.div_reg =3D CM_DPIDIV,
@@ -1943,6 +1995,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* Arasan EMMC clock */
 	[BCM2835_CLOCK_EMMC]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "emmc",
 		.ctl_reg =3D CM_EMMCCTL,
 		.div_reg =3D CM_EMMCDIV,
@@ -1952,6 +2005,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp0",
 		.ctl_reg =3D CM_GP0CTL,
 		.div_reg =3D CM_GP0DIV,
@@ -1960,6 +2014,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 20),
 	[BCM2835_CLOCK_GP1]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp1",
 		.ctl_reg =3D CM_GP1CTL,
 		.div_reg =3D CM_GP1DIV,
@@ -1969,6 +2024,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 21),
 	[BCM2835_CLOCK_GP2]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp2",
 		.ctl_reg =3D CM_GP2CTL,
 		.div_reg =3D CM_GP2DIV,
@@ -1978,6 +2034,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* HDMI state machine */
 	[BCM2835_CLOCK_HSM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "hsm",
 		.ctl_reg =3D CM_HSMCTL,
 		.div_reg =3D CM_HSMDIV,
@@ -1985,6 +2042,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 22),
 	[BCM2835_CLOCK_PCM]	=3D REGISTER_PCM_CLK(
+		SOC_ALL,
 		.name =3D "pcm",
 		.ctl_reg =3D CM_PCMCTL,
 		.div_reg =3D CM_PCMDIV,
@@ -1994,6 +2052,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.low_jitter =3D true,
 		.tcnt_mux =3D 23),
 	[BCM2835_CLOCK_PWM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "pwm",
 		.ctl_reg =3D CM_PWMCTL,
 		.div_reg =3D CM_PWMDIV,
@@ -2002,6 +2061,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 24),
 	[BCM2835_CLOCK_SLIM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "slim",
 		.ctl_reg =3D CM_SLIMCTL,
 		.div_reg =3D CM_SLIMDIV,
@@ -2010,6 +2070,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 25),
 	[BCM2835_CLOCK_SMI]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "smi",
 		.ctl_reg =3D CM_SMICTL,
 		.div_reg =3D CM_SMIDIV,
@@ -2017,6 +2078,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 27),
 	[BCM2835_CLOCK_UART]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "uart",
 		.ctl_reg =3D CM_UARTCTL,
 		.div_reg =3D CM_UARTDIV,
@@ -2026,6 +2088,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* TV encoder clock.  Only operating frequency is 108Mhz.  */
 	[BCM2835_CLOCK_VEC]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "vec",
 		.ctl_reg =3D CM_VECCTL,
 		.div_reg =3D CM_VECDIV,
@@ -2040,6 +2103,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* dsi clocks */
 	[BCM2835_CLOCK_DSI0E]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dsi0e",
 		.ctl_reg =3D CM_DSI0ECTL,
 		.div_reg =3D CM_DSI0EDIV,
@@ -2047,6 +2111,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 18),
 	[BCM2835_CLOCK_DSI1E]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dsi1e",
 		.ctl_reg =3D CM_DSI1ECTL,
 		.div_reg =3D CM_DSI1EDIV,
@@ -2054,6 +2119,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 19),
 	[BCM2835_CLOCK_DSI0P]	=3D REGISTER_DSI0_CLK(
+		SOC_ALL,
 		.name =3D "dsi0p",
 		.ctl_reg =3D CM_DSI0PCTL,
 		.div_reg =3D CM_DSI0PDIV,
@@ -2061,6 +2127,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 12),
 	[BCM2835_CLOCK_DSI1P]	=3D REGISTER_DSI1_CLK(
+		SOC_ALL,
 		.name =3D "dsi1p",
 		.ctl_reg =3D CM_DSI1PCTL,
 		.div_reg =3D CM_DSI1PDIV,
@@ -2077,6 +2144,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * non-stop vpu clock.
 	 */
 	[BCM2835_CLOCK_PERI_IMAGE] =3D REGISTER_GATE(
+		SOC_ALL,
 		.name =3D "peri_image",
 		.parent =3D "vpu",
 		.ctl_reg =3D CM_PERIICTL),
@@ -2109,9 +2177,14 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)
 	struct resource *res;
 	const struct bcm2835_clk_desc *desc;
 	const size_t asize =3D ARRAY_SIZE(clk_desc_array);
+	const struct cprman_plat_data *pdata;
 	size_t i;
 	int ret;

+	pdata =3D of_device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return -ENODEV;
+
 	cprman =3D devm_kzalloc(dev,
 			      struct_size(cprman, onecell.hws, asize),
 			      GFP_KERNEL);
@@ -2147,8 +2220,10 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)

 	for (i =3D 0; i < asize; i++) {
 		desc =3D &clk_desc_array[i];
-		if (desc->clk_register && desc->data)
+		if (desc->clk_register && desc->data &&
+		    (desc->supported & pdata->soc)) {
 			hws[i] =3D desc->clk_register(cprman, desc->data);
+		}
 	}

 	ret =3D bcm2835_mark_sdc_parent_critical(hws[BCM2835_CLOCK_SDRAM]->clk);
@@ -2159,8 +2234,12 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)
 				      &cprman->onecell);
 }

+static const struct cprman_plat_data cprman_bcm2835_plat_data =3D {
+	.soc =3D SOC_BCM2835,
+};
+
 static const struct of_device_id bcm2835_clk_of_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-cprman", },
+	{ .compatible =3D "brcm,bcm2835-cprman", .data =3D &cprman_bcm2835_plat_=
data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, bcm2835_clk_of_match);
=2D-
2.7.4

