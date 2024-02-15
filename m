Return-Path: <linux-i2c+bounces-1792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E2B857028
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D67531C21BAE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF92C14C5A8;
	Thu, 15 Feb 2024 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fuz4hOv1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70FB14A090;
	Thu, 15 Feb 2024 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034913; cv=none; b=C29xmP2TV76ljM8CoVc9hkiMTdExpIN0/LYxtMfdt0mKs4fRuzCvz1jIgwJN8nW9c/rFTE3zwulaT5f7OYfeZJXecK0l54v0kZJg4r+dhbN00cMTy/+awtg/aoRJGqzDiVlpsoeRkO9x058vEOSuXbNganQsjNLI7wr/R+ni9ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034913; c=relaxed/simple;
	bh=QVu20tcW/pErFdegM6TNMtLP095kS72bKybdH0MbwEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aSjOeVQWvcaeURN9z3TZzJG8Q3Mi/i4Uteq+BzvGNo7nPa2FkaXlzmaRi40KWSfau2HMimenx/sW2iC269Qi93GaPRJ6ZdatxzFyA+XvMZexmi0z3/F5svQ2srN+pvALrVrFjgdpwuqDgYeSg1oT2YlHcXrDSkH2G4bIp/T5OBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fuz4hOv1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0csO018105;
	Thu, 15 Feb 2024 22:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=G2U9RCikIAWX79HQyTXxI0GoS+WAxRjBt+QZS9Zg4lY=;
 b=fuz4hOv1M3zbBeE9j/a2icYfCb64RzdwR31wNzdLQIMcQU7z3cPTpzegmHEYk+3mIgLi
 +ugcKcvDgV5vlQ9axu4EJdhi6aaqfTfKpTp7/PlT01u7eBDhGrEsnVWQdfXRthzES1Xn
 yxCU9uFFVb5qRNw44yck0S6ycKRDB4m3CBe2KVofm3FOzkJxIg7/qu8rL5u3IEYZxr1q
 l5IqhSllarI3pp2h8HyWui6u/FVW49fAqWhsWSG35qaR3u0ahjVO6h67aez8raJvVZAw
 OLqvqXLYl4sse52udnWfralEsWB6vNmj1GilJzL6psjoFKjXvNG6dm8kGIMMyZYHO4L8 VQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg6ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:16 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLklQN032600;
	Thu, 15 Feb 2024 22:08:15 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyuet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:15 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8CsR18874962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE6E85807C;
	Thu, 15 Feb 2024 22:08:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83D3D58071;
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
Subject: [PATCH 25/33] fsi: hub: Add interrupt support
Date: Thu, 15 Feb 2024 16:07:51 -0600
Message-Id: <20240215220759.976998-26-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 3dTy5CLHc1ofbCEj1Lz_O4McShRkMRj0
X-Proofpoint-ORIG-GUID: 3dTy5CLHc1ofbCEj1Lz_O4McShRkMRj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=752 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

The hub master receives it's interrupts from the local slave register
space, which is handled in the FSI core. Therefore, just route the remote
slave interrupts to the hub link device interrupts.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 119 ++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 92aa07055c56..4c3f77ae1faf 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -7,8 +7,10 @@
 
 #include <linux/delay.h>
 #include <linux/fsi.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -35,9 +37,10 @@
  */
 struct fsi_master_hub {
 	struct fsi_master	master;
+	struct irq_domain	*irq_domain;
 	struct fsi_device	*upstream;
-	uint32_t		addr, size;	/* slave-relative addr of */
-						/* master address space */
+	uint32_t		addr;
+	uint32_t		size;
 };
 
 #define to_fsi_master_hub(m) container_of(m, struct fsi_master_hub, master)
@@ -77,10 +80,81 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
+static int hub_master_link_enable(struct fsi_master *master, int link,
+				  bool enable)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	u32 srsim = 0xff000000 >> (8 * (link % 4));
+	int slave_idx = 4 * (link / 4);
+	__be32 srsim_be;
+	int ret;
+
+	ret = fsi_slave_read(hub->upstream->slave, FSI_SLAVE_BASE + FSI_SRSIM0 + slave_idx,
+			     &srsim_be, sizeof(srsim_be));
+	if (ret)
+		return ret;
+
+	if (enable) {
+		ret = fsi_master_link_enable(master, link, enable);
+		if (ret)
+			return ret;
+
+		srsim |= be32_to_cpu(srsim_be);
+		srsim_be = cpu_to_be32(srsim);
+		ret = fsi_slave_write(hub->upstream->slave,
+				      FSI_SLAVE_BASE + FSI_SRSIM0 + slave_idx, &srsim_be,
+				      sizeof(srsim_be));
+	} else {
+		srsim = be32_to_cpu(srsim_be) & ~srsim;
+		srsim_be = cpu_to_be32(srsim);
+		ret = fsi_slave_write(hub->upstream->slave,
+				      FSI_SLAVE_BASE + FSI_SRSIM0 + slave_idx, &srsim_be,
+				      sizeof(srsim_be));
+		if (ret)
+			return ret;
+
+		ret = fsi_master_link_enable(master, link, enable);
+	}
+
+	return ret;
+}
+
+static irqreturn_t hub_master_irq(int irq, void *data)
+{
+	struct fsi_master_hub *hub = data;
+	struct fsi_master *parent = hub->upstream->slave->master;
+	unsigned int link = 0;
+
+	for (; link < FSI_HUB_MASTER_MAX_LINKS; ++link) {
+		if (parent->remote_interrupt_status & (1 << link))
+			fsi_master_irq(&hub->master, hub->irq_domain, link);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int hub_master_irqd_map(struct irq_domain *domain, unsigned int irq,
+			       irq_hw_number_t hwirq)
+{
+	struct fsi_master_hub *hub = domain->host_data;
+
+	irq_set_chip_and_handler(irq, &hub->master.irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, &hub->master);
+
+	return 0;
+}
+
+static const struct irq_domain_ops hub_master_irq_domain_ops = {
+	.map = hub_master_irqd_map,
+};
+
 static void hub_master_release(struct device *dev)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(to_fsi_master(dev));
 
+	if (hub->irq_domain)
+		irq_domain_remove(hub->irq_domain);
+
 	regmap_exit(hub->master.map);
 	kfree(hub);
 }
@@ -136,6 +210,7 @@ static int hub_master_probe(struct device *dev)
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
+	hub->master.link_enable = hub_master_link_enable;
 
 	dev_set_drvdata(dev, hub);
 
@@ -143,9 +218,44 @@ static int hub_master_probe(struct device *dev)
 	if (rc)
 		goto err_free;
 
+	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
+		struct device_node *parent = of_irq_find_parent(dev->of_node);
+
+		if (parent) {
+			struct irq_fwspec fwspec;
+			unsigned int irq;
+
+			fwspec.fwnode = of_node_to_fwnode(parent);
+			fwspec.param_count = 1;
+			fwspec.param[0] = (fsi_dev->slave->link * FSI_IRQ_COUNT) + 8;
+			irq = irq_create_fwspec_mapping(&fwspec);
+			if (irq) {
+				unsigned int size = links * FSI_IRQ_COUNT;
+
+				hub->irq_domain = irq_domain_add_linear(dev->of_node, size,
+									&hub_master_irq_domain_ops,
+									hub);
+
+				if (hub->irq_domain) {
+					rc = devm_request_irq(dev, irq, hub_master_irq, 0,
+							      dev_name(dev), hub);
+					if (rc) {
+						dev_warn(dev, "failed to request irq:%u\n", irq);
+						irq_domain_remove(hub->irq_domain);
+						hub->irq_domain = NULL;
+					} else {
+						dev_info(dev, "enabling interrupts irq:%u\n", irq);
+					}
+				} else {
+					dev_warn(dev, "failed to create irq domain\n");
+				}
+			}
+		}
+	}
+
 	rc = fsi_master_register(&hub->master);
 	if (rc)
-		goto err_free;
+		goto err_irq;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -157,6 +267,9 @@ static int hub_master_probe(struct device *dev)
 	get_device(&hub->master.dev);
 	return 0;
 
+err_irq:
+	if (hub->irq_domain)
+		irq_domain_remove(hub->irq_domain);
 err_free:
 	kfree(hub);
 err_release:
-- 
2.39.3


