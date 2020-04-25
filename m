Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9878C1B86D8
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 15:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgDYNox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 09:44:53 -0400
Received: from mga18.intel.com ([134.134.136.126]:30606 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgDYNox (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 09:44:53 -0400
IronPort-SDR: N3n02ESe3t+HKMkgML3qaO0/xpoILVYvjzEjgB+IK4fD2CmuMVaHe/qLHDu1/QhDctOVAFAWSB
 9ELTQDp8LC5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 06:44:52 -0700
IronPort-SDR: NnmlAsOgJ13MNGqEdPur7a2tGN0UVOJIqF3TFh2God1zFeHb2tfOLSzbqy1qYftvbgxNYRL4wQ
 jbPWlm+s58uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="292998888"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 25 Apr 2020 06:44:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 077232F4; Sat, 25 Apr 2020 16:44:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/5] i2c: designware: Allow slave mode for PCI enumerated devices
Date:   Sat, 25 Apr 2020 16:44:48 +0300
Message-Id: <20200425134448.28514-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allow slave mode for PCI enumerated devices by calling a common i2c_dw_probe()
instead of i2c_dw_probe_master().

While dropping dependency to platform driver in slave module, move its
configuration section above, closer to core.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/Kconfig                 | 21 ++++++++++-----------
 drivers/i2c/busses/i2c-designware-pcidrv.c |  4 ++--
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 70a561bff74a6..b1ad26269cc63 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -527,6 +527,16 @@ config I2C_DAVINCI
 config I2C_DESIGNWARE_CORE
 	tristate
 
+config I2C_DESIGNWARE_SLAVE
+	bool "Synopsys DesignWare Slave"
+	select I2C_SLAVE
+	help
+	  If you say yes to this option, support will be included for the
+	  Synopsys DesignWare I2C slave adapter.
+
+	  This is not a standalone module, this module compiles together with
+	  i2c-designware-core.
+
 config I2C_DESIGNWARE_PLATFORM
 	tristate "Synopsys DesignWare Platform"
 	select I2C_DESIGNWARE_CORE
@@ -538,17 +548,6 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
-config I2C_DESIGNWARE_SLAVE
-	bool "Synopsys DesignWare Slave"
-	select I2C_SLAVE
-	depends on I2C_DESIGNWARE_PLATFORM
-	help
-	  If you say yes to this option, support will be included for the
-	  Synopsys DesignWare I2C slave adapter.
-
-	  This is not a standalone module, this module compiles together with
-	  i2c-designware-core.
-
 config I2C_DESIGNWARE_PCI
 	tristate "Synopsys DesignWare PCI"
 	depends on PCI
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7e994f366a5e8..c762e5a11e44e 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -251,7 +251,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
-	i2c_dw_configure_master(dev);
+	i2c_dw_configure(dev);
 
 	if (controller->scl_sda_cfg) {
 		cfg = controller->scl_sda_cfg;
@@ -271,7 +271,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->nr = controller->bus_num;
 
-	r = i2c_dw_probe_master(dev);
+	r = i2c_dw_probe(dev);
 	if (r) {
 		pci_free_irq_vectors(pdev);
 		return r;
-- 
2.26.2

