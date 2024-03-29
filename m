Return-Path: <linux-i2c+bounces-2671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DBF89225B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C63C51C2657F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E12130E2D;
	Fri, 29 Mar 2024 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="nyFQ5eHK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3DB3309E;
	Fri, 29 Mar 2024 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731783; cv=none; b=jH3QM26XIUkY/eEYLOBjoY5fcvlL07nlToHEVZQJSrdvlAD0UvbtuQ8XHl+/S6kkp9T37WrzEJJrHeYrGGTqDcUKJDfj2ZuKbs0MkZfvP8O+xQeosKElxOsAeZGWlrdrHwYohZ4DI9SZqk4jwutV/tf52rGZiN4qpYIdrmOoTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731783; c=relaxed/simple;
	bh=y2fAh2dgdE2e7uNQn0Ht6yNV8QH4ls+9ggI0xy/D4W8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOL+l+L9wlAk6G8KM7NddGO0rfOXfHQ+TJdpEa8+PdU3b4nmrIVkWaE3XBUN0TvBCbEA9y6imL76yxi6J739sRwvL+X+Oz9J2/OBEUj/GwxPjq5t+NGKrBD4EPRMBOqIAV04dj6wrfgudqmK1/VYoPJ8A5XA2I2Qmb51aFg7QOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=nyFQ5eHK; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2105A20E6F57;
	Fri, 29 Mar 2024 10:03:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2105A20E6F57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731781;
	bh=b92hXveSFquyQbhxtaUmHSPsbW+5D4vpPR3tMHWATcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nyFQ5eHK3F9Gs99IX1KCpNgMhRVkTp5UR6tHOjJ+WR/EM+3MCGspplT+DT3anDTJx
	 Bfdg4HRBGfvUBJtRwgoMJ0MDwJbEYbn5uVLTta84glTQxdYPHE/X5MemjHvfA2A8Ai
	 Nl4Y2RtFlnGVpD6Qr7tJUwG+bdSxUE1t/oRsjUvQ=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andy Walls <awalls@md.metrocast.net>,
	Helge Deller <deller@gmx.de>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Zheng Wang <zyytlz.wz@163.com>,
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
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
Subject: [PATCH v0 14/14] i2c and treewide: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:38 +0000
Message-Id: <20240329170038.3863998-15-eahariha@linux.microsoft.com>
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
series to fix drivers/i2c[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  2 +-
 drivers/gpu/drm/gma500/intel_gmbus.c          |  4 ++--
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c    |  2 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 ++--
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c |  2 +-
 drivers/gpu/drm/radeon/radeon_i2c.c           |  4 ++--
 drivers/i2c/algos/i2c-algo-bit.c              | 12 ++++++------
 drivers/media/pci/bt8xx/bttv-i2c.c            |  2 +-
 drivers/media/pci/cobalt/cobalt-i2c.c         |  2 +-
 drivers/media/pci/cx23885/cx23885-i2c.c       |  2 +-
 drivers/media/pci/cx25821/cx25821-i2c.c       |  2 +-
 drivers/media/pci/dm1105/dm1105.c             |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c             |  2 +-
 drivers/media/pci/saa7164/saa7164-i2c.c       |  2 +-
 drivers/media/usb/au0828/au0828-i2c.c         |  2 +-
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c     |  2 +-
 21 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index a34626882b67..75793e493df6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -154,7 +154,7 @@ static void amdgpu_i2c_set_data(void *i2c_priv, int data)
 }
 
 static const struct i2c_algorithm amdgpu_atombios_i2c_algo = {
-	.master_xfer = amdgpu_atombios_i2c_xfer,
+	.xfer          = amdgpu_atombios_i2c_xfer,
 	.functionality = amdgpu_atombios_i2c_func,
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index f2fc96d1cd7b..1d909d33cd15 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -714,7 +714,7 @@ static u32 smu_v11_0_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm smu_v11_0_i2c_algo = {
-	.master_xfer = smu_v11_0_i2c_xfer,
+	.xfer          = smu_v11_0_i2c_xfer,
 	.functionality = smu_v11_0_i2c_func,
 };
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index dd1eb7e9877d..d6f3c3bc169f 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -194,7 +194,7 @@ i2c_algo_dp_aux_functionality(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_dp_aux_algo = {
-	.master_xfer	= i2c_algo_dp_aux_xfer,
+	.xfer		= i2c_algo_dp_aux_xfer,
 	.functionality	= i2c_algo_dp_aux_functionality,
 };
 
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index 94cf854b1d3d..90c83cae04d9 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -233,7 +233,7 @@ intel_i2c_quirk_xfer(struct drm_psb_private *dev_priv,
 	set_clock(gpio, 1);
 	udelay(I2C_RISEFALL_TIME);
 
-	ret = adapter->algo->master_xfer(adapter, msgs, num);
+	ret = adapter->algo->xfer(adapter, msgs, num);
 
 	set_data(gpio, 1);
 	set_clock(gpio, 1);
@@ -374,7 +374,7 @@ static u32 gmbus_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm gmbus_algorithm = {
-	.master_xfer	= gmbus_xfer,
+	.xfer		= gmbus_xfer,
 	.functionality	= gmbus_func
 };
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
index 6daa6669ed23..a93e61208a84 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
@@ -160,7 +160,7 @@ static u32 oaktrail_hdmi_i2c_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm oaktrail_hdmi_i2c_algorithm = {
-	.master_xfer	= oaktrail_hdmi_i2c_access,
+	.xfer		= oaktrail_hdmi_i2c_access,
 	.functionality  = oaktrail_hdmi_i2c_func,
 };
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 39a3b696efc5..ad274c8410ca 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -2417,7 +2417,7 @@ static u32 psb_intel_sdvo_ddc_proxy_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm psb_intel_sdvo_ddc_proxy = {
-	.master_xfer	= psb_intel_sdvo_ddc_proxy_xfer,
+	.xfer		= psb_intel_sdvo_ddc_proxy_xfer,
 	.functionality	= psb_intel_sdvo_ddc_proxy_func
 };
 
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index cbbdd84b4641..d97fe8f03a5d 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -759,7 +759,7 @@ gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
 	wakeref = intel_display_power_get(i915, POWER_DOMAIN_GMBUS);
 
 	if (bus->force_bit) {
-		ret = i2c_bit_algo.master_xfer(adapter, msgs, num);
+		ret = i2c_bit_algo.xfer(adapter, msgs, num);
 		if (ret < 0)
 			bus->force_bit &= ~GMBUS_FORCE_BIT_RETRY;
 	} else {
@@ -822,7 +822,7 @@ static u32 gmbus_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm gmbus_algorithm = {
-	.master_xfer	= gmbus_xfer,
+	.xfer		= gmbus_xfer,
 	.functionality	= gmbus_func
 };
 
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 126493c662c5..0764aaf8fbec 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3299,7 +3299,7 @@ static int intel_sdvo_ddc_proxy_xfer(struct i2c_adapter *adapter,
 	if (!__intel_sdvo_set_control_bus_switch(sdvo, 1 << ddc->ddc_bus))
 		return -EIO;
 
-	return sdvo->i2c->algo->master_xfer(sdvo->i2c, msgs, num);
+	return sdvo->i2c->algo->xfer(sdvo->i2c, msgs, num);
 }
 
 static u32 intel_sdvo_ddc_proxy_func(struct i2c_adapter *adapter)
@@ -3311,7 +3311,7 @@ static u32 intel_sdvo_ddc_proxy_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm intel_sdvo_ddc_proxy = {
-	.master_xfer	= intel_sdvo_ddc_proxy_xfer,
+	.xfer		= intel_sdvo_ddc_proxy_xfer,
 	.functionality	= intel_sdvo_ddc_proxy_func
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
index d063d0dc13c5..55d45aba8467 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
@@ -89,7 +89,7 @@ nvkm_i2c_aux_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm
 nvkm_i2c_aux_i2c_algo = {
-	.master_xfer = nvkm_i2c_aux_i2c_xfer,
+	.xfer          = nvkm_i2c_aux_i2c_xfer,
 	.functionality = nvkm_i2c_aux_i2c_func
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
index ed50cc3736b9..10c7bc68a278 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
@@ -97,7 +97,7 @@ nvkm_i2c_bus_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm
 nvkm_i2c_bus_algo = {
-	.master_xfer = nvkm_i2c_bus_xfer,
+	.xfer          = nvkm_i2c_bus_xfer,
 	.functionality = nvkm_i2c_bus_func,
 };
 
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 565d59536e9a..95912cce6aef 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -891,12 +891,12 @@ static u32 radeon_hw_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm radeon_i2c_algo = {
-	.master_xfer = radeon_hw_i2c_xfer,
+	.xfer          = radeon_hw_i2c_xfer,
 	.functionality = radeon_hw_i2c_func,
 };
 
 static const struct i2c_algorithm radeon_atom_i2c_algo = {
-	.master_xfer = radeon_atom_hw_i2c_xfer,
+	.xfer          = radeon_atom_hw_i2c_xfer,
 	.functionality = radeon_atom_hw_i2c_func,
 };
 
diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index eddf25b90ca8..de3b41f7d02d 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -143,7 +143,7 @@ static void i2c_stop(struct i2c_algo_bit_data *adap)
 
 
 /* send a byte without start cond., look for arbitration,
-   check ackn. from slave */
+   check ackn. from client */
 /* returns:
  * 1 if the device acknowledged
  * 0 if the device did not ack
@@ -182,7 +182,7 @@ static int i2c_outb(struct i2c_adapter *i2c_adap, unsigned char c)
 		return -ETIMEDOUT;
 	}
 
-	/* read ack: SDA should be pulled down by slave, or it may
+	/* read ack: SDA should be pulled down by client, or it may
 	 * NAK (usually to report problems with the data we wrote).
 	 * Always report ACK if SDA is write-only.
 	 */
@@ -358,7 +358,7 @@ static int sendbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 			temp++;
 			wrcount++;
 
-		/* A slave NAKing the master means the slave didn't like
+		/* A client NAKing the host means the client didn't like
 		 * something about the data it saw.  For example, maybe
 		 * the SMBus PEC was wrong.
 		 */
@@ -369,7 +369,7 @@ static int sendbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 		/* Timeout; or (someday) lost arbitration
 		 *
 		 * FIXME Lost ARB implies retrying the transaction from
-		 * the first message, after the "winning" master issues
+		 * the first message, after the "winning" host issues
 		 * its STOP.  As a rule, upper layer code has no reason
 		 * to know or care about this ... it is *NOT* an error.
 		 */
@@ -619,8 +619,8 @@ static u32 bit_func(struct i2c_adapter *adap)
 /* -----exported algorithm data: -------------------------------------	*/
 
 const struct i2c_algorithm i2c_bit_algo = {
-	.master_xfer = bit_xfer,
-	.master_xfer_atomic = bit_xfer_atomic,
+	.xfer = bit_xfer,
+	.xfer_atomic = bit_xfer_atomic,
 	.functionality = bit_func,
 };
 EXPORT_SYMBOL(i2c_bit_algo);
diff --git a/drivers/media/pci/bt8xx/bttv-i2c.c b/drivers/media/pci/bt8xx/bttv-i2c.c
index 4a8a3f80c6db..285b2bd21278 100644
--- a/drivers/media/pci/bt8xx/bttv-i2c.c
+++ b/drivers/media/pci/bt8xx/bttv-i2c.c
@@ -248,7 +248,7 @@ static int bttv_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs, int
 }
 
 static const struct i2c_algorithm bttv_algo = {
-	.master_xfer   = bttv_i2c_xfer,
+	.xfer          = bttv_i2c_xfer,
 	.functionality = functionality,
 };
 
diff --git a/drivers/media/pci/cobalt/cobalt-i2c.c b/drivers/media/pci/cobalt/cobalt-i2c.c
index d2963370f949..b70e89669bc7 100644
--- a/drivers/media/pci/cobalt/cobalt-i2c.c
+++ b/drivers/media/pci/cobalt/cobalt-i2c.c
@@ -297,7 +297,7 @@ static const struct i2c_adapter cobalt_i2c_adap_template = {
 };
 
 static const struct i2c_algorithm cobalt_algo = {
-	.master_xfer	= cobalt_xfer,
+	.xfer		= cobalt_xfer,
 	.functionality	= cobalt_func,
 };
 
diff --git a/drivers/media/pci/cx23885/cx23885-i2c.c b/drivers/media/pci/cx23885/cx23885-i2c.c
index 385af2a893b4..1e5d0ecde5a3 100644
--- a/drivers/media/pci/cx23885/cx23885-i2c.c
+++ b/drivers/media/pci/cx23885/cx23885-i2c.c
@@ -247,7 +247,7 @@ static u32 cx23885_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm cx23885_i2c_algo_template = {
-	.master_xfer	= i2c_xfer,
+	.xfer		= i2c_xfer,
 	.functionality	= cx23885_functionality,
 };
 
diff --git a/drivers/media/pci/cx25821/cx25821-i2c.c b/drivers/media/pci/cx25821/cx25821-i2c.c
index bad8fb9f5319..ffcdce4971c4 100644
--- a/drivers/media/pci/cx25821/cx25821-i2c.c
+++ b/drivers/media/pci/cx25821/cx25821-i2c.c
@@ -268,7 +268,7 @@ static u32 cx25821_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm cx25821_i2c_algo_template = {
-	.master_xfer = i2c_xfer,
+	.xfer          = i2c_xfer,
 	.functionality = cx25821_functionality,
 #ifdef NEED_ALGO_CONTROL
 	.algo_control = dummy_algo_control,
diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index 9e9c7c071acc..d9b8614e8f0b 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -561,7 +561,7 @@ static u32 functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm dm1105_algo = {
-	.master_xfer   = dm1105_i2c_xfer,
+	.xfer          = dm1105_i2c_xfer,
 	.functionality = functionality,
 };
 
diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index 967e6a025020..86735f42c23c 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -610,7 +610,7 @@ static u32 ivtv_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm ivtv_algo = {
-	.master_xfer   = ivtv_xfer,
+	.xfer          = ivtv_xfer,
 	.functionality = ivtv_functionality,
 };
 
diff --git a/drivers/media/pci/saa7164/saa7164-i2c.c b/drivers/media/pci/saa7164/saa7164-i2c.c
index 3b11bf8899a0..aa7d989c1cb4 100644
--- a/drivers/media/pci/saa7164/saa7164-i2c.c
+++ b/drivers/media/pci/saa7164/saa7164-i2c.c
@@ -62,7 +62,7 @@ static u32 saa7164_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm saa7164_i2c_algo_template = {
-	.master_xfer	= i2c_xfer,
+	.xfer		= i2c_xfer,
 	.functionality	= saa7164_functionality,
 };
 
diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
index 3e66d42bf134..585fe86f8ed7 100644
--- a/drivers/media/usb/au0828/au0828-i2c.c
+++ b/drivers/media/usb/au0828/au0828-i2c.c
@@ -313,7 +313,7 @@ static u32 au0828_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm au0828_i2c_algo_template = {
-	.master_xfer	= i2c_xfer,
+	.xfer		= i2c_xfer,
 	.functionality	= au0828_functionality,
 };
 
diff --git a/drivers/video/fbdev/mb862xx/mb862xx-i2c.c b/drivers/video/fbdev/mb862xx/mb862xx-i2c.c
index ffdb1597d303..55fe554a0818 100644
--- a/drivers/video/fbdev/mb862xx/mb862xx-i2c.c
+++ b/drivers/video/fbdev/mb862xx/mb862xx-i2c.c
@@ -141,7 +141,7 @@ static u32 mb862xx_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mb862xx_algo = {
-	.master_xfer	= mb862xx_xfer,
+	.xfer		= mb862xx_xfer,
 	.functionality	= mb862xx_func,
 };
 
-- 
2.34.1


