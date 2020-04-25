Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5931B8654
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 13:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgDYLv5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 07:51:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:59375 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgDYLv4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 07:51:56 -0400
IronPort-SDR: gnso1rqnH1S801yEcO5g3mhdNbGWylWKe9Ld0QKLePvJZL/1KZjZ3vnVWkK3l310pq3bSPiMKT
 +kwfE71IuA5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 04:51:56 -0700
IronPort-SDR: YjEmZR/OH5Tz1cGB+MLGEDNTjbt8SDizqBfMKq/SmX9oXQE9K0pidHuH+sC0qondQtBqIEp5Yo
 V+5dqXPApTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="458245902"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2020 04:51:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DC5F0302; Sat, 25 Apr 2020 14:51:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 4/4] i2c: mux: pca954x: Convert license to SPDX identifier
Date:   Sat, 25 Apr 2020 14:51:52 +0300
Message-Id: <20200425115152.29475-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
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
v3: rebase on top of latest rc

 drivers/i2c/muxes/i2c-mux-pca954x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 0908a0655cb79..4ad665757dd81 100644
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
2.26.2

