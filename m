Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C372116A9B7
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgBXPPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:50 -0500
Received: from mga18.intel.com ([134.134.136.126]:50806 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727727AbgBXPPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="226007450"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C0F1D4E5; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 16/40] i2c: img-scb: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:06 +0200
Message-Id: <20200224151530.31713-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 20a4fbc53007..e5fed1814c8f 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -304,7 +304,7 @@ static struct img_i2c_timings timings[] = {
 	/* Standard mode */
 	{
 		.name = "standard",
-		.max_bitrate = 100000,
+		.max_bitrate = I2C_STANDARD_MODE_FREQ,
 		.tckh = 4000,
 		.tckl = 4700,
 		.tsdh = 4700,
@@ -316,7 +316,7 @@ static struct img_i2c_timings timings[] = {
 	/* Fast mode */
 	{
 		.name = "fast",
-		.max_bitrate = 400000,
+		.max_bitrate = I2C_FAST_MODE_FREQ,
 		.tckh = 600,
 		.tckl = 1300,
 		.tsdh = 600,
-- 
2.25.0

