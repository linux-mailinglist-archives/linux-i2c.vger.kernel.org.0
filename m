Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5474625380
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 17:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfEUPHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 11:07:18 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:34890 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728316AbfEUPHS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 11:07:18 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4LExnXP029737;
        Tue, 21 May 2019 10:05:04 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2sjefmv1d9-1;
        Tue, 21 May 2019 10:05:04 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id D1C7A611C8D4;
        Tue, 21 May 2019 10:05:03 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 21 May
 2019 16:05:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 21 May 2019 16:05:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B6A2845;
        Tue, 21 May 2019 16:05:02 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 4/5] i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
Date:   Tue, 21 May 2019 16:05:01 +0100
Message-ID: <20190521150502.27305-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190521150502.27305-1-ckeepax@opensource.cirrus.com>
References: <20190521150502.27305-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=872 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905210094
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It makes sense to contain all the ACPI IRQ handling in a single helper
function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Note that this one is somewhat interesting, it seems the search
through the resource list is done against the companion device
of the adapter but the GPIO search is done against the companion
device of the client. It feels to me like these really should
be done on the same device, and certainly this is what SPI
does (both against the equivalent of the adapter). Perhaps
someone with more ACPI knowledge than myself could comment?

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 3 +++
 drivers/i2c/i2c-core-base.c | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index e332760bf9ebc..0c882d956e9a4 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -164,6 +164,9 @@ int i2c_acpi_get_irq(struct i2c_client *client, int *irq)
 
 	acpi_dev_free_resource_list(&resource_list);
 
+	if (*irq < 0)
+		*irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
+
 	return 0;
 }
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c1afa17a76bfc..f958b50c78c04 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -336,10 +336,6 @@ static int i2c_device_probe(struct device *dev)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
 			i2c_acpi_get_irq(client, &irq);
-
-			if (irq == -ENOENT)
-				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev),
-							    0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
-- 
2.11.0

