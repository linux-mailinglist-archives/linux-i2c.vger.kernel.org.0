Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB22433886
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 16:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhJSOlf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 10:41:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:57346 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229641AbhJSOle (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Oct 2021 10:41:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="252001992"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="252001992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 07:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="661823740"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.56])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2021 07:17:04 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: [PATCH] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Date:   Tue, 19 Oct 2021 17:17:00 +0300
Message-Id: <20211019141700.764413-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently interrupt storm will occur from i2-i801 after first transaction
if SMB_ALERT signal is enabled and ever asserted, even before the driver
is loaded and does not recover because that interrupt is not
acknowledged.

This fix aims to fix it by two ways:
- Add acknowledging for the SMB_ALERT interrupt status
- Disable the SMB_ALERT interrupt on platforms where possible since the
  driver currently does not make use for it

Acknowledging resets the SMB_ALERT interrupt status on all platforms and
also should help to avoid interrupt storm on older platforms where the
SMB_ALERT interrupt disabling is not available.

For simplicity this fix reuses the host notify feature for disabling and
restoring original register value.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=177311
Reported-by: ck+kernelbugzilla@bl4ckb0x.de
Reported-by: stephane.poignant@protonmail.com
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Hi Conrad and Stephane. This patch is otherwise the same than the one I
had in bugzilla but this adds also acknowledging for the SMB_ALERT
interrupt. There is short time window during driver load and unload
where interrupt storm will still occur if signal was asserted. Also
interrupt disabling is possible only on ICH3 and later so interrupt
acknowledging should also help those old platforms.
---
 drivers/i2c/busses/i2c-i801.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 115660dce722..e95de4ce6b64 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -190,6 +190,7 @@
 #define SMBSLVSTS_HST_NTFY_STS	BIT(0)
 
 /* Host Notify Command register bits */
+#define SMBSLVCMD_SMBALERT_DISABLE	BIT(2)
 #define SMBSLVCMD_HST_NTFY_INTREN	BIT(0)
 
 #define STATUS_ERROR_FLAGS	(SMBHSTSTS_FAILED | SMBHSTSTS_BUS_ERR | \
@@ -642,9 +643,11 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	 * Clear irq sources and report transaction result.
 	 * ->status must be cleared before the next transaction is started.
 	 */
-	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
-	if (status) {
+	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
+	if (status)
 		outb_p(status, SMBHSTSTS(priv));
+	status &= ~SMBHSTSTS_SMBALERT_STS;
+	if (status) {
 		priv->status = status;
 		complete(&priv->done);
 	}
@@ -972,9 +975,9 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
 	if (!(priv->features & FEATURE_HOST_NOTIFY))
 		return;
 
-	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
-		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
-		       SMBSLVCMD(priv));
+	/* Enable host notify interrupt and disable SMB_ALERT signal */
+	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
+	       priv->original_slvcmd, SMBSLVCMD(priv));
 
 	/* clear Host Notify bit to allow a new notification */
 	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
-- 
2.33.0

