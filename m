Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72797766C6D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 14:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236421AbjG1MBj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 08:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236427AbjG1MBV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 08:01:21 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847163C12;
        Fri, 28 Jul 2023 05:01:00 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SA4nTq029356;
        Fri, 28 Jul 2023 05:00:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=TD7Q9y/ur60jTDkCWNxdc8OlpW91X2hwEjYekz/8vps=;
 b=eN4OFd+BPK4uaWSbW3jA+il4yhBTkxD03QWji8lK64rlLjr/SLR0Tpzc8ug9rkVvGKS7
 r8HRs8EehaUGeaWvP/adddTdPyuszFbQwFP7A+fuAwLSiJ+HyJFTgSifmU6nor2n5ove
 id10e68kdOYkzx1RBukD6HUtzXkRBTwiDK5NWGSg/8UNwMk+yzs8j+zcMumOJD5t6T6i
 7I5ChzQj8YsjGFUS8/BxamZffRLXkVj9/+I0MiS995nAhFUVnKNQ9kNuO6x15kiBYPsx
 JRYgUsbd8vrNhjKaUURntXXA2LGYyQK4W2WnaxcCSpqGzpaJLaoXM5CVL4SzSV9xdhRt Dw== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3s4bd3gam0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 05:00:57 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 28 Jul
 2023 05:00:56 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Fri, 28 Jul 2023 05:00:56 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 2F5163F705A;
        Fri, 28 Jul 2023 05:00:56 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andi.shyti@kernel.org>, <rric@kernel.org>
CC:     <cchavva@marvell.com>, <sgarapati@marvell.com>,
        <jannadurai@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v2 4/4] i2c: thunderx: Adding ioclk support
Date:   Fri, 28 Jul 2023 05:00:04 -0700
Message-ID: <20230728120004.19680-5-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230728120004.19680-1-pmalgujar@marvell.com>
References: <20230728120004.19680-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5l2EQ_vc4dZdgZp5j1c815Dez2ikfFZo
X-Proofpoint-ORIG-GUID: 5l2EQ_vc4dZdgZp5j1c815Dez2ikfFZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Adding support to use ioclk as reference clock if sclk not
present to make it SOC agnostic.
In case, it's not defined in dts/acpi table, use 800MHz as
default clock.

Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 3dd5a4d798f99e9b5282360cf9d5840042fc8dcc..0f2a4a677762e832c10046a5702b21f6d13ba7c7 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -27,7 +27,7 @@
 
 #define PCI_DEVICE_ID_THUNDER_TWSI	0xa012
 
-#define SYS_FREQ_DEFAULT		700000000
+#define SYS_FREQ_DEFAULT		800000000
 
 #define TWSI_INT_ENA_W1C		0x1028
 #define TWSI_INT_ENA_W1S		0x1030
@@ -99,7 +99,8 @@ static void thunder_i2c_clock_enable(struct device *dev, struct octeon_i2c *i2c)
 		i2c->sys_freq = clk_get_rate(i2c->clk);
 	} else {
 		/* ACPI */
-		device_property_read_u32(dev, "sclk", &i2c->sys_freq);
+		if (device_property_read_u32(dev, "sclk", &i2c->sys_freq))
+			device_property_read_u32(dev, "ioclk", &i2c->sys_freq);
 	}
 
 skip:
@@ -181,7 +182,6 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	if (!i2c->twsi_base)
 		return -EINVAL;
 
-	thunder_i2c_clock_enable(dev, i2c);
 	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
 	if (ret)
 		i2c->twsi_freq = I2C_MAX_STANDARD_MODE_FREQ;
@@ -195,12 +195,12 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	ret = devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr, 0,
 			       DRV_NAME, i2c);
 	if (ret)
-		goto error;
+		return ret;
 
 	ret = octeon_i2c_init_lowlevel(i2c);
 	if (ret)
@@ -212,6 +212,9 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	 */
 	if (octeon_i2c_is_otx2(pdev) && IS_LS_FREQ(i2c->twsi_freq))
 		i2c->sys_freq = 100000000;
+	else
+		thunder_i2c_clock_enable(dev, i2c);
+
 	octeon_i2c_set_clock(i2c);
 
 	i2c->adap = thunderx_i2c_ops;
@@ -238,7 +241,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	return 0;
 
 error:
-	thunder_i2c_clock_disable(dev, i2c->clk);
+	if (!IS_LS_FREQ(i2c->twsi_freq))
+		thunder_i2c_clock_disable(dev, i2c->clk);
 	return ret;
 }
 
-- 
2.17.1

