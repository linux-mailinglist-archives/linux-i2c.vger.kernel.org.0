Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DC024C308
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 18:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgHTQML (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 12:12:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22570 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729649AbgHTQMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Aug 2020 12:12:08 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07KG2grF026030;
        Thu, 20 Aug 2020 12:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hhHY+4mykYZb1ygMIa/2oMUJkpOMkxUsZMIALIU7I+o=;
 b=ozzfgCC6108R0ojyjwma3Rk92ehzyFtLmUbelNgj/qoGRiK5RXtksypmQPs5Ryjt3vMF
 n9TAx2Fmks3UjHj/fCVKKtDjenJEBJvK7R/Kr77EOHUIWCVq66gjrnVjaVL8a/OO+VbQ
 4bUBnffHEqdkteBSYP2gCLACBEOTiCntQvgOzS+DVZ8C3bxPWXP4XR4aytiwvz5idrY/
 XKLsyD5V50IWwbHGtghrLamzDmo6fuZ4O+0JtfmE96BKeG3Ul2QWnDGMOcE8ID5l/WDM
 cV/dyaoZAMGKc+wrvPml1qNMFPWvdb4bhmBolt/qUFVdXqBpTTEL8f1IO3TtpXrgLCcu EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 331ugca6n5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:12:01 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07KG3bbf029910;
        Thu, 20 Aug 2020 12:12:00 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 331ugca6mg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 12:12:00 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KGAhCF019297;
        Thu, 20 Aug 2020 16:11:59 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma04wdc.us.ibm.com with ESMTP id 3304uewek7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 20 Aug 2020 16:11:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07KGBxYm15270516
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Aug 2020 16:11:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EFEBB112062;
        Thu, 20 Aug 2020 16:11:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9FE0B112064;
        Thu, 20 Aug 2020 16:11:57 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.70.74])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 20 Aug 2020 16:11:57 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, eajames@linux.ibm.com
Subject: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Date:   Thu, 20 Aug 2020 11:11:50 -0500
Message-Id: <20200820161152.22751-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200820161152.22751-1-eajames@linux.ibm.com>
References: <20200820161152.22751-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-20_03:2020-08-19,2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=914 mlxscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=1 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200130
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mask the IRQ status to only the bits that the driver checks. This
prevents excessive driver warnings when operating in slave mode
when additional bits are set that the driver doesn't handle.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 31268074c422..abf40f2af8b4 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -604,6 +604,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
 	       bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	irq_received &= 0xf000ffff;
 	irq_remaining = irq_received;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-- 
2.26.2

