Return-Path: <linux-i2c+bounces-3864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1DC8FD8C1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501B41C22FDF
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA13171671;
	Wed,  5 Jun 2024 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ng06+JGx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6803A1586D7;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622625; cv=none; b=qattLc1b2Wv+lryZUBx1YWELJGYkKxUQrQJ/x4zYfWmFx4hjv16LDWW4PmGluBeVQYgrI9rd4ezbqD/+w2/zzgB7Y3rDU1O5LtlkCxDK+LEy/A3Fr9hAuDbz/DMZE2+SvQl63AsvWkJP7PArx/lZmDClV7cM1CWtzOWasEhOyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622625; c=relaxed/simple;
	bh=Da+7g2WRkg7jGuc0nH2HzTkA09fzVTkF+Wt3wcS/lYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pW92soh/cl66LzVD7B+hXHZuw4DmwmFZLLWT+80+gL/ClILbnCsZAdTi0V2FNGvwuLUJzVy7dytav7bBmsv0rbpF5GhNgkaSt/65PTrQKN4WkmymsIO3TuUK3e0GvMLBi8Q/st4XpY9xKN4iqWMVZ3M98/2bsqdrzRPFZQqkUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ng06+JGx; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KvShv014025;
	Wed, 5 Jun 2024 21:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=WNiOJmiLmJsTND7DuVuE19O0w7Czdt5rWrFBHzegWuE=;
 b=ng06+JGxn+54pyqbL9zNE7micGEVzpVHIuMDDGQ5VR4IxojWTKfuwwp23X0oANnzixN+
 DG+TTvLTybKU9xeXBLWPRQ/R24Nk4Gbs2otCftcFHPMtQav5lKEktN/t9o5KCu3FO3Z/
 7oW+R5AgVSLIU7sTx4JGb7yQImJf0hp9PQnIuDWR1FruUQ1gdFTsvfqk82GhnaghE6Ib
 BPowBey19fBI2TDjWuiFb4oAjP8hdDIJkKei62Skj1rt1oRIOBTj9h0UqIgoPXDlGODO
 /nsr3mwfV3yfySesoFv4+pQcTWm8bO8Ndv60H5fNrze905P24VN9OrhOMIe0hTtG8kT7 Qg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjygp81ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455KwRtD026549;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp366fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNKS221758634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AB7F58061;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25A5758075;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 23/40] fsi: core: Add interrupt support
Date: Wed,  5 Jun 2024 16:22:55 -0500
Message-Id: <20240605212312.349188-24-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mv2oWU15DpZQWFChEZ7HZlF2hKia-8YK
X-Proofpoint-ORIG-GUID: mv2oWU15DpZQWFChEZ7HZlF2hKia-8YK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

Add an irq chip to the FSI master structure to control slave interrupt
masking. Add a function to request an IRQ from the FSI device.
The FSI master IRQ mapping is based on the FSI device engine type and
slave link.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Remove use of handle_irq_desc

Changes since v2:
 - Remove slave interrupt handler since it's not used yet

 drivers/fsi/fsi-core.c     | 159 +++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h   |   9 +++
 drivers/fsi/fsi-slave.h    |   1 -
 include/linux/fsi.h        |   2 +
 include/trace/events/fsi.h |  41 ++++++++++
 5 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8b402149acbe9..58cb6bc6ccc91 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -14,10 +14,12 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/idr.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
@@ -109,6 +111,67 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 
 	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
 }
+EXPORT_SYMBOL_GPL(fsi_device_peek);
+
+static int fsi_request_irq(struct fsi_slave *slave, irq_handler_t handler, void *data,
+			   unsigned int engine_irq, struct device *dev)
+{
+	struct device_node *parent = of_node_get(slave->master->dev.of_node);
+	struct irq_fwspec fwspec;
+	unsigned int irq;
+
+	/*
+	 * FSI devices can only report interrupts to their own master, so if the master
+	 * isn't an interrupt controller, don't try and map an irq.
+	 */
+	if (!of_get_property(parent, "#interrupt-cells", NULL)) {
+		of_node_put(parent);
+		return -EINVAL;
+	}
+
+	fwspec.fwnode = of_node_to_fwnode(parent);
+	fwspec.param_count = 1;
+	fwspec.param[0] = engine_irq + (slave->link * FSI_IRQ_COUNT);
+	irq = irq_create_fwspec_mapping(&fwspec);
+	if (!irq)
+		return -EINVAL;
+
+	return devm_request_irq(dev, irq, handler, 0, dev_name(dev), data);
+}
+
+int fsi_device_request_irq(struct fsi_device *dev, irq_handler_t handler, void *data)
+{
+	unsigned int engine_irq;
+
+	switch (dev->engine_type) {
+	case 0x4:	// shift
+		engine_irq = 1;
+		break;
+	case 0x5:	// scom
+		engine_irq = 2;
+		break;
+	case 0x6:	// scratchpad
+		engine_irq = 3;
+		break;
+	case 0x7:	// i2cm
+		engine_irq = 4;
+		break;
+	case 0x20:	// mbox
+		engine_irq = 7;
+		break;
+	case 0x22:	// sbefifo
+		engine_irq = 6;
+		break;
+	case 0x23:	// spim
+		engine_irq = 5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return fsi_request_irq(dev->slave, handler, data, engine_irq, &dev->dev);
+}
+EXPORT_SYMBOL_GPL(fsi_device_request_irq);
 
 unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev)
 {
@@ -1467,6 +1530,99 @@ void fsi_master_regmap_config(struct regmap_config *config)
 }
 EXPORT_SYMBOL_GPL(fsi_master_regmap_config);
 
+int fsi_master_irq(struct fsi_master *master, struct irq_domain *irq_domain, unsigned int link)
+{
+	unsigned int downstream = irq_find_mapping(irq_domain, (link * FSI_IRQ_COUNT) + 8);
+	unsigned long size = FSI_SI1S_SLAVE_BIT + 1;
+	unsigned long bit = FSI_SI1S_MBOX_BIT;
+	unsigned long srsis0 = 0;
+	unsigned long srsis4 = 0;
+	unsigned long si1s;
+	__be32 reg;
+	int rc;
+
+	rc = fsi_master_read(master, link, 0, FSI_SLAVE_BASE + FSI_SI1S, &reg, sizeof(reg));
+	if (rc)
+		return rc;
+
+	si1s = (unsigned long)be32_to_cpu(reg);
+	for_each_set_bit_from(bit, &si1s, size)
+		generic_handle_domain_irq(irq_domain, (link * FSI_IRQ_COUNT) + (31 - bit));
+
+	if (downstream) {
+		int i;
+
+		master->remote_interrupt_status = 0;
+
+		rc = fsi_master_read(master, link, 0, FSI_SLAVE_BASE + FSI_SRSIS0, &reg,
+				     sizeof(reg));
+		if (rc)
+			return rc;
+
+		srsis0 = (unsigned long)be32_to_cpu(reg);
+		for (i = 0; i < 4; ++i) {
+			if (srsis0 & (0xff000000 >> (8 * i)))
+				master->remote_interrupt_status |= (1 << i);
+		}
+
+		rc = fsi_master_read(master, link, 0, FSI_SLAVE_BASE + FSI_SRSIS4, &reg,
+				     sizeof(reg));
+		if (rc)
+			return rc;
+
+		srsis4 = (unsigned long)be32_to_cpu(reg);
+		for (i = 0; i < 4; ++i) {
+			if (srsis4 & (0xff000000 >> (8 * i)))
+				master->remote_interrupt_status |= (16 << i);
+		}
+
+		if (master->remote_interrupt_status) {
+			generic_handle_irq(downstream);
+
+			reg = cpu_to_be32(0xffffffff);
+			if (master->remote_interrupt_status & 0xf)
+				fsi_master_write(master, link, 0, FSI_SLAVE_BASE + FSI_SRSIC0,
+						 &reg, sizeof(reg));
+
+			if (master->remote_interrupt_status & 0xf0)
+				fsi_master_write(master, link, 0, FSI_SLAVE_BASE + FSI_SRSIC4,
+						 &reg, sizeof(reg));
+		}
+	}
+
+	trace_fsi_master_irq(master, link, si1s, srsis0, srsis4);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsi_master_irq);
+
+static void fsi_master_irq_mask(struct irq_data *data)
+{
+	unsigned int bit = 31 - (data->hwirq % FSI_IRQ_COUNT);
+
+	if (bit >= FSI_SI1S_MBOX_BIT) {
+		struct fsi_master *master = irq_data_get_irq_chip_data(data);
+		int link = data->hwirq / FSI_IRQ_COUNT;
+		__be32 mask = cpu_to_be32(BIT(bit));
+
+		trace_fsi_master_irq_mask(master, link, data->hwirq % FSI_IRQ_COUNT, true);
+		fsi_master_write(master, link, 0, FSI_SLAVE_BASE + FSI_SCI1M, &mask, sizeof(mask));
+	}
+}
+
+static void fsi_master_irq_unmask(struct irq_data *data)
+{
+	unsigned int bit = 31 - (data->hwirq % FSI_IRQ_COUNT);
+
+	if (bit >= FSI_SI1S_MBOX_BIT) {
+		struct fsi_master *master = irq_data_get_irq_chip_data(data);
+		int link = data->hwirq / FSI_IRQ_COUNT;
+		__be32 mask = cpu_to_be32(BIT(bit));
+
+		trace_fsi_master_irq_mask(master, link, data->hwirq % FSI_IRQ_COUNT, false);
+		fsi_master_write(master, link, 0, FSI_SLAVE_BASE + FSI_SSI1M, &mask, sizeof(mask));
+	}
+}
+
 int fsi_master_register(struct fsi_master *master)
 {
 	int rc;
@@ -1491,6 +1647,9 @@ int fsi_master_register(struct fsi_master *master)
 	if (master->flags & FSI_MASTER_FLAG_SWCLOCK)
 		master->clock_frequency = 100000000; // POWER reference clock
 
+	master->irq_chip.name = dev_name(&master->dev);
+	master->irq_chip.irq_mask = fsi_master_irq_mask;
+	master->irq_chip.irq_unmask = fsi_master_irq_unmask;
 	master->dev.class = &fsi_master_class;
 
 	mutex_lock(&master->scan_lock);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 8ea2f69ec4922..2104902091e05 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -10,6 +10,7 @@
 #define DRIVERS_FSI_MASTER_H
 
 #include <linux/device.h>
+#include <linux/irq.h>
 #include <linux/mutex.h>
 
 /*
@@ -112,6 +113,7 @@
 /* Misc */
 #define	FSI_CRC_SIZE		4
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
+#define FSI_IRQ_COUNT		9
 
 /* fsi-master definition and flags */
 #define FSI_MASTER_FLAG_SWCLOCK		0x1
@@ -137,6 +139,7 @@ struct fsi_master {
 	int		n_links;
 	int		flags;
 	struct mutex	scan_lock;
+	struct irq_chip	irq_chip;
 	int		(*read)(struct fsi_master *, int link, uint8_t id,
 				uint32_t addr, void *val, size_t size);
 	int		(*write)(struct fsi_master *, int link, uint8_t id,
@@ -147,6 +150,7 @@ struct fsi_master {
 				       bool enable);
 	int		(*link_config)(struct fsi_master *, int link,
 				       u8 t_send_delay, u8 t_echo_delay);
+	u8		remote_interrupt_status;
 };
 
 #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
@@ -176,4 +180,9 @@ extern void fsi_master_unregister(struct fsi_master *master);
 
 extern int fsi_master_rescan(struct fsi_master *master);
 
+struct irq_domain;
+
+extern int fsi_master_irq(struct fsi_master *master, struct irq_domain *irq_domain,
+			  unsigned int link);
+
 #endif /* DRIVERS_FSI_MASTER_H */
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 0468ec1c60db2..762636e7c8633 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -73,7 +73,6 @@
 #define FSI_SISS_MFSI_PORT_ERROR	BIT(2)
 #define FSI_SISS_MFSI_HP		BIT(1)
 #define FSI_SISS_MFSI_CR_PARITY_ERROR	BIT(0)
-#define FSI_SISS_ALL			0xfe007f00
 
 /*
  * SI1S fields
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index e0309bf0ae072..c249a95b7ff84 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -8,6 +8,7 @@
 #define LINUX_FSI_H
 
 #include <linux/device.h>
+#include <linux/interrupt.h>
 
 struct fsi_device {
 	struct device		dev;
@@ -25,6 +26,7 @@ extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
 		const void *val, size_t size);
 extern int fsi_device_peek(struct fsi_device *dev, void *val);
 extern unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev);
+extern int fsi_device_request_irq(struct fsi_device *dev, irq_handler_t handler, void *data);
 
 struct fsi_device_id {
 	u8	engine_type;
diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
index da977d59e163e..c750ae8e1f5b4 100644
--- a/include/trace/events/fsi.h
+++ b/include/trace/events/fsi.h
@@ -8,6 +8,47 @@
 
 #include <linux/tracepoint.h>
 
+TRACE_EVENT(fsi_master_irq,
+	TP_PROTO(const struct fsi_master *master, unsigned int link, uint32_t si1s,
+		 uint32_t srsis0, uint32_t srsis4),
+	TP_ARGS(master, link, si1s, srsis0, srsis4),
+	TP_STRUCT__entry(
+		__field(int, master_idx)
+		__field(unsigned int, link)
+		__field(uint32_t, si1s)
+		__field(uint32_t, srsis0)
+		__field(uint32_t, srsis4)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master->idx;
+		__entry->link = link;
+		__entry->si1s = si1s;
+		__entry->srsis0 = srsis0;
+		__entry->srsis4 = srsis4;
+	),
+	TP_printk("fsi%d:%02d si1s:%08x srsis0:%08x srsis4:%08x", __entry->master_idx,
+		  __entry->link, __entry->si1s, __entry->srsis0, __entry->srsis4)
+);
+
+TRACE_EVENT(fsi_master_irq_mask,
+	TP_PROTO(const struct fsi_master *master, unsigned int link, unsigned int bit, bool mask),
+	TP_ARGS(master, link, bit, mask),
+	TP_STRUCT__entry(
+		__field(int, master_idx)
+		__field(unsigned int, link)
+		__field(unsigned int, bit)
+		__field(bool, mask)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master->idx;
+		__entry->link = link;
+		__entry->bit = bit;
+		__entry->mask = mask;
+	),
+	TP_printk("fsi%d:%02d %s bit:%d", __entry->master_idx, __entry->link,
+		  __entry->mask ? "mask" : "unmask", __entry->bit)
+);
+
 TRACE_EVENT(fsi_master_xfer,
 	TP_PROTO(int master_idx, int link, int id, uint32_t addr, size_t size, const void *data,
 		 bool read),
-- 
2.39.3


