Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272C0261F58
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731088AbgIHUCM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:02:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51112 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730993AbgIHUCK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 16:02:10 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 088K1gjJ130525;
        Tue, 8 Sep 2020 16:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RCWfza78E0GJe4XRsge2lB3xIYQ/dfHU4o560gh/5Fc=;
 b=AZYAF+r/zzFm1JuUabkiYrUhnpR0giqWm8smqe5EWvjkxFhJYCAUDTgpdT34cfcG/I6k
 xIUmAWyPc0ah8VLYHCjIE5lVPZaS1dQxi5atjbWm3gNYoQBY4Vq9zMwtAbkXeOJjMxmi
 oDH+zIAlLJo4RVAzmSwVVCKqCI4OdcoNerhQHcrSdRGxt2GziJbCi20FhSNIrxxgiHLW
 UpP5Q634NWO4Ak0Q+5gl39fhhq8IWKV2NmNX8H2oBYPnUGFWqE7PzUm3P6O9oHOF2Iq8
 Uf4gNx7ZGV9ID0Z6hJvkKkJlg0hulQQagdLPjzt7K3VH413AvHsThfNQJ+dkYcvN0p2v Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33ef12b65j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:55 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088K1mrW131001;
        Tue, 8 Sep 2020 16:01:48 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com with ESMTP id 33ef12b5tc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 16:01:47 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088JvoAh008549;
        Tue, 8 Sep 2020 20:01:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma01dal.us.ibm.com with ESMTP id 33d46mk596-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Sep 2020 20:01:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 088K15Vc43123132
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 8 Sep 2020 20:01:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6C7156A04D;
        Tue,  8 Sep 2020 20:01:05 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B45E96A047;
        Tue,  8 Sep 2020 20:01:04 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.24.203])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  8 Sep 2020 20:01:04 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v2 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Date:   Tue,  8 Sep 2020 15:00:59 -0500
Message-Id: <20200908200101.64974-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908200101.64974-1-eajames@linux.ibm.com>
References: <20200908200101.64974-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-08_09:2020-09-08,2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=905
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=1 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009080179
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mask the IRQ status to only the bits that the driver checks. This
prevents excessive driver warnings when operating in slave mode
when additional bits are set that the driver doesn't handle.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 31268074c422..2a388911038a 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -69,6 +69,7 @@
  * These share bit definitions, so use the same values for the enable &
  * status bits.
  */
+#define ASPEED_I2CD_INTR_ALL				0xf000ffff
 #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
 #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
 #define ASPEED_I2CD_INTR_SLAVE_MATCH			BIT(7)
@@ -604,6 +605,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
 	       bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	irq_received &= ASPEED_I2CD_INTR_ALL;
 	irq_remaining = irq_received;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-- 
2.26.2

