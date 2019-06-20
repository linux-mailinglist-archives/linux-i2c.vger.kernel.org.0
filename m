Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4AF4CEEB
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 15:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfFTNfg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 09:35:36 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:60946 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726562AbfFTNfg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 09:35:36 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KDY8AC003198;
        Thu, 20 Jun 2019 08:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=OFPQ0yyFVd3+XyUYI3JpO5oIMg3yNIxvPAKsTDnuDw8=;
 b=Z2VR2ykI8R6o5t5cwvYVdW64c1I91Olnhl7ue/k2cP3R01d86YJWfB+119kT6zAlu5k6
 q4xhc6Wso8URGDFHyrQ+27rYMOSpBU2Cxgc11fBRaCns3knHQPGo6HAAAiS+66TMwicx
 /t2deWrFqJ4BzieTdrW3UiL25roxrxi/KY1SqUA7ZgOh/OnPAISzcXRWbMLJfY8auL0r
 bE4ZawJ9/6GcD4xm9vGbv9mlwLvQ8SEIluAcaB5hB/Hl1oiJU1wIN+X/OlXGHxmuJcoP
 9+CJkXgXgH20LK7QbET1emeVXn1MYeLVaNZ8lMsOSmmWoe77RekJ2v5T6yJ7UxZ3jpKs 8w== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2t780cthh0-1;
        Thu, 20 Jun 2019 08:34:21 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 8D642611C8CB;
        Thu, 20 Jun 2019 08:34:21 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 14:34:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 14:34:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9B65F2DD;
        Thu, 20 Jun 2019 14:34:20 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v5 6/7] i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
Date:   Thu, 20 Jun 2019 14:34:19 +0100
Message-ID: <20190620133420.4632-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=897 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200102
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It makes sense to contain all the ACPI IRQ handling in a single helper
function.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v4.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 3 +++
 drivers/i2c/i2c-core-base.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index f752879772f64..e21e31d661ba7 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -167,6 +167,9 @@ int i2c_acpi_get_irq(struct acpi_device *adev)
 
 	acpi_dev_free_resource_list(&resource_list);
 
+	if (irq == -ENOENT)
+		irq = acpi_dev_gpio_irq_get(adev, 0);
+
 	return irq;
 }
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 060d1a3a7ea4c..95a0380286c1c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -328,9 +328,6 @@ static int i2c_device_probe(struct device *dev)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
 			irq = i2c_acpi_get_irq(ACPI_COMPANION(dev));
-
-			if (irq == -ENOENT)
-				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
-- 
2.11.0

