Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A637343B4AB
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Oct 2021 16:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbhJZOt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Oct 2021 10:49:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:57972 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236045AbhJZOtZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 Oct 2021 10:49:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227382161"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; 
   d="scan'208";a="227382161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 07:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; 
   d="scan'208";a="664574967"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.56])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2021 07:39:27 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Fix incorrect and needless software PEC disabling
Date:   Tue, 26 Oct 2021 17:39:16 +0300
Message-Id: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit a6b8bb6a813a ("i2c: i801: Fix handling SMBHSTCNT_PEC_EN")
attempts to disable software PEC by clearing the SMBHSTCNT_PEC_EN (bit 7)
in the SMBus Host Control register (I/O SMBHSTCNT) but incorrectly
clears it in the PCI Host Configuration register (PCI SMBHSTCFG).

This clearing is actually needless since after above commit the
SMBHSTCNT_PEC_EN is never set and the register is initialized with known
values.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
I didn't add Fixes tag and Cc stable@vger.kernel.org since I don't see
this causes any real issues. A few platforms I checked the PCI Host
Configuration register bit 7 was reserved 0.
---
 drivers/i2c/busses/i2c-i801.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 115660dce722..b6048a571543 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1657,7 +1657,6 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 	unsigned char hstcfg = priv->original_hstcfg;
 
 	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
-	hstcfg &= ~SMBHSTCNT_PEC_EN;	/* Disable software PEC */
 	hstcfg |= SMBHSTCFG_HST_EN;
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
 }
-- 
2.33.0

