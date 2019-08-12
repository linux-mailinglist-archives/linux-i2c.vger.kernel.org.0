Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F38058969F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 07:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfHLFI2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 01:08:28 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46087 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbfHLFI2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 01:08:28 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1hx2ZF-0006uG-3X; Mon, 12 Aug 2019 07:08:25 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1hx2Z9-00064G-9x; Mon, 12 Aug 2019 07:08:19 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Wolfram Sang <wsa@the-dreams.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: [PATCH v1] MAINTAINERS: i2c-imx: take over maintainership
Date:   Mon, 12 Aug 2019 07:08:17 +0200
Message-Id: <20190812050817.23279-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I would like to maintain the i2c-imx driver. Since I work with
different i.MX variants and have access to the hardware, I can spend
some time on the reviewing of this driver.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e81e60bd7c26..ddc1cf5cb0b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6441,6 +6441,14 @@ S:	Maintained
 F:	drivers/perf/fsl_imx8_ddr_perf.c
 F:	Documentation/devicetree/bindings/perf/fsl-imx-ddr.txt
 
+FREESCALE IMX I2C DRIVER
+M:	Oleksij Rempel <o.rempel@pengutronix.de>
+R:	Pengutronix Kernel Team <kernel@pengutronix.de>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-imx.c
+F:	Documentation/devicetree/bindings/i2c/i2c-imx.txt
+
 FREESCALE IMX LPI2C DRIVER
 M:	Dong Aisheng <aisheng.dong@nxp.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.20.1

