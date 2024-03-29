Return-Path: <linux-i2c+bounces-2658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C70892212
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30D81F24B7F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FE8139D03;
	Fri, 29 Mar 2024 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="YRmz2Ily"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5110D130A42;
	Fri, 29 Mar 2024 17:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731661; cv=none; b=HoUCH86PJnTIPZ4lzpzSQWA6mdPRNdlPNTjCHwrQBvW8khWBDAKwY3zDa+DJLkzuyPIWZJa5wmjztoYZAxIac05osmTlU5rtAkJYmpnjUceMB8p395LAjsktZQ7H8bhiCI6mrtYfPngo2Iblqdz+YaMB5iK5L+DeF6ozHc9g0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731661; c=relaxed/simple;
	bh=zOo8Qw8g7D5wdVYPZHKAqEsT2eyHpN8K2CnmYrgejvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rRycyRdh3QYl7B4Uur+gOtbzArfjdNxOIKhj4+bXz03OK7P+VzNhLE6UTpFEwExcZ01CltlofifAZLBOHAp7RSfUQPvd4Y29SRaQbUnGN7UeQ9Gsytjcl62gzyOGw7axsPZYF8yMsKIv775436lWYEYS14pi34JPBqtRUWQFT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=YRmz2Ily; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9570D20E6F4C;
	Fri, 29 Mar 2024 10:00:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9570D20E6F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731653;
	bh=kq8lajM6OcUxoP9ic3Nr0EtUOoOisZW484LpcDVOIHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRmz2IlyGrkeh5HexU4/sDwcarKkYOuA+MADHIvSy0PXPDfAq0pliFGgjjQesQFis
	 4X04xV5kMzjBmnE5srBvhUd7tpjeOmosUuvAZYfmQAq8pRpl9mSKU5vxGtrGUKMei2
	 k5AlOJM96b3B8+toyH0wJDulp+jMDK7b5cwRyEtE=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org (open list:HFI1 DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v0 01/14] IB/hfi1, IB/qib: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:25 +0000
Message-Id: <20240329170038.3863998-2-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's series
to fix drivers/i2c[1], fix the terminology where I had a role to play, now that
the approved verbiage exists in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/infiniband/hw/hfi1/chip.c           |  6 ++--
 drivers/infiniband/hw/hfi1/chip.h           |  2 +-
 drivers/infiniband/hw/hfi1/chip_registers.h |  2 +-
 drivers/infiniband/hw/hfi1/file_ops.c       |  2 +-
 drivers/infiniband/hw/hfi1/firmware.c       | 22 ++++++-------
 drivers/infiniband/hw/hfi1/pcie.c           |  2 +-
 drivers/infiniband/hw/hfi1/qsfp.c           | 36 ++++++++++-----------
 drivers/infiniband/hw/hfi1/user_exp_rcv.c   |  2 +-
 drivers/infiniband/hw/qib/qib_twsi.c        |  6 ++--
 9 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/chip.c b/drivers/infiniband/hw/hfi1/chip.c
index 78f27f7b4203..5fb8d583d152 100644
--- a/drivers/infiniband/hw/hfi1/chip.c
+++ b/drivers/infiniband/hw/hfi1/chip.c
@@ -9761,7 +9761,7 @@ static void init_lcb(struct hfi1_devdata *dd)
 	/* set LCB for cclk loopback on the port */
 	write_csr(dd, DC_LCB_CFG_TX_FIFOS_RESET, 0x01);
 	write_csr(dd, DC_LCB_CFG_LANE_WIDTH, 0x00);
-	write_csr(dd, DC_LCB_CFG_REINIT_AS_SLAVE, 0x00);
+	write_csr(dd, DC_LCB_CFG_REINIT_AS_TARGET, 0x00);
 	write_csr(dd, DC_LCB_CFG_CNT_FOR_SKIP_STALL, 0x110);
 	write_csr(dd, DC_LCB_CFG_CLK_CNTR, 0x08);
 	write_csr(dd, DC_LCB_CFG_LOOPBACK, 0x02);
@@ -10371,7 +10371,7 @@ static void force_logical_link_state_down(struct hfi1_pportdata *ppd)
 		  DC_LCB_CFG_IGNORE_LOST_RCLK_EN_SMASK);
 
 	write_csr(dd, DC_LCB_CFG_LANE_WIDTH, 0);
-	write_csr(dd, DC_LCB_CFG_REINIT_AS_SLAVE, 0);
+	write_csr(dd, DC_LCB_CFG_REINIT_AS_TARGET, 0);
 	write_csr(dd, DC_LCB_CFG_CNT_FOR_SKIP_STALL, 0x110);
 	write_csr(dd, DC_LCB_CFG_LOOPBACK, 0x2);
 
@@ -15390,7 +15390,7 @@ u64 create_pbc(struct hfi1_pportdata *ppd, u64 flags, int srate_mbs, u32 vl,
  * Initialize the thermal sensor.
  *
  * After initialization, enable polling of thermal sensor through
- * SBus interface. In order for this to work, the SBus Master
+ * SBus interface. In order for this to work, the SBus Controller
  * firmware has to be loaded due to the fact that the HW polling
  * logic uses SBus interrupts, which are not supported with
  * default firmware. Otherwise, no data will be returned through
diff --git a/drivers/infiniband/hw/hfi1/chip.h b/drivers/infiniband/hw/hfi1/chip.h
index d861aa8fc640..631090383bd6 100644
--- a/drivers/infiniband/hw/hfi1/chip.h
+++ b/drivers/infiniband/hw/hfi1/chip.h
@@ -667,7 +667,7 @@ u64 create_pbc(struct hfi1_pportdata *ppd, u64 flags, int srate_mbs, u32 vl,
 	       u32 dw_len);
 
 /* firmware.c */
-#define SBUS_MASTER_BROADCAST 0xfd
+#define SBUS_CONTROLLER_BROADCAST 0xfd
 #define NUM_PCIE_SERDES 16	/* number of PCIe serdes on the SBus */
 extern const u8 pcie_serdes_broadcast[];
 extern const u8 pcie_pcs_addrs[2][NUM_PCIE_SERDES];
diff --git a/drivers/infiniband/hw/hfi1/chip_registers.h b/drivers/infiniband/hw/hfi1/chip_registers.h
index d79e25d20fb8..d4111e136468 100644
--- a/drivers/infiniband/hw/hfi1/chip_registers.h
+++ b/drivers/infiniband/hw/hfi1/chip_registers.h
@@ -276,7 +276,7 @@
 #define DC_LCB_CFG_TX_FIFOS_RADR_RST_VAL_SHIFT 0
 #define DC_LCB_CFG_TX_FIFOS_RESET (DC_LCB_CSRS + 0x000000000008)
 #define DC_LCB_CFG_TX_FIFOS_RESET_VAL_SHIFT 0
-#define DC_LCB_CFG_REINIT_AS_SLAVE (DC_LCB_CSRS + 0x000000000030)
+#define DC_LCB_CFG_REINIT_AS_TARGET (DC_LCB_CSRS + 0x000000000030)
 #define DC_LCB_CFG_CNT_FOR_SKIP_STALL (DC_LCB_CSRS + 0x000000000040)
 #define DC_LCB_CFG_CLK_CNTR (DC_LCB_CSRS + 0x000000000110)
 #define DC_LCB_ERR_CLR (DC_LCB_CSRS + 0x000000000308)
diff --git a/drivers/infiniband/hw/hfi1/file_ops.c b/drivers/infiniband/hw/hfi1/file_ops.c
index 503abec709c9..dd22c36cec78 100644
--- a/drivers/infiniband/hw/hfi1/file_ops.c
+++ b/drivers/infiniband/hw/hfi1/file_ops.c
@@ -1044,7 +1044,7 @@ static int setup_subctxt(struct hfi1_ctxtdata *uctxt)
 	if (!uctxt->subctxt_uregbase)
 		return -ENOMEM;
 
-	/* We can take the size of the RcvHdr Queue from the master */
+	/* We can take the size of the RcvHdr Queue from the parent */
 	uctxt->subctxt_rcvhdr_base = vmalloc_user(rcvhdrq_size(uctxt) *
 						  num_subctxts);
 	if (!uctxt->subctxt_rcvhdr_base) {
diff --git a/drivers/infiniband/hw/hfi1/firmware.c b/drivers/infiniband/hw/hfi1/firmware.c
index 3c228aeaaf81..8e4a89f348f3 100644
--- a/drivers/infiniband/hw/hfi1/firmware.c
+++ b/drivers/infiniband/hw/hfi1/firmware.c
@@ -1100,7 +1100,7 @@ static void turn_off_spicos(struct hfi1_devdata *dd, int flags)
 	write_csr(dd, MISC_CFG_FW_CTRL, ENABLE_SPICO_SMASK);
 	/* disable SBus spico */
 	if (flags & SPICO_SBUS)
-		sbus_request(dd, SBUS_MASTER_BROADCAST, 0x01,
+		sbus_request(dd, SBUS_CONTROLLER_BROADCAST, 0x01,
 			     WRITE_SBUS_RECEIVER, 0x00000040);
 
 	/* disable the fabric serdes spicos */
@@ -1257,7 +1257,7 @@ static int load_sbus_firmware(struct hfi1_devdata *dd,
 			      struct firmware_details *fdet)
 {
 	int i, err;
-	const u8 ra = SBUS_MASTER_BROADCAST; /* receiver address */
+	const u8 ra = SBUS_CONTROLLER_BROADCAST; /* receiver address */
 
 	dd_dev_info(dd, "Downloading SBus firmware\n");
 
@@ -1269,7 +1269,7 @@ static int load_sbus_firmware(struct hfi1_devdata *dd,
 	sbus_request(dd, ra, 0x01, WRITE_SBUS_RECEIVER, 0x00000240);
 	/* step 4: set starting IMEM address for burst download */
 	sbus_request(dd, ra, 0x03, WRITE_SBUS_RECEIVER, 0x80000000);
-	/* step 5: download the SBus Master machine code */
+	/* step 5: download the SBus Controller machine code */
 	for (i = 0; i < fdet->firmware_len; i += 4) {
 		sbus_request(dd, ra, 0x14, WRITE_SBUS_RECEIVER,
 			     *(u32 *)&fdet->firmware_ptr[i]);
@@ -1294,17 +1294,17 @@ static int load_pcie_serdes_firmware(struct hfi1_devdata *dd,
 				     struct firmware_details *fdet)
 {
 	int i;
-	const u8 ra = SBUS_MASTER_BROADCAST; /* receiver address */
+	const u8 ra = SBUS_CONTROLLER_BROADCAST; /* receiver address */
 
 	dd_dev_info(dd, "Downloading PCIe firmware\n");
 
 	/* step 1: load security variables */
 	load_security_variables(dd, fdet);
-	/* step 2: assert single step (halts the SBus Master spico) */
+	/* step 2: assert single step (halts the SBus Controller spico) */
 	sbus_request(dd, ra, 0x05, WRITE_SBUS_RECEIVER, 0x00000001);
 	/* step 3: enable XDMEM access */
 	sbus_request(dd, ra, 0x01, WRITE_SBUS_RECEIVER, 0x00000d40);
-	/* step 4: load firmware into SBus Master XDMEM */
+	/* step 4: load firmware into SBus Controller XDMEM */
 	/*
 	 * NOTE: the dmem address, write_en, and wdata are all pre-packed,
 	 * we only need to pick up the bytes and write them
@@ -2190,13 +2190,13 @@ static void dump_fw_version(struct hfi1_devdata *dd)
 	/* set fast mode */
 	set_sbus_fast_mode(dd);
 
-	/* read version for SBus Master */
-	sbus_request(dd, SBUS_MASTER_BROADCAST, 0x02, WRITE_SBUS_RECEIVER, 0);
-	sbus_request(dd, SBUS_MASTER_BROADCAST, 0x07, WRITE_SBUS_RECEIVER, 0x1);
+	/* read version for SBus Controller */
+	sbus_request(dd, SBUS_CONTROLLER_BROADCAST, 0x02, WRITE_SBUS_RECEIVER, 0);
+	sbus_request(dd, SBUS_CONTROLLER_BROADCAST, 0x07, WRITE_SBUS_RECEIVER, 0x1);
 	/* wait for interrupt to be processed */
 	usleep_range(10000, 11000);
-	sbus_vers = sbus_read(dd, SBUS_MASTER_BROADCAST, 0x08, 0x1);
-	dd_dev_info(dd, "SBus Master firmware version 0x%08x\n", sbus_vers);
+	sbus_vers = sbus_read(dd, SBUS_CONTROLLER_BROADCAST, 0x08, 0x1);
+	dd_dev_info(dd, "SBus Controller firmware version 0x%08x\n", sbus_vers);
 
 	/* read version for PCIe SerDes */
 	all_same = 1;
diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
index 119ec2f1382b..d9c545cfc000 100644
--- a/drivers/infiniband/hw/hfi1/pcie.c
+++ b/drivers/infiniband/hw/hfi1/pcie.c
@@ -1028,7 +1028,7 @@ int do_pcie_gen3_transition(struct hfi1_devdata *dd)
 retry:
 	/* the SBus download will reset the spico for thermal */
 
-	/* step 3: download SBus Master firmware */
+	/* step 3: download SBus Controller firmware */
 	/* step 4: download PCIe Gen3 SerDes firmware */
 	dd_dev_info(dd, "%s: downloading firmware\n", __func__);
 	ret = load_pcie_firmware(dd);
diff --git a/drivers/infiniband/hw/hfi1/qsfp.c b/drivers/infiniband/hw/hfi1/qsfp.c
index 52cce1c8b76a..7a5a014da0e9 100644
--- a/drivers/infiniband/hw/hfi1/qsfp.c
+++ b/drivers/infiniband/hw/hfi1/qsfp.c
@@ -171,7 +171,7 @@ void clean_up_i2c(struct hfi1_devdata *dd, struct hfi1_asic_data *ad)
 }
 
 static int i2c_bus_write(struct hfi1_devdata *dd, struct hfi1_i2c_bus *i2c,
-			 u8 slave_addr, int offset, int offset_size,
+			 u8 client_addr, int offset, int offset_size,
 			 u8 *data, u16 len)
 {
 	int ret;
@@ -182,7 +182,7 @@ static int i2c_bus_write(struct hfi1_devdata *dd, struct hfi1_i2c_bus *i2c,
 	switch (offset_size) {
 	case 0:
 		num_msgs = 1;
-		msgs[0].addr = slave_addr;
+		msgs[0].addr = client_addr;
 		msgs[0].flags = 0;
 		msgs[0].len = len;
 		msgs[0].buf = data;
@@ -194,12 +194,12 @@ static int i2c_bus_write(struct hfi1_devdata *dd, struct hfi1_i2c_bus *i2c,
 		num_msgs = 2;
 		offset_bytes[0] = offset & 0xff;
 
-		msgs[0].addr = slave_addr;
+		msgs[0].addr = client_addr;
 		msgs[0].flags = 0;
 		msgs[0].len = offset_size;
 		msgs[0].buf = offset_bytes;
 
-		msgs[1].addr = slave_addr;
+		msgs[1].addr = client_addr;
 		msgs[1].flags = I2C_M_NOSTART;
 		msgs[1].len = len;
 		msgs[1].buf = data;
@@ -211,15 +211,15 @@ static int i2c_bus_write(struct hfi1_devdata *dd, struct hfi1_i2c_bus *i2c,
 	i2c->controlling_dd = dd;
 	ret = i2c_transfer(&i2c->adapter, msgs, num_msgs);
 	if (ret != num_msgs) {
-		dd_dev_err(dd, "%s: bus %d, i2c slave 0x%x, offset 0x%x, len 0x%x; write failed, ret %d\n",
-			   __func__, i2c->num, slave_addr, offset, len, ret);
+		dd_dev_err(dd, "%s: bus %d, i2c client 0x%x, offset 0x%x, len 0x%x; write failed, ret %d\n",
+			   __func__, i2c->num, client_addr, offset, len, ret);
 		return ret < 0 ? ret : -EIO;
 	}
 	return 0;
 }
 
 static int i2c_bus_read(struct hfi1_devdata *dd, struct hfi1_i2c_bus *bus,
-			u8 slave_addr, int offset, int offset_size,
+			u8 client_addr, int offset, int offset_size,
 			u8 *data, u16 len)
 {
 	int ret;
@@ -230,7 +230,7 @@ static int i2c_bus_read(struct hfi1_devdata *dd, struct hfi1_i2c_bus *bus,
 	switch (offset_size) {
 	case 0:
 		num_msgs = 1;
-		msgs[0].addr = slave_addr;
+		msgs[0].addr = client_addr;
 		msgs[0].flags = I2C_M_RD;
 		msgs[0].len = len;
 		msgs[0].buf = data;
@@ -242,12 +242,12 @@ static int i2c_bus_read(struct hfi1_devdata *dd, struct hfi1_i2c_bus *bus,
 		num_msgs = 2;
 		offset_bytes[0] = offset & 0xff;
 
-		msgs[0].addr = slave_addr;
+		msgs[0].addr = client_addr;
 		msgs[0].flags = 0;
 		msgs[0].len = offset_size;
 		msgs[0].buf = offset_bytes;
 
-		msgs[1].addr = slave_addr;
+		msgs[1].addr = client_addr;
 		msgs[1].flags = I2C_M_RD;
 		msgs[1].len = len;
 		msgs[1].buf = data;
@@ -259,8 +259,8 @@ static int i2c_bus_read(struct hfi1_devdata *dd, struct hfi1_i2c_bus *bus,
 	bus->controlling_dd = dd;
 	ret = i2c_transfer(&bus->adapter, msgs, num_msgs);
 	if (ret != num_msgs) {
-		dd_dev_err(dd, "%s: bus %d, i2c slave 0x%x, offset 0x%x, len 0x%x; read failed, ret %d\n",
-			   __func__, bus->num, slave_addr, offset, len, ret);
+		dd_dev_err(dd, "%s: bus %d, i2c client 0x%x, offset 0x%x, len 0x%x; read failed, ret %d\n",
+			   __func__, bus->num, client_addr, offset, len, ret);
 		return ret < 0 ? ret : -EIO;
 	}
 	return 0;
@@ -276,13 +276,13 @@ static int __i2c_write(struct hfi1_pportdata *ppd, u32 target, int i2c_addr,
 {
 	struct hfi1_devdata *dd = ppd->dd;
 	struct hfi1_i2c_bus *bus;
-	u8 slave_addr;
+	u8 client_addr;
 	int offset_size;
 
 	bus = target ? dd->asic_data->i2c_bus1 : dd->asic_data->i2c_bus0;
-	slave_addr = (i2c_addr & 0xff) >> 1; /* convert to 7-bit addr */
+	client_addr = (i2c_addr & 0xff) >> 1; /* convert to 7-bit addr */
 	offset_size = (i2c_addr >> 8) & 0x3;
-	return i2c_bus_write(dd, bus, slave_addr, offset, offset_size, bp, len);
+	return i2c_bus_write(dd, bus, client_addr, offset, offset_size, bp, len);
 }
 
 /*
@@ -315,13 +315,13 @@ static int __i2c_read(struct hfi1_pportdata *ppd, u32 target, int i2c_addr,
 {
 	struct hfi1_devdata *dd = ppd->dd;
 	struct hfi1_i2c_bus *bus;
-	u8 slave_addr;
+	u8 client_addr;
 	int offset_size;
 
 	bus = target ? dd->asic_data->i2c_bus1 : dd->asic_data->i2c_bus0;
-	slave_addr = (i2c_addr & 0xff) >> 1; /* convert to 7-bit addr */
+	client_addr = (i2c_addr & 0xff) >> 1; /* convert to 7-bit addr */
 	offset_size = (i2c_addr >> 8) & 0x3;
-	return i2c_bus_read(dd, bus, slave_addr, offset, offset_size, bp, len);
+	return i2c_bus_read(dd, bus, client_addr, offset, offset_size, bp, len);
 }
 
 /*
diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.c b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
index cf2d29098406..145e2396fd56 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.c
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
@@ -318,7 +318,7 @@ int hfi1_user_exp_rcv_setup(struct hfi1_filedata *fd,
 	tididx = 0;
 
 	/*
-	 * From this point on, we are going to be using shared (between master
+	 * From this point on, we are going to be using shared (between parent
 	 * and subcontexts) context resources. We need to take the lock.
 	 */
 	mutex_lock(&uctxt->exp_mutex);
diff --git a/drivers/infiniband/hw/qib/qib_twsi.c b/drivers/infiniband/hw/qib/qib_twsi.c
index 97b8a2bf5c69..c0bf2211599f 100644
--- a/drivers/infiniband/hw/qib/qib_twsi.c
+++ b/drivers/infiniband/hw/qib/qib_twsi.c
@@ -98,7 +98,7 @@ static void scl_out(struct qib_devdata *dd, u8 bit)
 	dd->f_gpio_mod(dd, 0, bit ? 0 : mask, mask);
 
 	/*
-	 * Allow for slow slaves by simple
+	 * Allow for slow clients by simple
 	 * delay for falling edge, sampling on rise.
 	 */
 	if (!bit)
@@ -292,13 +292,13 @@ int qib_twsi_reset(struct qib_devdata *dd)
 	while (clock_cycles_left--) {
 		scl_out(dd, 0);
 		scl_out(dd, 1);
-		/* Note if SDA is high, but keep clocking to sync slave */
+		/* Note if SDA is high, but keep clocking to sync client */
 		was_high |= sda_in(dd, 0);
 	}
 
 	if (was_high) {
 		/*
-		 * We saw a high, which we hope means the slave is sync'd.
+		 * We saw a high, which we hope means the client is sync'd.
 		 * Issue START, STOP, pause for T_BUF.
 		 */
 
-- 
2.34.1


