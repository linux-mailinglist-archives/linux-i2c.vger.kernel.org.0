Return-Path: <linux-i2c+bounces-2694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA68933F7
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 18:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 634E11C22A5F
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 16:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C50156F5F;
	Sun, 31 Mar 2024 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Fq9Foy0j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED697156656;
	Sun, 31 Mar 2024 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711903219; cv=none; b=Q+Q6A5jUyObgvXBe3qZkgxTMr2bzL7x5c0Tf4VzziaMoOY667Q4yHn/5qfGoawbQkYF/VvSchaAKtDAd0MOQu6SkLMy/AqlU442NhYLt03HXFpfJy/Ig8UkE5wnT+Opdq3QOiQo+pBqRnvcHRI2R4fbSByTdHan9CVc0kHysGAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711903219; c=relaxed/simple;
	bh=0eZZv7jW/VBJ/AJ2nQrWYo41zmXJSjCnU0mqdAyjNuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GmaKK6aeLk2m+WyqVRAukhnF8xX9zDqNwbMJvCA7pZXXqowOVG1ctkn2O8LpqU4jMRkVu5+8VCFrA7T4ahlS8unh1h/QG+V1nt913cZSoSCBn/96jrNmM4YrIglA4zwHWEAuL7/MLl5pQJKDVlqOBwJ+lpLWDV6CbjwebSHwAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com; spf=fail smtp.mailfrom=lists.freedesktop.org; dkim=fail (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Fq9Foy0j reason="signature verification failed"; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lists.freedesktop.org
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 612FE208D6;
	Sun, 31 Mar 2024 18:40:11 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMNLqmCsccHt; Sun, 31 Mar 2024 18:40:09 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 8880D2087C;
	Sun, 31 Mar 2024 18:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 8880D2087C
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout2.secunet.com (Postfix) with ESMTP id 7A245800050;
	Sun, 31 Mar 2024 18:40:05 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:40:05 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:30 +0000
X-sender: <intel-gfx-bounces@lists.freedesktop.org>
X-Receiver: <martin.weber@secunet.com> ORCPT=rfc822;martin.weber@secunet.com
 NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJuYHy0vkvxLoOu7fW2WcxcPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAF4AAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249V2ViZXIgTWFydGluOTU1BQALABcAvgAAALMpUnVJ4+pPsL47FHo+lvtDTj1EQjIsQ049RGF0YWJhc2VzLENOPUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpLENOPUFkbWluaXN0cmF0aXZlIEdyb3VwcyxDTj1zZWN1bmV0LENOPU1pY3Jvc29mdCBFeGNoYW5nZSxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXNlY3VuZXQsREM9ZGUFAA4AEQBACf3SYEkDT461FZzDv+B7BQAdAA8ADAAAAG1ieC1lc3Nlbi0wMQUAPAACAAAPADYAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0Lk1haWxSZWNpcGllbnQuRGlzcGxheU5hbWUPAA0AAABXZWJlciwgTWFydGluBQAMAAIAAAUAbAACAAAFAFgAFwBGAAAAm5gfLS+S/Eug67t9bZZzF0NOPVdlYmVyIE1hcnRpbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8AL
	wAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAeHUFfe5Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGAAAAG1hcnRpbi53ZWJlckBzZWN1bmV0LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAAFAAUAAgABBQBiAAoA0gAAAO+KAAAFAGQADwADAAAASHVi
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 76315
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=131.252.210.177; helo=gabe.freedesktop.org; envelope-from=intel-gfx-bounces@lists.freedesktop.org; receiver=martin.weber@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 3842F20322
Authentication-Results: b.mx.secunet.com;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Fq9Foy0j"
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Fq9Foy0j";
	dkim-atps=neutral
X-Original-To: intel-gfx@lists.freedesktop.org
Delivered-To: intel-gfx@lists.freedesktop.org
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE66620E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731731;
 bh=TXF3chngF6WfBZMxY0bb+7aovYcEVbalNWIPlb+B8Qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fq9Foy0jdrIbtty2aeNBaIxnLWZbf1QQF+y14HHXF/SRp3a0OKFGF2Dcfg5BuUOYD
 /1fiCYAtQK3MTQ2MHiNPetXlXAhswmEupmGAn0/zeiZHroMo6Afb6X1k8qwZuFqcW+
 hJLg/90ix95mGIRi2UU9x1U5Xk2He7D8sbVpKNX4=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-gvt-dev@lists.freedesktop.org (open list:INTEL GVT-g DRIVERS (Intel GPU
 Virtualization))
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v0 03/14] drm/gma500,
 drm/i915: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:27 +0000
Message-ID: <20240329170038.3863998-4-eahariha@linux.microsoft.com>
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
X-Mailman-Approved-At: Sun, 31 Mar 2024 08:50:08 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]:
https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  2 +-
 drivers/gpu/drm/gma500/intel_bios.c           | 22 +++++++-------
 drivers/gpu/drm/gma500/intel_bios.h           |  4 +--
 drivers/gpu/drm/gma500/intel_gmbus.c          |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h              |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h        |  2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  4 +--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       | 26 ++++++++--------
 drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
 drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
 drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
 drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
 drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
 drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 .../gpu/drm/i915/display/intel_display_core.h |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 18 +++++------
 drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
 drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
 drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
 drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
 27 files changed, 150 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index f08a6803dc18..84c9122062c4 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -565,7 +565,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 			dev->dev, "I2C bus registration failed.\n");
 		goto err_encoder_cleanup;
 	}
-	gma_encoder->i2c_bus->slave_addr = 0x2C;
+	gma_encoder->i2c_bus->client_addr = 0x2C;
 	dev_priv->lvds_i2c_bus = gma_encoder->i2c_bus;
 
 	/*
diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index 8245b5603d2c..333bece1a64f 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -14,8 +14,8 @@
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
 
-#define	SLAVE_ADDR1	0x70
-#define	SLAVE_ADDR2	0x72
+#define	CLIENT_ADDR1	0x70
+#define	CLIENT_ADDR2	0x72
 
 static void *find_section(struct bdb_header *bdb, int section_id)
 {
@@ -357,10 +357,10 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
 			/* skip the device block if device type is invalid */
 			continue;
 		}
-		if (p_child->slave_addr != SLAVE_ADDR1 &&
-			p_child->slave_addr != SLAVE_ADDR2) {
+		if (p_child->client_addr != CLIENT_ADDR1 &&
+			p_child->client_addr != CLIENT_ADDR2) {
 			/*
-			 * If the slave address is neither 0x70 nor 0x72,
+			 * If the client address is neither 0x70 nor 0x72,
 			 * it is not a SDVO device. Skip it.
 			 */
 			continue;
@@ -371,22 +371,22 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
 			DRM_DEBUG_KMS("Incorrect SDVO port. Skip it\n");
 			continue;
 		}
-		DRM_DEBUG_KMS("the SDVO device with slave addr %2x is found on"
+		DRM_DEBUG_KMS("the SDVO device with client addr %2x is found on"
 				" %s port\n",
-				p_child->slave_addr,
+				p_child->client_addr,
 				(p_child->dvo_port == DEVICE_PORT_DVOB) ?
 					"SDVOB" : "SDVOC");
 		p_mapping = &(dev_priv->sdvo_mappings[p_child->dvo_port - 1]);
 		if (!p_mapping->initialized) {
 			p_mapping->dvo_port = p_child->dvo_port;
-			p_mapping->slave_addr = p_child->slave_addr;
+			p_mapping->client_addr = p_child->client_addr;
 			p_mapping->dvo_wiring = p_child->dvo_wiring;
 			p_mapping->ddc_pin = p_child->ddc_pin;
 			p_mapping->i2c_pin = p_child->i2c_pin;
 			p_mapping->initialized = 1;
 			DRM_DEBUG_KMS("SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
 				      p_mapping->dvo_port,
-				      p_mapping->slave_addr,
+				      p_mapping->client_addr,
 				      p_mapping->dvo_wiring,
 				      p_mapping->ddc_pin,
 				      p_mapping->i2c_pin);
@@ -394,10 +394,10 @@ parse_sdvo_device_mapping(struct drm_psb_private *dev_priv,
 			DRM_DEBUG_KMS("Maybe one SDVO port is shared by "
 					 "two SDVO device.\n");
 		}
-		if (p_child->slave2_addr) {
+		if (p_child->client2_addr) {
 			/* Maybe this is a SDVO device with multiple inputs */
 			/* And the mapping info is not added */
-			DRM_DEBUG_KMS("there exists the slave2_addr. Maybe this"
+			DRM_DEBUG_KMS("there exists the client2_addr. Maybe this"
 				" is a SDVO device with multiple inputs.\n");
 		}
 		count++;
diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
index 0e6facf21e33..cfca33427f94 100644
--- a/drivers/gpu/drm/gma500/intel_bios.h
+++ b/drivers/gpu/drm/gma500/intel_bios.h
@@ -186,13 +186,13 @@ struct child_device_config {
 	u16 addin_offset;
 	u8  dvo_port; /* See Device_PORT_* above */
 	u8  i2c_pin;
-	u8  slave_addr;
+	u8  client_addr;
 	u8  ddc_pin;
 	u16 edid_ptr;
 	u8  dvo_cfg; /* See DEVICE_CFG_* above */
 	u8  dvo2_port;
 	u8  i2c2_pin;
-	u8  slave2_addr;
+	u8  client2_addr;
 	u8  ddc2_pin;
 	u8  capabilities;
 	u8  dvo_wiring;/* See DEVICE_WIRE_* above */
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index aa45509859f2..94cf854b1d3d 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -333,7 +333,7 @@ gmbus_xfer(struct i2c_adapter *adapter,
 clear_err:
 	/* Toggle the Software Clear Interrupt bit. This has the effect
 	 * of resetting the GMBUS controller and so clearing the
-	 * BUS_ERROR raised by the slave's NAK.
+	 * BUS_ERROR raised by the client's NAK.
 	 */
 	GMBUS_REG_WRITE(GMBUS1 + reg_offset, GMBUS_SW_CLR_INT);
 	GMBUS_REG_WRITE(GMBUS1 + reg_offset, 0);
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index c5edfa4aa4cc..bbf3af1b01cd 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -203,7 +203,7 @@ struct psb_intel_opregion {
 struct sdvo_device_mapping {
 	u8 initialized;
 	u8 dvo_port;
-	u8 slave_addr;
+	u8 client_addr;
 	u8 dvo_wiring;
 	u8 i2c_pin;
 	u8 i2c_speed;
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index c111e933e1ed..3536414c1988 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -80,7 +80,7 @@ struct psb_intel_mode_device {
 struct gma_i2c_chan {
 	struct i2c_adapter base;
 	struct i2c_algo_bit_data algo;
-	u8 slave_addr;
+	u8 client_addr;
 
 	/* for getting at dev. private (mmio etc.) */
 	struct drm_device *drm_dev;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 8486de230ec9..3ce54aaf92ce 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -97,7 +97,7 @@ static int psb_lvds_i2c_set_brightness(struct drm_device *dev,
 
 	struct i2c_msg msgs[] = {
 		{
-			.addr = lvds_i2c_bus->slave_addr,
+			.addr = lvds_i2c_bus->client_addr,
 			.flags = 0,
 			.len = 2,
 			.buf = out_buf,
@@ -707,7 +707,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 			dev->dev, "I2C bus registration failed.\n");
 		goto err_encoder_cleanup;
 	}
-	lvds_priv->i2c_bus->slave_addr = 0x2C;
+	lvds_priv->i2c_bus->client_addr = 0x2C;
 	dev_priv->lvds_i2c_bus =  lvds_priv->i2c_bus;
 
 	/*
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index e4f914deceba..39a3b696efc5 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -70,7 +70,7 @@ struct psb_intel_sdvo {
 	struct gma_encoder base;
 
 	struct i2c_adapter *i2c;
-	u8 slave_addr;
+	u8 client_addr;
 
 	struct i2c_adapter ddc;
 
@@ -259,13 +259,13 @@ static bool psb_intel_sdvo_read_byte(struct psb_intel_sdvo *psb_intel_sdvo, u8 a
 {
 	struct i2c_msg msgs[] = {
 		{
-			.addr = psb_intel_sdvo->slave_addr,
+			.addr = psb_intel_sdvo->client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = &addr,
 		},
 		{
-			.addr = psb_intel_sdvo->slave_addr,
+			.addr = psb_intel_sdvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = ch,
@@ -463,14 +463,14 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 	psb_intel_sdvo_debug_write(psb_intel_sdvo, cmd, args, args_len);
 
 	for (i = 0; i < args_len; i++) {
-		msgs[i].addr = psb_intel_sdvo->slave_addr;
+		msgs[i].addr = psb_intel_sdvo->client_addr;
 		msgs[i].flags = 0;
 		msgs[i].len = 2;
 		msgs[i].buf = buf + 2 *i;
 		buf[2*i + 0] = SDVO_I2C_ARG_0 - i;
 		buf[2*i + 1] = ((u8*)args)[i];
 	}
-	msgs[i].addr = psb_intel_sdvo->slave_addr;
+	msgs[i].addr = psb_intel_sdvo->client_addr;
 	msgs[i].flags = 0;
 	msgs[i].len = 2;
 	msgs[i].buf = buf + 2*i;
@@ -479,12 +479,12 @@ static bool psb_intel_sdvo_write_cmd(struct psb_intel_sdvo *psb_intel_sdvo, u8 c
 
 	/* the following two are to read the response */
 	status = SDVO_I2C_CMD_STATUS;
-	msgs[i+1].addr = psb_intel_sdvo->slave_addr;
+	msgs[i+1].addr = psb_intel_sdvo->client_addr;
 	msgs[i+1].flags = 0;
 	msgs[i+1].len = 1;
 	msgs[i+1].buf = &status;
 
-	msgs[i+2].addr = psb_intel_sdvo->slave_addr;
+	msgs[i+2].addr = psb_intel_sdvo->client_addr;
 	msgs[i+2].flags = I2C_M_RD;
 	msgs[i+2].len = 1;
 	msgs[i+2].buf = &status;
@@ -1899,7 +1899,7 @@ psb_intel_sdvo_is_hdmi_connector(struct psb_intel_sdvo *psb_intel_sdvo, int devi
 }
 
 static u8
-psb_intel_sdvo_get_slave_addr(struct drm_device *dev, int sdvo_reg)
+psb_intel_sdvo_get_client_addr(struct drm_device *dev, int sdvo_reg)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct sdvo_device_mapping *my_mapping, *other_mapping;
@@ -1913,14 +1913,14 @@ psb_intel_sdvo_get_slave_addr(struct drm_device *dev, int sdvo_reg)
 	}
 
 	/* If the BIOS described our SDVO device, take advantage of it. */
-	if (my_mapping->slave_addr)
-		return my_mapping->slave_addr;
+	if (my_mapping->client_addr)
+		return my_mapping->client_addr;
 
 	/* If the BIOS only described a different SDVO device, use the
 	 * address that it isn't using.
 	 */
-	if (other_mapping->slave_addr) {
-		if (other_mapping->slave_addr == 0x70)
+	if (other_mapping->client_addr) {
+		if (other_mapping->client_addr == 0x70)
 			return 0x72;
 		else
 			return 0x70;
@@ -2446,7 +2446,7 @@ bool psb_intel_sdvo_init(struct drm_device *dev, int sdvo_reg)
 		return false;
 
 	psb_intel_sdvo->sdvo_reg = sdvo_reg;
-	psb_intel_sdvo->slave_addr = psb_intel_sdvo_get_slave_addr(dev, sdvo_reg) >> 1;
+	psb_intel_sdvo->client_addr = psb_intel_sdvo_get_client_addr(dev, sdvo_reg) >> 1;
 	psb_intel_sdvo_select_i2c_bus(dev_priv, psb_intel_sdvo, sdvo_reg);
 	if (!psb_intel_sdvo_init_ddc_proxy(psb_intel_sdvo, dev)) {
 		kfree(psb_intel_sdvo);
diff --git a/drivers/gpu/drm/i915/display/dvo_ch7017.c b/drivers/gpu/drm/i915/display/dvo_ch7017.c
index d0c3880d7f80..b9d04581b820 100644
--- a/drivers/gpu/drm/i915/display/dvo_ch7017.c
+++ b/drivers/gpu/drm/i915/display/dvo_ch7017.c
@@ -170,13 +170,13 @@ static bool ch7017_read(struct intel_dvo_device *dvo, u8 addr, u8 *val)
 {
 	struct i2c_msg msgs[] = {
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = &addr,
 		},
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = val,
@@ -189,7 +189,7 @@ static bool ch7017_write(struct intel_dvo_device *dvo, u8 addr, u8 val)
 {
 	u8 buf[2] = { addr, val };
 	struct i2c_msg msg = {
-		.addr = dvo->slave_addr,
+		.addr = dvo->client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = buf,
@@ -197,7 +197,7 @@ static bool ch7017_write(struct intel_dvo_device *dvo, u8 addr, u8 val)
 	return i2c_transfer(dvo->i2c_bus, &msg, 1) == 1;
 }
 
-/** Probes for a CH7017 on the given bus and slave address. */
+/** Probes for a CH7017 on the given bus and client address. */
 static bool ch7017_init(struct intel_dvo_device *dvo,
 			struct i2c_adapter *adapter)
 {
@@ -227,13 +227,13 @@ static bool ch7017_init(struct intel_dvo_device *dvo,
 		break;
 	default:
 		DRM_DEBUG_KMS("ch701x not detected, got %d: from %s "
-			      "slave %d.\n",
-			      val, adapter->name, dvo->slave_addr);
+			      "client %d.\n",
+			      val, adapter->name, dvo->client_addr);
 		goto fail;
 	}
 
 	DRM_DEBUG_KMS("%s detected on %s, addr %d\n",
-		      str, adapter->name, dvo->slave_addr);
+		      str, adapter->name, dvo->client_addr);
 	return true;
 
 fail:
diff --git a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
index 2e8e85da5a40..8e36d6e2dde0 100644
--- a/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
+++ b/drivers/gpu/drm/i915/display/dvo_ch7xxx.c
@@ -153,13 +153,13 @@ static bool ch7xxx_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	struct i2c_msg msgs[] = {
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -176,7 +176,7 @@ static bool ch7xxx_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	if (!ch7xxx->quiet) {
 		DRM_DEBUG_KMS("Unable to read register 0x%02x from %s:%02x.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 	return false;
 }
@@ -188,7 +188,7 @@ static bool ch7xxx_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 	struct i2c_adapter *adapter = dvo->i2c_bus;
 	u8 out_buf[2];
 	struct i2c_msg msg = {
-		.addr = dvo->slave_addr,
+		.addr = dvo->client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
@@ -202,7 +202,7 @@ static bool ch7xxx_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 
 	if (!ch7xxx->quiet) {
 		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 
 	return false;
@@ -229,8 +229,8 @@ static bool ch7xxx_init(struct intel_dvo_device *dvo,
 
 	name = ch7xxx_get_id(vendor);
 	if (!name) {
-		DRM_DEBUG_KMS("ch7xxx not detected; got VID 0x%02x from %s slave %d.\n",
-			      vendor, adapter->name, dvo->slave_addr);
+		DRM_DEBUG_KMS("ch7xxx not detected; got VID 0x%02x from %s client %d.\n",
+			      vendor, adapter->name, dvo->client_addr);
 		goto out;
 	}
 
@@ -240,8 +240,8 @@ static bool ch7xxx_init(struct intel_dvo_device *dvo,
 
 	devid = ch7xxx_get_did(device);
 	if (!devid) {
-		DRM_DEBUG_KMS("ch7xxx not detected; got DID 0x%02x from %s slave %d.\n",
-			      device, adapter->name, dvo->slave_addr);
+		DRM_DEBUG_KMS("ch7xxx not detected; got DID 0x%02x from %s client %d.\n",
+			      device, adapter->name, dvo->client_addr);
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/dvo_ivch.c b/drivers/gpu/drm/i915/display/dvo_ivch.c
index eef72bb3b767..718bb17da2e3 100644
--- a/drivers/gpu/drm/i915/display/dvo_ivch.c
+++ b/drivers/gpu/drm/i915/display/dvo_ivch.c
@@ -198,7 +198,7 @@ static bool ivch_read(struct intel_dvo_device *dvo, int addr, u16 *data)
 
 	struct i2c_msg msgs[] = {
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 0,
 		},
@@ -209,7 +209,7 @@ static bool ivch_read(struct intel_dvo_device *dvo, int addr, u16 *data)
 			.buf = out_buf,
 		},
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = I2C_M_RD | I2C_M_NOSTART,
 			.len = 2,
 			.buf = in_buf,
@@ -226,7 +226,7 @@ static bool ivch_read(struct intel_dvo_device *dvo, int addr, u16 *data)
 	if (!priv->quiet) {
 		DRM_DEBUG_KMS("Unable to read register 0x%02x from "
 				"%s:%02x.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 	return false;
 }
@@ -238,7 +238,7 @@ static bool ivch_write(struct intel_dvo_device *dvo, int addr, u16 data)
 	struct i2c_adapter *adapter = dvo->i2c_bus;
 	u8 out_buf[3];
 	struct i2c_msg msg = {
-		.addr = dvo->slave_addr,
+		.addr = dvo->client_addr,
 		.flags = 0,
 		.len = 3,
 		.buf = out_buf,
@@ -253,13 +253,13 @@ static bool ivch_write(struct intel_dvo_device *dvo, int addr, u16 data)
 
 	if (!priv->quiet) {
 		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 
 	return false;
 }
 
-/* Probes the given bus and slave address for an ivch */
+/* Probes the given bus and client address for an ivch */
 static bool ivch_init(struct intel_dvo_device *dvo,
 		      struct i2c_adapter *adapter)
 {
@@ -283,10 +283,10 @@ static bool ivch_init(struct intel_dvo_device *dvo,
 	 * very unique, check that the value in the base address field matches
 	 * the address it's responding on.
 	 */
-	if ((temp & VR00_BASE_ADDRESS_MASK) != dvo->slave_addr) {
+	if ((temp & VR00_BASE_ADDRESS_MASK) != dvo->client_addr) {
 		DRM_DEBUG_KMS("ivch detect failed due to address mismatch "
 			  "(%d vs %d)\n",
-			  (temp & VR00_BASE_ADDRESS_MASK), dvo->slave_addr);
+			  (temp & VR00_BASE_ADDRESS_MASK), dvo->client_addr);
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/dvo_ns2501.c b/drivers/gpu/drm/i915/display/dvo_ns2501.c
index 1df212fb000e..b15875a832f5 100644
--- a/drivers/gpu/drm/i915/display/dvo_ns2501.c
+++ b/drivers/gpu/drm/i915/display/dvo_ns2501.c
@@ -399,13 +399,13 @@ static bool ns2501_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	struct i2c_msg msgs[] = {
 		{
-		 .addr = dvo->slave_addr,
+		 .addr = dvo->client_addr,
 		 .flags = 0,
 		 .len = 1,
 		 .buf = out_buf,
 		 },
 		{
-		 .addr = dvo->slave_addr,
+		 .addr = dvo->client_addr,
 		 .flags = I2C_M_RD,
 		 .len = 1,
 		 .buf = in_buf,
@@ -423,7 +423,7 @@ static bool ns2501_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 	if (!ns->quiet) {
 		DRM_DEBUG_KMS
 		    ("Unable to read register 0x%02x from %s:0x%02x.\n", addr,
-		     adapter->name, dvo->slave_addr);
+		     adapter->name, dvo->client_addr);
 	}
 
 	return false;
@@ -442,7 +442,7 @@ static bool ns2501_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 	u8 out_buf[2];
 
 	struct i2c_msg msg = {
-		.addr = dvo->slave_addr,
+		.addr = dvo->client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
@@ -457,7 +457,7 @@ static bool ns2501_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 
 	if (!ns->quiet) {
 		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d\n",
-			      addr, adapter->name, dvo->slave_addr);
+			      addr, adapter->name, dvo->client_addr);
 	}
 
 	return false;
@@ -488,8 +488,8 @@ static bool ns2501_init(struct intel_dvo_device *dvo,
 		goto out;
 
 	if (ch != (NS2501_VID & 0xff)) {
-		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Slave %d.\n",
-			      ch, adapter->name, dvo->slave_addr);
+		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Client %d.\n",
+			      ch, adapter->name, dvo->client_addr);
 		goto out;
 	}
 
@@ -497,8 +497,8 @@ static bool ns2501_init(struct intel_dvo_device *dvo,
 		goto out;
 
 	if (ch != (NS2501_DID & 0xff)) {
-		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Slave %d.\n",
-			      ch, adapter->name, dvo->slave_addr);
+		DRM_DEBUG_KMS("ns2501 not detected got %d: from %s Client %d.\n",
+			      ch, adapter->name, dvo->client_addr);
 		goto out;
 	}
 	ns->quiet = false;
diff --git a/drivers/gpu/drm/i915/display/dvo_sil164.c b/drivers/gpu/drm/i915/display/dvo_sil164.c
index 6c461024c8e3..e9e4433ffa14 100644
--- a/drivers/gpu/drm/i915/display/dvo_sil164.c
+++ b/drivers/gpu/drm/i915/display/dvo_sil164.c
@@ -79,13 +79,13 @@ static bool sil164_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	struct i2c_msg msgs[] = {
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -102,7 +102,7 @@ static bool sil164_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	if (!sil->quiet) {
 		DRM_DEBUG_KMS("Unable to read register 0x%02x from %s:%02x.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 	return false;
 }
@@ -113,7 +113,7 @@ static bool sil164_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 	struct i2c_adapter *adapter = dvo->i2c_bus;
 	u8 out_buf[2];
 	struct i2c_msg msg = {
-		.addr = dvo->slave_addr,
+		.addr = dvo->client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
@@ -127,7 +127,7 @@ static bool sil164_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 
 	if (!sil->quiet) {
 		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 
 	return false;
@@ -153,8 +153,8 @@ static bool sil164_init(struct intel_dvo_device *dvo,
 		goto out;
 
 	if (ch != (SIL164_VID & 0xff)) {
-		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Slave %d.\n",
-			  ch, adapter->name, dvo->slave_addr);
+		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Client %d.\n",
+			  ch, adapter->name, dvo->client_addr);
 		goto out;
 	}
 
@@ -162,8 +162,8 @@ static bool sil164_init(struct intel_dvo_device *dvo,
 		goto out;
 
 	if (ch != (SIL164_DID & 0xff)) {
-		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Slave %d.\n",
-			  ch, adapter->name, dvo->slave_addr);
+		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Client %d.\n",
+			  ch, adapter->name, dvo->client_addr);
 		goto out;
 	}
 	sil->quiet = false;
diff --git a/drivers/gpu/drm/i915/display/dvo_tfp410.c b/drivers/gpu/drm/i915/display/dvo_tfp410.c
index 0939e097f4f9..ef1385fc16e7 100644
--- a/drivers/gpu/drm/i915/display/dvo_tfp410.c
+++ b/drivers/gpu/drm/i915/display/dvo_tfp410.c
@@ -100,13 +100,13 @@ static bool tfp410_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	struct i2c_msg msgs[] = {
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = out_buf,
 		},
 		{
-			.addr = dvo->slave_addr,
+			.addr = dvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = in_buf,
@@ -123,7 +123,7 @@ static bool tfp410_readb(struct intel_dvo_device *dvo, int addr, u8 *ch)
 
 	if (!tfp->quiet) {
 		DRM_DEBUG_KMS("Unable to read register 0x%02x from %s:%02x.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 	return false;
 }
@@ -134,7 +134,7 @@ static bool tfp410_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 	struct i2c_adapter *adapter = dvo->i2c_bus;
 	u8 out_buf[2];
 	struct i2c_msg msg = {
-		.addr = dvo->slave_addr,
+		.addr = dvo->client_addr,
 		.flags = 0,
 		.len = 2,
 		.buf = out_buf,
@@ -148,7 +148,7 @@ static bool tfp410_writeb(struct intel_dvo_device *dvo, int addr, u8 ch)
 
 	if (!tfp->quiet) {
 		DRM_DEBUG_KMS("Unable to write register 0x%02x to %s:%d.\n",
-			  addr, adapter->name, dvo->slave_addr);
+			  addr, adapter->name, dvo->client_addr);
 	}
 
 	return false;
@@ -183,15 +183,15 @@ static bool tfp410_init(struct intel_dvo_device *dvo,
 
 	if ((id = tfp410_getid(dvo, TFP410_VID_LO)) != TFP410_VID) {
 		DRM_DEBUG_KMS("tfp410 not detected got VID %X: from %s "
-				"Slave %d.\n",
-			  id, adapter->name, dvo->slave_addr);
+				"Client %d.\n",
+			  id, adapter->name, dvo->client_addr);
 		goto out;
 	}
 
 	if ((id = tfp410_getid(dvo, TFP410_DID_LO)) != TFP410_DID) {
 		DRM_DEBUG_KMS("tfp410 not detected got DID %X: from %s "
-				"Slave %d.\n",
-			  id, adapter->name, dvo->slave_addr);
+				"Client %d.\n",
+			  id, adapter->name, dvo->client_addr);
 		goto out;
 	}
 	tfp->quiet = false;
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index fe52c06271ef..dbeb3a89d004 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -69,8 +69,8 @@ struct intel_bios_encoder_data {
 	struct list_head node;
 };
 
-#define	SLAVE_ADDR1	0x70
-#define	SLAVE_ADDR2	0x72
+#define	CLIENT_ADDR1	0x70
+#define	CLIENT_ADDR2	0x72
 
 /* Get BDB block size given a pointer to Block ID. */
 static u32 _get_blocksize(const u8 *block_base)
@@ -1231,10 +1231,10 @@ parse_sdvo_device_mapping(struct drm_i915_private *i915)
 		const struct child_device_config *child = &devdata->child;
 		struct sdvo_device_mapping *mapping;
 
-		if (child->slave_addr != SLAVE_ADDR1 &&
-		    child->slave_addr != SLAVE_ADDR2) {
+		if (child->client_addr != CLIENT_ADDR1 &&
+		    child->client_addr != CLIENT_ADDR2) {
 			/*
-			 * If the slave address is neither 0x70 nor 0x72,
+			 * If the client address is neither 0x70 nor 0x72,
 			 * it is not a SDVO device. Skip it.
 			 */
 			continue;
@@ -1247,22 +1247,22 @@ parse_sdvo_device_mapping(struct drm_i915_private *i915)
 			continue;
 		}
 		drm_dbg_kms(&i915->drm,
-			    "the SDVO device with slave addr %2x is found on"
+			    "the SDVO device with client addr %2x is found on"
 			    " %s port\n",
-			    child->slave_addr,
+			    child->client_addr,
 			    (child->dvo_port == DEVICE_PORT_DVOB) ?
 			    "SDVOB" : "SDVOC");
 		mapping = &i915->display.vbt.sdvo_mappings[child->dvo_port - 1];
 		if (!mapping->initialized) {
 			mapping->dvo_port = child->dvo_port;
-			mapping->slave_addr = child->slave_addr;
+			mapping->client_addr = child->client_addr;
 			mapping->dvo_wiring = child->dvo_wiring;
 			mapping->ddc_pin = child->ddc_pin;
 			mapping->i2c_pin = child->i2c_pin;
 			mapping->initialized = 1;
 			drm_dbg_kms(&i915->drm,
 				    "SDVO device: dvo=%x, addr=%x, wiring=%d, ddc_pin=%d, i2c_pin=%d\n",
-				    mapping->dvo_port, mapping->slave_addr,
+				    mapping->dvo_port, mapping->client_addr,
 				    mapping->dvo_wiring, mapping->ddc_pin,
 				    mapping->i2c_pin);
 		} else {
@@ -1270,11 +1270,11 @@ parse_sdvo_device_mapping(struct drm_i915_private *i915)
 				    "Maybe one SDVO port is shared by "
 				    "two SDVO device.\n");
 		}
-		if (child->slave2_addr) {
+		if (child->client2_addr) {
 			/* Maybe this is a SDVO device with multiple inputs */
 			/* And the mapping info is not added */
 			drm_dbg_kms(&i915->drm,
-				    "there exists the slave2_addr. Maybe this"
+				    "there exists the client2_addr. Maybe this"
 				    " is a SDVO device with multiple inputs.\n");
 		}
 		count++;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index c587a8efeafc..c408daee412a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4327,7 +4327,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 									connector->tile_group->id);
 
 	/*
-	 * EDP Transcoders cannot be ensalved
+	 * EDP Transcoders cannot be slaves
 	 * make them a master always when present
 	 */
 	if (port_sync_transcoders & BIT(TRANSCODER_EDP))
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 2167dbee5eea..663be73536e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -236,7 +236,7 @@ struct intel_vbt_data {
 	struct sdvo_device_mapping {
 		u8 initialized;
 		u8 dvo_port;
-		u8 slave_addr;
+		u8 client_addr;
 		u8 dvo_wiring;
 		u8 i2c_pin;
 		u8 ddc_pin;
diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
index e99c94edfaae..d1031fe69e76 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.h
+++ b/drivers/gpu/drm/i915/display/intel_dsi.h
@@ -66,7 +66,7 @@ struct intel_dsi {
 	/* number of DSI lanes */
 	unsigned int lane_count;
 
-	/* i2c bus associated with the slave device */
+	/* i2c bus associated with the client device */
 	int i2c_bus_num;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index a5d7fc8418c9..3335d4e31964 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -56,7 +56,7 @@
 #define MIPI_PORT_SHIFT			3
 
 struct i2c_adapter_lookup {
-	u16 slave_addr;
+	u16 client_addr;
 	struct intel_dsi *intel_dsi;
 	acpi_handle dev_handle;
 };
@@ -443,7 +443,7 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
 	if (!i2c_acpi_get_i2c_resource(ares, &sb))
 		return 1;
 
-	if (lookup->slave_addr != sb->slave_address)
+	if (lookup->client_addr != sb->slave_address)
 		return 1;
 
 	status = acpi_get_handle(lookup->dev_handle,
@@ -460,12 +460,12 @@ static int i2c_adapter_lookup(struct acpi_resource *ares, void *data)
 }
 
 static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
-				  const u16 slave_addr)
+				  const u16 client_addr)
 {
 	struct drm_device *drm_dev = intel_dsi->base.base.dev;
 	struct acpi_device *adev = ACPI_COMPANION(drm_dev->dev);
 	struct i2c_adapter_lookup lookup = {
-		.slave_addr = slave_addr,
+		.client_addr = client_addr,
 		.intel_dsi = intel_dsi,
 		.dev_handle = acpi_device_handle(adev),
 	};
@@ -476,7 +476,7 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 }
 #else
 static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
-					 const u16 slave_addr)
+					 const u16 client_addr)
 {
 }
 #endif
@@ -488,17 +488,17 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 	struct i2c_msg msg;
 	int ret;
 	u8 vbt_i2c_bus_num = *(data + 2);
-	u16 slave_addr = *(u16 *)(data + 3);
+	u16 client_addr = *(u16 *)(data + 3);
 	u8 reg_offset = *(data + 5);
 	u8 payload_size = *(data + 6);
 	u8 *payload_data;
 
 	drm_dbg_kms(&i915->drm, "bus %d client-addr 0x%02x reg 0x%02x data %*ph\n",
-		    vbt_i2c_bus_num, slave_addr, reg_offset, payload_size, data + 7);
+		    vbt_i2c_bus_num, client_addr, reg_offset, payload_size, data + 7);
 
 	if (intel_dsi->i2c_bus_num < 0) {
 		intel_dsi->i2c_bus_num = vbt_i2c_bus_num;
-		i2c_acpi_find_adapter(intel_dsi, slave_addr);
+		i2c_acpi_find_adapter(intel_dsi, client_addr);
 	}
 
 	adapter = i2c_get_adapter(intel_dsi->i2c_bus_num);
@@ -514,7 +514,7 @@ static const u8 *mipi_exec_i2c(struct intel_dsi *intel_dsi, const u8 *data)
 	payload_data[0] = reg_offset;
 	memcpy(&payload_data[1], (data + 7), payload_size);
 
-	msg.addr = slave_addr;
+	msg.addr = client_addr;
 	msg.flags = 0;
 	msg.len = payload_size + 1;
 	msg.buf = payload_data;
diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index c076da75b066..7da2725149e4 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -60,42 +60,42 @@ static const struct intel_dvo_device intel_dvo_devices[] = {
 		.type = INTEL_DVO_CHIP_TMDS,
 		.name = "sil164",
 		.port = PORT_C,
-		.slave_addr = SIL164_ADDR,
+		.client_addr = SIL164_ADDR,
 		.dev_ops = &sil164_ops,
 	},
 	{
 		.type = INTEL_DVO_CHIP_TMDS,
 		.name = "ch7xxx",
 		.port = PORT_C,
-		.slave_addr = CH7xxx_ADDR,
+		.client_addr = CH7xxx_ADDR,
 		.dev_ops = &ch7xxx_ops,
 	},
 	{
 		.type = INTEL_DVO_CHIP_TMDS,
 		.name = "ch7xxx",
 		.port = PORT_C,
-		.slave_addr = 0x75, /* For some ch7010 */
+		.client_addr = 0x75, /* For some ch7010 */
 		.dev_ops = &ch7xxx_ops,
 	},
 	{
 		.type = INTEL_DVO_CHIP_LVDS,
 		.name = "ivch",
 		.port = PORT_A,
-		.slave_addr = 0x02, /* Might also be 0x44, 0x84, 0xc4 */
+		.client_addr = 0x02, /* Might also be 0x44, 0x84, 0xc4 */
 		.dev_ops = &ivch_ops,
 	},
 	{
 		.type = INTEL_DVO_CHIP_TMDS,
 		.name = "tfp410",
 		.port = PORT_C,
-		.slave_addr = TFP410_ADDR,
+		.client_addr = TFP410_ADDR,
 		.dev_ops = &tfp410_ops,
 	},
 	{
 		.type = INTEL_DVO_CHIP_LVDS,
 		.name = "ch7017",
 		.port = PORT_C,
-		.slave_addr = 0x75,
+		.client_addr = 0x75,
 		.gpio = GMBUS_PIN_DPB,
 		.dev_ops = &ch7017_ops,
 	},
@@ -103,7 +103,7 @@ static const struct intel_dvo_device intel_dvo_devices[] = {
 		.type = INTEL_DVO_CHIP_LVDS_NO_FIXED,
 		.name = "ns2501",
 		.port = PORT_B,
-		.slave_addr = NS2501_ADDR,
+		.client_addr = NS2501_ADDR,
 		.dev_ops = &ns2501_ops,
 	},
 };
diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
index af7b04539b93..042949ac8a16 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
+++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
@@ -38,7 +38,7 @@ struct intel_dvo_device {
 	enum port port;
 	/* GPIO register used for i2c bus to control this device */
 	u32 gpio;
-	int slave_addr;
+	int client_addr;
 
 	const struct intel_dvo_dev_ops *dev_ops;
 	void *dev_priv;
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index d3e03ed5b79c..cbbdd84b4641 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -478,7 +478,7 @@ gmbus_xfer_read_chunk(struct drm_i915_private *i915,
 /*
  * HW spec says that 512Bytes in Burst read need special treatment.
  * But it doesn't talk about other multiple of 256Bytes. And couldn't locate
- * an I2C slave, which supports such a lengthy burst read too for experiments.
+ * an I2C client, which supports such a lengthy burst read too for experiments.
  *
  * So until things get clarified on HW support, to avoid the burst read length
  * in fold of 256Bytes except 512, max burst read length is fixed at 767Bytes.
@@ -701,7 +701,7 @@ do_gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num,
 
 	/* Toggle the Software Clear Interrupt bit. This has the effect
 	 * of resetting the GMBUS controller and so clearing the
-	 * BUS_ERROR raised by the slave's NAK.
+	 * BUS_ERROR raised by the client's NAK.
 	 */
 	intel_de_write_fw(i915, GMBUS1(i915), GMBUS_SW_CLR_INT);
 	intel_de_write_fw(i915, GMBUS1(i915), 0);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 5f9e748adc89..126493c662c5 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -95,7 +95,7 @@ struct intel_sdvo {
 	struct intel_encoder base;
 
 	struct i2c_adapter *i2c;
-	u8 slave_addr;
+	u8 client_addr;
 
 	struct intel_sdvo_ddc ddc[3];
 
@@ -255,13 +255,13 @@ static bool intel_sdvo_read_byte(struct intel_sdvo *intel_sdvo, u8 addr, u8 *ch)
 	struct drm_i915_private *i915 = to_i915(intel_sdvo->base.base.dev);
 	struct i2c_msg msgs[] = {
 		{
-			.addr = intel_sdvo->slave_addr,
+			.addr = intel_sdvo->client_addr,
 			.flags = 0,
 			.len = 1,
 			.buf = &addr,
 		},
 		{
-			.addr = intel_sdvo->slave_addr,
+			.addr = intel_sdvo->client_addr,
 			.flags = I2C_M_RD,
 			.len = 1,
 			.buf = ch,
@@ -483,14 +483,14 @@ static bool __intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
 	intel_sdvo_debug_write(intel_sdvo, cmd, args, args_len);
 
 	for (i = 0; i < args_len; i++) {
-		msgs[i].addr = intel_sdvo->slave_addr;
+		msgs[i].addr = intel_sdvo->client_addr;
 		msgs[i].flags = 0;
 		msgs[i].len = 2;
 		msgs[i].buf = buf + 2 *i;
 		buf[2*i + 0] = SDVO_I2C_ARG_0 - i;
 		buf[2*i + 1] = ((u8*)args)[i];
 	}
-	msgs[i].addr = intel_sdvo->slave_addr;
+	msgs[i].addr = intel_sdvo->client_addr;
 	msgs[i].flags = 0;
 	msgs[i].len = 2;
 	msgs[i].buf = buf + 2*i;
@@ -499,12 +499,12 @@ static bool __intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
 
 	/* the following two are to read the response */
 	status = SDVO_I2C_CMD_STATUS;
-	msgs[i+1].addr = intel_sdvo->slave_addr;
+	msgs[i+1].addr = intel_sdvo->client_addr;
 	msgs[i+1].flags = 0;
 	msgs[i+1].len = 1;
 	msgs[i+1].buf = &status;
 
-	msgs[i+2].addr = intel_sdvo->slave_addr;
+	msgs[i+2].addr = intel_sdvo->client_addr;
 	msgs[i+2].flags = I2C_M_RD;
 	msgs[i+2].len = 1;
 	msgs[i+2].buf = &status;
@@ -2659,9 +2659,9 @@ intel_sdvo_select_i2c_bus(struct intel_sdvo *sdvo)
 	else
 		pin = GMBUS_PIN_DPB;
 
-	drm_dbg_kms(&dev_priv->drm, "[ENCODER:%d:%s] I2C pin %d, slave addr 0x%x\n",
+	drm_dbg_kms(&dev_priv->drm, "[ENCODER:%d:%s] I2C pin %d, client addr 0x%x\n",
 		    sdvo->base.base.base.id, sdvo->base.base.name,
-		    pin, sdvo->slave_addr);
+		    pin, sdvo->client_addr);
 
 	sdvo->i2c = intel_gmbus_get_adapter(dev_priv, pin);
 
@@ -2687,7 +2687,7 @@ intel_sdvo_is_hdmi_connector(struct intel_sdvo *intel_sdvo)
 }
 
 static u8
-intel_sdvo_get_slave_addr(struct intel_sdvo *sdvo)
+intel_sdvo_get_client_addr(struct intel_sdvo *sdvo)
 {
 	struct drm_i915_private *dev_priv = to_i915(sdvo->base.base.dev);
 	const struct sdvo_device_mapping *my_mapping, *other_mapping;
@@ -2701,15 +2701,15 @@ intel_sdvo_get_slave_addr(struct intel_sdvo *sdvo)
 	}
 
 	/* If the BIOS described our SDVO device, take advantage of it. */
-	if (my_mapping->slave_addr)
-		return my_mapping->slave_addr;
+	if (my_mapping->client_addr)
+		return my_mapping->client_addr;
 
 	/*
 	 * If the BIOS only described a different SDVO device, use the
 	 * address that it isn't using.
 	 */
-	if (other_mapping->slave_addr) {
-		if (other_mapping->slave_addr == 0x70)
+	if (other_mapping->client_addr) {
+		if (other_mapping->client_addr == 0x70)
 			return 0x72;
 		else
 			return 0x70;
@@ -3412,7 +3412,7 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 			 "SDVO %c", port_name(port));
 
 	intel_sdvo->sdvo_reg = sdvo_reg;
-	intel_sdvo->slave_addr = intel_sdvo_get_slave_addr(intel_sdvo) >> 1;
+	intel_sdvo->client_addr = intel_sdvo_get_client_addr(intel_sdvo) >> 1;
 
 	intel_sdvo_select_i2c_bus(intel_sdvo);
 
diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index a9f44abfc9fc..e268224355eb 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -432,7 +432,7 @@ struct child_device_config {
 	u16 addin_offset;
 	u8 dvo_port; /* See DEVICE_PORT_* and DVO_PORT_* above */
 	u8 i2c_pin;
-	u8 slave_addr;
+	u8 client_addr;
 	u8 ddc_pin;
 	u16 edid_ptr;
 	u8 dvo_cfg; /* See DEVICE_CFG_* above */
@@ -441,7 +441,7 @@ struct child_device_config {
 		struct {
 			u8 dvo2_port;
 			u8 i2c2_pin;
-			u8 slave2_addr;
+			u8 client2_addr;
 			u8 ddc2_pin;
 		} __packed;
 		struct {
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index af9afdb53c7f..29380c774133 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -42,8 +42,8 @@
 #define GMBUS1_TOTAL_BYTES_MASK 0x1ff
 #define gmbus1_total_byte_count(v) (((v) >> \
 	GMBUS1_TOTAL_BYTES_SHIFT) & GMBUS1_TOTAL_BYTES_MASK)
-#define gmbus1_slave_addr(v) (((v) & 0xff) >> 1)
-#define gmbus1_slave_index(v) (((v) >> 8) & 0xff)
+#define gmbus1_client_addr(v) (((v) & 0xff) >> 1)
+#define gmbus1_client_index(v) (((v) >> 8) & 0xff)
 #define gmbus1_bus_cycle(v) (((v) >> 25) & 0x7)
 
 /* GMBUS0 bits definitions */
@@ -54,7 +54,7 @@ static unsigned char edid_get_byte(struct intel_vgpu *vgpu)
 	struct intel_vgpu_i2c_edid *edid = &vgpu->display.i2c_edid;
 	unsigned char chr = 0;
 
-	if (edid->state == I2C_NOT_SPECIFIED || !edid->slave_selected) {
+	if (edid->state == I2C_NOT_SPECIFIED || !edid->client_selected) {
 		gvt_vgpu_err("Driver tries to read EDID without proper sequence!\n");
 		return 0;
 	}
@@ -179,7 +179,7 @@ static int gmbus1_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
 	struct intel_vgpu_i2c_edid *i2c_edid = &vgpu->display.i2c_edid;
-	u32 slave_addr;
+	u32 client_addr;
 	u32 wvalue = *(u32 *)p_data;
 
 	if (vgpu_vreg(vgpu, offset) & GMBUS_SW_CLR_INT) {
@@ -210,21 +210,21 @@ static int gmbus1_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 
 		i2c_edid->gmbus.total_byte_count =
 			gmbus1_total_byte_count(wvalue);
-		slave_addr = gmbus1_slave_addr(wvalue);
+		client_addr = gmbus1_client_addr(wvalue);
 
 		/* vgpu gmbus only support EDID */
-		if (slave_addr == EDID_ADDR) {
-			i2c_edid->slave_selected = true;
-		} else if (slave_addr != 0) {
+		if (client_addr == EDID_ADDR) {
+			i2c_edid->client_selected = true;
+		} else if (client_addr != 0) {
 			gvt_dbg_dpy(
-				"vgpu%d: unsupported gmbus slave addr(0x%x)\n"
+				"vgpu%d: unsupported gmbus client addr(0x%x)\n"
 				"	gmbus operations will be ignored.\n",
-					vgpu->id, slave_addr);
+					vgpu->id, client_addr);
 		}
 
 		if (wvalue & GMBUS_CYCLE_INDEX)
 			i2c_edid->current_edid_read =
-				gmbus1_slave_index(wvalue);
+				gmbus1_client_index(wvalue);
 
 		i2c_edid->gmbus.cycle_type = gmbus1_bus_cycle(wvalue);
 		switch (gmbus1_bus_cycle(wvalue)) {
@@ -523,7 +523,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 			} else if (addr == EDID_ADDR) {
 				i2c_edid->state = I2C_AUX_CH;
 				i2c_edid->port = port_idx;
-				i2c_edid->slave_selected = true;
+				i2c_edid->client_selected = true;
 				if (intel_vgpu_has_monitor_on_port(vgpu,
 					port_idx) &&
 					intel_vgpu_port_is_dp(vgpu, port_idx))
@@ -542,7 +542,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 			return;
 		if (drm_WARN_ON(&i915->drm, msg_length != 4))
 			return;
-		if (i2c_edid->edid_available && i2c_edid->slave_selected) {
+		if (i2c_edid->edid_available && i2c_edid->client_selected) {
 			unsigned char val = edid_get_byte(vgpu);
 
 			aux_data_for_write = (val << 16);
@@ -571,7 +571,7 @@ void intel_vgpu_init_i2c_edid(struct intel_vgpu *vgpu)
 	edid->state = I2C_NOT_SPECIFIED;
 
 	edid->port = -1;
-	edid->slave_selected = false;
+	edid->client_selected = false;
 	edid->edid_available = false;
 	edid->current_edid_read = 0;
 
diff --git a/drivers/gpu/drm/i915/gvt/edid.h b/drivers/gpu/drm/i915/gvt/edid.h
index dfe0cbc6aad8..c36f26c5f5cc 100644
--- a/drivers/gpu/drm/i915/gvt/edid.h
+++ b/drivers/gpu/drm/i915/gvt/edid.h
@@ -80,7 +80,7 @@ enum gmbus_cycle_type {
  *      R/W Protect
  *      Command and Status.
  *      bit0 is the direction bit: 1 is read; 0 is write.
- *      bit1 - bit7 is slave 7-bit address.
+ *      bit1 - bit7 is client 7-bit address.
  *      bit16 - bit24 total byte count (ignore?)
  *
  * GMBUS2:
@@ -130,7 +130,7 @@ struct intel_vgpu_i2c_edid {
 	enum i2c_state state;
 
 	unsigned int port;
-	bool slave_selected;
+	bool client_selected;
 	bool edid_available;
 	unsigned int current_edid_read;
 
diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index d2bed466540a..88fa6877ec90 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -86,7 +86,7 @@ struct efp_child_device_config {
 	u8 skip2;
 	u8 dvo_port;
 	u8 i2c_pin; /* for add-in card */
-	u8 slave_addr; /* for add-in card */
+	u8 client_addr; /* for add-in card */
 	u8 ddc_pin;
 	u16 edid_ptr;
 	u8 dvo_config;
-- 
2.34.1



