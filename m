Return-Path: <linux-i2c+bounces-4872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C7C92DF8E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 07:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCC121C214AB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 05:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B8178C67;
	Thu, 11 Jul 2024 05:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="TF51oVSj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC178287A;
	Thu, 11 Jul 2024 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675741; cv=none; b=a83Q7Kf0taNTVe47tLJcZrmAMBbMJabceKDjG7lJDQG1oJb/4n7Nid08jttd3VPQ2NNH8gJd544WQ6ePFT8gRubKGFyaE1hJocxTRWrbSVX6UvtABn2uSCUYYSeiEsQqbgPCKDuxgnzw9MNfkCLBa8bJnzycKhMPPoUm+LqUfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675741; c=relaxed/simple;
	bh=2PkvWz7NNRN6c5hE4MvQMZT9YrS2VYNgEg9nTjF3mjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eIwV27FhiddPR9DgyuTyxqY/YyNTV55OwATKi+0oa9luHpO3zF7skSzbaP7xqgBWY91SN6R83p9qqEIrdMih+1gbMm2UOIWQTrFtHiHuWwi+7asPpqicTWHdB1ZPzBcsbSnuPnCaeUeMF6nHzBX3hwHiSanwn4uDjD9FCkxrIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=TF51oVSj; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7898F20B7165;
	Wed, 10 Jul 2024 22:28:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7898F20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1720675739;
	bh=trdnBqLVSPpomRu6Y6Umj1cFxyQIE9BVrl6xkyiidhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TF51oVSjez9I59mCiy2N2ZPbXhxQ9I+VxsXd1AkWmI3JlSQ1nQDDOfxv3Va6wireW
	 ZKno+bEnWPxKiqrXnRirNCSkDrJSRhCbDTkYy0GOQDjO6p0asw3ef7otYRoL1Cwrue
	 T2S2jciu4ledtJBw7NCoMa86YVbC9xBKYjYydAoI=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v4 2/6] drm/gma500: Make I2C terminology more inclusive
Date: Thu, 11 Jul 2024 05:27:30 +0000
Message-Id: <20240711052734.1273652-3-eahariha@linux.microsoft.com>
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
 drivers/gpu/drm/gma500/cdv_intel_lvds.c |  2 +-
 drivers/gpu/drm/gma500/intel_bios.c     | 22 ++++++++++-----------
 drivers/gpu/drm/gma500/intel_bios.h     |  4 ++--
 drivers/gpu/drm/gma500/intel_gmbus.c    |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h        |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h  |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c |  4 ++--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 26 ++++++++++++-------------
 8 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index f08a6803dc184..c7652a02b42ec 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -565,7 +565,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 			dev->dev, "I2C bus registration failed.\n");
 		goto err_encoder_cleanup;
 	}
-	gma_encoder->i2c_bus->slave_addr = 0x2C;
+	gma_encoder->i2c_bus->target_addr = 0x2C;
 	dev_priv->lvds_i2c_bus = gma_encoder->i2c_bus;
 
 	/*
diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index 8245b5603d2c0..d5924ca3ed050 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -14,8 +14,8 @@
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
 
-#define	SLAVE_ADDR1	0x70
-#define	SLAVE_ADDR2	0x72
+#define	TARGET_ADDR1	0x70
+#define	TARGET_ADDR2	0x72
 
 static void *find_section(struct bdb_header *bdb, int section_id)
 {
@@ -357,10 +357,10 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
 			/* skip the device block if device type is invalid */
 			continue;
 		}
-		if (p_child->slave_addr != SLAVE_ADDR1 &&
-			p_child->slave_addr != SLAVE_ADDR2) {
+		if (p_child->target_addr != TARGET_ADDR1 &&
+			p_child->target_addr != TARGET_ADDR2) {
 			/*
-			 * If the slave address is neither 0x70 nor 0x72,
+			 * If the target address is neither 0x70 nor 0x72,
 			 * it is not a SDVO device. Skip it.
 			 */
 			continue;
@@ -371,22 +371,22 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
 			DRM_DEBUG_KMS("Incorrect SDVO port. Skip it\n");
 			continue;
 		}
-		DRM_DEBUG_KMS("the SDVO device with slave addr %2x is found on"
+		DRM_DEBUG_KMS("the SDVO device with target addr %2x is found on"
 				" %s port\n",
-				p_child->slave_addr,
+				p_child->target_addr,
 				(p_child->dvo_port == DEVICE_PORT_DVOB) ?
 					"SDVOB" : "SDVOC");
 		p_mapping = &(dev_priv->sdvo_mappings[p_child->dvo_port - 1]);
 		if (!p_mapping->initialized) {
 			p_mapping->dvo_port = p_child->dvo_port;
-			p_mapping->slave_addr = p_child->slave_addr;
+			p_mapping->target_addr = p_child->target_addr;
 			p_mapping->dvo_wiring = p_child->dvo_wiring;
 			p_mapping->ddc_pin = p_child->ddc_pin;
 			p_mapping->i2c_pin = p_child->i2c_pin;
 			p_mapping->initialized = 1;
 			DRM_DEBUG_KMS("SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
 				      p_mapping->dvo_port,
-				      p_mapping->slave_addr,
+				      p_mapping->target_addr,
 				      p_mapping->dvo_wiring,
 				      p_mapping->ddc_pin,
 				      p_mapping->i2c_pin);
@@ -394,10 +394,10 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
 			DRM_DEBUG_KMS("Maybe one SDVO port is shared by "
 					 "two SDVO device.\n");
 		}
-		if (p_child->slave2_addr) {
+		if (p_child->target2_addr) {
 			/* Maybe this is a SDVO device with multiple inputs */
 			/* And the mapping info is not added */
-			DRM_DEBUG_KMS("there exists the slave2_addr. Maybe this"
+			DRM_DEBUG_KMS("there exists the target2_addr. Maybe this"
 				" is a SDVO device with multiple inputs.\n");
 		}
 		count++;
diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
index 0e6facf21e332..b5adea2a20c38 100644
--- a/drivers/gpu/drm/gma500/intel_bios.h
+++ b/drivers/gpu/drm/gma500/intel_bios.h
@@ -186,13 +186,13 @@ struct child_device_config {
 	u16 addin_offset;
 	u8  dvo_port; /* See Device_PORT_* above */
 	u8  i2c_pin;
-	u8  slave_addr;
+	u8  target_addr;
 	u8  ddc_pin;
 	u16 edid_ptr;
 	u8  dvo_cfg; /* See DEVICE_CFG_* above */
 	u8  dvo2_port;
 	u8  i2c2_pin;
-	u8  slave2_addr;
+	u8  target2_addr;
 	u8  ddc2_pin;
 	u8  capabilities;
 	u8  dvo_wiring;/* See DEVICE_WIRE_* above */
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index aa45509859f21..ee8b047587f25 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -333,7 +333,7 @@ gmbus_xfer(struct i2c_adapter *adapter,
 clear_err:
 	/* Toggle the Software Clear Interrupt bit. This has the effect
 	 * of resetting the GMBUS controller and so clearing the
-	 * BUS_ERROR raised by the slave's NAK.
+	 * BUS_ERROR raised by the target's NAK.
 	 */
 	GMBUS_REG_WRITE(GMBUS1 + reg_offset, GMBUS_SW_CLR_INT);
 	GMBUS_REG_WRITE(GMBUS1 + reg_offset, 0);
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 83c17689c454f..bddf89b82fecc 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -202,7 +202,7 @@ struct psb_intel_opregion {
 struct sdvo_device_mapping {
 	u8 initialized;
 	u8 dvo_port;
-	u8 slave_addr;
+	u8 target_addr;
 	u8 dvo_wiring;
 	u8 i2c_pin;
 	u8 i2c_speed;
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index c111e933e1ed2..2499fd6a80c9d 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -80,7 +80,7 @@ struct psb_intel_mode_device {
 struct gma_i2c_chan {
 	struct i2c_adapter base;
 	struct i2c_algo_bit_data algo;
-	u8 slave_addr;
+	u8 target_addr;
 
 	/* for getting at dev. private (mmio etc.) */
 	struct drm_device *drm_dev;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 8486de230ec91..d1cd9a9403959 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -97,7 +97,7 @@ static int psb_lvds_i2c_set_brightness(struct drm_device *dev,
 
 	struct i2c_msg msgs[] = {
 		{
-			.addr = lvds_i2c_bus->slave_addr,
+			.addr = lvds_i2c_bus->target_addr,
 			.flags = 0,
 			.len = 2,
 			.buf = out_buf,
@@ -707,7 +707,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 			dev->dev, "I2C bus registration failed.\n");
 		goto err_encoder_cleanup;
 	}
-	lvds_priv->i2c_bus->slave_addr = 0x2C;
+	lvds_priv->i2c_bus->target_addr = 0x2C;
 	dev_priv->lvds_i2c_bus =  lvds_priv->i2c_bus;
 
 	/*
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index e4f914decebae..8dafff963ca8b 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -70,7 +70,7 @@ struct psb_intel_sdvo {
 	struct gma_encoder base;
 
 	struct i2c_adapter *i2c;
-	u8 slave_addr;
+	u8 target_addr;
 
 	struct i2c_adapter ddc;
 
@@ -259,13 +259,13 @@ static bool psb_intel_sdvo_read_byte(struct psb_intel_sdvo *psb_intel_sdvo, u8 a
 {
 	struct i2c_msg msgs[] = {
 		{
-			.addr = psb_intel_sdvo->slave_addr,
+			.addr = psb_intel_sdvo->target_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = &addr,
 		},
 		{
-			.addr = psb_intel_sdvo->slave_addr,
+			.addr = psb_intel_sdvo->target_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = ch,
@@ -463,14 +463,14 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 	psb_intel_sdvo_debug_write(psb_intel_sdvo, cmd, args, args_len);
 
 	for (i = 0; i < args_len; i++) {
-		msgs[i].addr = psb_intel_sdvo->slave_addr;
+		msgs[i].addr = psb_intel_sdvo->target_addr;
 		msgs[i].flags = 0;
 		msgs[i].len = 2;
 		msgs[i].buf = buf + 2 *i;
 		buf[2*i + 0] = SDVO_I2C_ARG_0 - i;
 		buf[2*i + 1] = ((u8*)args)[i];
 	}
-	msgs[i].addr = psb_intel_sdvo->slave_addr;
+	msgs[i].addr = psb_intel_sdvo->target_addr;
 	msgs[i].flags = 0;
 	msgs[i].len = 2;
 	msgs[i].buf = buf + 2*i;
@@ -479,12 +479,12 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 
 	/* the following two are to read the response */
 	status = SDVO_I2C_CMD_STATUS;
-	msgs[i+1].addr = psb_intel_sdvo->slave_addr;
+	msgs[i+1].addr = psb_intel_sdvo->target_addr;
 	msgs[i+1].flags = 0;
 	msgs[i+1].len = 1;
 	msgs[i+1].buf = &status;
 
-	msgs[i+2].addr = psb_intel_sdvo->slave_addr;
+	msgs[i+2].addr = psb_intel_sdvo->target_addr;
 	msgs[i+2].flags = I2C_M_RD;
 	msgs[i+2].len = 1;
 	msgs[i+2].buf = &status;
@@ -1899,7 +1899,7 @@ psb_intel_sdvo_is_hdmi_connector(struct psb_intel_sdvo *psb_intel_sdvo, int devi
 }
 
 static u8
-psb_intel_sdvo_get_slave_addr(struct drm_device *dev, int sdvo_reg)
+psb_intel_sdvo_get_target_addr(struct drm_device *dev, int sdvo_reg)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct sdvo_device_mapping *my_mapping, *other_mapping;
@@ -1913,14 +1913,14 @@ psb_intel_sdvo_get_slave_addr(struct drm_device *dev, int sdvo_reg)
 	}
 
 	/* If the BIOS described our SDVO device, take advantage of it. */
-	if (my_mapping->slave_addr)
-		return my_mapping->slave_addr;
+	if (my_mapping->target_addr)
+		return my_mapping->target_addr;
 
 	/* If the BIOS only described a different SDVO device, use the
 	 * address that it isn't using.
 	 */
-	if (other_mapping->slave_addr) {
-		if (other_mapping->slave_addr == 0x70)
+	if (other_mapping->target_addr) {
+		if (other_mapping->target_addr == 0x70)
 			return 0x72;
 		else
 			return 0x70;
@@ -2446,7 +2446,7 @@ bool psb_intel_sdvo_init(struct drm_device *dev, int sdvo_reg)
 		return false;
 
 	psb_intel_sdvo->sdvo_reg = sdvo_reg;
-	psb_intel_sdvo->slave_addr = psb_intel_sdvo_get_slave_addr(dev, sdvo_reg) >> 1;
+	psb_intel_sdvo->target_addr = psb_intel_sdvo_get_target_addr(dev, sdvo_reg) >> 1;
 	psb_intel_sdvo_select_i2c_bus(dev_priv, psb_intel_sdvo, sdvo_reg);
 	if (!psb_intel_sdvo_init_ddc_proxy(psb_intel_sdvo, dev)) {
 		kfree(psb_intel_sdvo);
-- 
2.34.1


