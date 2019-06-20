Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBC34CEF5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 15:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731834AbfFTNfs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 09:35:48 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:61850 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726492AbfFTNfr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 09:35:47 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KDYLFx022021;
        Thu, 20 Jun 2019 08:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=RWVcDEE8wf/P9fjlKPZCMewbUIuAQoCO+5cEqHpkMV4=;
 b=kVns0sxT4xFZuaSHHwSorUZbYlMTLNu12z7KHjHSO24SRKsd48ofMObOExEy6N98Huq3
 LjeAq4zYqoZMHBTT2lDnEAQ3bdWEWDsPEFIQodn2uXQbS7+BtdHXEGyXZkz/sP7yjo+T
 5ycxcfsXjE3/0Xarvz+VIHhtzG5Qt6xb+a++qR+emhWJAhyHMXrQv0qSWLhuh1aKu585
 mOAq5pqolYTp/uQn3te6BV3QIyTSZpV2gGWFiIbAWd4r33M3ICeMRIggN7ZlZeKh+Bpi
 Bwi846CrpL/23aq/Bes1iHmLWiMCRVNuogY7RyvVGGAk7HJvh7zDlqWklWojdYFPY00a 0A== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gjqhw-1;
        Thu, 20 Jun 2019 08:34:22 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id 11E17611C8C7;
        Thu, 20 Jun 2019 08:34:22 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 14:34:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 14:34:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7AD0D45;
        Thu, 20 Jun 2019 14:34:20 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v5 4/7] i2c: core: Make i2c_acpi_get_irq available to the rest of the I2C core
Date:   Thu, 20 Jun 2019 14:34:17 +0100
Message-ID: <20190620133420.4632-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=949 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200102
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In preparation for more refactoring make i2c_acpi_get_irq available
outside i2c-core-acpi.c.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v4:
 - Leave i2c_acpi_get_irq accepting an acpi_device, this should
   avoid the NULL pointer issue we had with i2c_acpi_find_client_by_adev

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 10 +++++++++-
 drivers/i2c/i2c-core.h      |  9 +++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 7d4d66ba752d4..0ddfcca6091e1 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -144,7 +144,15 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
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
+int i2c_acpi_get_irq(struct acpi_device *adev)
 {
 	struct list_head resource_list;
 	int irq = -ENOENT;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 2a3b28bf826b1..4fbe0a0bcc4c4 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -58,11 +58,15 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 	return 0;
 }
 
+struct acpi_device;
+
 #ifdef CONFIG_ACPI
 const struct acpi_device_id *
 i2c_acpi_match_device(const struct acpi_device_id *matches,
 		      struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
+
+int i2c_acpi_get_irq(struct acpi_device *adev);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
 static inline const struct acpi_device_id *
@@ -71,6 +75,11 @@ i2c_acpi_match_device(const struct acpi_device_id *matches,
 {
 	return NULL;
 }
+
+static inline int i2c_acpi_get_irq(struct acpi_device *adev)
+{
+	return 0;
+}
 #endif /* CONFIG_ACPI */
 extern struct notifier_block i2c_acpi_notifier;
 
-- 
2.11.0

