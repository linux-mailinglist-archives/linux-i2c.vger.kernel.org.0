Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F019757F3F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2019 11:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfF0JYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jun 2019 05:24:46 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:21236 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726293AbfF0JY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jun 2019 05:24:29 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5R9JbXT012618;
        Thu, 27 Jun 2019 04:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=xq2cCapP4dgrd+nT+2nqxyaf8X3aLPD+0j8liLfP3vw=;
 b=BJky9re7mCLjC1Kti6t/nAW21DP+3HOPKgIU/8GDXYSh/fd2F+9TUbpjSrxzcPb5pTHM
 2ZQkiFdaxDOJVd4kaJYpZaAsvApxk4LFCTf0I3mt3YfSRIKh5hc/NXm0LccC6uUWMxTE
 uJDrKXqtof2sMKaegoV7IusDMZfnB41x9ZvRDVzV9ll47lqBU4IAzq6jOCa+cyIE5tpZ
 mcn5w/x1wTAUSp1KwrhTMp/nq8Cqf1oJO1IZTqU2CnqnIluWcDucHRqmgMuNUI4Cj06S
 6Pq8k3eVpcJgNGvjlPhmjaAomXjC+PrjfW4/XWh0rp9w2VXNM6DK0Ssk57P56KRJPsWg vg== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2gr55-1;
        Thu, 27 Jun 2019 04:24:13 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id AFBB6611C8A7;
        Thu, 27 Jun 2019 04:24:14 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 27 Jun
 2019 10:24:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 27 Jun 2019 10:24:12 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F6D62A1;
        Thu, 27 Jun 2019 10:24:12 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v8 5/6] i2c: core: Move ACPI gpio IRQ handling into i2c_acpi_get_irq
Date:   Thu, 27 Jun 2019 10:24:10 +0100
Message-ID: <20190627092411.26123-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190627092411.26123-1-ckeepax@opensource.cirrus.com>
References: <20190627092411.26123-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=915 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270109
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It makes sense to contain all the ACPI IRQ handling in a single helper
function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v7.

Thanks,
Charles

 drivers/i2c/i2c-core-acpi.c | 3 +++
 drivers/i2c/i2c-core-base.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index eaf45cf8e5b91..3707823efa850 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -168,6 +168,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
 
 	acpi_dev_free_resource_list(&resource_list);
 
+	if (irq == -ENOENT)
+		irq = acpi_dev_gpio_irq_get(adev, 0);
+
 	return irq;
 }
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c8fa2b825dcef..f0e1d338c7ddf 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -328,9 +328,6 @@ static int i2c_device_probe(struct device *dev)
 				irq = of_irq_get(dev->of_node, 0);
 		} else if (ACPI_COMPANION(dev)) {
 			irq = i2c_acpi_get_irq(client);
-
-			if (irq == -ENOENT)
-				irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
 		}
 		if (irq == -EPROBE_DEFER)
 			return irq;
-- 
2.11.0

