Return-Path: <linux-i2c+bounces-2670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1A892256
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 977DE286AE9
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046E113DDAE;
	Fri, 29 Mar 2024 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="WVloCqZL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA6A13DB9C;
	Fri, 29 Mar 2024 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711731757; cv=none; b=k0KGG5RNzmm9vGiR6CmQCaxTJ4fMTVoKla/UjW7rwV8WYosCdI8wtWgt00wYkwc3d9k+LE4K1MZ7o9Cy/0iOypf1dd8Fqa7tP5XIhcEra3HXFZl2XlpoD00bpHTIIGzlRDcLw3fPChKObQ985xwYmwSo3CxHjDo2XjznWVKh6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711731757; c=relaxed/simple;
	bh=xUYJREAS/asBANXJW4l77OGKyAMOXQBUROhpgO/Y9AE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qUgH+3PAw3wd6XBUnW23PyGL5hgP5TeY16oxReVbOiKSStugfKpUv76x6cOKwnlbAD1juRSW+3j5MdY1eMdZT9FgfHyVJwcCgGFoNBUszVvc69jzmJO1/ixAVauUPash/NNJsqBoxQTjpvRBsuQyzUPPJ7SrpTLW9ZwI72Q9vRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=WVloCqZL; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id CBAD220E6F3E;
	Fri, 29 Mar 2024 10:02:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CBAD220E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711731756;
	bh=gRW86ANHtbye+7f91W3f5Kays+kZ9CFcrEWE6EnDd+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVloCqZLiu74exUfSs0XMEzoaCWC9C9N6JvLyKKMKD2Kmz1sc75LLvxjn3VzSKcYW
	 6WcPltpIu1npZG5Sudjj/8kw9TeQESGEXoM1GUjTyxO1aWsnlcr5i2F4RlfMRXMPHe
	 UdTHCmDUiPzWuTXD8LA5Q3ssvEzSHH54ZXFwfvjQ=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
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
Subject: [PATCH v0 13/14] drm/nouveau: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:37 +0000
Message-Id: <20240329170038.3863998-14-eahariha@linux.microsoft.com>
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
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             | 14 +++++++-------
 .../gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c             |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index d5b129dc623b..65b791006b19 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -149,7 +149,7 @@ void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode)
 	}
 }
 
-static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
+static struct drm_encoder *get_tmds_client(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
@@ -172,7 +172,7 @@ static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
 		struct dcb_output *slave_dcb = nouveau_encoder(slave)->dcb;
 
 		if (slave_dcb->type == DCB_OUTPUT_TMDS && get_slave_funcs(slave) &&
-		    slave_dcb->tmdsconf.slave_addr == dcb->tmdsconf.slave_addr)
+		    slave_dcb->tmdsconf.client_addr == dcb->tmdsconf.client_addr)
 			return slave;
 	}
 
@@ -471,7 +471,7 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0x00100000);
 
 	/* Init external transmitters */
-	slave_encoder = get_tmds_slave(encoder);
+	slave_encoder = get_tmds_client(encoder);
 	if (slave_encoder)
 		get_slave_funcs(slave_encoder)->mode_set(
 			slave_encoder, &nv_encoder->mode, &nv_encoder->mode);
@@ -621,7 +621,7 @@ static void nv04_dfp_destroy(struct drm_encoder *encoder)
 	kfree(nv_encoder);
 }
 
-static void nv04_tmds_slave_init(struct drm_encoder *encoder)
+static void nv04_tmds_client_init(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
@@ -632,7 +632,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
 		{
 		    {
 		        .type = "sil164",
-		        .addr = (dcb->tmdsconf.slave_addr == 0x7 ? 0x3a : 0x38),
+		        .addr = (dcb->tmdsconf.client_addr == 0x7 ? 0x3a : 0x38),
 		        .platform_data = &(struct sil164_encoder_params) {
 		            SIL164_INPUT_EDGE_RISING
 		         }
@@ -642,7 +642,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
 	};
 	int type;
 
-	if (!nv_gf4_disp_arch(dev) || !bus || get_tmds_slave(encoder))
+	if (!nv_gf4_disp_arch(dev) || !bus || get_tmds_client(encoder))
 		return;
 
 	type = nvkm_i2c_bus_probe(bus, "TMDS transmitter", info, NULL, NULL);
@@ -716,7 +716,7 @@ nv04_dfp_create(struct drm_connector *connector, struct dcb_output *entry)
 
 	if (entry->type == DCB_OUTPUT_TMDS &&
 	    entry->location != DCB_LOC_ON_CHIP)
-		nv04_tmds_slave_init(encoder);
+		nv04_tmds_client_init(encoder);
 
 	drm_connector_attach_encoder(connector, encoder);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h
index 73f9d9947e7e..5da40cf74b1a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h
@@ -50,7 +50,7 @@ struct dcb_output {
 		} dpconf;
 		struct {
 			struct sor_conf sor;
-			int slave_addr;
+			int client_addr;
 		} tmdsconf;
 	};
 	bool i2c_upper_default;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 479effcf607e..a91a5d3df3ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -1511,9 +1511,9 @@ parse_dcb20_entry(struct drm_device *dev, struct dcb_table *dcb,
 			link = entry->tmdsconf.sor.link;
 		}
 		else if (dcb->version >= 0x30)
-			entry->tmdsconf.slave_addr = (conf & 0x00000700) >> 8;
+			entry->tmdsconf.client_addr = (conf & 0x00000700) >> 8;
 		else if (dcb->version >= 0x22)
-			entry->tmdsconf.slave_addr = (conf & 0x00000070) >> 4;
+			entry->tmdsconf.client_addr = (conf & 0x00000070) >> 4;
 		break;
 	case DCB_OUTPUT_EOL:
 		/* weird g80 mobile type that "nv" treats as a terminator */
-- 
2.34.1


