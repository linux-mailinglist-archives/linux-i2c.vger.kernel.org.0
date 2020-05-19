Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBBC1D96A4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgESMuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:52 -0400
Received: from mga03.intel.com ([134.134.136.65]:26797 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728699AbgESMuu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:50 -0400
IronPort-SDR: Jg8u6h6SRbSXO73zQKaFviiR7D3q6Tq7Hjtrl5gQkXfjINw+HvY/AS+ewlemY5osCQgkLmEaCq
 tdasBRfT8aig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:50 -0700
IronPort-SDR: XgHVE+DLbR5bw9hGydpNy1nQlCmq2BEyxbnNO3u/tvaEJJAAqZqLcb4AGSHbmmVYAD8iibepVB
 o6horZ3y2YJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="373716844"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 19 May 2020 05:50:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CC041BD; Tue, 19 May 2020 15:50:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/7] i2c: designware: Include proper headers in i2c-desingware-core.h
Date:   Tue, 19 May 2020 15:50:38 +0300
Message-Id: <20200519125043.6069-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This header is a user of some generic ones, include them respectively.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/i2c/busses/i2c-designware-core.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 6202f9ee953d..94d9ad15133a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -9,7 +9,13 @@
  * Copyright (C) 2009 Provigent Ltd.
  */
 
+#include <linux/bits.h>
+#include <linux/compiler_types.h>
+#include <linux/completion.h>
+#include <linux/dev_printk.h>
+#include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/types.h>
 
 #define DW_IC_DEFAULT_FUNCTIONALITY (I2C_FUNC_I2C |			\
 					I2C_FUNC_SMBUS_BYTE |		\
@@ -170,6 +176,9 @@
 					 DW_IC_TX_ABRT_TXDATA_NOACK | \
 					 DW_IC_TX_ABRT_GCALL_NOACK)
 
+struct clk;
+struct device;
+struct reset_control;
 
 /**
  * struct dw_i2c_dev - private i2c-designware data
-- 
2.26.2

