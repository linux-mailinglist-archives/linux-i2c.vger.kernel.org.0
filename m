Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DB644C2C6
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 15:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhKJON0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 09:13:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:63711 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232113AbhKJONZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Nov 2021 09:13:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293504587"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="293504587"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 06:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="589294562"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.159])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2021 06:10:34 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
Subject: [PATCH v3] i2c: i801: Fix interrupt storm from SMB_ALERT signal
Date:   Wed, 10 Nov 2021 16:10:32 +0200
Message-Id: <20211110141032.2429745-1-jarkko.nikula@linux.intel.com>
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
v3: Add comment from Jean Delvare why SMB_ALERT interrupt is blocked for
    now. Simplify comment about SMB_ALERT status clearing
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
 drivers/i2c/busses/i2c-i801.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ed271274250b..21be28b7955f 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -191,6 +191,7 @@
 #define SMBSLVSTS_HST_NTFY_STS	BIT(0)
 
 /* Host Notify Command register bits */
+#define SMBSLVCMD_SMBALERT_DISABLE	BIT(2)
 #define SMBSLVCMD_HST_NTFY_INTREN	BIT(0)
 
 #define STATUS_ERROR_FLAGS	(SMBHSTSTS_FAILED | SMBHSTSTS_BUS_ERR | \
@@ -642,12 +643,20 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 		i801_isr_byte_done(priv);
 
 	/*
-	 * Clear irq sources and report transaction result.
+	 * Clear remaining irq sources: Completion of last command, errors
+	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
+	 * assertion independently is the interrupt generation blocked or not
+	 * so clear it always when the status is set.
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
@@ -975,9 +984,13 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
 	if (!(priv->features & FEATURE_HOST_NOTIFY))
 		return;
 
-	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
-		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
-		       SMBSLVCMD(priv));
+	/*
+	 * Enable host notify interrupt and block the generation of interrupt
+	 * from the SMB_ALERT signal because the driver does not support
+	 * SMBus Alert yet.
+	 */
+	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
+	       priv->original_slvcmd, SMBSLVCMD(priv));
 
 	/* clear Host Notify bit to allow a new notification */
 	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
-- 
2.33.0

