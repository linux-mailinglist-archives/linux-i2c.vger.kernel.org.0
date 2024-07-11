Return-Path: <linux-i2c+bounces-4876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B992DF9C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D89AAB21AD5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 05:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A0E13213D;
	Thu, 11 Jul 2024 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="eoGn8Qek"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D943812EBD6;
	Thu, 11 Jul 2024 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675751; cv=none; b=RxabEphfCr25ZBRssi4ExS6V1EcWiF7G6ZrLPEXE5DpgRUI1wW8Zv8vtCGXyF+sA0Qi6ZastNxWb5RmuWC4EyVlhnJq4nvBub/7SyJ8/83QwknTxT6JTsEYH7zZZJ2wlaIZ/dgAvzglG9ijhBu6u1BjVgF/2fDduU7QgUKSJRR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675751; c=relaxed/simple;
	bh=LjVFHUW1i5MW8BjuRxPGqlUs0KNO8F20PvjjZxW7Msg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ls1xt/Pt48bgf9Zy3xN24PIIiB+cPbqymwHB/T4r2c17F4E9QFArY3IYyYy/XHurRb+MmPEpDJgnMitiCsTPgfeEeeAj8OJ6OPDBLg1l6wf4hMGT3A2Ol1I4fOzQVc0FfhK5/mhBoJmbjn4lEE74GTEvYcxl76uw+XL+Ev/cKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=eoGn8Qek; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
	by linux.microsoft.com (Postfix) with ESMTPSA id 91CE520B7165;
	Wed, 10 Jul 2024 22:29:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 91CE520B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1720675749;
	bh=4zzt0sxaEK28Q73el3r0U92JO8hyIlQcIdU1sMN5SYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eoGn8Qek5E9XSsJ2C10alVGfeRI/GzNSHI1/EexKzjrgWsychWzp8Ge+lGek14A/J
	 MUw7Gos/0iZHXuMnVkt3Ib9Gd6v9b9vWi3i9BPGB45RuwnW2BN8APCzd4c6a7/vLya
	 0KvnYyDte6YcPv6Z07Lp3J2rdrUZVExWoJeNWNLg=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org (open list:VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER),
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 6/6] fbdev/viafb: Make I2C terminology more inclusive
Date: Thu, 11 Jul 2024 05:27:34 +0000
Message-Id: <20240711052734.1273652-7-eahariha@linux.microsoft.com>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/video/fbdev/via/chip.h    |  8 ++++----
 drivers/video/fbdev/via/dvi.c     | 24 ++++++++++++------------
 drivers/video/fbdev/via/lcd.c     |  6 +++---
 drivers/video/fbdev/via/via_aux.h |  2 +-
 drivers/video/fbdev/via/via_i2c.c | 12 ++++++------
 drivers/video/fbdev/via/vt1636.c  |  6 +++---
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/video/fbdev/via/chip.h b/drivers/video/fbdev/via/chip.h
index f0a19cbcb9e5d..f81af13630e28 100644
--- a/drivers/video/fbdev/via/chip.h
+++ b/drivers/video/fbdev/via/chip.h
@@ -69,7 +69,7 @@
 #define     VT1632_TMDS             0x01
 #define     INTEGRATED_TMDS         0x42
 
-/* Definition TMDS Trasmitter I2C Slave Address */
+/* Definition TMDS Trasmitter I2C Target Address */
 #define     VT1632_TMDS_I2C_ADDR    0x10
 
 /**************************************************/
@@ -88,21 +88,21 @@
 #define     TX_DATA_DDR_MODE        0x04
 #define     TX_DATA_SDR_MODE        0x08
 
-/* Definition LVDS Trasmitter I2C Slave Address */
+/* Definition LVDS Trasmitter I2C Target Address */
 #define     VT1631_LVDS_I2C_ADDR    0x70
 #define     VT3271_LVDS_I2C_ADDR    0x80
 #define     VT1636_LVDS_I2C_ADDR    0x80
 
 struct tmds_chip_information {
 	int tmds_chip_name;
-	int tmds_chip_slave_addr;
+	int tmds_chip_target_addr;
 	int output_interface;
 	int i2c_port;
 };
 
 struct lvds_chip_information {
 	int lvds_chip_name;
-	int lvds_chip_slave_addr;
+	int lvds_chip_target_addr;
 	int output_interface;
 	int i2c_port;
 };
diff --git a/drivers/video/fbdev/via/dvi.c b/drivers/video/fbdev/via/dvi.c
index 13147e3066ebf..27990a73bfa39 100644
--- a/drivers/video/fbdev/via/dvi.c
+++ b/drivers/video/fbdev/via/dvi.c
@@ -70,7 +70,7 @@ bool viafb_tmds_trasmitter_identify(void)
 	/* Check for VT1632: */
 	viaparinfo->chip_info->tmds_chip_info.tmds_chip_name = VT1632_TMDS;
 	viaparinfo->chip_info->
-		tmds_chip_info.tmds_chip_slave_addr = VT1632_TMDS_I2C_ADDR;
+		tmds_chip_info.tmds_chip_target_addr = VT1632_TMDS_I2C_ADDR;
 	viaparinfo->chip_info->tmds_chip_info.i2c_port = VIA_PORT_31;
 	if (check_tmds_chip(VT1632_DEVICE_ID_REG, VT1632_DEVICE_ID)) {
 		/*
@@ -128,14 +128,14 @@ bool viafb_tmds_trasmitter_identify(void)
 	viaparinfo->chip_info->
 		tmds_chip_info.tmds_chip_name = NON_TMDS_TRANSMITTER;
 	viaparinfo->chip_info->tmds_chip_info.
-		tmds_chip_slave_addr = VT1632_TMDS_I2C_ADDR;
+		tmds_chip_target_addr = VT1632_TMDS_I2C_ADDR;
 	return false;
 }
 
 static void tmds_register_write(int index, u8 data)
 {
 	viafb_i2c_writebyte(viaparinfo->chip_info->tmds_chip_info.i2c_port,
-			    viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr,
+			    viaparinfo->chip_info->tmds_chip_info.tmds_chip_target_addr,
 			    index, data);
 }
 
@@ -144,7 +144,7 @@ static int tmds_register_read(int index)
 	u8 data;
 
 	viafb_i2c_readbyte(viaparinfo->chip_info->tmds_chip_info.i2c_port,
-			   (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr,
+			   (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_target_addr,
 			   (u8) index, &data);
 	return data;
 }
@@ -152,7 +152,7 @@ static int tmds_register_read(int index)
 static int tmds_register_read_bytes(int index, u8 *buff, int buff_len)
 {
 	viafb_i2c_readbytes(viaparinfo->chip_info->tmds_chip_info.i2c_port,
-			    (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr,
+			    (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_target_addr,
 			    (u8) index, buff, buff_len);
 	return 0;
 }
@@ -256,14 +256,14 @@ static int viafb_dvi_query_EDID(void)
 
 	DEBUG_MSG(KERN_INFO "viafb_dvi_query_EDID!!\n");
 
-	restore = viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr;
-	viaparinfo->chip_info->tmds_chip_info.tmds_chip_slave_addr = 0xA0;
+	restore = viaparinfo->chip_info->tmds_chip_info.tmds_chip_target_addr;
+	viaparinfo->chip_info->tmds_chip_info.tmds_chip_target_addr = 0xA0;
 
 	data0 = (u8) tmds_register_read(0x00);
 	data1 = (u8) tmds_register_read(0x01);
 	if ((data0 == 0) && (data1 == 0xFF)) {
 		viaparinfo->chip_info->
-			tmds_chip_info.tmds_chip_slave_addr = restore;
+			tmds_chip_info.tmds_chip_target_addr = restore;
 		return EDID_VERSION_1;	/* Found EDID1 Table */
 	}
 
@@ -280,8 +280,8 @@ static void dvi_get_panel_size_from_DDCv1(
 
 	DEBUG_MSG(KERN_INFO "\n dvi_get_panel_size_from_DDCv1 \n");
 
-	restore = tmds_chip->tmds_chip_slave_addr;
-	tmds_chip->tmds_chip_slave_addr = 0xA0;
+	restore = tmds_chip->tmds_chip_target_addr;
+	tmds_chip->tmds_chip_target_addr = 0xA0;
 	for (i = 0x25; i < 0x6D; i++) {
 		switch (i) {
 		case 0x36:
@@ -306,7 +306,7 @@ static void dvi_get_panel_size_from_DDCv1(
 
 	DEBUG_MSG(KERN_INFO "DVI max pixelclock = %d\n",
 		tmds_setting->max_pixel_clock);
-	tmds_chip->tmds_chip_slave_addr = restore;
+	tmds_chip->tmds_chip_target_addr = restore;
 }
 
 /* If Disable DVI, turn off pad */
@@ -427,7 +427,7 @@ void viafb_dvi_enable(void)
 				viafb_i2c_writebyte(viaparinfo->chip_info->
 					tmds_chip_info.i2c_port,
 					viaparinfo->chip_info->
-					tmds_chip_info.tmds_chip_slave_addr,
+					tmds_chip_info.tmds_chip_target_addr,
 					0x08, data);
 			}
 		}
diff --git a/drivers/video/fbdev/via/lcd.c b/drivers/video/fbdev/via/lcd.c
index beec5c8d4d083..8673fced87492 100644
--- a/drivers/video/fbdev/via/lcd.c
+++ b/drivers/video/fbdev/via/lcd.c
@@ -147,7 +147,7 @@ bool viafb_lvds_trasmitter_identify(void)
 		return true;
 	/* Check for VT1631: */
 	viaparinfo->chip_info->lvds_chip_info.lvds_chip_name = VT1631_LVDS;
-	viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr =
+	viaparinfo->chip_info->lvds_chip_info.lvds_chip_target_addr =
 		VT1631_LVDS_I2C_ADDR;
 
 	if (check_lvds_chip(VT1631_DEVICE_ID_REG, VT1631_DEVICE_ID)) {
@@ -161,7 +161,7 @@ bool viafb_lvds_trasmitter_identify(void)
 
 	viaparinfo->chip_info->lvds_chip_info.lvds_chip_name =
 		NON_LVDS_TRANSMITTER;
-	viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr =
+	viaparinfo->chip_info->lvds_chip_info.lvds_chip_target_addr =
 		VT1631_LVDS_I2C_ADDR;
 	return false;
 }
@@ -327,7 +327,7 @@ static int lvds_register_read(int index)
 	u8 data;
 
 	viafb_i2c_readbyte(VIA_PORT_2C,
-			(u8) viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr,
+			(u8) viaparinfo->chip_info->lvds_chip_info.lvds_chip_target_addr,
 			(u8) index, &data);
 	return data;
 }
diff --git a/drivers/video/fbdev/via/via_aux.h b/drivers/video/fbdev/via/via_aux.h
index 0933bbf20e588..464723fd514ca 100644
--- a/drivers/video/fbdev/via/via_aux.h
+++ b/drivers/video/fbdev/via/via_aux.h
@@ -24,7 +24,7 @@ struct via_aux_drv {
 	struct list_head chain;		/* chain to support multiple drivers */
 
 	struct via_aux_bus *bus;	/* the I2C bus used */
-	u8 addr;			/* the I2C slave address */
+	u8 addr;			/* the I2C target address */
 
 	const char *name;	/* human readable name of the driver */
 	void *data;		/* private data of this driver */
diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index 5825028105759..5edd3827ca271 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -104,7 +104,7 @@ static void via_i2c_setsda(void *data, int state)
 	spin_unlock_irqrestore(&i2c_vdev->reg_lock, flags);
 }
 
-int viafb_i2c_readbyte(u8 adap, u8 slave_addr, u8 index, u8 *pdata)
+int viafb_i2c_readbyte(u8 adap, u8 target_addr, u8 index, u8 *pdata)
 {
 	int ret;
 	u8 mm1[] = {0x00};
@@ -115,7 +115,7 @@ int viafb_i2c_readbyte(u8 adap, u8 slave_addr, u8 index, u8 *pdata)
 	*pdata = 0;
 	msgs[0].flags = 0;
 	msgs[1].flags = I2C_M_RD;
-	msgs[0].addr = msgs[1].addr = slave_addr / 2;
+	msgs[0].addr = msgs[1].addr = target_addr / 2;
 	mm1[0] = index;
 	msgs[0].len = 1; msgs[1].len = 1;
 	msgs[0].buf = mm1; msgs[1].buf = pdata;
@@ -128,7 +128,7 @@ int viafb_i2c_readbyte(u8 adap, u8 slave_addr, u8 index, u8 *pdata)
 	return ret;
 }
 
-int viafb_i2c_writebyte(u8 adap, u8 slave_addr, u8 index, u8 data)
+int viafb_i2c_writebyte(u8 adap, u8 target_addr, u8 index, u8 data)
 {
 	int ret;
 	u8 msg[2] = { index, data };
@@ -137,7 +137,7 @@ int viafb_i2c_writebyte(u8 adap, u8 slave_addr, u8 index, u8 data)
 	if (!via_i2c_par[adap].is_active)
 		return -ENODEV;
 	msgs.flags = 0;
-	msgs.addr = slave_addr / 2;
+	msgs.addr = target_addr / 2;
 	msgs.len = 2;
 	msgs.buf = msg;
 	ret = i2c_transfer(&via_i2c_par[adap].adapter, &msgs, 1);
@@ -149,7 +149,7 @@ int viafb_i2c_writebyte(u8 adap, u8 slave_addr, u8 index, u8 data)
 	return ret;
 }
 
-int viafb_i2c_readbytes(u8 adap, u8 slave_addr, u8 index, u8 *buff, int buff_len)
+int viafb_i2c_readbytes(u8 adap, u8 target_addr, u8 index, u8 *buff, int buff_len)
 {
 	int ret;
 	u8 mm1[] = {0x00};
@@ -159,7 +159,7 @@ int viafb_i2c_readbytes(u8 adap, u8 slave_addr, u8 index, u8 *buff, int buff_len
 		return -ENODEV;
 	msgs[0].flags = 0;
 	msgs[1].flags = I2C_M_RD;
-	msgs[0].addr = msgs[1].addr = slave_addr / 2;
+	msgs[0].addr = msgs[1].addr = target_addr / 2;
 	mm1[0] = index;
 	msgs[0].len = 1; msgs[1].len = buff_len;
 	msgs[0].buf = mm1; msgs[1].buf = buff;
diff --git a/drivers/video/fbdev/via/vt1636.c b/drivers/video/fbdev/via/vt1636.c
index 8d8cfdb05618f..0d58ca144e190 100644
--- a/drivers/video/fbdev/via/vt1636.c
+++ b/drivers/video/fbdev/via/vt1636.c
@@ -44,7 +44,7 @@ u8 viafb_gpio_i2c_read_lvds(struct lvds_setting_information
 	u8 data;
 
 	viafb_i2c_readbyte(plvds_chip_info->i2c_port,
-			   plvds_chip_info->lvds_chip_slave_addr, index, &data);
+			   plvds_chip_info->lvds_chip_target_addr, index, &data);
 	return data;
 }
 
@@ -60,7 +60,7 @@ void viafb_gpio_i2c_write_mask_lvds(struct lvds_setting_information
 	data = (data & (~io_data.Mask)) | io_data.Data;
 
 	viafb_i2c_writebyte(plvds_chip_info->i2c_port,
-			    plvds_chip_info->lvds_chip_slave_addr, index, data);
+			    plvds_chip_info->lvds_chip_target_addr, index, data);
 }
 
 void viafb_init_lvds_vt1636(struct lvds_setting_information
@@ -113,7 +113,7 @@ bool viafb_lvds_identify_vt1636(u8 i2c_adapter)
 	DEBUG_MSG(KERN_INFO "viafb_lvds_identify_vt1636.\n");
 
 	/* Sense VT1636 LVDS Transmiter */
-	viaparinfo->chip_info->lvds_chip_info.lvds_chip_slave_addr =
+	viaparinfo->chip_info->lvds_chip_info.lvds_chip_target_addr =
 		VT1636_LVDS_I2C_ADDR;
 
 	/* Check vendor ID first: */
-- 
2.34.1


