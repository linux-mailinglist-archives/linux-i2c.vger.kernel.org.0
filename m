Return-Path: <linux-i2c+bounces-2001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B847C867D2D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B4928F3C9
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323941353F0;
	Mon, 26 Feb 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SHEUlOjw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32FF134757;
	Mon, 26 Feb 2024 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966439; cv=none; b=nFE0/C4sfoisSVG16nMp9ZEIOPKXRVf81MzAJb4E2nwz9AtKJHebUKdPqb3cpvD6bp4tc2oBKKXNaeDK9+zOl/vPjXNdskT0ZLfhS8mkvwgKRmiPjIXHV/ue4Yby06JvFq18eW7V5bh6gBs8aWZ4/tiXgKM94nGOlNjNeNO8Rl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966439; c=relaxed/simple;
	bh=Oy/PecaJQqqYYGdXapk1iSlOMlrVMCJsXMFhQNMPBBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E3OuIz4HWmm73i7MNZmAZR44fu/NfmISOupY7xgiMquHPO6lwgapiBoLNrSs0Z5hJnd0GjqvlD2uwqYD6Zr44ycbOA2ZCnO0/0FJrKoyenFILaf/ze0ljxhsZrg6HWywCYmfyOuQg1f93Vf1AFdQXef5ezrPqzNqt+DQPV/2NTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SHEUlOjw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QF2mUJ022255;
	Mon, 26 Feb 2024 16:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WxfAGywu2AttZSoe43SdDUfwB1vRf0idG419kD0lB08=;
 b=SHEUlOjwtx+Fgw3c4vNCdRsMFHGvAHwYBPQrh5Y+f6saP6NsR4vsR5FvumPZL5hXNRWW
 XnrAuw5oQAfzxG2Xna2VikRECNDSdWjTyrIsojSM1EH3cK36bLzfKAqrYiWmThtGjt6E
 uaE/OeHb6r55QU5azB/q7HOg5yqxLSsZvEsLnkxRr5/lK8uBJK7K/oHXl3KGLZQ4Mndd
 bYeFI9/iznIKGchqVQ+c9TgtliSvAt0zHQUTlKp+zRULbZTAyA57/qreqvz0NtpIFqvK
 1N+Jn7Dk/0ZD34S9inarFq9ScA+MLIkYnPCD2WtPC9DOG1zTizhO9MTXSsKl2nS5K7eP Bg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvp6bkea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:44 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGPaeD021759;
	Mon, 26 Feb 2024 16:53:43 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu5ytkrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:43 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGreSJ34931044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:42 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80DD058067;
	Mon, 26 Feb 2024 16:53:40 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9F1B58053;
	Mon, 26 Feb 2024 16:53:39 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 22/31] fsi: core: Add interrupt support
Date: Mon, 26 Feb 2024 10:53:12 -0600
Message-Id: <20240226165321.91976-23-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aQ1NP8BJ83p9zEnNmR99-y-L_4CC-GCr
X-Proofpoint-GUID: aQ1NP8BJ83p9zEnNmR99-y-L_4CC-GCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260128

Add an irq chip to the FSI master structure to control slave interrupt
masking. Add a function to request an IRQ from the FSI device.
The FSI master IRQ mapping is based on the FSI device engine type and
slave link.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c     | 196 +++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h   |   9 ++
 include/linux/fsi.h        |   2 +
 include/trace/events/fsi.h |  60 ++++++++++++
 4 files changed, 267 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index ce463ff8ef70..ff5d9d0c9992 100644
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
@@ -600,6 +663,9 @@ static const struct bin_attribute fsi_slave_raw_attr = {
 static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
+	__be32 scism = cpu_to_be32(0xffffffff);
+
+	fsi_slave_write(slave, FSI_SLAVE_BASE + FSI_SCISM, &scism, sizeof(scism));
 
 	fsi_free_minor(slave->dev.devt);
 	of_node_put(dev->of_node);
@@ -957,6 +1023,27 @@ void fsi_free_minor(dev_t dev)
 }
 EXPORT_SYMBOL_GPL(fsi_free_minor);
 
+static irqreturn_t fsi_slave_irq(int irq, void *data)
+{
+	struct fsi_slave *slave = data;
+	__be32 reg;
+	u32 siss;
+	int rc;
+
+	rc = fsi_slave_read(slave, FSI_SLAVE_BASE + FSI_SISS, &reg, sizeof(reg));
+	if (rc)
+		return IRQ_NONE;
+
+	siss = be32_to_cpu(reg);
+	reg = cpu_to_be32(0xffffffff);
+	rc = fsi_slave_write(slave, FSI_SLAVE_BASE + FSI_SCISC, &reg, sizeof(reg));
+	if (rc)
+		return IRQ_NONE;
+
+	trace_fsi_slave_irq(slave, siss);
+	return IRQ_HANDLED;
+}
+
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
 	uint32_t cfam_id;
@@ -1067,6 +1154,19 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		goto err_free_ida;
 	}
 
+	rc = fsi_request_irq(slave, fsi_slave_irq, slave, 0, &slave->dev);
+	if (!rc) {
+		__be32 ssism = cpu_to_be32(FSI_SISS_ALL);
+
+		/* clear interrupt conditions before unmasking */
+		data = cpu_to_be32(0xffffffff);
+		fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SCISC, &data,
+				 sizeof(data));
+
+		fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SSISM, &ssism,
+				 sizeof(ssism));
+	}
+
 	/* Now that we have the cdev registered with the core, any fatal
 	 * failures beyond this point will need to clean up through
 	 * cdev_device_del(). Fortunately though, nothing past here is fatal.
@@ -1441,6 +1541,99 @@ void fsi_master_regmap_config(struct regmap_config *config)
 }
 EXPORT_SYMBOL_GPL(fsi_master_regmap_config);
 
+int fsi_master_irq(struct fsi_master *master, struct irq_domain *irq_domain, unsigned int link)
+{
+	struct irq_desc *downstream = irq_resolve_mapping(irq_domain, (link * FSI_IRQ_COUNT) + 8);
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
+			handle_irq_desc(downstream);
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
@@ -1467,6 +1660,9 @@ int fsi_master_register(struct fsi_master *master)
 	if (!master->lbus_divider)
 		master->lbus_divider = FSI_SMODE_LBCRR_DEFAULT;
 
+	master->irq_chip.name = dev_name(&master->dev);
+	master->irq_chip.irq_mask = fsi_master_irq_mask;
+	master->irq_chip.irq_unmask = fsi_master_irq_unmask;
 	master->dev.class = &fsi_master_class;
 
 	mutex_lock(&master->scan_lock);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index f4cecdff3834..b718eeba3f43 100644
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
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index e0309bf0ae07..c249a95b7ff8 100644
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
index da977d59e163..0e4d717ee0ad 100644
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
@@ -206,6 +247,25 @@ TRACE_EVENT(fsi_slave_invalid_cfam,
 	)
 );
 
+TRACE_EVENT(fsi_slave_irq,
+	TP_PROTO(const struct fsi_slave *slave, uint32_t siss),
+	TP_ARGS(slave, siss),
+	TP_STRUCT__entry(
+		__field(int, master_idx)
+		__field(int, link)
+		__field(int, id)
+		__field(uint32_t, siss)
+	),
+	TP_fast_assign(
+		__entry->master_idx = slave->master->idx;
+		__entry->link = slave->link;
+		__entry->id = slave->id;
+		__entry->siss = siss;
+	),
+	TP_printk("fsi%d:%02d:%02d siss:%08x", __entry->master_idx, __entry->link, __entry->id,
+		  __entry->siss)
+);
+
 TRACE_EVENT(fsi_dev_init,
 	TP_PROTO(const struct fsi_device *dev),
 	TP_ARGS(dev),
-- 
2.39.3


