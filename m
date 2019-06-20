Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDAC4CEEF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 15:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfFTNfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 09:35:45 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:53670 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726492AbfFTNfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 09:35:44 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KDYFFv022016;
        Thu, 20 Jun 2019 08:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=ImClaZoQgkbKlWnfxIwNwB5Kngl/8JM/wQS0/6LfNxw=;
 b=UZ5tHp6n+eNSCQvqF+H2mQ3gwmo378RpH5sWHxSM9FI7ZW4qAFsRNPovhmkjqfIM1say
 z46o7pv34kwW5WTk417UpSpMn5oaJO2BcoudvmE2V7ZH76g0FNHYp+7l1jrNggUfF668
 mr4aoIgYDzq/v/i36MpukzUAA3nHvx0hM39MBDsZmPiPWoqDZqxrT0Z0guF3taq45BSl
 Egiq49jZKyZ3pizTKBsadsBwkC3z2PQNWdjTH8dIXqvsQfuNElzUD0t3L2lKfhFG1OFX
 CQw8B0dlXzd7PVxvBdDEWqeHvVYUrGxKVOw7JkadtNEQl/VOC7glLl8mKmqVUIuCKi5k GQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gjqhu-1;
        Thu, 20 Jun 2019 08:34:21 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 35975611C8C8;
        Thu, 20 Jun 2019 08:34:21 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 14:34:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 14:34:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8C7B52DB;
        Thu, 20 Jun 2019 14:34:20 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v5 5/7] i2c: core: Move ACPI IRQ handling to probe time
Date:   Thu, 20 Jun 2019 14:34:18 +0100
Message-ID: <20190620133420.4632-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200102
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Bring the ACPI path in sync with the device tree path and handle all the
IRQ fetching at probe time. This leaves the only IRQ handling at device
registration time being that which is passed directly through the board
info as either a resource or an actual IRQ number.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v4:
 - Pass acpi_device to i2c_acpi_get_irq
 - Pass the client acpi_device rather than the adaptor, I think (maybe
   hope is more accurate) this should fix the issue seen by Benjamin.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 5 -----
 drivers/i2c/i2c-core-base.c | 5 ++++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 0ddfcca6091e1..f752879772f64 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -205,11 +205,6 @@ static int i2c_acpi_get_info(struct acpi_device *adev,
 	if (adapter_handle)
 		*adapter_handle = lookup.adapter_handle;
 
-	/* Then fill IRQ number if any */
-	ret = i2c_acpi_get_irq(adev);
-	if (ret > 0)
-		info->irq = ret;
-
 	acpi_set_modalias(adev, dev_name(&adev->dev), info->type,
 			  sizeof(info->type));
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8a303246d534b..060d1a3a7ea4c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -327,7 +327,10 @@ static int i2c_device_probe(struct device *dev)
 			if (irq == -EINVAL || irq == -ENODATA)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
-			irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
+			irq = i2c_acpi_get_irq(ACPI_COMPANION(dev));
+
+			if (irq == -ENOENT)
+				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
-- 
2.11.0

