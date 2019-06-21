Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 135414E583
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfFUKIu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:08:50 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:65394 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726651AbfFUKIt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:08:49 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5LA4Qov000349;
        Fri, 21 Jun 2019 05:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=oTtNnnbZGJLJy4HFzqLOvJvW0A05UConAokanpdr8uQ=;
 b=iWtGWfyAiGm6VAkMqW/n36ytq3xH3WnGgNq6Ie6gbmTvk7fADVHKjRw/SVzzf33tj/LD
 +nz+l0X3M044EcjSkL0Bt7PA/KUXw1BbeWOie8ydVlV+YvLtb+5mhaIgM39+ZCk7nigU
 jFJzZk/Y0nZRWrY8ALw6vzKziz/MQwERRlXVgtxzmV9a+vJnRedClxsSux0J22b8oScU
 Nh1XfzH8utK463AzlIhJKOip7wAqvnBjCQi3dCtRjC905KMFW5gDSLqaaqtsuEsS87PI
 /MhKvLRQ03etOQQFMjjL6351RSjh3o8W6r5jNOhz86IfJVVqCZC4GqWWgql1QUqhVbWU HA== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780cuxbt-1;
        Fri, 21 Jun 2019 05:08:17 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 324F6605A6BD;
        Fri, 21 Jun 2019 05:08:17 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Jun
 2019 11:08:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 21 Jun 2019 11:08:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4E1722A1;
        Fri, 21 Jun 2019 11:08:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v6 4/7] i2c: core: Make i2c_acpi_get_irq available to the rest of the I2C core
Date:   Fri, 21 Jun 2019 11:08:12 +0100
Message-ID: <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=898 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210085
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for more refactoring make i2c_acpi_get_irq available
outside i2c-core-acpi.c.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v5:
 - Pass a struct device rather than acpi_device to i2c_acpi_get_irq,
   note this is more awkward than I would have liked as I am very
   unconvinced that adev->dev can actually be passed to
   ACPI_COMPANION. If anyone can answer that for sure that would be
   very helpful.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 13 +++++++++++--
 drivers/i2c/i2c-core.h      |  7 +++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c91492eaacd93..37bf80b35365f 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -145,8 +145,17 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 	return 1;
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
+int i2c_acpi_get_irq(struct device *dev)
 {
+	struct acpi_device *adev = container_of(dev, struct acpi_device, dev);
 	struct list_head resource_list;
 	int irq = -ENOENT;
 	int ret;
@@ -199,7 +208,7 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 		*adapter_handle = lookup.adapter_handle;
 
 	/* Then fill IRQ number if any */
-	info->irq = i2c_acpi_get_irq(adev);
+	info->irq = i2c_acpi_get_irq(&adev->dev);
 	if (info->irq < 0)
 		return info->irq;
 
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 2a3b28bf826b1..1735ac17a957a 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -63,6 +63,8 @@ const struct acpi_device_id *
 i2c_acpi_match_device(const struct acpi_device_id *matches,
 		      struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
+
+int i2c_acpi_get_irq(struct device *dev);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 static inline const struct acpi_device_id *
@@ -71,6 +73,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
 {
 	return NULL;
 }
+
+static inline int i2c_acpi_get_irq(struct device *dev)
+{
+	return 0;
+}
 #endif /* CONFIG_ACPI */
 extern struct notifier_block i2c_acpi_notifier;
 
-- 
2.11.0

