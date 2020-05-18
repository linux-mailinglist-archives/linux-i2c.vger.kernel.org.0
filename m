Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7450F1D7784
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 13:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgERLmb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 07:42:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:39668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgERLma (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 May 2020 07:42:30 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5A9B20709;
        Mon, 18 May 2020 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589802150;
        bh=QyagQtbRq9+HNQq2KG3lZ1yeWLFN+f8sR7Llr8JpROY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WRl4ZeON8N/weVJtzW8ATHnTWKRb+wh0e7W6SbhidoTE8KmfCjFbTMeHP6Rq4oAdW
         HLzsIRxLCAZTITtge5TL+eJt9Glj2yp3WFYtPjPNi+w2PL2e0C963fosw6lKKZEYlP
         t1GUyZktiwM24d4QWV6S2EyOdvNsDI0hdfyfk8Xo=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jaeA7-00CStl-Cz; Mon, 18 May 2020 13:42:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 3/3] mfd: ensure that AXP20X_I2C will have the right deps on X86
Date:   Mon, 18 May 2020 13:42:12 +0200
Message-Id: <cfbb80f220bba5051640d92fc00825bdaa2ec877.1589801950.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1589801950.git.mchehab+huawei@kernel.org>
References: <cover.1589801950.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The axp20x I2C driver can be used on X86, but also on ARM
platforms.

Yet, for X86, it has to be builtin and need ACPI OpRegion
support enabled.

So, the dependency chain is diferent for X86 and for other
archs.

Change the dependency chain to take this into consideration,
ensuring that everything will be set as it should.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/acpi/Kconfig       |  3 ++-
 drivers/i2c/busses/Kconfig |  4 ++--
 drivers/mfd/Kconfig        | 21 ++++++++++++++++-----
 drivers/mfd/Makefile       |  8 +++++---
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ce2730d61a8f..4490200ef134 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -547,7 +547,8 @@ config CHTCRC_PMIC_OPREGION
 
 config XPOWER_PMIC_OPREGION
 	bool "ACPI operation region support for XPower AXP288 PMIC"
-	depends on MFD_AXP20X_I2C && IOSF_MBI=y
+	depends on MFD_AXP20X_I2C
+	select IOSF_MBI
 	help
 	  This config adds ACPI operation region support for XPower AXP288 PMIC.
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..202e743c8e3e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -563,8 +563,8 @@ config I2C_DESIGNWARE_PCI
 config I2C_DESIGNWARE_BAYTRAIL
 	bool "Intel Baytrail I2C semaphore support"
 	depends on ACPI
-	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
-		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
+	depends on I2C_DESIGNWARE_PLATFORM=y
+	select IOSF_MBI
 	help
 	  This driver enables managed host access to the PMIC I2C bus on select
 	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 167f117ff015..11bbbed30098 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -187,7 +187,7 @@ config MFD_AXP20X_I2C
 	tristate "X-Powers AXP series PMICs with I2C"
 	select MFD_AXP20X
 	select REGMAP_I2C
-	depends on I2C
+	depends on !X86 || (X86 && I2C_DESIGNWARE_PLATFORM=y && I2C_DESIGNWARE_BAYTRAIL=y && ACPI_I2C_OPREGION)
 	help
 	  If you say Y here you get support for the X-Powers AXP series power
 	  management ICs (PMICs) controlled with I2C.
@@ -195,10 +195,21 @@ config MFD_AXP20X_I2C
 	  components like regulators or the PEK (Power Enable Key) under the
 	  corresponding menus.
 
-	  Note on x86 this provides an ACPI OpRegion, so this must be 'y'
-	  (builtin) and not a module, as the OpRegion must be available as
-	  soon as possible. For the same reason the I2C bus driver options
-	  I2C_DESIGNWARE_PLATFORM and I2C_DESIGNWARE_BAYTRAIL must be 'y' too.
+	  Note on x86 this provides an ACPI OpRegion, so enabling it
+	  requires that I2C_DESIGNWARE_PLATFORM and I2C_DESIGNWARE_BAYTRAIL
+	  to be set as 'y'. On such architecture, the driver, if enabled,
+	  will always be (builtin) and not a module, as the OpRegion must be
+	  available as soon as possible.
+
+config MFD_AXP20X_X86
+	bool
+	depends on X86
+	default MFD_AXP20X_I2C
+
+config MFD_AXP20X_NOT_X86
+	tristate
+	depends on !X86
+	default MFD_AXP20X_I2C
 
 config MFD_AXP20X_RSB
 	tristate "X-Powers AXP series PMICs with RSB"
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f935d10cbf0f..dd902b5c31ff 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -142,9 +142,11 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
 obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
 
 obj-$(CONFIG_MFD_AC100)		+= ac100.o
-obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
-obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
-obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
+
+obj-$(CONFIG_MFD_AXP20X)		+= axp20x.o
+obj-$(CONFIG_MFD_AXP20X_I2C_X86)	+= axp20x-i2c.o
+obj-$(CONFIG_MFD_AXP20X_I2C_NOT_X86)	+= axp20x-i2c.o
+obj-$(CONFIG_MFD_AXP20X_RSB)		+= axp20x-rsb.o
 
 obj-$(CONFIG_MFD_LP3943)	+= lp3943.o
 obj-$(CONFIG_MFD_LP8788)	+= lp8788.o lp8788-irq.o
-- 
2.26.2

