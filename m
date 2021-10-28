Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4944443E449
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Oct 2021 16:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhJ1Ozo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Oct 2021 10:55:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:25274 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230258AbhJ1Ozo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Oct 2021 10:55:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230371956"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; 
   d="scan'208";a="230371956"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 07:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; 
   d="scan'208";a="447723103"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.159])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2021 07:53:14 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: [PATCH v2] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Date:   Thu, 28 Oct 2021 17:53:11 +0300
Message-Id: <20211028145311.1401355-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently interrupt storm will occur from i2c-i801 after first
transaction if SMB_ALERT signal is enabled and ever asserted. It is
enough if the signal is asserted once even before the driver is loaded
and does not recover because that interrupt is not acknowledged.

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
v2: More verbose commenting around interrupt acknowledging, reporting
    and SMB_ALERT disabling. Fix typo in commit log and split the first
    sentence.
v1:
Hi Conrad and Stephane. This patch is otherwise the same than the one I
had in bugzilla but this adds also acknowledging for the SMB_ALERT
interrupt. There is short time window during driver load and unload
where interrupt storm will still occur if signal was asserted. Also
interrupt disabling is possible only on ICH3 and later so interrupt
acknowledging should also help those old platforms.
---
 drivers/i2c/busses/i2c-i801.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 115660dce722..cf6cf419c760 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -190,6 +190,7 @@
 #define SMBSLVSTS_HST_NTFY_STS	BIT(0)
 
 /* Host Notify Command register bits */
+#define SMBSLVCMD_SMBALERT_DISABLE	BIT(2)
 #define SMBSLVCMD_HST_NTFY_INTREN	BIT(0)
 
 #define STATUS_ERROR_FLAGS	(SMBHSTSTS_FAILED | SMBHSTSTS_BUS_ERR | \
@@ -639,12 +640,20 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 		i801_isr_byte_done(priv);
 
 	/*
-	 * Clear irq sources and report transaction result.
+	 * Clear remaining irq sources: Completion of last command, errors
+	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
+	 * assertion also when the interrupt from it is blocked on platforms
+	 * where disabling is possible so clear it always when status is set.
+	 */
+	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
+	if (status)
+		outb_p(status, SMBHSTSTS(priv));
+	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
+	/*
+	 * Report transaction result.
 	 * ->status must be cleared before the next transaction is started.
 	 */
-	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
 	if (status) {
-		outb_p(status, SMBHSTSTS(priv));
 		priv->status = status;
 		complete(&priv->done);
 	}
@@ -972,9 +981,12 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
 	if (!(priv->features & FEATURE_HOST_NOTIFY))
 		return;
 
-	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
-		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
-		       SMBSLVCMD(priv));
+	/*
+	 * Enable host notify interrupt and block the generation of interrupt
+	 * from the SMB_ALERT signal.
+	 */
+	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
+	       priv->original_slvcmd, SMBSLVCMD(priv));
 
 	/* clear Host Notify bit to allow a new notification */
 	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
-- 
2.33.0

