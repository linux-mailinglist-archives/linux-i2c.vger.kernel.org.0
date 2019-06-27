Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744DB57F3B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 11:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfF0JY3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 05:24:29 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:22886 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726295AbfF0JY2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 05:24:28 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5R9JwY2012689;
        Thu, 27 Jun 2019 04:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=KOUZPgn0yMZDEu4MNw3Htd+h1ICsCHH3YUisAZovHyg=;
 b=dvlz8uZzzpZu0HnGPOMs4Gosei0wN4qVpQgKbD59pFpXUFpnMgXIajxwwDmZckHA4oHd
 hPYfeFKuPZOcBgxpvwBQTwldRgtjRgDau51x2nmyGioWwx8y4/MRUrkCYmvxMNMMKTrF
 klW1khdLSc3XXjEmoKVxGRAMUtomIAQAdSZ6jtwNPTlcPxpPOcIuP4YjT1jWo07fegup
 GeauqFXZFzSOB39JrnpzJ11Gypf/zq+x/KFGbzuIcKgNIESvkGxeIeHXm7I8IISxnppA
 i/ZQ04N/XSEBHz3P1ucfbeET0+VBIaIAruKi1dC7L7bEJp+n+oJa39hnVdz+V1CQ2kfl Kw== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2gr53-1;
        Thu, 27 Jun 2019 04:24:13 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail4.cirrus.com (Postfix) with ESMTP id B1F0C611C8B2;
        Thu, 27 Jun 2019 04:24:14 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 10:24:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 27 Jun 2019 10:24:12 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 17B5B45;
        Thu, 27 Jun 2019 10:24:12 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v8 4/6] i2c: core: Move ACPI IRQ handling to probe time
Date:   Thu, 27 Jun 2019 10:24:09 +0100
Message-ID: <20190627092411.26123-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190627092411.26123-1-ckeepax@opensource.cirrus.com>
References: <20190627092411.26123-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270109
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Bring the ACPI path in sync with the device tree path and handle all the
IRQ fetching at probe time. This leaves the only IRQ handling at device
registration time being that which is passed directly through the board
info as either a resource or an actual IRQ number.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v7.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 16 ++++++++++------
 drivers/i2c/i2c-core-base.c |  5 ++++-
 drivers/i2c/i2c-core.h      |  7 +++++++
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 3eb65f113c13b..eaf45cf8e5b91 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -144,8 +144,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 	return 1; /* No need to add resource to the list */
 }
 
-static int i2c_acpi_get_irq(struct acpi_device *adev)
+/**
+ * i2c_acpi_get_irq - get device IRQ number from ACPI
+ * @client: Pointer to the I2C client device
+ *
+ * Find the IRQ number used by a specific client device.
+ *
+ * Return: The IRQ number or an error code.
+ */
+int i2c_acpi_get_irq(struct i2c_client *client)
 {
+	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct list_head resource_list;
 	int irq = -ENOENT;
 	int ret;
@@ -197,11 +206,6 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 	if (adapter_handle)
 		*adapter_handle = lookup.adapter_handle;
 
-	/* Then fill IRQ number if any */
-	info->irq = i2c_acpi_get_irq(adev);
-	if (info->irq < 0)
-		return info->irq;
-
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2a0a9cc8b8fbd..c8fa2b825dcef 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -327,7 +327,10 @@ static int i2c_device_probe(struct device *dev)
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
index 2a3b28bf826b1..517d98be68d25 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -63,6 +63,8 @@ const struct acpi_device_id *
 i2c_acpi_match_device(const struct acpi_device_id *matches,
 		      struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
+
+int i2c_acpi_get_irq(struct i2c_client *client);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 static inline const struct acpi_device_id *
@@ -71,6 +73,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
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

