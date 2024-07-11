Return-Path: <linux-i2c+bounces-4871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB8A92DF80
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B45B71F2170B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 05:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B833A77105;
	Thu, 11 Jul 2024 05:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Wo3tLcA6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2A05CDE9;
	Thu, 11 Jul 2024 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675732; cv=none; b=LJKWwXeqqh7B5bZojOUawgNbU4FZUMyHwgfCHoWR+EANRdJjV618Eztun9IpfeUkF/QWe/OoQGlxm9hzm/99371zGkCH8oxWhBZAoyRjQpudfnhVcdm4whefqhYPnBXdwXtEQDG7t34LXgUzwbKWKdMi1J0XdFBh1pS8jYmrtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675732; c=relaxed/simple;
	bh=42ddMbWbaevg+UJi46EbPPsTjWbL/IsTlo3Vaqb89ys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5nVANknYJbEbTSk/hxB+2gdRQzzBcaXmjKhNpvllkJTvQuWTFnnCxF1QIMZc2jYIkcE2MbXoVt8X1d/pwIQQl3HvWrNeVtc51UFFFaq5yhsdWUXbPM+gOAc2ChdkXEtwkFaHrig5zUx4hHbkCzKJ4exFBOPGQvdrwleVINGboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Wo3tLcA6; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4FD8F20B7165;
	Wed, 10 Jul 2024 22:28:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4FD8F20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1720675729;
	bh=t6PKcXtRl0TuNZhA/WW8m6MJdvXITTyyekjOk1bgJpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wo3tLcA6DKie9YkQ6zlS4rWwiGurRhcqXHji8Fgui57F8zpFUFAjmT68095sYAKT3
	 AKiNC3aM8zp6aLFnHgL+VYbeTxvkXYhE+sVUJp5GHxxpKyBu+RFtdJal1C/uhgjXsE
	 K+js0KSehtJA+Ld9SaixcRg/e0vFNwqhoghhY/84=
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
	Li Ma <li.ma@amd.com>,
	Ran Sun <sunran001@208suo.com>,
	Likun Gao <Likun.Gao@amd.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alexander Richards <electrodeyt@gmail.com>,
	Bob Zhou <bob.zhou@amd.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Wayne Lin <wayne.lin@amd.com>,
	Samson Tam <samson.tam@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>,
	Charlene Liu <charlene.liu@amd.com>,
	Sohaib Nadeem <sohaib.nadeem@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Wenjing Liu <wenjing.liu@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	George Shen <george.shen@amd.com>,
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
	Aric Cyr <aric.cyr@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Darren Powell <darren.powell@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	Le Ma <le.ma@amd.com>,
	Umio Yasuno <coelacanth_dream@protonmail.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v4 1/6] drm/amdgpu, drm/radeon: Make I2C terminology more inclusive
Date: Thu, 11 Jul 2024 05:27:29 +0000
Message-Id: <20240711052734.1273652-2-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
the approved verbiage exists in the specification.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
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
 drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
 drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
 drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++----------
 drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
 drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
 28 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 2e13c7c4b2b41..d68cd8dcb692a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -630,7 +630,7 @@ bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_device *adev,
 		if ((frev == 3 && crev >= 4) || (frev > 3)) {
 			firmware_info = (union firmware_info *)
 				(mode_info->atom_context->bios + data_offset);
-			/* The ras_rom_i2c_slave_addr should ideally
+			/* The ras_rom_i2c_target_addr should ideally
 			 * be a 19-bit EEPROM address, which would be
 			 * used as is by the driver; see top of
 			 * amdgpu_eeprom.c.
@@ -641,13 +641,13 @@ bool amdgpu_atomfirmware_ras_rom_addr(struct amdgpu_device *adev,
 			 * leave the check for the pointer.
 			 *
 			 * The reason this works right now is because
-			 * ras_rom_i2c_slave_addr contains the EEPROM
+			 * ras_rom_i2c_target_addr contains the EEPROM
 			 * device type qualifier 1010b in the top 4
 			 * bits.
 			 */
-			if (firmware_info->v34.ras_rom_i2c_slave_addr) {
+			if (firmware_info->v34.ras_rom_i2c_target_addr) {
 				if (i2c_address)
-					*i2c_address = firmware_info->v34.ras_rom_i2c_slave_addr;
+					*i2c_address = firmware_info->v34.ras_rom_i2c_target_addr;
 				return true;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 00d6211e0fbf9..1d99e9a630aa7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -280,7 +280,7 @@ amdgpu_i2c_lookup(struct amdgpu_device *adev,
 }
 
 static int amdgpu_i2c_get_byte(struct amdgpu_i2c_chan *i2c_bus,
-				 u8 slave_addr,
+				 u8 target_addr,
 				 u8 addr,
 				 u8 *val)
 {
@@ -288,13 +288,13 @@ static int amdgpu_i2c_get_byte(struct amdgpu_i2c_chan *i2c_bus,
 	u8 in_buf[2];
 	struct i2c_msg msgs[] = {
 		{
-			.addr = slave_addr,
+			.addr = target_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = slave_addr,
+			.addr = target_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -316,13 +316,13 @@ static int amdgpu_i2c_get_byte(struct amdgpu_i2c_chan *i2c_bus,
 }
 
 static int amdgpu_i2c_put_byte(struct amdgpu_i2c_chan *i2c_bus,
-				 u8 slave_addr,
+				 u8 target_addr,
 				 u8 addr,
 				 u8 val)
 {
 	uint8_t out_buf[2];
 	struct i2c_msg msg = {
-		.addr = slave_addr,
+		.addr = target_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
index a6501114322fd..a7d3c3d2c6334 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
@@ -36,7 +36,7 @@
 #define ATOM_MAX_HW_I2C_READ  255
 
 static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
-				       u8 slave_addr, u8 flags,
+				       u8 target_addr, u8 flags,
 				       u8 *buf, u8 num)
 {
 	struct drm_device *dev = chan->dev;
@@ -83,7 +83,7 @@ static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
 	args.ucFlag = flags;
 	args.ucI2CSpeed = TARGET_HW_I2C_CLOCK;
 	args.ucTransBytes = num;
-	args.ucSlaveAddr = slave_addr << 1;
+	args.ucTargetAddr = target_addr << 1;
 	args.ucLineNumber = chan->rec.i2c_id;
 
 	amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
@@ -159,7 +159,7 @@ u32 amdgpu_atombios_i2c_func(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
-void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 slave_addr, u8 line_number, u8 offset, u8 data)
+void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 target_addr, u8 line_number, u8 offset, u8 data)
 {
 	PROCESS_I2C_CHANNEL_TRANSACTION_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, ProcessI2cChannelTransaction);
@@ -169,7 +169,7 @@ void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 slave_addr
 	args.ucFlag = 1;
 	args.ucI2CSpeed = TARGET_HW_I2C_CLOCK;
 	args.ucTransBytes = 1;
-	args.ucSlaveAddr = slave_addr;
+	args.ucTargetAddr = target_addr;
 	args.ucLineNumber = line_number;
 
 	amdgpu_atom_execute_table(adev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.h b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.h
index 251aaf41f65d5..13e683896ef6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.h
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.h
@@ -28,6 +28,6 @@ int amdgpu_atombios_i2c_xfer(struct i2c_adapter *i2c_adap,
 		      struct i2c_msg *msgs, int num);
 u32 amdgpu_atombios_i2c_func(struct i2c_adapter *adap);
 void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device* adev,
-		u8 slave_addr, u8 line_number, u8 offset, u8 data);
+		u8 target_addr, u8 line_number, u8 offset, u8 data);
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index dd2d66090d237..b91ed6050541f 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -229,7 +229,7 @@ static uint32_t smu_v11_0_i2c_poll_rx_status(struct i2c_adapter *control)
 
 	reg_c_tx_abrt_source = RREG32_SOC15(SMUIO, 0, mmCKSVII2C_IC_TX_ABRT_SOURCE);
 
-	/* If slave is not present */
+	/* If target is not present */
 	if (REG_GET_FIELD(reg_c_tx_abrt_source,
 			  CKSVII2C_IC_TX_ABRT_SOURCE,
 			  ABRT_7B_ADDR_NOACK) == 1) {
@@ -255,10 +255,10 @@ static uint32_t smu_v11_0_i2c_poll_rx_status(struct i2c_adapter *control)
 }
 
 /**
- * smu_v11_0_i2c_transmit - Send a block of data over the I2C bus to a slave device.
+ * smu_v11_0_i2c_transmit - Send a block of data over the I2C bus to a target device.
  *
  * @control: I2C adapter reference
- * @address: The I2C address of the slave device.
+ * @address: The I2C address of the target device.
  * @data: The data to transmit over the bus.
  * @numbytes: The amount of data to transmit.
  * @i2c_flag: Flags for transmission
@@ -284,7 +284,7 @@ static uint32_t smu_v11_0_i2c_transmit(struct i2c_adapter *control,
 			       16, 1, data, numbytes, false);
 	}
 
-	/* Set the I2C slave address */
+	/* Set the I2C target address */
 	smu_v11_0_i2c_set_address(control, address);
 	/* Enable I2C */
 	smu_v11_0_i2c_enable(control, true);
@@ -354,10 +354,10 @@ static uint32_t smu_v11_0_i2c_transmit(struct i2c_adapter *control,
 
 
 /**
- * smu_v11_0_i2c_receive - Receive a block of data over the I2C bus from a slave device.
+ * smu_v11_0_i2c_receive - Receive a block of data over the I2C bus from a target device.
  *
  * @control: I2C adapter reference
- * @address: The I2C address of the slave device.
+ * @address: The I2C address of the target device.
  * @data: Placeholder to store received data.
  * @numbytes: The amount of data to transmit.
  * @i2c_flag: Flags for transmission
@@ -374,7 +374,7 @@ static uint32_t smu_v11_0_i2c_receive(struct i2c_adapter *control,
 
 	bytes_received = 0;
 
-	/* Set the I2C slave address */
+	/* Set the I2C target address */
 	smu_v11_0_i2c_set_address(control, address);
 
 	/* Enable I2C */
@@ -509,7 +509,7 @@ static void smu_v11_0_i2c_init(struct i2c_adapter *control)
 	if (res != I2C_OK)
 		smu_v11_0_i2c_abort(control);
 
-	/* Configure I2C to operate as master and in standard mode */
+	/* Configure I2C to operate as controller and in standard mode */
 	smu_v11_0_i2c_configure(control);
 
 	/* Initialize the clock to 50 kHz default */
@@ -650,11 +650,11 @@ static int smu_v11_0_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 	smu_v11_0_i2c_init(i2c_adap);
 
-	/* From the client's point of view, this sequence of
+	/* From the target's point of view, this sequence of
 	 * messages-- the array i2c_msg *msg, is a single transaction
 	 * on the bus, starting with START and ending with STOP.
 	 *
-	 * The client is welcome to send any sequence of messages in
+	 * The target is welcome to send any sequence of messages in
 	 * this array, as processing under this function here is
 	 * striving to be agnostic.
 	 *
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index bc16db69a6636..36283ebf897b9 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -1870,7 +1870,7 @@ static enum bp_result get_gpio_i2c_info(struct bios_parser *bp,
 	info->i2c_hw_assist = record->sucI2cId.bfHW_Capable;
 	info->i2c_line = record->sucI2cId.bfI2C_LineMux;
 	info->i2c_engine_id = record->sucI2cId.bfHW_EngineID;
-	info->i2c_slave_address = record->ucI2CAddr;
+	info->i2c_target_address = record->ucI2CAddr;
 
 	info->gpio_info.clk_mask_register_index =
 			le16_to_cpu(header->asGPIO_Info[info->i2c_line].usClkMaskRegisterIndex);
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 9fe0020bcb9c2..adf68b84901d4 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -511,7 +511,7 @@ static enum bp_result get_gpio_i2c_info(
 	info->i2c_hw_assist = (record->i2c_id & I2C_HW_CAP) ? true : false;
 	info->i2c_line = record->i2c_id & I2C_HW_LANE_MUX;
 	info->i2c_engine_id = (record->i2c_id & I2C_HW_ENGINE_ID_MASK) >> 4;
-	info->i2c_slave_address = record->i2c_slave_addr;
+	info->i2c_target_address = record->i2c_target_addr;
 
 	/* TODO: check how to get register offset for en, Y, etc. */
 	info->gpio_info.clk_a_register_index = le16_to_cpu(pin->data_a_reg_index);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index c6c35037bdb8b..9d2ec5fce4ae0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -141,13 +141,13 @@ bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx)
 
 bool dc_is_oem_i2c_device_present(
 	struct dc *dc,
-	size_t slave_address)
+	size_t target_address)
 {
 	if (dc->res_pool->oem_device)
 		return dce_i2c_oem_device_present(
 			dc->res_pool,
 			dc->res_pool->oem_device,
-			slave_address);
+			target_address);
 
 	return false;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 3c33c3bcbe2cb..237bc188f8bfd 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1842,7 +1842,7 @@ int dc_link_aux_transfer_raw(struct ddc_service *ddc,
 
 bool dc_is_oem_i2c_device_present(
 	struct dc *dc,
-	size_t slave_address
+	size_t target_address
 );
 
 /* return true if the connected receiver supports the hdcp version */
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
index f5cd2392fc5f7..f4c83d322350a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
@@ -28,7 +28,7 @@
 bool dce_i2c_oem_device_present(
 	struct resource_pool *pool,
 	struct ddc_service *ddc,
-	size_t slave_address
+	size_t target_address
 )
 {
 	struct dc *dc = ddc->ctx->dc;
@@ -45,7 +45,7 @@ bool dce_i2c_oem_device_present(
 	if (dcb->funcs->get_i2c_info(dcb, id, &i2c_info) != BP_RESULT_OK)
 		return false;
 
-	if (i2c_info.i2c_slave_address != slave_address)
+	if (i2c_info.i2c_target_address != target_address)
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
index 813463ffe15c5..c30a2117a5392 100644
--- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
+++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
@@ -92,7 +92,7 @@ struct graphics_object_i2c_info {
 	bool i2c_hw_assist;
 	uint32_t i2c_line;
 	uint32_t i2c_engine_id;
-	uint32_t i2c_slave_address;
+	uint32_t i2c_target_address;
 };
 
 struct graphics_object_hpd_info {
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71bc9a..5644920f45e6c 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -8503,7 +8503,7 @@ typedef struct _PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS
    USHORT  lpI2CDataOut;
   UCHAR   ucFlag;
   UCHAR   ucTransBytes;
-  UCHAR   ucSlaveAddr;
+  UCHAR   ucTargetAddr;
   UCHAR   ucLineNumber;
 }PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS;
 
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 09cbc3afd6d89..b60761a33e4ce 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -534,7 +534,7 @@ struct atom_firmware_info_v3_2 {
   uint32_t mc_baseaddr_low;
   uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
   uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-  uint8_t  board_i2c_feature_slave_addr;
+  uint8_t  board_i2c_feature_target_addr;
   uint8_t  reserved3;
   uint16_t bootup_mvddq_mv;
   uint16_t bootup_mvpp_mv;
@@ -562,7 +562,7 @@ struct atom_firmware_info_v3_3
   uint32_t mc_baseaddr_low;
   uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
   uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-  uint8_t  board_i2c_feature_slave_addr;
+  uint8_t  board_i2c_feature_target_addr;
   uint8_t  reserved3;
   uint16_t bootup_mvddq_mv;
   uint16_t bootup_mvpp_mv;
@@ -590,8 +590,8 @@ struct atom_firmware_info_v3_4 {
 	uint32_t mc_baseaddr_low;
 	uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
 	uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-	uint8_t  board_i2c_feature_slave_addr;
-	uint8_t  ras_rom_i2c_slave_addr;
+	uint8_t  board_i2c_feature_target_addr;
+	uint8_t  ras_rom_i2c_target_addr;
 	uint16_t bootup_mvddq_mv;
 	uint16_t bootup_mvpp_mv;
 	uint32_t zfbstartaddrin16mb;
@@ -626,8 +626,8 @@ struct atom_firmware_info_v3_5 {
   uint32_t mc_baseaddr_low;
   uint8_t  board_i2c_feature_id;            // enum of atom_board_i2c_feature_id_def
   uint8_t  board_i2c_feature_gpio_id;       // i2c id find in gpio_lut data table gpio_id
-  uint8_t  board_i2c_feature_slave_addr;
-  uint8_t  ras_rom_i2c_slave_addr;
+  uint8_t  board_i2c_feature_target_addr;
+  uint8_t  ras_rom_i2c_target_addr;
   uint32_t bootup_voltage_reserved1;
   uint32_t zfb_reserved;
   // if pplib_pptable_id!=0, pplib get powerplay table inside driver instead of from VBIOS
@@ -830,7 +830,7 @@ struct atom_i2c_record
 {
   struct atom_common_record_header record_header;   //record_type = ATOM_I2C_RECORD_TYPE
   uint8_t i2c_id; 
-  uint8_t i2c_slave_addr;                   //The slave address, it's 0 when the record is attached to connector for DDC
+  uint8_t i2c_target_addr;                   //The target address, it's 0 when the record is attached to connector for DDC
 };
 
 struct atom_hpd_int_record
@@ -2069,7 +2069,7 @@ struct atom_smu_info_v3_5
   uint16_t smuinitoffset;
   uint32_t bootup_dprefclk_10khz;
   uint32_t bootup_usbclk_10khz;
-  uint32_t smb_slave_address;
+  uint32_t smb_target_address;
   uint32_t cg_fdo_ctrl0_val;
   uint32_t cg_fdo_ctrl1_val;
   uint32_t cg_fdo_ctrl2_val;
@@ -2126,7 +2126,7 @@ struct atom_smu_info_v3_6
 	uint16_t smuinitoffset;
 	uint32_t bootup_gfxavsclk_10khz;
 	uint32_t bootup_mpioclk_10khz;
-	uint32_t smb_slave_address;
+	uint32_t smb_target_address;
 	uint32_t cg_fdo_ctrl0_val;
 	uint32_t cg_fdo_ctrl1_val;
 	uint32_t cg_fdo_ctrl2_val;
@@ -2181,7 +2181,7 @@ struct atom_smu_info_v4_0 {
 	uint16_t smuinitoffset;
 	uint32_t bootup_dprefclk_10khz;
 	uint32_t bootup_usbclk_10khz;
-	uint32_t smb_slave_address;
+	uint32_t smb_target_address;
 	uint32_t cg_fdo_ctrl0_val;
 	uint32_t cg_fdo_ctrl1_val;
 	uint32_t cg_fdo_ctrl2_val;
@@ -2392,7 +2392,7 @@ struct atom_smc_dpm_info_v4_3
 
 struct smudpm_i2ccontrollerconfig_t {
   uint32_t  enabled;
-  uint32_t  slaveaddress;
+  uint32_t  targetaddress;
   uint32_t  controllerport;
   uint32_t  controllername;
   uint32_t  thermalthrottler;
@@ -3553,7 +3553,7 @@ struct  atom_i2c_voltage_object_v4
    struct atom_voltage_object_header_v4 header;  // voltage mode = VOLTAGE_OBJ_VR_I2C_INIT_SEQ
    uint8_t  regulator_id;                        //Indicate Voltage Regulator Id
    uint8_t  i2c_id;
-   uint8_t  i2c_slave_addr;
+   uint8_t  i2c_target_addr;
    uint8_t  i2c_control_offset;       
    uint8_t  i2c_flag;                            // Bit0: 0 - One byte data; 1 - Two byte data
    uint8_t  i2c_speed;                           // =0, use default i2c speed, otherwise use it in unit of kHz. 
@@ -4195,7 +4195,7 @@ struct process_i2c_channel_transaction_parameters
   uint16_t  i2c_data_out;
   uint8_t   flag;                    /* enum atom_process_i2c_status */
   uint8_t   trans_bytes;
-  uint8_t   slave_addr;
+  uint8_t   target_addr;
   uint8_t   i2c_id;
 };
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
index 79c817752a331..cb9ee5345745d 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
@@ -784,8 +784,8 @@ static int append_vbios_pptable(struct pp_hwmgr *hwmgr, PPTable_t *ppsmc_pptable
 	for (i = 0; i < I2C_CONTROLLER_NAME_COUNT; i++) {
 		ppsmc_pptable->I2cControllers[i].Enabled =
 			smc_dpm_table->i2ccontrollers[i].enabled;
-		ppsmc_pptable->I2cControllers[i].SlaveAddress =
-			smc_dpm_table->i2ccontrollers[i].slaveaddress;
+		ppsmc_pptable->I2cControllers[i].TargetAddress =
+			smc_dpm_table->i2ccontrollers[i].targetaddress;
 		ppsmc_pptable->I2cControllers[i].ControllerPort =
 			smc_dpm_table->i2ccontrollers[i].controllerport;
 		ppsmc_pptable->I2cControllers[i].ThermalThrottler =
diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h
index c2efc70ef2888..69d7ec6fd971f 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h
@@ -287,7 +287,7 @@ typedef enum {
 
 typedef struct {
   uint32_t Enabled;
-  uint32_t SlaveAddress;
+  uint32_t TargetAddress;
   uint32_t ControllerPort;
   uint32_t ControllerName;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
index d518dee18e1be..5684e2a16e6cf 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
@@ -263,7 +263,7 @@ typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
   uint8_t   Padding[2];
-  uint32_t  SlaveAddress;
+  uint32_t  TargetAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
index c5c1943fb6a1c..1782b8e8fcd21 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
@@ -267,7 +267,7 @@ typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
   uint8_t   Padding[2];
-  uint32_t  SlaveAddress;
+  uint32_t  TargetAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
index aa6d29de40025..6be89c6dd4929 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h
@@ -342,7 +342,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;  
+  uint8_t   TargetAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h
index cddf45eebee8d..c590f4557074f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h
@@ -167,7 +167,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;
+  uint8_t   TargetAddress;
   uint8_t   ControllerPort;
   uint8_t   ThermalThrotter;
   uint8_t   I2cProtocol;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
index b114d14fc053e..ebe2d344bf5bb 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
@@ -319,7 +319,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;
+  uint8_t   TargetAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
index 8b1496f8ce584..8e9c7fa22b4f0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
@@ -320,7 +320,7 @@ typedef enum {
 typedef struct {
   uint8_t   Enabled;
   uint8_t   Speed;
-  uint8_t   SlaveAddress;
+  uint8_t   TargetAddress;
   uint8_t   ControllerPort;
   uint8_t   ControllerName;
   uint8_t   ThermalThrotter;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
index 6d334a2aff672..7747a5a835490 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
@@ -1909,8 +1909,8 @@ static void arcturus_dump_pptable(struct smu_context *smu)
 		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", i);
 		dev_info(smu->adev->dev, "                   .Enabled = %d\n",
 				pptable->I2cControllers[i].Enabled);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
+		dev_info(smu->adev->dev, "                   .TargetAddress = 0x%x\n",
+				pptable->I2cControllers[i].TargetAddress);
 		dev_info(smu->adev->dev, "                   .ControllerPort = %d\n",
 				pptable->I2cControllers[i].ControllerPort);
 		dev_info(smu->adev->dev, "                   .ControllerName = %d\n",
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index e426f457a017f..049a27475c889 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2988,8 +2988,8 @@ static void beige_goby_dump_pptable(struct smu_context *smu)
 				pptable->I2cControllers[i].Enabled);
 		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
 				pptable->I2cControllers[i].Speed);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
+		dev_info(smu->adev->dev, "                   .TargetAddress = 0x%x\n",
+				pptable->I2cControllers[i].TargetAddress);
 		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
 				pptable->I2cControllers[i].ControllerPort);
 		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
@@ -3627,8 +3627,8 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
 				pptable->I2cControllers[i].Enabled);
 		dev_info(smu->adev->dev, "                   .Speed = 0x%x\n",
 				pptable->I2cControllers[i].Speed);
-		dev_info(smu->adev->dev, "                   .SlaveAddress = 0x%x\n",
-				pptable->I2cControllers[i].SlaveAddress);
+		dev_info(smu->adev->dev, "                   .TargetAddress = 0x%x\n",
+				pptable->I2cControllers[i].TargetAddress);
 		dev_info(smu->adev->dev, "                   .ControllerPort = 0x%x\n",
 				pptable->I2cControllers[i].ControllerPort);
 		dev_info(smu->adev->dev, "                   .ControllerName = 0x%x\n",
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 2db40789235cb..40444af51d0aa 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -1834,7 +1834,7 @@ typedef struct _READ_EDID_FROM_HW_I2C_DATA_PARAMETERS
   USHORT    usVRAMAddress;      //Address in Frame Buffer where to pace raw EDID
   USHORT    usStatus;           //When use output: lower byte EDID checksum, high byte hardware status
                                 //WHen use input:  lower byte as 'byte to read':currently limited to 128byte or 1byte
-  UCHAR     ucSlaveAddr;        //Read from which slave
+  UCHAR     ucTargetAddr;        //Read from which slave
   UCHAR     ucLineNumber;       //Read from which HW assisted line
 }READ_EDID_FROM_HW_I2C_DATA_PARAMETERS;
 #define READ_EDID_FROM_HW_I2C_DATA_PS_ALLOCATION  READ_EDID_FROM_HW_I2C_DATA_PARAMETERS
@@ -1858,7 +1858,7 @@ typedef struct _WRITE_ONE_BYTE_HW_I2C_DATA_PARAMETERS
                                 //blockID+counterID+offsetID
   UCHAR     ucData;             //PS data1
   UCHAR     ucStatus;           //Status byte 1=success, 2=failure, Also is used as PS data2
-  UCHAR     ucSlaveAddr;        //Write to which slave
+  UCHAR     ucTargetAddr;        //Write to which slave
   UCHAR     ucLineNumber;       //Write from which HW assisted line
 }WRITE_ONE_BYTE_HW_I2C_DATA_PARAMETERS;
 
@@ -1867,7 +1867,7 @@ typedef struct _WRITE_ONE_BYTE_HW_I2C_DATA_PARAMETERS
 typedef struct _SET_UP_HW_I2C_DATA_PARAMETERS
 {
   USHORT    usPrescale;         //Ratio between Engine clock and I2C clock
-  UCHAR     ucSlaveAddr;        //Write to which slave
+  UCHAR     ucTargetAddr;        //Write to which slave
   UCHAR     ucLineNumber;       //Write from which HW assisted line
 }SET_UP_HW_I2C_DATA_PARAMETERS;
 
@@ -4741,7 +4741,7 @@ typedef struct _ATOM_POWER_SOURCE_OBJECT
 	UCHAR	ucPwrSrcId;													// Power source
 	UCHAR	ucPwrSensorType;										// GPIO, I2C or none
 	UCHAR	ucPwrSensId;											  // if GPIO detect, it is GPIO id,  if I2C detect, it is I2C id
-	UCHAR	ucPwrSensSlaveAddr;									// Slave address if I2C detect
+	UCHAR	ucPwrSensTargetAddr;									// Target address if I2C detect
 	UCHAR ucPwrSensRegIndex;									// I2C register Index if I2C detect
 	UCHAR ucPwrSensRegBitMask;								// detect which bit is used if I2C detect
 	UCHAR	ucPwrSensActiveState;								// high active or low active
@@ -5449,7 +5449,7 @@ typedef struct _ATOM_I2C_DEVICE_SETUP_INFO
 {
   ATOM_I2C_ID_CONFIG_ACCESS       sucI2cId;               //I2C line and HW/SW assisted cap.
   UCHAR		                        ucSSChipID;             //SS chip being used
-  UCHAR		                        ucSSChipSlaveAddr;      //Slave Address to set up this SS chip
+  UCHAR		                        ucSSChipTargetAddr;      //Target Address to set up this SS chip
   UCHAR                           ucNumOfI2CDataRecords;  //number of data block
   ATOM_I2C_DATA_RECORD            asI2CData[];
 }ATOM_I2C_DEVICE_SETUP_INFO;
@@ -7229,7 +7229,7 @@ typedef struct _PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS
 	USHORT  lpI2CDataOut;
   UCHAR   ucFlag;               
   UCHAR   ucTransBytes;
-  UCHAR   ucSlaveAddr;
+  UCHAR   ucTargetAddr;
   UCHAR   ucLineNumber;
 }PROCESS_I2C_CHANNEL_TRANSACTION_PARAMETERS;
 
@@ -7599,8 +7599,8 @@ typedef struct _ATOM_XTMDS_INFO
   UCHAR                      ucSupportedLink;    // Bit field, bit0=1, single link supported;bit1=1,dual link supported
   UCHAR                      ucSequnceAlterID;   // Even with the same external TMDS asic, it's possible that the program seqence alters 
                                                  // due to design. This ID is used to alert driver that the sequence is not "standard"!              
-  UCHAR                      ucMasterAddress;    // Address to control Master xTMDS Chip
-  UCHAR                      ucSlaveAddress;     // Address to control Slave xTMDS Chip
+  UCHAR                      ucControllerAddress;    // Address to control Controller xTMDS Chip
+  UCHAR                      ucTargetAddress;     // Address to control Target xTMDS Chip
 }ATOM_XTMDS_INFO;
 
 typedef struct _DFP_DPMS_STATUS_CHANGE_PARAMETERS
diff --git a/drivers/gpu/drm/radeon/atombios_i2c.c b/drivers/gpu/drm/radeon/atombios_i2c.c
index 730f0b25312b7..3acae0b28122e 100644
--- a/drivers/gpu/drm/radeon/atombios_i2c.c
+++ b/drivers/gpu/drm/radeon/atombios_i2c.c
@@ -34,7 +34,7 @@
 #define ATOM_MAX_HW_I2C_READ  255
 
 static int radeon_process_i2c_ch(struct radeon_i2c_chan *chan,
-				 u8 slave_addr, u8 flags,
+				 u8 target_addr, u8 flags,
 				 u8 *buf, int num)
 {
 	struct drm_device *dev = chan->dev;
@@ -75,7 +75,7 @@ static int radeon_process_i2c_ch(struct radeon_i2c_chan *chan,
 	args.ucFlag = flags;
 	args.ucI2CSpeed = TARGET_HW_I2C_CLOCK;
 	args.ucTransBytes = num;
-	args.ucSlaveAddr = slave_addr << 1;
+	args.ucTargetAddr = target_addr << 1;
 	args.ucLineNumber = chan->rec.i2c_id;
 
 	atom_execute_table_scratch_unlocked(rdev->mode_info.atom_context, index, (uint32_t *)&args, sizeof(args));
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 6952b1273b0f7..107638ec8c756 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -1398,7 +1398,7 @@ bool radeon_legacy_get_ext_tmds_info_from_table(struct radeon_encoder *encoder,
 	case CT_MINI_EXTERNAL:
 	default:
 		tmds->dvo_chip = DVO_SIL164;
-		tmds->slave_addr = 0x70 >> 1; /* 7 bit addressing */
+		tmds->target_addr = 0x70 >> 1; /* 7 bit addressing */
 		break;
 	}
 
@@ -1420,14 +1420,14 @@ bool radeon_legacy_get_ext_tmds_info_from_combios(struct radeon_encoder *encoder
 		i2c_bus = combios_setup_i2c_bus(rdev, DDC_MONID, 0, 0);
 		tmds->i2c_bus = radeon_i2c_lookup(rdev, &i2c_bus);
 		tmds->dvo_chip = DVO_SIL164;
-		tmds->slave_addr = 0x70 >> 1; /* 7 bit addressing */
+		tmds->target_addr = 0x70 >> 1; /* 7 bit addressing */
 	} else {
 		offset = combios_get_table_offset(dev, COMBIOS_EXT_TMDS_INFO_TABLE);
 		if (offset) {
 			ver = RBIOS8(offset);
 			DRM_DEBUG_KMS("External TMDS Table revision: %d\n", ver);
-			tmds->slave_addr = RBIOS8(offset + 4 + 2);
-			tmds->slave_addr >>= 1; /* 7 bit addressing */
+			tmds->target_addr = RBIOS8(offset + 4 + 2);
+			tmds->target_addr >>= 1; /* 7 bit addressing */
 			gpio = RBIOS8(offset + 4 + 3);
 			if (gpio == DDC_LCD) {
 				/* MM i2c */
@@ -2846,19 +2846,19 @@ void radeon_external_tmds_setup(struct drm_encoder *encoder)
 	case DVO_SIL164:
 		/* sil 164 */
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				    tmds->slave_addr,
+				    tmds->target_addr,
 				    0x08, 0x30);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				       tmds->slave_addr,
+				       tmds->target_addr,
 				       0x09, 0x00);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				    tmds->slave_addr,
+				    tmds->target_addr,
 				    0x0a, 0x90);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				    tmds->slave_addr,
+				    tmds->target_addr,
 				    0x0c, 0x89);
 		radeon_i2c_put_byte(tmds->i2c_bus,
-				       tmds->slave_addr,
+				       tmds->target_addr,
 				       0x08, 0x3b);
 		break;
 	case DVO_SIL1178:
@@ -2887,7 +2887,7 @@ bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	uint16_t offset;
-	uint8_t blocks, slave_addr, rev;
+	uint8_t blocks, target_addr, rev;
 	uint32_t index, id;
 	uint32_t reg, val, and_mask, or_mask;
 	struct radeon_encoder_ext_tmds *tmds = radeon_encoder->enc_priv;
@@ -2934,15 +2934,15 @@ bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 						mdelay(val);
 						break;
 					case 6:
-						slave_addr = id & 0xff;
-						slave_addr >>= 1; /* 7 bit addressing */
+						target_addr = id & 0xff;
+						target_addr >>= 1; /* 7 bit addressing */
 						index++;
 						reg = RBIOS8(index);
 						index++;
 						val = RBIOS8(index);
 						index++;
 						radeon_i2c_put_byte(tmds->i2c_bus,
-								    slave_addr,
+								    target_addr,
 								    reg, val);
 						break;
 					default:
@@ -2997,7 +2997,7 @@ bool radeon_combios_external_tmds_setup(struct drm_encoder *encoder)
 					val = RBIOS8(index);
 					index += 1;
 					radeon_i2c_put_byte(tmds->i2c_bus,
-							    tmds->slave_addr,
+							    tmds->target_addr,
 							    reg, val);
 					break;
 				default:
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 3d174390a8afe..a2eb002294289 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -1038,7 +1038,7 @@ struct radeon_i2c_chan *radeon_i2c_lookup(struct radeon_device *rdev,
 }
 
 void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
-			 u8 slave_addr,
+			 u8 target_addr,
 			 u8 addr,
 			 u8 *val)
 {
@@ -1046,13 +1046,13 @@ void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
 	u8 in_buf[2];
 	struct i2c_msg msgs[] = {
 		{
-			.addr = slave_addr,
+			.addr = target_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = slave_addr,
+			.addr = target_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -1072,13 +1072,13 @@ void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
 }
 
 void radeon_i2c_put_byte(struct radeon_i2c_chan *i2c_bus,
-			 u8 slave_addr,
+			 u8 target_addr,
 			 u8 addr,
 			 u8 val)
 {
 	uint8_t out_buf[2];
 	struct i2c_msg msg = {
-		.addr = slave_addr,
+		.addr = target_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 546381a5c918d..701c5f9046a07 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -409,7 +409,7 @@ struct radeon_encoder_int_tmds {
 struct radeon_encoder_ext_tmds {
 	/* tmds over dvo */
 	struct radeon_i2c_chan *i2c_bus;
-	uint8_t slave_addr;
+	uint8_t target_addr;
 	enum radeon_dvo_chip dvo_chip;
 };
 
@@ -749,11 +749,11 @@ extern struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 						 const char *name);
 extern void radeon_i2c_destroy(struct radeon_i2c_chan *i2c);
 extern void radeon_i2c_get_byte(struct radeon_i2c_chan *i2c_bus,
-				u8 slave_addr,
+				u8 target_addr,
 				u8 addr,
 				u8 *val);
 extern void radeon_i2c_put_byte(struct radeon_i2c_chan *i2c,
-				u8 slave_addr,
+				u8 target_addr,
 				u8 addr,
 				u8 val);
 extern void radeon_router_select_ddc_port(struct radeon_connector *radeon_connector);
-- 
2.34.1


