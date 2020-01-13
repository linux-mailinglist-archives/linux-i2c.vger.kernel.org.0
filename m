Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC98139B19
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 22:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgAMVGy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 16:06:54 -0500
Received: from sauhun.de ([88.99.104.3]:42052 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgAMVGy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 16:06:54 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id A515A2C0701;
        Mon, 13 Jan 2020 22:06:52 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2c: parport: simplify Kconfig description
Date:   Mon, 13 Jan 2020 22:06:42 +0100
Message-Id: <20200113210643.5033-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver is not 'new' anymore, so remove details from the driver it
surpassed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/Kconfig | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 933f15f0ad67..b2840c5ebf24 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1202,14 +1202,8 @@ config I2C_PARPORT
 	  This supports parallel port I2C adapters such as the ones made by
 	  Philips or Velleman, Analog Devices evaluation boards, and more.
 	  Basically any adapter using the parallel port as an I2C bus with
-	  no extra chipset is supported by this driver, or could be.
-
-	  This driver is a replacement for (and was inspired by) an older
-	  driver named i2c-philips-par.  The new driver supports more devices,
-	  and makes it easier to add support for new devices.
-
-	  An adapter type parameter is now mandatory.  Please read the file
-	  Documentation/i2c/busses/i2c-parport.rst for details.
+	  no extra chipset is supported by this driver, or could be. Please
+	  read the file Documentation/i2c/busses/i2c-parport.rst for details.
 
 	  This support is also available as a module.  If so, the module
 	  will be called i2c-parport.
-- 
2.20.1

