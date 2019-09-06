Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A332CAB84B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 14:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732456AbfIFMke (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 08:40:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:12899 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728507AbfIFMke (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Sep 2019 08:40:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Sep 2019 05:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; 
   d="scan'208";a="177624565"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga008.jf.intel.com with ESMTP; 06 Sep 2019 05:40:32 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: designware-pci: Remove needless pci_set_master() call
Date:   Fri,  6 Sep 2019 15:40:29 +0300
Message-Id: <20190906124029.25406-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I failed to notice the pci_set_master() call is needless in the
commit 21aa3983d619 ("i2c: designware-pci: Switch over to MSI interrupts")
due the fact driver don't support DMA.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 050adda7c1bd..1fa6171e253b 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -234,8 +234,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return r;
 	}
 
-	pci_set_master(pdev);
-
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
 	if (r) {
 		dev_err(&pdev->dev, "I/O memory remapping failed\n");
-- 
2.23.0.rc1

