Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A673922F43
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 10:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731458AbfETItt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 04:49:49 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:44194 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731334AbfETIts (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 04:49:48 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4K8i3Lt030391;
        Mon, 20 May 2019 03:49:37 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sjefmt3ej-1;
        Mon, 20 May 2019 03:49:37 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 35EC6611C8B9;
        Mon, 20 May 2019 03:49:37 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 20 May
 2019 09:49:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 20 May 2019 09:49:36 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F90F2DA;
        Mon, 20 May 2019 09:49:36 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.tissoires@redhat.com>,
        <jbroadus@gmail.com>, <patches@opensource.cirrus.com>
Subject: [PATCH 1/5] i2c: acpi: Factor out getting the IRQ from ACPI
Date:   Mon, 20 May 2019 09:49:32 +0100
Message-ID: <20190520084936.10590-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
References: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=738 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905200064
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for future refactoring factor out the fetch of the IRQ
into its own helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/i2c/i2c-core-acpi.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 2728006920888..c3ac3ea184317 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -137,13 +137,35 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 	return 0;
 }
 
+static int i2c_acpi_get_irq(struct acpi_device *adev, int *irq)
+{
+	struct list_head resource_list;
+	struct resource_entry *entry;
+	int ret;
+
+	INIT_LIST_HEAD(&resource_list);
+
+	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
+	if (ret < 0)
+		return -EINVAL;
+
+	resource_list_for_each_entry(entry, &resource_list) {
+		if (resource_type(entry->res) == IORESOURCE_IRQ) {
+			*irq = entry->res->start;
+			break;
+		}
+	}
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	return 0;
+}
+
 static int i2c_acpi_get_info(struct acpi_device *adev,
 			     struct i2c_board_info *info,
 			     struct i2c_adapter *adapter,
 			     acpi_handle *adapter_handle)
 {
-	struct list_head resource_list;
-	struct resource_entry *entry;
 	struct i2c_acpi_lookup lookup;
 	int ret;
 
@@ -175,19 +197,7 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 		*adapter_handle = lookup.adapter_handle;
 
 	/* Then fill IRQ number if any */
-	INIT_LIST_HEAD(&resource_list);
-	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
-	if (ret < 0)
-		return -EINVAL;
-
-	resource_list_for_each_entry(entry, &resource_list) {
-		if (resource_type(entry->res) == IORESOURCE_IRQ) {
-			info->irq = entry->res->start;
-			break;
-		}
-	}
-
-	acpi_dev_free_resource_list(&resource_list);
+	i2c_acpi_get_irq(adev, &info->irq);
 
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
-- 
2.11.0

