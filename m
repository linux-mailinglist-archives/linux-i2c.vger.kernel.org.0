Return-Path: <linux-i2c+bounces-3536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE48C7C51
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8CF283358
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109EA158847;
	Thu, 16 May 2024 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="d/OCKQ50"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394415E21E;
	Thu, 16 May 2024 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883585; cv=none; b=oYx76SFVw7mQU/g8S4bNH+qhukr2c6PHVe+jgn+dlg//7gVPzlDH2vXd84TXNx+FndwVlhUUY8HUjmxf8niCcjZLQksoHOWymOhSmT1dPSaHA6RBmwMBAtv8NhkEkNXKbUwtOV2cnFQ/i0VEJhiOnP04rmLlSFEh3FvoZA3A0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883585; c=relaxed/simple;
	bh=87vNvPwlNAGeQ5WqIoHAelTRCQC/Naflh/0oKi3szzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAJXMrDoE5oR7nvvR2VjxLB3moanstr44A6vZ+51g7pypLbsuZIC/KdP9/XfftW19geFjSnCMnaKPAtnkw4PlyGygXvTLtQ2ccAewB7k4AfX3849V1sYaWFNPOdajHCChdxNKobi4JnQ/gbhsrzRX8XvIdgSC41qYBleC9xIiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=d/OCKQ50; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GEwfd5032739;
	Thu, 16 May 2024 18:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8PJMQwkXBuHRk4+y67UGNnhw/k8TP4I96ElVzPKL2DE=;
 b=d/OCKQ50Fxj5glIyNRwMuFydF2wiMZcO81DgAf8NxMV0us75gYvP8nnvfAvcWJw8JTZX
 U+W4l6I76GUSiQ6dXieV3s5QPi0tEUd/GDTpX8mZKSNcF4WnVLkq9xhKIhbkTZDEjlnY
 IREX7iA6HRGPFzPQXRjOn/tTu0ZUKhWfuqNQt+5uWg2Gd1+vvxMDqGJsU/b6IWpHxDfW
 YhgQm6bMAZZNAsWMdplw3QvHF0i6msT3Sbu+opy80CJeRmIlxdfuZdcXq7QRG5aRmzyp
 w6vRKi85KzP7+meY44HQBIzuyTcp6zlGZmbppu5n4qJk0sIa50KAMSMIebRO8yzICgCr uQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5mce8frt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGHsWJ018810;
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJGCY27787942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C114B5807C;
	Thu, 16 May 2024 18:19:14 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8350558076;
	Thu, 16 May 2024 18:19:14 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:14 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 24/40] fsi: aspeed: Add interrupt support
Date: Thu, 16 May 2024 13:18:51 -0500
Message-Id: <20240516181907.3468796-25-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5r-YgToBKnwZojzrSD1vNtqMHpp0PV0F
X-Proofpoint-ORIG-GUID: 5r-YgToBKnwZojzrSD1vNtqMHpp0PV0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=889 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160132

Handle slave interrupts and pass them to the FSI core.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c          | 106 ++++++++++++++++++++++-
 include/trace/events/fsi_master_aspeed.h |  12 +++
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index eecd64bc29512..34f4c9e00e43d 100644
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
@@ -25,11 +27,13 @@ struct fsi_master_aspeed_data {
 struct fsi_master_aspeed {
 	struct fsi_master	master;
 	spinlock_t		lock;	/* protect HW access */
+	struct irq_domain	*irq_domain;
 	struct device		*dev;
 	void __iomem		*base;
 	void __iomem		*ctrl;
 	struct clk		*clk;
 	struct gpio_desc	*cfam_reset_gpio;
+	u32			irq_mask;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -79,6 +83,11 @@ static const u32 fsi_base = 0xa0000000;
 #define STATUS_TIMEOUT		BIT(4)
 
 /* OPB_IRQ_MASK */
+#define FSI_MASTER_ERROR_IRQ	BIT(28)
+#define FSI_PORT_ERROR_IRQ	BIT(27)
+#define FSI_HOTPLUG_IRQ		BIT(26)
+#define FSI_REMOTE_SLV_IRQ(l)	(BIT(FSI_REMOTE_SLV_IRQ_BIT) << (l))
+#define FSI_REMOTE_SLV_IRQ_BIT	18
 #define OPB1_XFER_ACK_EN BIT(17)
 #define OPB0_XFER_ACK_EN BIT(16)
 
@@ -96,7 +105,7 @@ static const u32 fsi_base = 0xa0000000;
 #define OPB_RC_CTRL_OPB		BIT(18)	/* Access controller over OPB, not AHB (AST27xx+) */
 #define OPB_RC_XFER_ACK_EN	BIT(16)	/* Enable OPBx xfer ack bit without mask */
 #define OPB_RC_COUNT		GENMASK(15, 0)	/* Number of retries */
-#define OPB_RC_DEFAULT		0x10
+#define OPB_RC_DEFAULT		(OPB_RC_XFER_ACK_EN | 0x10)
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/fsi_master_aspeed.h>
@@ -322,11 +331,76 @@ static int aspeed_master_break(struct fsi_master *master, int link)
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
@@ -477,6 +551,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	struct resource *res;
 	unsigned int reg;
 	int rc, links;
+	int irq;
 
 	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
 	if (rc) {
@@ -567,11 +642,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
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
 
@@ -579,9 +655,30 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
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
@@ -593,6 +690,9 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	get_device(&aspeed->master.dev);
 	return 0;
 
+err_irq:
+	if (aspeed->irq_domain)
+		irq_domain_remove(aspeed->irq_domain);
 err_regmap:
 	regmap_exit(aspeed->master.map);
 err_release:
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 7eeecbfec7f09..dba1776334a0e 100644
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


