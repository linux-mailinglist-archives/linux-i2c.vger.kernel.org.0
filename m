Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CEF2120CD
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 12:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgGBKPc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 06:15:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:46709 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728320AbgGBKPb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jul 2020 06:15:31 -0400
IronPort-SDR: Vt4fiRzgdiT+Bt9YVRQNneeHnE0rwKntkF2V+7vvOS0IKHXv6n3maR9hW8k9y8RwfMGY8qXUev
 IjevuR6Jaojg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="146852878"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="146852878"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 03:15:31 -0700
IronPort-SDR: c/JlylX6G65ta5/B92MKTAoGfsqsDf0Sc/Fhr/3a+iJr4kFnw80el5CDigStxn1+vgDwPjmNuk
 WQy1ceVZ76jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="304199499"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 02 Jul 2020 03:15:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 240BE17D; Thu,  2 Jul 2020 13:15:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: eg20t: Load module automatically if ID matches
Date:   Thu,  2 Jul 2020 13:15:27 +0300
Message-Id: <20200702101527.10285-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver can't be loaded automatically because it misses
module alias to be provided. Add corresponding MODULE_DEVICE_TABLE()
call to the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index bb810dee8fb5..73f139690e4e 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -180,6 +180,7 @@ static const struct pci_device_id pch_pcidev_id[] = {
 	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_I2C), 1, },
 	{0,}
 };
+MODULE_DEVICE_TABLE(pci, pch_pcidev_id);
 
 static irqreturn_t pch_i2c_handler(int irq, void *pData);
 
-- 
2.27.0

