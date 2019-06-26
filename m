Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AECC56D19
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 17:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfFZPD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 11:03:58 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:15358 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728191AbfFZPDx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 11:03:53 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QEx8t4022681;
        Wed, 26 Jun 2019 10:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=HhQXOPboJatrAjIjlN0zmSjtyxdx/PPDiOsj7av4iEM=;
 b=TcZJBiTSFyccXMzJOwW709LrWSldNXcBInzW1jJ4znht43wcH+Mqsmy82pp+XaTg/9vB
 6EylvZ3mKr4MpA9Z1suw/WJKk7IZUcIXdTIsL3I6yjIjFd9tH/wHGXw9/RwirmTla9c2
 DGhazbDUjaDJUQl6G0ceVWypS+1zqGuP7BI0TcsNsvgfPtayYFiyQiJ9EwHiKwah+zGD
 N0J3RKQ8F90XYz5fHqdyVKNV4nd3/Nhot5mRm91kqLjkYjsx5amxIGf0tEGw79WbuxpW
 tWMYySc5dtdFT2DZiVO4JG8pD3I4h0Nbfy1uraPX3A6fq8V1w90MQtEEZtU/mpe2N+od Uw== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2fcrk-1;
        Wed, 26 Jun 2019 10:03:03 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id E8AF3611C8AB;
        Wed, 26 Jun 2019 10:03:02 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 16:03:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 16:03:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 377512DD;
        Wed, 26 Jun 2019 16:03:02 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v7 3/6] i2c: acpi: Factor out getting the IRQ from ACPI
Date:   Wed, 26 Jun 2019 16:02:59 +0100
Message-ID: <20190626150302.22703-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
References: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=757 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260177
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for future refactoring factor out the fetch of the IRQ
into its own helper function. Whilst we are at it update the handling
to return the actual error code returned from acpi_dev_get_resources
as well.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v6.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 3951e352317ff..c91492eaacd93 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -145,12 +145,29 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
 	return 1;
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
+		return ret;
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
 	int ret;
 
@@ -182,11 +199,9 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 		*adapter_handle = lookup.adapter_handle;
 
 	/* Then fill IRQ number if any */
-	INIT_LIST_HEAD(&resource_list);
-	ret = acpi_dev_get_resources(adev, &resource_list,
-				     i2c_acpi_add_resource, &info->irq);
-	if (ret < 0)
-		return -EINVAL;
+	info->irq = i2c_acpi_get_irq(adev);
+	if (info->irq < 0)
+		return info->irq;
 
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
-- 
2.11.0

