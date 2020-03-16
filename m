Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEAD186FA8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 17:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731687AbgCPQH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 12:07:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:44771 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731704AbgCPQH2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Mar 2020 12:07:28 -0400
IronPort-SDR: FE3jki/9R/N7IXvJaWLB18LlTyeMipfFwUHwh/WfYQ5dhzc52keWrWtaiJCRL3nN3M3qbdeBvh
 Ao0WmtCZNwXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:07:27 -0700
IronPort-SDR: 5MhvtFzE7ujE3VoIU8F/iHqJAu5HSlw4Q9mi03gbraL3Mq1CEZCuLXgX4MANePUbjCivPq2lZv
 6qdUHqRcxrLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; 
   d="scan'208";a="233209890"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2020 09:07:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 53DEA1AA; Mon, 16 Mar 2020 18:07:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/4] i2c: mux: pca954x: Convert license to SPDX identifier
Date:   Mon, 16 Mar 2020 18:07:24 +0200
Message-Id: <20200316160724.37596-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
References: <20200316160724.37596-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a shorter SPDX identifier instead of pasting the whole license.

While here, replace duplicating PCA954x with PCA984x.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 drivers/i2c/muxes/i2c-mux-pca954x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 0908a0655cb7..4ad665757dd8 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -1,10 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * I2C multiplexer
  *
  * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
  * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
  *
- * This module supports the PCA954x and PCA954x series of I2C multiplexer/switch
+ * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
  * chips made by NXP Semiconductors.
  * This includes the:
  *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
@@ -29,10 +30,6 @@
  *	i2c-virtual_cb.c from Brian Kuschak <bkuschak@yahoo.com>
  * and
  *	pca9540.c from Jean Delvare <jdelvare@suse.de>.
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/device.h>
-- 
2.25.1

