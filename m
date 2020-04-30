Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFC51C00A8
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Apr 2020 17:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgD3Pnk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Apr 2020 11:43:40 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5966 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726421AbgD3Pnj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Apr 2020 11:43:39 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03UFcaTe000876;
        Thu, 30 Apr 2020 17:43:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=FM5KaA1uV/WxDroCmg60tmJ6OFRkMqWZLOVG28f30so=;
 b=rKrWYm2WR11CqtjKHjOJE10wXs1SeV7guFfl2H1E7WK/HU48cgF9WUid+OZMUTZCTQ33
 Evb4j5q+28C/fj3zcCcjkn3jSAO6EZ+HVooBZGBk6naQJ21Srk4J7LIArE0ugWNAt4dj
 pUNfzi0W1FCPszx39V33ti8VqNumC4TCM7oWwMxprA6jlHoppgEmereLvfJVu+L9VYi3
 VGteWeK29cBn3hOgYypVKbxiK9rZFRmpm1RIYOvaYxCNd/p/8d6V/YXxzzzNnNjELZDJ
 4K5eYh/iIA/OXh5Vtt5rD+MA3YLJn7buFlOyeTRnY+2ol8jH95xkGY7Q5ozGRjZnqyAN NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30mhq6daug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Apr 2020 17:43:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2340510002A;
        Thu, 30 Apr 2020 17:43:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 077512AAF71;
        Thu, 30 Apr 2020 17:43:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Apr 2020 17:43:21
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH] i2c: fix missing pm_runtime_put_sync in i2c_device_probe
Date:   Thu, 30 Apr 2020 17:43:21 +0200
Message-ID: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-30_10:2020-04-30,2020-04-30 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case of the I2C client exposes the flag I2C_CLIENT_HOST_NOTIFY,
pm_runtime_get_sync is called in order to always keep active the
adapter. However later on, pm_runtime_put_sync is never called
within the function in case of an error. This commit add this
error handling.

Fixes: 72bfcee11cf8 ("i2c: Prevent runtime suspend of adapter when Host Notify is required")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 139aea351ffb..2e4560671183 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -338,8 +338,10 @@ static int i2c_device_probe(struct device *dev)
 		} else if (ACPI_COMPANION(dev)) {
 			irq = i2c_acpi_get_irq(client);
 		}
-		if (irq == -EPROBE_DEFER)
-			return irq;
+		if (irq == -EPROBE_DEFER) {
+			status = irq;
+			goto put_sync_adapter;
+		}
 
 		if (irq < 0)
 			irq = 0;
@@ -353,15 +355,19 @@ static int i2c_device_probe(struct device *dev)
 	 */
 	if (!driver->id_table &&
 	    !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
-	    !i2c_of_match_device(dev->driver->of_match_table, client))
-		return -ENODEV;
+	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
+		status = -ENODEV;
+		goto put_sync_adapter;
+	}
 
 	if (client->flags & I2C_CLIENT_WAKE) {
 		int wakeirq;
 
 		wakeirq = of_irq_get_byname(dev->of_node, "wakeup");
-		if (wakeirq == -EPROBE_DEFER)
-			return wakeirq;
+		if (wakeirq == -EPROBE_DEFER) {
+			status = wakeirq;
+			goto put_sync_adapter;
+		}
 
 		device_init_wakeup(&client->dev, true);
 
@@ -408,6 +414,10 @@ static int i2c_device_probe(struct device *dev)
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
+put_sync_adapter:
+	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
+		pm_runtime_put_sync(&client->adapter->dev);
+
 	return status;
 }
 
-- 
2.17.1

