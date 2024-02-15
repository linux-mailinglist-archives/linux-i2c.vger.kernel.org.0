Return-Path: <linux-i2c+bounces-1790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57F857022
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83D24B254EE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4087314AD3E;
	Thu, 15 Feb 2024 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tOCCV/4C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165E1482E2;
	Thu, 15 Feb 2024 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034912; cv=none; b=GGfFha2jam3kXpQaHAA9akRyKFEcRnWPjSDkoZENqJekMAiX07RQ0l4TM2JOP/yhXiD/ojp1fKfErHSLq/XpuZtpuVQeYlmQS8UD3cnsjBJANP/7A+YTcVnSBtWLQyi7Q74bSnX3QaQYdgWa7T1i4wRD3NiHCm7pbxV9w19akzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034912; c=relaxed/simple;
	bh=IrBE4fcRHBBIKINnpShMKbyQ6uSukeQFgVtSxmIFIdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oc0Uy9q0XAeP0pCGdmbSoGoaeKzVqcKGVJv+VLIf61+ZDcWPpP1rtk6icTqkrVRIOJNcJLiU1xutDwjrjRMyycNnYaJ5nOoRg8fe0sdUGwcOFrgil7Ecasbiso4olc6/FCIUFARe44a52C49CjKMbSBWfqfKFRUgVfFOV+sKLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tOCCV/4C; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM6M3o026169;
	Thu, 15 Feb 2024 22:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=acDsFEaV89yyM3MMGJ1GuBnRej8Gzzefq6bvVEMTi8I=;
 b=tOCCV/4C3q3Axhvi9p20lwjr4x7gM9enAtywxxVb8oCRd/+RLS6cBw8QCRPneXoScTM3
 +p3zvBvq2UM6K+mT/QG+63jCNrWKy7xWW9wR3biQcn6KQ6sqc3tSrt5M2m9tGYAiJrte
 jZ5rmrxOqzFtSQ5e4jaipC9YqL2NGbzv8YgAUfsDbXpP0E53SG53MsVBTVWOY4/CqwYz
 J5nQLkB2mCT4Yn9PlmrL2sV6g11GGQTQfHQHfC5CRhRpRvTHRCWOIRkSjA4yDWvfBil1
 RoM1S9x9NoRBBpuFGw0jcQ5fCwbmdWpPZ8ppIuDJ+7X+uPIkANJigrZCIt2uT1eYG2Rz /w== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u46r160-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:15 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0Eu8004287;
	Thu, 15 Feb 2024 22:08:15 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0qtna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:15 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8Ce110486306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:14 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C2D258061;
	Thu, 15 Feb 2024 22:08:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30C4258076;
	Thu, 15 Feb 2024 22:08:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 24/33] fsi: aspeed: Add interrupt support
Date: Thu, 15 Feb 2024 16:07:50 -0600
Message-Id: <20240215220759.976998-25-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bM638bld7yVVOlAalSevQXK-XCCphuBS
X-Proofpoint-GUID: bM638bld7yVVOlAalSevQXK-XCCphuBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=841 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

Handle slave interrupts and pass them to the FSI core.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c          | 104 ++++++++++++++++++++++-
 include/trace/events/fsi_master_aspeed.h |  12 +++
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index ac8835e4d1f8..ce16ea65f65d 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -6,6 +6,8 @@
 #include <linux/delay.h>
 #include <linux/fsi.h>
 #include <linux/io.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -25,10 +27,12 @@ struct fsi_master_aspeed_data {
 struct fsi_master_aspeed {
 	struct fsi_master	master;
 	spinlock_t		lock;	/* protect HW access */
+	struct irq_domain	*irq_domain;
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
 	struct gpio_desc	*cfam_reset_gpio;
+	u32			irq_mask;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -80,6 +84,11 @@ static const u32 fsi_base = 0xa0000000;
 #define STATUS_TIMEOUT		BIT(4)
 
 /* OPB_IRQ_MASK */
+#define FSI_MASTER_ERROR_IRQ	BIT(28)
+#define FSI_PORT_ERROR_IRQ	BIT(27)
+#define FSI_HOTPLUG_IRQ		BIT(26)
+#define FSI_REMOTE_SLV_IRQ(l)	(BIT(FSI_REMOTE_SLV_IRQ_BIT) << (l))
+#define FSI_REMOTE_SLV_IRQ_BIT	18
 #define OPB1_XFER_ACK_EN BIT(17)
 #define OPB0_XFER_ACK_EN BIT(16)
 
@@ -316,11 +325,76 @@ static int aspeed_master_break(struct fsi_master *master, int link)
 	return aspeed_master_write(master, link, 0, addr, &cmd, 4);
 }
 
+static int aspeed_master_link_enable(struct fsi_master *master, int link, bool enable)
+{
+	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&aspeed->lock, flags);
+	if (enable) {
+		rc = fsi_master_link_enable(master, link, enable);
+		if (rc)
+			goto done;
+
+		aspeed->irq_mask |= FSI_REMOTE_SLV_IRQ(link);
+		writel(aspeed->irq_mask, aspeed->base + OPB_IRQ_MASK);
+	} else {
+		aspeed->irq_mask &= ~FSI_REMOTE_SLV_IRQ(link);
+		writel(aspeed->irq_mask, aspeed->base + OPB_IRQ_MASK);
+
+		rc = fsi_master_link_enable(master, link, enable);
+	}
+
+done:
+	spin_unlock_irqrestore(&aspeed->lock, flags);
+	return rc;
+}
+
+static irqreturn_t aspeed_master_irq(int irq, void *data)
+{
+	struct fsi_master_aspeed *aspeed = data;
+	unsigned long size = FSI_REMOTE_SLV_IRQ_BIT + aspeed->master.n_links;
+	unsigned long bit = FSI_REMOTE_SLV_IRQ_BIT;
+	unsigned long status;
+
+	status = readl(aspeed->base + OPB_IRQ_STATUS);
+	writel(0, aspeed->base + OPB_IRQ_MASK);
+
+	for_each_set_bit_from(bit, &status, size)
+		fsi_master_irq(&aspeed->master, aspeed->irq_domain, bit - FSI_REMOTE_SLV_IRQ_BIT);
+
+	writel(status, aspeed->base + OPB_IRQ_STATUS);
+	writel(0, aspeed->base + OPB_IRQ_STATUS);
+	writel(aspeed->irq_mask, aspeed->base + OPB_IRQ_MASK);
+
+	trace_fsi_master_aspeed_irq(status);
+	return IRQ_HANDLED;
+}
+
+static int aspeed_master_irqd_map(struct irq_domain *domain, unsigned int irq,
+				  irq_hw_number_t hwirq)
+{
+	struct fsi_master_aspeed *aspeed = domain->host_data;
+
+	irq_set_chip_and_handler(irq, &aspeed->master.irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, &aspeed->master);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_master_irq_domain_ops = {
+	.map = aspeed_master_irqd_map,
+};
+
 static void aspeed_master_release(struct device *dev)
 {
 	struct fsi_master_aspeed *aspeed =
 		to_fsi_master_aspeed(to_fsi_master(dev));
 
+	if (aspeed->irq_domain)
+		irq_domain_remove(aspeed->irq_domain);
+
 	regmap_exit(aspeed->master.map);
 	kfree(aspeed);
 }
@@ -447,6 +521,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	struct fsi_master_aspeed *aspeed;
 	unsigned int reg;
 	int rc, links;
+	int irq;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
 	if (rc) {
@@ -527,11 +602,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed->master.dev.of_node = of_node_get(dev_of_node(&pdev->dev));
 
 	aspeed->master.n_links = links;
-	aspeed->master.flags = FSI_MASTER_FLAG_RELA;
+	aspeed->master.flags = FSI_MASTER_FLAG_INTERRUPT | FSI_MASTER_FLAG_RELA;
 	aspeed->master.read = aspeed_master_read;
 	aspeed->master.write = aspeed_master_write;
 	aspeed->master.send_break = aspeed_master_break;
 	aspeed->master.term = aspeed_master_term;
+	aspeed->master.link_enable = aspeed_master_link_enable;
 
 	dev_set_drvdata(&pdev->dev, aspeed);
 
@@ -539,9 +615,30 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_regmap;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		unsigned int size = links * FSI_IRQ_COUNT;
+
+		aspeed->irq_domain = irq_domain_add_linear(aspeed->dev->of_node, size,
+							   &aspeed_master_irq_domain_ops, aspeed);
+		if (aspeed->irq_domain) {
+			rc = devm_request_irq(aspeed->dev, irq, aspeed_master_irq, 0,
+					      dev_name(aspeed->dev), aspeed);
+			if (rc) {
+				dev_warn(aspeed->dev, "failed to request irq:%d\n", irq);
+				irq_domain_remove(aspeed->irq_domain);
+				aspeed->irq_domain = NULL;
+			} else {
+				dev_info(aspeed->dev, "enabling interrupts irq:%d\n", irq);
+			}
+		} else {
+			dev_warn(aspeed->dev, "failed to create irq domain\n");
+		}
+	}
+
 	rc = fsi_master_register(&aspeed->master);
 	if (rc)
-		goto err_regmap;
+		goto err_irq;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -553,6 +650,9 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	get_device(&aspeed->master.dev);
 	return 0;
 
+err_irq:
+	if (aspeed->irq_domain)
+		irq_domain_remove(aspeed->irq_domain);
 err_regmap:
 	regmap_exit(aspeed->master.map);
 err_release:
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 7eeecbfec7f0..dba1776334a0 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -8,6 +8,18 @@
 
 #include <linux/tracepoint.h>
 
+TRACE_EVENT(fsi_master_aspeed_irq,
+	TP_PROTO(uint32_t status),
+	TP_ARGS(status),
+	TP_STRUCT__entry(
+		__field(uint32_t, status)
+	),
+	TP_fast_assign(
+		__entry->status = status;
+	),
+	TP_printk("status %08x", __entry->status)
+);
+
 TRACE_EVENT(fsi_master_aspeed_opb_xfer,
 	TP_PROTO(uint32_t addr, uint32_t size, uint32_t data, bool read),
 	TP_ARGS(addr, size, data, read),
-- 
2.39.3


