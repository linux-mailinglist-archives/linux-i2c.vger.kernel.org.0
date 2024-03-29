Return-Path: <linux-i2c+bounces-2659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA76D89221B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673B61F266B2
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD08136999;
	Fri, 29 Mar 2024 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DapTCqdy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E3013280B;
	Fri, 29 Mar 2024 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731704; cv=none; b=fONJiGpHyy7XlkP/279Au6kokj/daMHS168IiXJrPD4c6VlUfED4u5u7sosX1aHmMe528WLyKRwx89AE9gDgmkrVkxtLhb4RIUi0nVtscHpcxJxWe+3UkGODSOKJRaUkrlWPgyF4QHs2r5W5f6u/k0KchlSD4TPAJFLs04bDoOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731704; c=relaxed/simple;
	bh=ynlrh1NHr726SFwkyMK1QKwpj4OSawHITEtBPmm7yAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LtkHRpcd2640DrooQUTvqsBXbPiMWXlH10hz66MqRBAN0dzs6jGAyhngZVIp7g/y5JcJ3/a9VKjmjF2Uj1zPi10DKLicfC2NcRlnI2JF4ZWdu6Rt/EEqdD2JaP7mFzdDFPmgPcFZMZQaG25kE8B8/sZzye0ASmZVcPRlnW5mi2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=DapTCqdy; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4254C20E6F3E;
	Fri, 29 Mar 2024 10:01:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4254C20E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731701;
	bh=LMxDB4U8piuFU+SwDEiRATO61NO3M/ZS1ekhtLxKdW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DapTCqdyFUVdgvKDrBWEyffgAxLRmwt9yic2m7NHNCzFKqrgs3Jog7oqUEW9qgxks
	 FriTk7RG24I1VrPXIjJ3DpW8s5MhKkvQl2BNXMcY+MdDK9DnoOwO/7+yAWCAwt/j7t
	 maM5vq37UFRT1XmW4qdYCEDvUrQufwdiILmZ7siA=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Evan Quan <evan.quan@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Candice Li <candice.li@amd.com>,
	Ran Sun <sunran001@208suo.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alexander Richards <electrodeyt@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Alan Liu <haoping.liu@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Wayne Lin <wayne.lin@amd.com>,
	Samson Tam <samson.tam@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>,
	Charlene Liu <charlene.liu@amd.com>,
	Sohaib Nadeem <sohaib.nadeem@amd.com>,
	Lewis Huang <lewis.huang@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
	George Shen <george.shen@amd.com>,
	Aric Cyr <aric.cyr@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Le Ma <Le.Ma@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Asad kamal <asad.kamal@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	Darren Powell <darren.powell@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
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
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:26 +0000
Message-Id: <20240329170038.3863998-3-eahariha@linux.microsoft.com>
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
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 16 +++++------
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
 .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
 .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
 .../display/include/grph_object_ctrl_defs.h   |  2 +-
 drivers/gpu/drm/amd/include/atombios.h        |  2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
 .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
 .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
 .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
 .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
 drivers/gpu/drm/radeon/atombios.h             |  2 +-
 drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
 drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++----------
 drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
 drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
 27 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 6857c586ded7..8c2c3f2280cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -614,7 +614,7 @@ bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_device *adev,
 		if ((frev == 3 && crev >= 4) || (frev > 3)) {
 			firmware_info = (union firmware_info *)
 				(mode_info->atom_context->bios + data_offset);
-			/* The ras_rom_i2c_slave_addr should ideally
+			/* The ras_rom_i2c_client_addr should ideally
 			 * be a 19-bit EEPROM address, which would be
 			 * used as is by the driver; see top of
 			 * amdgpu_eeprom.c.
@@ -625,13 +625,13 @@ bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_device *adev,
 			 * leave the check for the pointer.
 			 *
 			 * The reason this works right now is because
-			 * ras_rom_i2c_slave_addr contains the EEPROM
+			 * ras_rom_i2c_client_addr contains the EEPROM
 			 * device type qualifier 1010b in the top 4
 			 * bits.
 			 */
-			if (firmware_info->v34.ras_rom_i2c_slave_addr) {
+			if (firmware_info->v34.ras_rom_i2c_client_addr) {
 				if (i2c_address)
-					*i2c_address = firmware_info->v34.ras_rom_i2c_slave_addr;
+					*i2c_address = firmware_info->v34.ras_rom_i2c_client_addr;
 				return true;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index d79cb13e1aa8..a34626882b67 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -280,7 +280,7 @@ amdgpu_i2c_lookup(struct amdgpu_device *adev,
 }
 
 static void amdgpu_i2c_get_byte(struct amdgpu_i2c_chan *i2c_bus,
-				 u8 slave_addr,
+				 u8 client_addr,
 				 u8 addr,
 				 u8 *val)
 {
@@ -288,13 +288,13 @@ static void amdgpu_i2c_get_byte(struct amdgpu_i2c_chan *i2c_bus,
 	u8 in_buf[2];
 	struct i2c_msg msgs[] = {
 		{
-			.addr = slave_addr,
+			.addr = client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = slave_addr,
+			.addr = client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -314,13 +314,13 @@ static void amdgpu_i2c_get_byte(struct amdgpu_i2c_chan *i2c_bus,
 }
 
 static void amdgpu_i2c_put_byte(struct amdgpu_i2c_chan *i2c_bus,
-				 u8 slave_addr,
+				 u8 client_addr,
 				 u8 addr,
 				 u8 val)
 {
 	uint8_t out_buf[2];
 	struct i2c_msg msg = {
-		.addr = slave_addr,
+		.addr = client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
index a6501114322f..6a396ca6d1d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
@@ -36,7 +36,7 @@
 #define ATOM_MAX_HW_I2C_READ  255
 
 static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
-				       u8 slave_addr, u8 flags,
+				       u8 client_addr, u8 flags,
 				       u8 *buf, u8 num)
 {
 	struct drm_device *dev = chan->dev;
@@ -83,7 +83,7 @@ static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
 	args.ucFlag = flags;
 	args.ucI2CSpeed = TARGET_HW_I2C_CLOCK;
 	args.ucTransBytes = num;
-	args.ucSlaveAddr = slave_addr << 1;
+	args.ucClientAddr = client_addr << 1;
 	args.ucLineNumber = chan->rec.i2c_id;
 
 	amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
@@ -159,7 +159,7 @@ u32 amdgpu_atombios_i2c_func(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
-void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 slave_addr, u8 line_number, u8 offset, u8 data)
+void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 client_addr, u8 line_number, u8 offset, u8 data)
 {
 	PROCESS_I2C_CHANNEL_TRANSACTION_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, ProcessI2cChannelTransaction);
@@ -169,7 +169,7 @@ void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 slave_addr
 	args.ucFlag = 1;
 	args.ucI2CSpeed = TARGET_HW_I2C_CLOCK;
 	args.ucTransBytes = 1;
-	args.ucSlaveAddr = slave_addr;
+	args.ucClientAddr = client_addr;
 	args.ucLineNumber = line_number;
 
 	amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index dd2d66090d23..f2fc96d1cd7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -229,7 +229,7 @@ static uint32_t smu_v11_0_i2c_poll_rx_status(struct i2c_adapter *control)
 
 	reg_c_tx_abrt_source = RREG32_SOC15(SMUIO, 0, mmCKSVII2C_IC_TX_ABRT_SOURCE);
 
-	/* If slave is not present */
+	/* If client is not present */
 	if (REG_GET_FIELD(reg_c_tx_abrt_source,
 			  CKSVII2C_IC_TX_ABRT_SOURCE,
 			  ABRT_7B_ADDR_NOACK) == 1) {
@@ -255,10 +255,10 @@ static uint32_t smu_v11_0_i2c_poll_rx_status(struct i2c_adapter *control)
 }
 
 /**
- * smu_v11_0_i2c_transmit - Send a block of data over the I2C bus to a slave device.
+ * smu_v11_0_i2c_transmit - Send a block of data over the I2C bus to a client device.
  *
  * @control: I2C adapter reference
- * @address: The I2C address of the slave device.
+ * @address: The I2C address of the client device.
  * @data: The data to transmit over the bus.
  * @numbytes: The amount of data to transmit.
  * @i2c_flag: Flags for transmission
@@ -284,7 +284,7 @@ static uint32_t smu_v11_0_i2c_transmit(struct i2c_adapter *control,
 			       16, 1, data, numbytes, false);
 	}
 
-	/* Set the I2C slave address */
+	/* Set the I2C client address */
 	smu_v11_0_i2c_set_address(control, address);
 	/* Enable I2C */
 	smu_v11_0_i2c_enable(control, true);
@@ -354,10 +354,10 @@ static uint32_t smu_v11_0_i2c_transmit(struct i2c_adapter *control,
 
 
 /**
- * smu_v11_0_i2c_receive - Receive a block of data over the I2C bus from a slave device.
+ * smu_v11_0_i2c_receive - Receive a block of data over the I2C bus from a client device.
  *
  * @control: I2C adapter reference
- * @address: The I2C address of the slave device.
+ * @address: The I2C address of the client device.
  * @data: Placeholder to store received data.
  * @numbytes: The amount of data to transmit.
  * @i2c_flag: Flags for transmission
@@ -374,7 +374,7 @@ static uint32_t smu_v11_0_i2c_receive(struct i2c_adapter *control,
 
 	bytes_received = 0;
 
-	/* Set the I2C slave address */
+	/* Set the I2C client address */
 	smu_v11_0_i2c_set_address(control, address);
 
 	/* Enable I2C */
@@ -509,7 +509,7 @@ static void smu_v11_0_i2c_init(struct i2c_adapter *control)
 	if (res != I2C_OK)
 		smu_v11_0_i2c_abort(control);
 
-	/* Configure I2C to operate as master and in standard mode */
+	/* Configure I2C to operate as host and in standard mode */
 	smu_v11_0_i2c_configure(control);
 
 	/* Initialize the clock to 50 kHz default */
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 6450853fea94..16c6a3997c8e 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -1871,7 +1871,7 @@ static enum bp_result get_gpio_i2c_info(struct bios_parser *bp,
 	info->i2c_hw_assist = record->sucI2cId.bfHW_Capable;
 	info->i2c_line = record->sucI2cId.bfI2C_LineMux;
 	info->i2c_engine_id = record->sucI2cId.bfHW_EngineID;
-	info->i2c_slave_address = record->ucI2CAddr;
+	info->i2c_client_address = record->ucI2CAddr;
 
 	info->gpio_info.clk_mask_register_index =
 			le16_to_cpu(header->asGPIO_Info[info->i2c_line].usClkMaskRegisterIndex);
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 05f392501c0a..33725f5ef72f 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -511,7 +511,7 @@ static enum bp_result get_gpio_i2c_info(
 	info->i2c_hw_assist = (record->i2c_id & I2C_HW_CAP) ? true : false;
 	info->i2c_line = record->i2c_id & I2C_HW_LANE_MUX;
 	info->i2c_engine_id = (record->i2c_id & I2C_HW_ENGINE_ID_MASK) >> 4;
-	info->i2c_slave_address = record->i2c_slave_addr;
+	info->i2c_client_address = record->i2c_client_addr;
 
 	/* TODO: check how to get register offset for en, Y, etc. */
 	info->gpio_info.clk_a_register_index = le16_to_cpu(pin->data_a_reg_index);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index c6c35037bdb8..6f922fea3fbe 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -141,13 +141,13 @@ bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx)
 
 bool dc_is_oem_i2c_device_present(
 	struct dc *dc,
-	size_t slave_address)
+	size_t client_address)
 {
 	if (dc->res_pool->oem_device)
 		return dce_i2c_oem_device_present(
 			dc->res_pool,
 			dc->res_pool->oem_device,
-			slave_address);
+			client_address);
 
 	return false;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index ee8453bf958f..f13db28ee5ac 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1803,7 +1803,7 @@ int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 
 bool dc_is_oem_i2c_device_present(
 	struct dc *dc,
-	size_t slave_address
+	size_t client_address
 );
 
 /* return true if the connected receiver supports the hdcp version */
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
index f5cd2392fc5f..e4036d9c2d9e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
@@ -28,7 +28,7 @@
 bool dce_i2c_oem_device_present(
 	struct resource_pool *pool,
 	struct ddc_service *ddc,
-	size_t slave_address
+	size_t client_address
 )
 {
 	struct dc *dc = ddc->ctx->dc;
@@ -45,7 +45,7 @@ bool dce_i2c_oem_device_present(
 	if (dcb->funcs->get_i2c_info(dcb, id, &i2c_info) != BP_RESULT_OK)
 		return false;
 
-	if (i2c_info.i2c_slave_address != slave_address)
+	if (i2c_info.i2c_client_address != client_address)
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 813463ffe15c..27aae2e03ef7 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -92,7 +92,7 @@ struct graphics_object_i2c_info {
 	bool i2c_hw_assist;
 	uint32_t i2c_line;
 	uint32_t i2c_engine_id;
-	uint32_t i2c_slave_address;
+	uint32_t i2c_client_address;
 };
 
 struct graphics_object_hpd_info {
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71bc9..94edf684db97 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -8503,7 +8503,7 @@ typedef struct _PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS
    USHORT  lpI2CDataOut;
   UCHAR   ucFlag;
   UCHAR   ucTransBytes;
-  UCHAR   ucSlaveAddr;
+  UCHAR   ucClientAddr;
   UCHAR   ucLineNumber;
 }PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS;
 
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index af3eebb4c9bc..1760a36c19a5 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -534,7 +534,7 @@ struct atom_firmware_info_v3_2 {
   uint32_t mc_baseaddr_low;
   uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
   uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-  uint8_t  board_i2c_feature_slave_addr;
+  uint8_t  board_i2c_feature_client_addr;
   uint8_t  reserved3;
   uint16_t bootup_mvddq_mv;
   uint16_t bootup_mvpp_mv;
@@ -562,7 +562,7 @@ struct atom_firmware_info_v3_3
   uint32_t mc_baseaddr_low;
   uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
   uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-  uint8_t  board_i2c_feature_slave_addr;
+  uint8_t  board_i2c_feature_client_addr;
   uint8_t  reserved3;
   uint16_t bootup_mvddq_mv;
   uint16_t bootup_mvpp_mv;
@@ -590,8 +590,8 @@ struct atom_firmware_info_v3_4 {
 	uint32_t mc_baseaddr_low;
 	uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
 	uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-	uint8_t  board_i2c_feature_slave_addr;
-	uint8_t  ras_rom_i2c_slave_addr;
+	uint8_t  board_i2c_feature_client_addr;
+	uint8_t  ras_rom_i2c_client_addr;
 	uint16_t bootup_mvddq_mv;
 	uint16_t bootup_mvpp_mv;
 	uint32_t zfbstartaddrin16mb;
@@ -626,8 +626,8 @@ struct atom_firmware_info_v3_5 {
   uint32_t mc_baseaddr_low;
   uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
   uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-  uint8_t  board_i2c_feature_slave_addr;
-  uint8_t  ras_rom_i2c_slave_addr;
+  uint8_t  board_i2c_feature_client_addr;
+  uint8_t  ras_rom_i2c_client_addr;
   uint32_t bootup_voltage_reserved1;
   uint32_t zfb_reserved;
   // if pplib_pptable_id!=0, pplib get powerplay table inside driver instead of from VBIOS
@@ -830,7 +830,7 @@ struct atom_i2c_record
 {
   struct atom_common_record_header record_header;   //record_type = ATOM_I2C_RECORD_TYPE
   uint8_t i2c_id; 
-  uint8_t i2c_slave_addr;                   //The slave address, it's 0 when the record is attached to connector for DDC
+  uint8_t i2c_client_addr;                   //The client address, it's 0 when the record is attached to connector for DDC
 };
 
 struct atom_hpd_int_record
@@ -2026,7 +2026,7 @@ struct atom_smu_info_v3_5
   uint16_t smuinitoffset;
   uint32_t bootup_dprefclk_10khz;
   uint32_t bootup_usbclk_10khz;
-  uint32_t smb_slave_address;
+  uint32_t smb_client_address;
   uint32_t cg_fdo_ctrl0_val;
   uint32_t cg_fdo_ctrl1_val;
   uint32_t cg_fdo_ctrl2_val;
@@ -2083,7 +2083,7 @@ struct atom_smu_info_v3_6
 	uint16_t smuinitoffset;
 	uint32_t bootup_gfxavsclk_10khz;
 	uint32_t bootup_mpioclk_10khz;
-	uint32_t smb_slave_address;
+	uint32_t smb_client_address;
 	uint32_t cg_fdo_ctrl0_val;
 	uint32_t cg_fdo_ctrl1_val;
 	uint32_t cg_fdo_ctrl2_val;
@@ -2138,7 +2138,7 @@ struct atom_smu_info_v4_0 {
 	uint16_t smuinitoffset;
 	uint32_t bootup_dprefclk_10khz;
 	uint32_t bootup_usbclk_10khz;
-	uint32_t smb_slave_address;
+	uint32_t smb_client_address;
 	uint32_t cg_fdo_ctrl0_val;
 	uint32_t cg_fdo_ctrl1_val;
 	uint32_t cg_fdo_ctrl2_val;
@@ -2349,7 +2349,7 @@ struct atom_smc_dpm_info_v4_3
 
 struct smudpm_i2ccontrollerconfig_t {
   uint32_t  enabled;
-  uint32_t  slaveaddress;
+  uint32_t  clientaddress;
   uint32_t  controllerport;
   uint32_t  controllername;
   uint32_t  thermalthrottler;
@@ -3510,7 +3510,7 @@ struct  atom_i2c_voltage_object_v4
    struct atom_voltage_object_header_v4 header;  // voltage mode = VOLTAGE_OBJ_VR_I2C_INIT_SEQ
    uint8_t  regulator_id;                        //Indicate Voltage Regulator Id
    uint8_t  i2c_id;
-   uint8_t  i2c_slave_addr;
+   uint8_t  i2c_client_addr;
    uint8_t  i2c_control_offset;       
    uint8_t  i2c_flag;                            // Bit0: 0 - One byte data; 1 - Two byte data
    uint8_t  i2c_speed;                           // =0, use default i2c speed, otherwise use it in unit of kHz. 
@@ -4152,7 +4152,7 @@ struct process_i2c_channel_transaction_parameters
   uint16_t  i2c_data_out;
   uint8_t   flag;                    /* enum atom_process_i2c_status */
   uint8_t   trans_bytes;
-  uint8_t   slave_addr;
+  uint8_t   client_addr;
   uint8_t   i2c_id;
 };
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
index 79c817752a33..c0b421b85c14 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
@@ -784,8 +784,8 @@ static int append_vbios_pptable(struct pp_hwmgr *hwmgr, PPTable_t *ppsmc_pptable
 	for (i = 0; i < I2C_CONTROLLER_NAME_COUNT; i++) {
 		ppsmc_pptable->I2cControllers[i].Enabled =
 			smc_dpm_table->i2ccontrollers[i].enabled;
-		ppsmc_pptable->I2cControllers[i].SlaveAddress =
-			smc_dpm_table->i2ccontrollers[i].slaveaddress;
+		ppsmc_pptable->I2cControllers[i].ClientAddress =
+			smc_dpm_table->i2ccontrollers[i].clientaddress;
 		ppsmc_pptable->I2cControllers[i].ControllerPort =
 			smc_dpm_table->i2ccontrollers[i].controllerport;
 		ppsmc_pptable->I2cControllers[i].ThermalThrottler =
diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h
index c2efc70ef288..82d2ee1ee9bb 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h
@@ -287,7 +287,7 @@ typedef enum {
 
 typedef struct {
   uint32_t Enabled;
-  uint32_t SlaveAddress;
+  uint32_t ClientAddress;
   uint32_t ControllerPort;
   uint32_t ControllerName;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
index d518dee18e1b..b4d29f14ae31 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
@@ -263,7 +263,7 @@ typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
   uint8_t   Padding[2];
-  uint32_t  SlaveAddress;
+  uint32_t  ClientAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
index c5c1943fb6a1..9952eff1856d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
@@ -267,7 +267,7 @@ typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
   uint8_t   Padding[2];
-  uint32_t  SlaveAddress;
+  uint32_t  ClientAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
index aa6d29de4002..09fe241a449b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
@@ -342,7 +342,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;  
+  uint8_t   ClientAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h
index cddf45eebee8..e16617173538 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h
@@ -167,7 +167,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;
+  uint8_t   ClientAddress;
   uint8_t   ControllerPort;
   uint8_t   ThermalThrotter;
   uint8_t   I2cProtocol;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
index b114d14fc053..37a8f8f116bb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
@@ -319,7 +319,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;
+  uint8_t   ClientAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
index 8b1496f8ce58..e1c2eeaa08d0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
@@ -320,7 +320,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;
+  uint8_t   ClientAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 0c2d04f978ac..87bfb2580ff7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -1909,8 +1909,8 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
 		dev_info(smu->adev->dev, "                   .Enabled = %d\n",
 				pptable->I2cControllers[i].Enabled);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
+		dev_info(smu->adev->dev, "                   .ClientAddress = 0x%x\n",
+				pptable->I2cControllers[i].ClientAddress);
 		dev_info(smu->adev->dev, "                   .ControllerPort = %d\n",
 				pptable->I2cControllers[i].ControllerPort);
 		dev_info(smu->adev->dev, "                   .ControllerName = %d\n",
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 1f18b61884f3..65a9e10ffd8a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2988,8 +2988,8 @@ static void beige_goby_dump_pptable(struct smu_context *smu)
 				pptable->I2cControllers[i].Enabled);
 		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
 				pptable->I2cControllers[i].Speed);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
+		dev_info(smu->adev->dev, "                   .ClientAddress = 0x%x\n",
+				pptable->I2cControllers[i].ClientAddress);
 		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
 				pptable->I2cControllers[i].ControllerPort);
 		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
@@ -3627,8 +3627,8 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 				pptable->I2cControllers[i].Enabled);
 		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
 				pptable->I2cControllers[i].Speed);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
+		dev_info(smu->adev->dev, "                   .ClientAddress = 0x%x\n",
+				pptable->I2cControllers[i].ClientAddress);
 		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
 				pptable->I2cControllers[i].ControllerPort);
 		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 2db40789235c..5ec4609114c1 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -7229,7 +7229,7 @@ typedef struct _PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS
 	USHORT  lpI2CDataOut;
   UCHAR   ucFlag;               
   UCHAR   ucTransBytes;
-  UCHAR   ucSlaveAddr;
+  UCHAR   ucClientAddr;
   UCHAR   ucLineNumber;
 }PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS;
 
diff --git a/drivers/gpu/drm/radeon/atombios_i2c.c b/drivers/gpu/drm/radeon/atombios_i2c.c
index 730f0b25312b..2000d35b9a1f 100644
--- a/drivers/gpu/drm/radeon/atombios_i2c.c
+++ b/drivers/gpu/drm/radeon/atombios_i2c.c
@@ -34,7 +34,7 @@
 #define ATOM_MAX_HW_I2C_READ  255
 
 static int radeon_process_i2c_ch(struct radeon_i2c_chan *chan,
-				 u8 slave_addr, u8 flags,
+				 u8 client_addr, u8 flags,
 				 u8 *buf, int num)
 {
 	struct drm_device *dev = chan->dev;
@@ -75,7 +75,7 @@ static int radeon_process_i2c_ch(struct radeon_i2c_chan *chan,
 	args.ucFlag = flags;
 	args.ucI2CSpeed = TARGET_HW_I2C_CLOCK;
 	args.ucTransBytes = num;
-	args.ucSlaveAddr = slave_addr << 1;
+	args.ucClientAddr = client_addr << 1;
 	args.ucLineNumber = chan->rec.i2c_id;
 
 	atom_execute_table_scratch_unlocked(rdev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 6952b1273b0f..cf5c6f1e4a61 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -1398,7 +1398,7 @@ bool radeon_legacy_get_ext_tmds_info_from_table(struct radeon_encoder *encoder,
 	case CT_MINI_EXTERNAL:
 	default:
 		tmds->dvo_chip = DVO_SIL164;
-		tmds->slave_addr = 0x70 >> 1; /* 7 bit addressing */
+		tmds->client_addr = 0x70 >> 1; /* 7 bit addressing */
 		break;
 	}
 
@@ -1420,14 +1420,14 @@ bool radeon_legacy_get_ext_tmds_info_from_combios(struct radeon_encoder *encoder
 		i2c_bus = combios_setup_i2c_bus(rdev, DDC_MONID, 0, 0);
 		tmds->i2c_bus = radeon_i2c_lookup(rdev, &i2c_bus);
 		tmds->dvo_chip = DVO_SIL164;
-		tmds->slave_addr = 0x70 >> 1; /* 7 bit addressing */
+		tmds->client_addr = 0x70 >> 1; /* 7 bit addressing */
 	} else {
 		offset = combios_get_table_offset(dev, COMBIOS_EXT_TMDS_INFO_TABLE);
 		if (offset) {
 			ver = RBIOS8(offset);
 			DRM_DEBUG_KMS("External TMDS Table revision: %d\n", ver);
-			tmds->slave_addr = RBIOS8(offset + 4 + 2);
-			tmds->slave_addr >>= 1; /* 7 bit addressing */
+			tmds->client_addr = RBIOS8(offset + 4 + 2);
+			tmds->client_addr >>= 1; /* 7 bit addressing */
 			gpio = RBIOS8(offset + 4 + 3);
 			if (gpio == DDC_LCD) {
 				/* MM i2c */
@@ -2846,19 +2846,19 @@ void radeon_external_tmds_setup(struct drm_encoder *encoder)
 	case DVO_SIL164:
 		/* sil 164 */
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				    tmds->slave_addr,
+				    tmds->client_addr,
 				    0x08, 0x30);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				       tmds->slave_addr,
+				       tmds->client_addr,
 				       0x09, 0x00);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				    tmds->slave_addr,
+				    tmds->client_addr,
 				    0x0a, 0x90);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				    tmds->slave_addr,
+				    tmds->client_addr,
 				    0x0c, 0x89);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				       tmds->slave_addr,
+				       tmds->client_addr,
 				       0x08, 0x3b);
 		break;
 	case DVO_SIL1178:
@@ -2887,7 +2887,7 @@ bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint16_t offset;
-	uint8_t blocks, slave_addr, rev;
+	uint8_t blocks, client_addr, rev;
 	uint32_t index, id;
 	uint32_t reg, val, and_mask, or_mask;
 	struct radeon_encoder_ext_tmds *tmds = radeon_encoder->enc_priv;
@@ -2934,15 +2934,15 @@ bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 						mdelay(val);
 						break;
 					case 6:
-						slave_addr = id & 0xff;
-						slave_addr >>= 1; /* 7 bit addressing */
+						client_addr = id & 0xff;
+						client_addr >>= 1; /* 7 bit addressing */
 						index++;
 						reg = RBIOS8(index);
 						index++;
 						val = RBIOS8(index);
 						index++;
 						radeon_i2c_put_byte(tmds->i2c_bus,
-								    slave_addr,
+								    client_addr,
 								    reg, val);
 						break;
 					default:
@@ -2997,7 +2997,7 @@ bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 					val = RBIOS8(index);
 					index += 1;
 					radeon_i2c_put_byte(tmds->i2c_bus,
-							    tmds->slave_addr,
+							    tmds->client_addr,
 							    reg, val);
 					break;
 				default:
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 3d174390a8af..565d59536e9a 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -1038,7 +1038,7 @@ struct radeon_i2c_chan *radeon_i2c_lookup(struct radeon_device *rdev,
 }
 
 void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
-			 u8 slave_addr,
+			 u8 client_addr,
 			 u8 addr,
 			 u8 *val)
 {
@@ -1046,13 +1046,13 @@ void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
 	u8 in_buf[2];
 	struct i2c_msg msgs[] = {
 		{
-			.addr = slave_addr,
+			.addr = client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = slave_addr,
+			.addr = client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -1072,13 +1072,13 @@ void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
 }
 
 void radeon_i2c_put_byte(struct radeon_i2c_chan *i2c_bus,
-			 u8 slave_addr,
+			 u8 client_addr,
 			 u8 addr,
 			 u8 val)
 {
 	uint8_t out_buf[2];
 	struct i2c_msg msg = {
-		.addr = slave_addr,
+		.addr = client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 546381a5c918..9ae5ed661c75 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -409,7 +409,7 @@ struct radeon_encoder_int_tmds {
 struct radeon_encoder_ext_tmds {
 	/* tmds over dvo */
 	struct radeon_i2c_chan *i2c_bus;
-	uint8_t slave_addr;
+	uint8_t client_addr;
 	enum radeon_dvo_chip dvo_chip;
 };
 
@@ -749,11 +749,11 @@ extern struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 						 const char *name);
 extern void radeon_i2c_destroy(struct radeon_i2c_chan *i2c);
 extern void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
-				u8 slave_addr,
+				u8 client_addr,
 				u8 addr,
 				u8 *val);
 extern void radeon_i2c_put_byte(struct radeon_i2c_chan *i2c,
-				u8 slave_addr,
+				u8 client_addr,
 				u8 addr,
 				u8 val);
 extern void radeon_router_select_ddc_port(struct radeon_connector *radeon_connector);
-- 
2.34.1


