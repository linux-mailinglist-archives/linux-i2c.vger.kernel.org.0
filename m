Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCDEB4CEF6
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 15:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732093AbfFTNfu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 09:35:50 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:4096 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732076AbfFTNft (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 09:35:49 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KDY3ck021995;
        Thu, 20 Jun 2019 08:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=bdUqOJXZ7iqsufMswSnxhfnRKUdoFtTGOHQgXjM/RlI=;
 b=SYtPjXkrWaOSadWrn/ietbrID62bwCYUl3pNm/o2TrXUibQ5Y2ZpOJvhoiYB73qDjaVU
 PbQMqOgepRgC1IW2XPdmmPXJRrzkhU2aKeo8zX8XOeWmETrJcCuaNEoJ4oJuMcC7r1jW
 mTX13uNVzZSWPMHtZ2xed4TAJj73lA17paOQ+W9xRKLH9a2UOi/8llwIaap6rXBhLCQK
 UIyVCsTSkbLg1H6ShCjE0sqpZEXLfvq1JGNGr3b2T3J/FT69/CnqF8c35Cg0Z+h73il4
 TgNCiCYm/qDQBgOudk64MGj+KeW8gL98kGQQiBqv0Y2wxed8NbAP3kjN5W99wyuQUqHH Tw== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gjqhv-1;
        Thu, 20 Jun 2019 08:34:22 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id AEECC611C8CD;
        Thu, 20 Jun 2019 08:34:21 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 14:34:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 14:34:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C04744;
        Thu, 20 Jun 2019 14:34:20 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v5 2/7] i2c: acpi: Use available IRQ helper functions
Date:   Thu, 20 Jun 2019 14:34:15 +0100
Message-ID: <20190620133420.4632-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200102
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the available IRQ helper functions, most of the functions have
additional helpful side affects like configuring the trigger type of the
IRQ.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v4.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index f1d648962b223..47d5b1c5ec9e0 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -133,14 +133,25 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 	return 0;
 }
 
+static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
+{
+	int *irq = data;
+	struct resource r;
+
+	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
+		*irq = i2c_dev_irq_from_resources(&r, 1);
+
+	return 1; /* No need to add resource to the list */
+}
+
 static int i2c_acpi_get_info(struct acpi_device *adev,
 			     struct i2c_board_info *info,
 			     struct i2c_adapter *adapter,
 			     acpi_handle *adapter_handle)
 {
 	struct list_head resource_list;
-	struct resource_entry *entry;
 	struct i2c_acpi_lookup lookup;
+	int irq = -ENOENT;
 	int ret;
 
 	memset(&lookup, 0, sizeof(lookup));
@@ -172,16 +183,13 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 
 	/* Then fill IRQ number if any */
 	INIT_LIST_HEAD(&resource_list);
-	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     i2c_acpi_add_resource, &irq);
 	if (ret < 0)
 		return -EINVAL;
 
-	resource_list_for_each_entry(entry, &resource_list) {
-		if (resource_type(entry->res) == IORESOURCE_IRQ) {
-			info->irq = entry->res->start;
-			break;
-		}
-	}
+	if (irq > 0)
+		info->irq = irq;
 
 	acpi_dev_free_resource_list(&resource_list);
 
-- 
2.11.0

