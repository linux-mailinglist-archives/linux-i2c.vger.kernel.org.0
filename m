Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23E322F4A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 10:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731416AbfETItr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 04:49:47 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:53410 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731340AbfETItq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 04:49:46 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4K8i6Uw008060;
        Mon, 20 May 2019 03:49:38 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2sjff1t49g-1;
        Mon, 20 May 2019 03:49:38 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail3.cirrus.com (Postfix) with ESMTP id 48045614E635;
        Mon, 20 May 2019 03:50:16 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 20 May
 2019 09:49:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 20 May 2019 09:49:36 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7DC6545;
        Mon, 20 May 2019 09:49:36 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.tissoires@redhat.com>,
        <jbroadus@gmail.com>, <patches@opensource.cirrus.com>
Subject: [PATCH 2/5] i2c: acpi: Use available IRQ helper functions
Date:   Mon, 20 May 2019 09:49:33 +0100
Message-ID: <20190520084936.10590-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
References: <20190520084936.10590-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=736 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905200064
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the available IRQ helper functions, most of the functions have
additional helpful side affects like configuring the trigger type of the
IRQ.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/i2c/i2c-core-acpi.c | 23 ++++++++++++++---------
 drivers/i2c/i2c-core-base.c |  4 ++--
 drivers/i2c/i2c-core.h      |  2 ++
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index c3ac3ea184317..764cd10420a74 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -137,25 +137,30 @@ static int i2c_acpi_do_lookup(struct acpi_device *adev,
 	return 0;
 }
 
+static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
+{
+	int *irq = data;
+	struct resource r;
+
+	if (*irq < 0 && acpi_dev_resource_interrupt(ares, 0, &r))
+		*irq = i2c_dev_irq_from_resources(&r, 1);
+
+	return 1; /* No need to add resource to the list */
+}
+
 static int i2c_acpi_get_irq(struct acpi_device *adev, int *irq)
 {
 	struct list_head resource_list;
-	struct resource_entry *entry;
 	int ret;
 
 	INIT_LIST_HEAD(&resource_list);
+	*irq = -ENOENT;
 
-	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     i2c_acpi_add_resource, &irq);
 	if (ret < 0)
 		return -EINVAL;
 
-	resource_list_for_each_entry(entry, &resource_list) {
-		if (resource_type(entry->res) == IORESOURCE_IRQ) {
-			*irq = entry->res->start;
-			break;
-		}
-	}
-
 	acpi_dev_free_resource_list(&resource_list);
 
 	return 0;
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d389d4fb0623a..84bf11b25a120 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -687,8 +687,8 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
 		     i2c_encode_flags_to_addr(client));
 }
 
-static int i2c_dev_irq_from_resources(const struct resource *resources,
-				      unsigned int num_resources)
+int i2c_dev_irq_from_resources(const struct resource *resources,
+			       unsigned int num_resources)
 {
 	struct irq_data *irqd;
 	int i;
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index c88cfef813431..8f3a08dc73a25 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -28,6 +28,8 @@ extern struct list_head	__i2c_board_list;
 extern int		__i2c_first_dynamic_bus_num;
 
 int i2c_check_7bit_addr_validity_strict(unsigned short addr);
+int i2c_dev_irq_from_resources(const struct resource *resources,
+			       unsigned int num_resources);
 
 /*
  * We only allow atomic transfers for very late communication, e.g. to send
-- 
2.11.0

