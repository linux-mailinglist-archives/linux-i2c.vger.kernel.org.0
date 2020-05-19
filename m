Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37A11D96A8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgESMu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:8123 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728725AbgESMuw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:52 -0400
IronPort-SDR: 3YO6SnMlmQ6LMbUqfAfvM6IciRrUcAYxJ6+0mxprXEVs+fDp9rO7OeDriKHi21ndnIOrmiHW6F
 AyaYzKIIGAUg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:52 -0700
IronPort-SDR: Paehu4oW2qnqjXonBHNpzlee53MBvgykjeO8hD+Le0MIT73p7wfiYHk5KBUEiikNrdfJ8rFCnx
 onc916P4yQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="253234885"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 19 May 2020 05:50:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EFB971D6; Tue, 19 May 2020 15:50:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 6/7] i2c: designware: Read counters from ACPI for PCI driver
Date:   Tue, 19 May 2020 15:50:42 +0300
Message-Id: <20200519125043.6069-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PCI devices may have been backed with ACPI handle which supplies
an additional information to the drivers, such as counters.

Call for ACPI configuration from PCI driver in order to utilize counters
provided by ACPI.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: also call i2c_dw_acpi_adjust_bus_speed()
 drivers/i2c/busses/i2c-designware-pcidrv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index c8808e5855b4..3664d76bb976 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -255,6 +255,17 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
+	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
+
+	if (has_acpi_companion(&pdev->dev))
+		i2c_dw_acpi_configure(&pdev->dev);
+
+	r = i2c_dw_validate_speed(dev);
+	if (r) {
+		pci_free_irq_vectors(pdev);
+		return r;
+	}
+
 	i2c_dw_configure(dev);
 
 	if (controller->scl_sda_cfg) {
-- 
2.26.2

