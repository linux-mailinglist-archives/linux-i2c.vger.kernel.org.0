Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2BC24B0BC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 10:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgHTIGH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 04:06:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:23003 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgHTIGC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 04:06:02 -0400
IronPort-SDR: 9ZaNxSfgOMNxlXgNRUKMZ0/pBcBUDNcXpIgvLPi5KtuuQ40NnAwP6UdbJgEq40R/jPazPIswlx
 GYMnk5obxLig==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="134783074"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="134783074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 01:06:01 -0700
IronPort-SDR: Kho7LKglAwU9F/SCgFsdMO5NPdczvwQL013OUivty0Ra8Qlqpf7uTxxqEvs4HetEtgFc6QFnoU
 hzeH4XG32Hdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="297481717"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.92])
  by orsmga006.jf.intel.com with ESMTP; 20 Aug 2020 01:05:59 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: Remove 'default n' from busses/Kconfig
Date:   Thu, 20 Aug 2020 11:05:25 +0300
Message-Id: <20200820080525.2767120-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The default value for a config option defaults to 'n' so it doesn't need
to be set here.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 085ca9b009ed..9731121ec561 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -840,7 +840,6 @@ config I2C_PASEMI
 config I2C_PCA_PLATFORM
 	tristate "PCA9564/PCA9665 as platform device"
 	select I2C_ALGOPCA
-	default n
 	help
 	  This driver supports a memory mapped Philips PCA9564/PCA9665
 	  parallel bus to I2C bus controller.
@@ -1251,7 +1250,6 @@ config I2C_TAOS_EVM
 	depends on TTY
 	select SERIO
 	select SERIO_SERPORT
-	default n
 	help
 	  This supports TAOS evaluation modules on serial port. In order to
 	  use this driver, you will need the inputattach tool, which is part
@@ -1335,7 +1333,6 @@ config I2C_PCA_ISA
 	tristate "PCA9564/PCA9665 on an ISA bus"
 	depends on ISA
 	select I2C_ALGOPCA
-	default n
 	help
 	  This driver supports ISA boards using the Philips PCA9564/PCA9665
 	  parallel bus to I2C bus controller.
-- 
2.28.0

