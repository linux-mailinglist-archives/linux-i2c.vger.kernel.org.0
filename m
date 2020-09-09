Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250E4263773
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 22:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgIIUb4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 16:31:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63504 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728954AbgIIUbR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 16:31:17 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 089K3Axk012169;
        Wed, 9 Sep 2020 16:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uZTwxRGiybMVxcdn181C6LPfRk1d8cI/lPlb4AZOy18=;
 b=jQyZ+YoUUjD8i/ge0gXUaNH010nG1v9T3h3TixhBEMLEgx2rcsybCKodrutghtL0nh/P
 Cu61mx5iP1vAat99fGfi0IXmv8hJIvz3GZ8VS/tui+7m+Lt2B0C5Jf7t4oBI45RfmtZo
 4zqEDiv9YzfF7oNrDGmP59YNsEuK24eOY+0mL1DjvDWpVBO6A7gEUA6I53a1qA1hb4GL
 YY98nXiOQ0Nbq69cnc2Q1b+MWC7l/oabLkThDfn+Lv8XZfhKJX4irqRcdW5gjoOzBtv5
 1l3yfE2/49Q7OhaS0XwaX+5fiXOtqK0FmwMRg4QDpt9+VukoHFvLclJQtxHgk4vlLJVD fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f5nnrsss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:05 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 089K3u2Y014703;
        Wed, 9 Sep 2020 16:31:04 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33f5nnrss9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 16:31:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089KQU2s024423;
        Wed, 9 Sep 2020 20:31:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma02dal.us.ibm.com with ESMTP id 33c2a9jnfu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 20:31:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 089KV2se17760678
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Sep 2020 20:31:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5F02F78064;
        Wed,  9 Sep 2020 20:31:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B0F9178066;
        Wed,  9 Sep 2020 20:31:01 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.76.239])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  9 Sep 2020 20:31:01 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com, joel@jms.id.au,
        andrew@aj.id.au, benh@kernel.crashing.org,
        brendanhiggins@google.com, wsa@kernel.org, rentao.bupt@gmail.com,
        ryan_chen@aspeedtech.com
Subject: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Date:   Wed,  9 Sep 2020 15:30:57 -0500
Message-Id: <20200909203059.23427-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909203059.23427-1-eajames@linux.ibm.com>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_16:2020-09-09,2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=932 malwarescore=0 spamscore=0 suspectscore=1 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090178
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mask the IRQ status to only the bits that the driver checks. This
prevents excessive driver warnings when operating in slave mode
when additional bits are set that the driver doesn't handle.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 31268074c422..724bf30600d6 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -69,6 +69,7 @@
  * These share bit definitions, so use the same values for the enable &
  * status bits.
  */
+#define ASPEED_I2CD_INTR_RECV_MASK			0xf000ffff
 #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
 #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
 #define ASPEED_I2CD_INTR_SLAVE_MATCH			BIT(7)
@@ -604,6 +605,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
 	       bus->base + ASPEED_I2C_INTR_STS_REG);
 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
 	irq_remaining = irq_received;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-- 
2.26.2

