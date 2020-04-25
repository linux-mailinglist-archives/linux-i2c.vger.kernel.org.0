Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6291B8651
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 13:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgDYLv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 07:51:56 -0400
Received: from mga18.intel.com ([134.134.136.126]:8095 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgDYLv4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 07:51:56 -0400
IronPort-SDR: Wn/8H+QhMOEj1wEW9EfijKmWRUe8uKbgvHe/Ava17r1OGVRTAMP+NA31Fb63hJ5A/v4FKa1niv
 Mus87Jr77apw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 04:51:55 -0700
IronPort-SDR: lZJ6sYHDNkB2Uw3BJcMmSdN/fFI8nZuUvXdOESJV4Pe37KRuZjAeQQL6wtF5HUYxg66ihe9H6L
 XMIAz/qluZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="256701744"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 25 Apr 2020 04:51:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BE398190; Sat, 25 Apr 2020 14:51:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Date:   Sat, 25 Apr 2020 14:51:49 +0300
Message-Id: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Refactor pca954x_irq_handler() to:
  - use for_each_set_bit() macro
  - use IRQ_RETVAL() macro

Above change makes code easy to read and understand.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: rebase on top of latest rc
 drivers/i2c/muxes/i2c-mux-pca954x.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index a0d926ae3f864..b764c7c746e96 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -327,21 +327,18 @@ static DEVICE_ATTR_RW(idle_state);
 static irqreturn_t pca954x_irq_handler(int irq, void *dev_id)
 {
 	struct pca954x *data = dev_id;
-	unsigned int child_irq;
-	int ret, i, handled = 0;
+	unsigned long pending;
+	int ret, i;
 
 	ret = i2c_smbus_read_byte(data->client);
 	if (ret < 0)
 		return IRQ_NONE;
 
-	for (i = 0; i < data->chip->nchans; i++) {
-		if (ret & BIT(PCA954X_IRQ_OFFSET + i)) {
-			child_irq = irq_linear_revmap(data->irq, i);
-			handle_nested_irq(child_irq);
-			handled++;
-		}
-	}
-	return handled ? IRQ_HANDLED : IRQ_NONE;
+	pending = (ret >> PCA954X_IRQ_OFFSET) & (BIT(data->chip->nchans) - 1);
+	for_each_set_bit(i, &pending, data->chip->nchans)
+		handle_nested_irq(irq_linear_revmap(data->irq, i));
+
+	return IRQ_RETVAL(pending);
 }
 
 static int pca954x_irq_set_type(struct irq_data *idata, unsigned int type)
-- 
2.26.2

