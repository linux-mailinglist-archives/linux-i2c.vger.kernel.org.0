Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F828BE1F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfHMQVP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:15 -0400
Received: from mout.gmx.net ([212.227.15.19]:33561 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727221AbfHMQVP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713259;
        bh=qdXQg2OrSZffMMctJ7ip3unY7gSBHUJWbQ4Efr9U4Y4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dRVVd8zELT+O1B8rSCWCttDBQSp1Jzz3zyc/oYw5Cdi8BY3Ja+rAZwUfX1Xx66eQg
         i++eex9wfShxCj151QyJmcSUANEFOSHa5SdXP3FcDZPicmBriu7gcGzMRNj9mOGHwX
         8UfNlEITUxcRx5MP0AlD2eaKUa0payx9/AaKBcrY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MmDEg-1ifOji3rBw-00iEJ2; Tue, 13 Aug 2019 18:20:59 +0200
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
Subject: [PATCH V2 05/13] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
Date:   Tue, 13 Aug 2019 18:20:40 +0200
Message-Id: <1565713248-4906-6-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:MII+w+qvfSnz565NJxLI9YRp5kw2GvzGA3+V7tAejkOxHaFHLS1
 r9siGlg27T4lOQWi2UbC7um1wV0luJe09kx+DT2+kxru+v2Yv7/DXnw5SWBBQHPjonMO0u0
 QxM6+DpAzLISgA8yUjyZOX4IR6yo9p9Wu04vd9s41ln+Br9TBpL/kn9YQBYIwV5CiLnHPn9
 EbaKX25HUVXoVYbkbs6jw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8TJ2pPE3k6U=:ZDBYvhifcnxmeFUCKJMmND
 Sh+4KcsBGw5l2MokxZqJ4KibK7ewcnW6cSAGjgHN0D/A/JovI1KULRB+HkWfhjDW7T2XyWN/X
 n8CIueOphIo6RrPD/MJA+ldEIvCrTur7waaJR/b22QYBO3rSgSNAflyld23QqdKNMGlXwby3g
 A3pVlBlBsIkdFsfCxsg/C3cYfgX9W+7rjqk4KNzd+N+Br22GKeT1RZlecRBb3+7aIDCp/fFiM
 rZvTRwdlbkcBoq7k/D91tllV+OvsxI5SoNQ0lmngA+fy5yyL/9dxK1Aw6KZhb7ckxaG7FojH3
 uFPI+//bkD3S2XkheBpM4E1C4+plft8TlV2NncpLqd/pu30+p+PSGxSZapRQGPklN46V9NRuT
 zBdEDBMtKG2HNdWHF9LbbyMotv3AMlx5YLvbAJeq7ksyub/8Xr//Ce0zl1Xzvsqwgqyu9tput
 WkyWDBu5t/c0yN/BFnTquRThqSUoMu/MGWfyXVrU/ikplnU9k7dIudwuOP9F5UvoySlzn2Wpu
 2NkJinaNuwo27dv1qMWPK1Qd9xaNIRgs5xNMPdOHkMx4vtG3Mhh9omCkXXHZZKAwbtZ0RnTCW
 nQ3HlYHfgTN+2h0GCxBFOingPXyCNItYWWtzod0sWsV3/KNEIXjUSFl1YFjkCLx2O/Av9hdKA
 2ipQBQgpUQc6ahbybsb8NGBX4TqON3j5rJMjs7ZRSlODviT9uUqOA0Q5xtl5+ZuRWRO/ScqJF
 ziAdv3IAzCMwJ0mBMotDjbMwjFb7mVSb9s7RF2Rxf5FHGOBbjZpJRQZJEg/Q25JYsEEaLCRnq
 kIiOq7qfP5oBXjseq2vIEUCebasVAJ4XRzfjLc8OcUBrNH0AkURKCJJTmDCb8dMDFEEI7nBBO
 xItNR6ZSmVY00LRQ+lXTZ/qiAs0DS1keKqvP8QLje1himsRJ8R9AP87PvTzhkKHgkEQ/ed011
 af97O7sBgs9zLkgoL7ldarBAkhYS2aSC0J1nPL7ZguVmjtqrmTXj0m09iFSFKSGg1WZ5PcWJq
 EtBNmXYgFu0vOI17ZzaWwrytQWm69pVNAI4j1LoG2eFsVpsUl2+cIfzhxmIzTMpVnFPemUJyG
 +d2uHbAVhM6HW1/awnRbVfqKzJtc/x6/aIKo3JZOzipNRGViYaRXcP4ww==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The new BCM2711 supports an additional clock for the emmc2 block.
So add a new compatible and register this clock only for BCM2711.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Acked-by: Eric Anholt <eric@anholt.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 21cd952..fdf672a 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -114,6 +114,8 @@
 #define CM_AVEODIV		0x1bc
 #define CM_EMMCCTL		0x1c0
 #define CM_EMMCDIV		0x1c4
+#define CM_EMMC2CTL		0x1d0
+#define CM_EMMC2DIV		0x1d4

 /* General bits for the CM_*CTL regs */
 # define CM_ENABLE			BIT(4)
@@ -290,7 +292,8 @@
 #define BCM2835_MAX_FB_RATE	1750000000u

 #define SOC_BCM2835		BIT(0)
-#define SOC_ALL			(SOC_BCM2835)
+#define SOC_BCM2711		BIT(1)
+#define SOC_ALL			(SOC_BCM2835 | SOC_BCM2711)

 /*
  * Names of clocks used within the driver that need to be replaced
@@ -2003,6 +2006,16 @@ static const struct bcm2835_clk_desc clk_desc_array=
[] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 39),

+	/* EMMC2 clock (only available for BCM2711) */
+	[BCM2711_CLOCK_EMMC2]	=3D REGISTER_PER_CLK(
+		SOC_BCM2711,
+		.name =3D "emmc2",
+		.ctl_reg =3D CM_EMMC2CTL,
+		.div_reg =3D CM_EMMC2DIV,
+		.int_bits =3D 4,
+		.frac_bits =3D 8,
+		.tcnt_mux =3D 42),
+
 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
 		SOC_ALL,
@@ -2238,8 +2251,13 @@ static const struct cprman_plat_data cprman_bcm2835=
_plat_data =3D {
 	.soc =3D SOC_BCM2835,
 };

+static const struct cprman_plat_data cprman_bcm2711_plat_data =3D {
+	.soc =3D SOC_BCM2711,
+};
+
 static const struct of_device_id bcm2835_clk_of_match[] =3D {
 	{ .compatible =3D "brcm,bcm2835-cprman", .data =3D &cprman_bcm2835_plat_=
data },
+	{ .compatible =3D "brcm,bcm2711-cprman", .data =3D &cprman_bcm2711_plat_=
data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, bcm2835_clk_of_match);
=2D-
2.7.4

