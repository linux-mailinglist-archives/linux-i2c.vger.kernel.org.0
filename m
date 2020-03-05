Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9235617A94D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 16:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgCEPxz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 10:53:55 -0500
Received: from mga06.intel.com ([134.134.136.31]:42076 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgCEPxz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 10:53:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 07:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="387534728"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 05 Mar 2020 07:53:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BB148D7; Thu,  5 Mar 2020 17:53:52 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/5] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Date:   Thu,  5 Mar 2020 17:53:48 +0200
Message-Id: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
 drivers/i2c/muxes/i2c-mux-pca954x.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index a0d926ae3f86..819ff95e64ba 100644
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
+	pending = ret >> PCA954X_IRQ_OFFSET;
+	for_each_set_bit(i, &pending, data->chip->nchans)
+		handle_nested_irq(irq_linear_revmap(data->irq, i));
+
+	return IRQ_RETVAL(pending);
 }
 
 static int pca954x_irq_set_type(struct irq_data *idata, unsigned int type)
-- 
2.25.1

