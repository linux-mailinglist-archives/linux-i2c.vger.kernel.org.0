Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FEF1F729
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2019 17:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfEOPJm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 May 2019 11:09:42 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56392 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726572AbfEOPJm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 May 2019 11:09:42 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4FF8Atg026402;
        Wed, 15 May 2019 17:09:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9sDHCBobyGwN5zX9QrGG4fMjtEr0teqvHD1XBP671OE=;
 b=vs8iIGizAr8EZcpEPvULzixNjpcbcuSJOC5vtbzzWdw7a0/5BZYjzGufuG8RfIzQcBw1
 uGIh2sEdKRSCj8W2h1bxTJC7ajb3KG4CRqba25GHYF67xZoovwvHFGRuMH//dvE0NPup
 ShlIpJeh5pqDYMW67fGQchXaKv4qgMe1++YWb4qxSTkcJ6YZF9f16fQWw9fzMKVN+4uI
 WgGvTacKmjS4EoHLSV/iBUKNiZCr/hTK9BvTpDTPxnvwz2SlKbVd/ZdpE4xvFfJpkSEj
 lx2bDETNO4RKcA3AbAsCvydmgwwD6rM/QzvQK6FmTLVv8mTEeTkcODHBJiya0gQEWC+c 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sdn9g1m3w-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 15 May 2019 17:09:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 51BC238;
        Wed, 15 May 2019 15:09:24 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E6EF29E7;
        Wed, 15 May 2019 15:09:24 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 15 May 2019 17:09:23
 +0200
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: i2c-stm32f7: fix the get_irq error cases
Date:   Wed, 15 May 2019 17:09:09 +0200
Message-ID: <1557932949-15912-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_10:,,
 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During probe, return the "get_irq" error value instead of -EINVAL which
allows the driver to be deferred probed if needed.
Fix also the case where of_irq_get() returns a negative value.
Note :
On failure of_irq_get() returns 0 or a negative value while
platform_get_irq() returns a negative value.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 4284fc9..14fb105 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -25,7 +25,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
@@ -1812,15 +1811,14 @@ static struct i2c_algorithm stm32f7_i2c_algo = {
 
 static int stm32f7_i2c_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct stm32f7_i2c_dev *i2c_dev;
 	const struct stm32f7_i2c_setup *setup;
 	struct resource *res;
-	u32 irq_error, irq_event, clk_rate, rise_time, fall_time;
+	u32 clk_rate, rise_time, fall_time;
 	struct i2c_adapter *adap;
 	struct reset_control *rst;
 	dma_addr_t phy_addr;
-	int ret;
+	int irq_error, irq_event, ret;
 
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
@@ -1832,16 +1830,20 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 	phy_addr = (dma_addr_t)res->start;
 
-	irq_event = irq_of_parse_and_map(np, 0);
-	if (!irq_event) {
-		dev_err(&pdev->dev, "IRQ event missing or invalid\n");
-		return -EINVAL;
+	irq_event = platform_get_irq(pdev, 0);
+	if (irq_event < 0) {
+		if (irq_event != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get IRQ event: %d\n",
+				irq_event);
+		return irq_event;
 	}
 
-	irq_error = irq_of_parse_and_map(np, 1);
-	if (!irq_error) {
-		dev_err(&pdev->dev, "IRQ error missing or invalid\n");
-		return -EINVAL;
+	irq_error = platform_get_irq(pdev, 1);
+	if (irq_error < 0) {
+		if (irq_error != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get IRQ error: %d\n",
+				irq_error);
+		return irq_error;
 	}
 
 	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
-- 
2.7.4

