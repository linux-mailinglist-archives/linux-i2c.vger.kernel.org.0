Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5E7186F0F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 16:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731848AbgCPPtd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 11:49:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:50166 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731838AbgCPPtc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 11:49:32 -0400
IronPort-SDR: s89WxgvOWV+qlZAbTD0h2Rp42B3ftt3n4jjKYs5Ds/5SQQqLV/ZkigtvmUPwSYNAG4mcTRxulx
 nmSybSn/tJYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 08:49:32 -0700
IronPort-SDR: TYpIkxHCc8jTpugD+oImTofM5lNKA1/suffF91vpYLuGvSxXn9WByNH+Ys6Rw0dTymVUE+qhSI
 PH7lbOua8zIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,560,1574150400"; 
   d="scan'208";a="355049868"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2020 08:49:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DDCAA11E; Mon, 16 Mar 2020 17:49:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 5/6] i2c: algo: Use generic definitions for bus frequencies
Date:   Mon, 16 Mar 2020 17:49:28 +0200
Message-Id: <20200316154929.20886-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: no changes
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

