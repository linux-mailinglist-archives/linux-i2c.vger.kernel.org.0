Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C322B847
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfE0PUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 11:20:00 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:57502 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726297AbfE0PUA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 May 2019 11:20:00 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4RFJEKg030074;
        Mon, 27 May 2019 10:19:33 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sq24q28p1-1;
        Mon, 27 May 2019 10:19:33 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail4.cirrus.com (Postfix) with ESMTP id 93021611C8AF;
        Mon, 27 May 2019 10:20:24 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 27 May
 2019 16:19:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 27 May 2019 16:19:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91C632DA;
        Mon, 27 May 2019 16:19:32 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 3/6] i2c: acpi: Factor out getting the IRQ from ACPI
Date:   Mon, 27 May 2019 16:19:29 +0100
Message-ID: <20190527151932.14310-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
References: <20190527151932.14310-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=946 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905270108
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for future refactoring factor out the fetch of the IRQ
into its own helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update function to just return the IRQ rather than use a pointer
   argument.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 4b0387d040698..f28d702dc6a89 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -148,14 +148,30 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 	return 1; /* No need to add resource to the list */
 }
 
+static int i2c_acpi_get_irq(struct acpi_device *adev)
+{
+	struct list_head resource_list;
+	int irq = -ENOENT;
+	int ret;
+
+	INIT_LIST_HEAD(&resource_list);
+
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     i2c_acpi_add_resource, &irq);
+	if (ret < 0)
+		return -EINVAL;
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	return irq;
+}
+
 static int i2c_acpi_get_info(struct acpi_device *adev,
 			     struct i2c_board_info *info,
 			     struct i2c_adapter *adapter,
 			     acpi_handle *adapter_handle)
 {
-	struct list_head resource_list;
 	struct i2c_acpi_lookup lookup;
-	int irq = -ENOENT;
 	int ret;
 
 	memset(&lookup, 0, sizeof(lookup));
@@ -186,16 +202,9 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 		*adapter_handle = lookup.adapter_handle;
 
 	/* Then fill IRQ number if any */
-	INIT_LIST_HEAD(&resource_list);
-	ret = acpi_dev_get_resources(adev, &resource_list,
-				     i2c_acpi_add_resource, &irq);
-	if (ret < 0)
-		return -EINVAL;
-
-	if (irq >= 0)
-		info->irq = irq;
-
-	acpi_dev_free_resource_list(&resource_list);
+	ret = i2c_acpi_get_irq(adev);
+	if (ret >= 0)
+		info->irq = ret;
 
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
-- 
2.11.0

