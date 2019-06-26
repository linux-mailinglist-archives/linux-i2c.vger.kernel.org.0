Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E32956D0B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 17:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfFZPDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 11:03:30 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:49138 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726029AbfFZPD3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 11:03:29 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QExT9f031832;
        Wed, 26 Jun 2019 10:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=WDeL3zXQ72/70Vg444pCa9RqPYZq07/4JCE0/ZUZX9g=;
 b=cP985+BIBKyotSpP9zE3bgfrVqJu0MtOITPjdIT5CzzS6m/f615rr4DZlO3cxJCYM+Qh
 7O+Sow9pBQAf4tAIaD3fxAljz5cPrRM0ztSyEuhT2nZpCc5X8QnxFkT1tnJloydCZp0D
 cdYtL/E+X8M3dEjY5kR/uEd2PwXHSJmWvLo4bIGpVq5v9i+31y1yUcHPEVbJvqpJCTCv
 6udyM8habxs9pmZZapS4RbOUrT01uRgQkM1IKxecY9l3aMlDIETKVv3jRvKIYAnRp3TN
 NWH7GFJw/6V71ZjNJw/RNHTQcfFvlc1hNGcPlVFT/SveuNEg9JA05I5gs5vog/rdX8YL tw== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt8b76-1;
        Wed, 26 Jun 2019 10:03:03 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail3.cirrus.com (Postfix) with ESMTP id D88B66159F9B;
        Wed, 26 Jun 2019 10:03:50 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 16:03:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 16:03:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 268F345;
        Wed, 26 Jun 2019 16:03:02 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v7 2/6] i2c: acpi: Use available IRQ helper functions
Date:   Wed, 26 Jun 2019 16:02:58 +0100
Message-ID: <20190626150302.22703-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
References: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=970 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260177
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the available IRQ helper functions, most of the functions have
additional helpful side affects like configuring the trigger type of the
IRQ.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v6.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index f1d648962b223..3951e352317ff 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -133,13 +133,24 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
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
+	/* No need to add resource to the list, free list if this changes */
+	return 1;
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
 	int ret;
 
@@ -172,19 +183,11 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 
 	/* Then fill IRQ number if any */
 	INIT_LIST_HEAD(&resource_list);
-	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     i2c_acpi_add_resource, &info->irq);
 	if (ret < 0)
 		return -EINVAL;
 
-	resource_list_for_each_entry(entry, &resource_list) {
-		if (resource_type(entry->res) == IORESOURCE_IRQ) {
-			info->irq = entry->res->start;
-			break;
-		}
-	}
-
-	acpi_dev_free_resource_list(&resource_list);
-
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
 
-- 
2.11.0

