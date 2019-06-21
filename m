Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881194E57D
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfFUKIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:08:48 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:37092 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726620AbfFUKIs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:08:48 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5LA3kSr032314;
        Fri, 21 Jun 2019 05:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=FGdKuH0EgrNIwtAmIG3f5mfcO86eNYlY2sk+4u+Uq0o=;
 b=KQ+X0YEhSd9A1s68Xk+27TF4ALYPkTWZEAuTqWQKcZyBOEL62Q8oCLwDiRqZhQjFMZrR
 lBLqpaEDURbzy6Ww5gfEno2++BTzH+D/TCyt76b1gBK5K4+2tz1P+UJfddKEqPN4hsnA
 nF5lNXNAlFdi1s9a9M6j6+Dkwj+yZyX63NVIL6wCwo19rH0LGy30OFSPqnn0QE37cLJ5
 Uo8jOCJ0ZcJ50S3ZbDZtZcT04yGDyVapCN4irN+8CxfxMjP8XL9H+xO1mhgkXg1OJEUO
 FHeKk5tbGGyGBF77I3vFnwSSaxi0JVW47ufnd34HC30ceUne9m5WNzjCfopcYWQAX1hj XQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780cuxbs-1;
        Fri, 21 Jun 2019 05:08:17 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id D110E605A6AF;
        Fri, 21 Jun 2019 05:08:16 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Jun
 2019 11:08:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 21 Jun 2019 11:08:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5CC532DD;
        Fri, 21 Jun 2019 11:08:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v6 5/7] i2c: core: Move ACPI IRQ handling to probe time
Date:   Fri, 21 Jun 2019 11:08:13 +0100
Message-ID: <20190621100815.12417-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210085
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

Changes since v5:
 - Pass a struct device rather than acpi_device to i2c_acpi_get_irq.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 7 +------
 drivers/i2c/i2c-core-base.c | 5 ++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 37bf80b35365f..aaca1e216be66 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -155,7 +155,7 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
  */
 int i2c_acpi_get_irq(struct device *dev)
 {
-	struct acpi_device *adev = container_of(dev, struct acpi_device, dev);
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct list_head resource_list;
 	int irq = -ENOENT;
 	int ret;
@@ -207,11 +207,6 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 	if (adapter_handle)
 		*adapter_handle = lookup.adapter_handle;
 
-	/* Then fill IRQ number if any */
-	info->irq = i2c_acpi_get_irq(&adev->dev);
-	if (info->irq < 0)
-		return info->irq;
-
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8a303246d534b..34de732598533 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -327,7 +327,10 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
+			irq = i2c_acpi_get_irq(dev);
+
+			if (irq == -ENOENT)
+				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
-- 
2.11.0

