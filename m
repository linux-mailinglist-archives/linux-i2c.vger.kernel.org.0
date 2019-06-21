Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A254E58D
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfFUKIn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:08:43 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:11732 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726498AbfFUKIn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:08:43 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5LA4Qou000349;
        Fri, 21 Jun 2019 05:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=1NgFvVDhvCHqSR/CePJrSFYwI0WzzG6j+CKs/AV+u6Y=;
 b=mXKem9+PZFl4SV/dnAvDtezRzEWZ8qgnlHG2Jai8vONemgHFzoK81SwdBdR/PgIYPWdf
 FtvlNMt/tLysY6X/rUPTiFgmRAAPFr2VLiL/D9NKiNzJGkC3iB3WBwydjshMTwI+ToHc
 0V29oAD+uuHfCPuZl6qO+pQH/T6AIgT82YBsOgfCZUo9S0WvJCcWLLTg4pZnavUNO1i0
 dmbfSgh8ykAxuceJHyXVe8w3QnDZzce+g7QZkeRr9N9nKIf/vQL/LkKPgG55X/H9X0l0
 37/ssyTrzyRosJEGDhX108I2OZdXymCst/Kp+6T0gPVgfeG42lur9F2iPV063rEKEeAz EQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780cuxbr-1;
        Fri, 21 Jun 2019 05:08:16 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 7BA9B605A6BF;
        Fri, 21 Jun 2019 05:08:16 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Jun
 2019 11:08:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 21 Jun 2019 11:08:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C0DE2DB;
        Fri, 21 Jun 2019 11:08:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v6 2/7] i2c: acpi: Use available IRQ helper functions
Date:   Fri, 21 Jun 2019 11:08:10 +0100
Message-ID: <20190621100815.12417-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=993 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210085
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the available IRQ helper functions, most of the functions have
additional helpful side affects like configuring the trigger type of the
IRQ.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v5:
 - Pass info->irq to i2c_acpi_add_resource directly
 - Remove call to acpi_dev_free_resource_list since we never add
   anything to the list.

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

