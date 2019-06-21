Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C44E58E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 12:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfFUKIl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 06:08:41 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:15976 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726218AbfFUKIl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jun 2019 06:08:41 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5LA4s3o009159;
        Fri, 21 Jun 2019 05:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=a5umfxpQ6L+20Vsyn6NyItos8JeMJ4pwMns4M4xNiTo=;
 b=fQOMtgXwakjFd2Uo6SvRP8nw0WKea66Y17JTgGQYwmL1KrCMLpBzAd6W1JeTOI3L4eBC
 U7/RbbL/iO1mZ3BmFBwmcJkAHg/yxY2Gp92mRa91x/hDFZZ7LlVQl2W2j+182O3bSZ9N
 20JhR3lCtE3kpy7/GArE/p2iJT7TtreV0TQtWeddcxqwVRCSFT905okq0OawqHEhrCXM
 sYGYZO3ui8YBsvRoIyfR0LkYh4qMuDKz0xj6Af4As81D3im1b6Jn2j8fVHroRKVLqXOg
 tLipWJH8q699vGGhSxWR9aCQLRtBO8PkUmI+PvqE3aM28B4KcmkNv/kXsr1rs552LSYq Uw== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gm6v8-1;
        Fri, 21 Jun 2019 05:08:17 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id 39DF0611C8BC;
        Fri, 21 Jun 2019 05:08:16 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 21 Jun
 2019 11:08:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 21 Jun 2019 11:08:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B11144;
        Fri, 21 Jun 2019 11:08:15 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v6 6/7] i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
Date:   Fri, 21 Jun 2019 11:08:14 +0100
Message-ID: <20190621100815.12417-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=827 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210085
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
 drivers/i2c/i2c-core-acpi.c | 3 +++
 drivers/i2c/i2c-core-base.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index aaca1e216be66..042c1cb148bc6 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -169,6 +169,9 @@ int i2c_acpi_get_irq(struct device *dev)
 
 	acpi_dev_free_resource_list(&resource_list);
 
+	if (irq == -ENOENT)
+		irq = acpi_dev_gpio_irq_get(adev, 0);
+
 	return irq;
 }
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 34de732598533..87a2ad8f41a76 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -328,9 +328,6 @@ static int i2c_device_probe(struct device *dev)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
 			irq = i2c_acpi_get_irq(dev);
-
-			if (irq == -ENOENT)
-				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
-- 
2.11.0

