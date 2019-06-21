Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231EE4E574
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfFUKIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:08:37 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:51158 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726218AbfFUKIh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:08:37 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5LA3vgs008660;
        Fri, 21 Jun 2019 05:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=8Wq63RwT0blreLIdF8TfbK/0UxW1qpD8JdYoP8le1Ts=;
 b=USRpQ+OwEAwgqy+/6zPcMRT98741GCovng+bp/JuqNdH6ZDkeAW/HxKwWGCeMspWsp5Z
 WDUTGVYsDd2Yyll5vpB+YSPr4dFDxNUbrebgG+/Zqw5agl6w3LB+ieGtQwE4vTYz4thb
 vWOi7pU/V3PUmc3rLLO3n31UcIIf3Ge9dL7PhyAuk/yjYQX0TPAmYgT9P0uM6dH5xhnm
 VBloodQxh7OIhZnZG4JAvufV5j0OGFfkOjx7EsfcEd0WjR5YmOj6Ar01zGQ8cVq4Jm9+
 Jv5VDbx7bC5+M2gm6dY7zR5dyPcO5m7XxAe0OIhc49zduIxOS/wtzm/KhyBRjEVzcqEW JQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gm6v6-1;
        Fri, 21 Jun 2019 05:08:18 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id C3B5D605A6A0;
        Fri, 21 Jun 2019 05:08:15 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Jun
 2019 11:08:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 21 Jun 2019 11:08:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 257F72A1;
        Fri, 21 Jun 2019 11:08:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v6 1/7] i2c: core: Allow whole core to use i2c_dev_irq_from_resources
Date:   Fri, 21 Jun 2019 11:08:09 +0100
Message-ID: <20190621100815.12417-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=669 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210085
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the static from i2c_dev_irq_from _resources so that other parts
of the core code can use this helper function.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v5.

Thanks,
Charles

 drivers/i2c/i2c-core-base.c | 4 ++--
 drivers/i2c/i2c-core.h      | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2569e97f9bf35..8a303246d534b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -679,8 +679,8 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
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
index 851c11b4c0f3a..2a3b28bf826b1 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -19,6 +19,8 @@ extern struct list_head	__i2c_board_list;
 extern int		__i2c_first_dynamic_bus_num;
 
 int i2c_check_7bit_addr_validity_strict(unsigned short addr);
+int i2c_dev_irq_from_resources(const struct resource *resources,
+			       unsigned int num_resources);
 
 /*
  * We only allow atomic transfers for very late communication, e.g. to send
-- 
2.11.0

