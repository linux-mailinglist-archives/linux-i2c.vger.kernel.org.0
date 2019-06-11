Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E86E3CB95
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 14:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbfFKMb2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 08:31:28 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:50372 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727796AbfFKMb0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 08:31:26 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5BCT7an012215;
        Tue, 11 Jun 2019 07:31:02 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t0ae2v69s-1;
        Tue, 11 Jun 2019 07:31:02 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
        by mail3.cirrus.com (Postfix) with ESMTP id D62B761408E8;
        Tue, 11 Jun 2019 07:31:46 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 11 Jun
 2019 13:31:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 11 Jun 2019 13:31:01 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9017C2A1;
        Tue, 11 Jun 2019 13:31:01 +0100 (BST)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <wsa@the-dreams.de>, <mika.westerberg@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.tissoires@redhat.com>, <jbroadus@gmail.com>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v4 1/7] i2c: core: Allow whole core to use i2c_dev_irq_from_resources
Date:   Tue, 11 Jun 2019 13:30:55 +0100
Message-ID: <20190611123101.25264-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
References: <20190611123101.25264-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=654 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110085
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the static from i2c_dev_irq_from _resources so that other parts
of the core code can use this helper function.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

Thanks,
Charles

 drivers/i2c/i2c-core-base.c | 4 ++--
 drivers/i2c/i2c-core.h      | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9e43508d4567d..67344586de913 100644
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

