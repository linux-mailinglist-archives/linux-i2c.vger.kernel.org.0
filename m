Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477AC56D1B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 17:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfFZPED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 11:04:03 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:11476 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728191AbfFZPED (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jun 2019 11:04:03 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QExKqq022685;
        Wed, 26 Jun 2019 10:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=ntG1MCXS+tfiByA1X2VF8qfKEYO2bEbFmlc88KNzjuk=;
 b=VzbOT6dhinY1XaYRsUAkXgUNlCDY4gxcuYqBHCqxTQ2OoSDFPpWAT1hNaksGnV1aGr11
 SEpdN64Wh9OVc/8UZ7tBwqi/BieV+DX0Q6MR7XUevEB7sIVjZvX8eKMjz3bsOscCuVrX
 acBnfOyBPujmAiut1bz+MTDYPgJ5Abf/ETTQjsYXAOubA/zQVoOK0UYEiKGhbQAdlu90
 RsrH3Q455RYHgUsc/T4rWUPOe4KwfX1VbJYqzVWHuqO0688siX+G6PoaIiKfHGVmExA9
 4X/VZQnoOmoMgjheIeHJM7nFStA/h9Djr0+Qzwbsp9nyL0TFUXNFtbXFijRw5OPj6otg 9Q== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t9hr2fcrh-1;
        Wed, 26 Jun 2019 10:03:03 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail4.cirrus.com (Postfix) with ESMTP id AAA3E611C8AF;
        Wed, 26 Jun 2019 10:03:04 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 16:03:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 16:03:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 59BA544;
        Wed, 26 Jun 2019 16:03:02 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v7 6/6] i2c: core: Tidy up handling of init_irq
Date:   Wed, 26 Jun 2019 16:03:02 +0100
Message-ID: <20190626150302.22703-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
References: <20190626150302.22703-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260177
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Only set init_irq during i2c_device_new and only handle client->irq on
the probe/remove paths.

Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v6.

Thanks,
Charles

 drivers/i2c/i2c-core-base.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 1bf7d8748de14..aeb3e0508186b 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -314,6 +314,8 @@ static int i2c_device_probe(struct device *dev)
 
 	driver = to_i2c_driver(dev->driver);
 
+	client->irq = client->init_irq;
+
 	if (!client->irq && !driver->disable_i2c_core_irq_mapping) {
 		int irq = -ENOENT;
 
@@ -424,7 +426,7 @@ static int i2c_device_remove(struct device *dev)
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
 
-	client->irq = client->init_irq;
+	client->irq = 0;
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put(&client->adapter->dev);
 
@@ -741,7 +743,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	if (!client->init_irq)
 		client->init_irq = i2c_dev_irq_from_resources(info->resources,
 							 info->num_resources);
-	client->irq = client->init_irq;
 
 	strlcpy(client->name, info->type, sizeof(client->name));
 
-- 
2.11.0

