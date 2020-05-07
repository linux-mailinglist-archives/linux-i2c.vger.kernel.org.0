Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7514D1C8D00
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 15:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgEGNvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 09:51:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:8846 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbgEGNvp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 May 2020 09:51:45 -0400
IronPort-SDR: UFvx2kn7AItt/86FBbx+X/0tKRPLMfIGVl2590ptNLMApaNNdSr0lNSq0iK1lTXk7TLm4q3TFi
 X94CIwubdj3w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:51:44 -0700
IronPort-SDR: lknXsqJVH5VK0JWRcE4z/XJBLM8mSB8bkNI6WOC69U9maQbiF/4O37ipN3GGMG7ao5EX+h0P8G
 4SRXQFgBUJrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="278604305"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 07 May 2020 06:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3456A234; Thu,  7 May 2020 16:51:42 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] i2c: designware: Read counters from ACPI for PCI driver
Date:   Thu,  7 May 2020 16:51:40 +0300
Message-Id: <20200507135140.14635-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-pcidrv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index c762e5a11e44e..96191925f71ec 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -251,6 +251,15 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
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

