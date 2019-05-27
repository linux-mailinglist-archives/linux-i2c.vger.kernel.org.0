Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A442B853
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 17:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfE0PUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 11:20:22 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:57498 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726165AbfE0PUA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 11:20:00 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4RFJ8NT030059;
        Mon, 27 May 2019 10:19:33 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sq24q28p3-1;
        Mon, 27 May 2019 10:19:33 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail4.cirrus.com (Postfix) with ESMTP id 9D302611C8B1;
        Mon, 27 May 2019 10:20:24 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 27 May
 2019 16:19:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 27 May 2019 16:19:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A273E2DD;
        Mon, 27 May 2019 16:19:32 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 4/6] i2c: core: Move ACPI IRQ handling to probe time
Date:   Mon, 27 May 2019 16:19:30 +0100
Message-ID: <20190527151932.14310-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
References: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905270108
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Bring the ACPI path in sync with the device tree path and handle all the
IRQ fetching at probe time. This leaves the only IRQ handling at device
registration time being that which is passed directly through the board
info as either a resource or an actual IRQ number.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Kept function call on a single line despite going a couple characters
   over line length.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 8 ++------
 drivers/i2c/i2c-core-base.c | 5 ++++-
 drivers/i2c/i2c-core.h      | 7 +++++++
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index f28d702dc6a89..133fa9fa239f7 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -148,8 +148,9 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 	return 1; /* No need to add resource to the list */
 }
 
-static int i2c_acpi_get_irq(struct acpi_device *adev)
+int i2c_acpi_get_irq(struct i2c_client *client)
 {
+	struct acpi_device *adev = ACPI_COMPANION(&client->adapter->dev);
 	struct list_head resource_list;
 	int irq = -ENOENT;
 	int ret;
@@ -201,11 +202,6 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 	if (adapter_handle)
 		*adapter_handle = lookup.adapter_handle;
 
-	/* Then fill IRQ number if any */
-	ret = i2c_acpi_get_irq(adev);
-	if (ret >= 0)
-		info->irq = ret;
-
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84bf11b25a120..b6b009bfe842b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -335,7 +335,10 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
+			irq = i2c_acpi_get_irq(client);
+
+			if (irq == -ENOENT)
+				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 8f3a08dc73a25..15c1411f35f07 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -72,6 +72,8 @@ const struct acpi_device_id *
 i2c_acpi_match_device(const struct acpi_device_id *matches,
 		      struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
+
+int i2c_acpi_get_irq(struct i2c_client *client);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 static inline const struct acpi_device_id *
@@ -80,6 +82,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
 {
 	return NULL;
 }
+
+static inline int i2c_acpi_get_irq(struct i2c_client *client)
+{
+	return 0;
+}
 #endif /* CONFIG_ACPI */
 extern struct notifier_block i2c_acpi_notifier;
 
-- 
2.11.0

