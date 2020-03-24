Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9BF8190D8A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 13:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgCXMcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 08:32:21 -0400
Received: from mga07.intel.com ([134.134.136.100]:5891 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727511AbgCXMcU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 08:32:20 -0400
IronPort-SDR: EobnEQy2oMx7EoKF8VQddQ3VP/B503PXd4EkHEqWa6GtbxDd32eIf3d3a7/8LnI1X0e1QnFbtF
 wHYxR6jwvuRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 05:32:19 -0700
IronPort-SDR: q37ZQ8seY1q1ho1RfZh9gGNVeeT7rRVCIkkQ1dd06MOCmBh1qUoXe8ZrqFwGZcRxwqiCAJNnBJ
 0OwWIqoEbbnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; 
   d="scan'208";a="240046586"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2020 05:32:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C43F61FC; Tue, 24 Mar 2020 14:32:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 5/6] i2c: algo: Use generic definitions for bus frequencies
Date:   Tue, 24 Mar 2020 14:32:15 +0200
Message-Id: <20200324123216.78113-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5: no changes
 drivers/i2c/algos/i2c-algo-pca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index 5ac93f41bfec..dff4e178c732 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -459,17 +459,17 @@ static int pca_init(struct i2c_adapter *adap)
 		/* To avoid integer overflow, use clock/100 for calculations */
 		clock = pca_clock(pca_data) / 100;
 
-		if (pca_data->i2c_clock > 1000000) {
+		if (pca_data->i2c_clock > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 			mode = I2C_PCA_MODE_TURBO;
 			min_tlow = 14;
 			min_thi  = 5;
 			raise_fall_time = 22; /* Raise 11e-8s, Fall 11e-8s */
-		} else if (pca_data->i2c_clock > 400000) {
+		} else if (pca_data->i2c_clock > I2C_MAX_FAST_MODE_FREQ) {
 			mode = I2C_PCA_MODE_FASTP;
 			min_tlow = 17;
 			min_thi  = 9;
 			raise_fall_time = 22; /* Raise 11e-8s, Fall 11e-8s */
-		} else if (pca_data->i2c_clock > 100000) {
+		} else if (pca_data->i2c_clock > I2C_MAX_STANDARD_MODE_FREQ) {
 			mode = I2C_PCA_MODE_FAST;
 			min_tlow = 44;
 			min_thi  = 20;
-- 
2.25.1

