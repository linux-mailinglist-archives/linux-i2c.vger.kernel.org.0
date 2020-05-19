Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE7F1D96A5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgESMuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:24026 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728705AbgESMuu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:50 -0400
IronPort-SDR: 0LQQUajR1oUlE3aX78p/bgs6Uq+jjBxEVZ+DA3CQ1ymqmowVvYLLqsCNuymJOOemcSbejRQ/Iz
 kA+MG2TmqFdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:50 -0700
IronPort-SDR: x84hk5W9x5dlPpCXR1cjjY3y2FkL+QWO5maZZNiaaWxZay1oUrCdQL9OkWzzteoVtByFRyQ2EF
 EV+VbcfDZ9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="343126153"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 19 May 2020 05:50:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E07CA2A2; Tue, 19 May 2020 15:50:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/7] i2c: designware: Drop unneeded condition in i2c_dw_validate_speed()
Date:   Tue, 19 May 2020 15:50:40 +0300
Message-Id: <20200519125043.6069-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We may bailout directly from the loop instead of breaking it and
testing a loop counter. This also gives advantages such as decreased
indentation level along with dropped unneeded condition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/i2c-designware-common.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 9f06567be54a..2fd5372b1237 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -127,16 +127,14 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 	 */
 	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
 		if (t->bus_freq_hz == i2c_dw_supported_speeds[i])
-			break;
-	}
-	if (i == ARRAY_SIZE(i2c_dw_supported_speeds)) {
-		dev_err(dev->dev,
-			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
-			t->bus_freq_hz);
-		return -EINVAL;
+			return 0;
 	}
 
-	return 0;
+	dev_err(dev->dev,
+		"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
+		t->bus_freq_hz);
+
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(i2c_dw_validate_speed);
 
-- 
2.26.2

