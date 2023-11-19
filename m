Return-Path: <linux-i2c+bounces-295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B2B7F05D9
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FB31F22603
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18F5101F8;
	Sun, 19 Nov 2023 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6lcmgeR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2D610FB;
	Sun, 19 Nov 2023 03:28:48 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9e623356e59so468896466b.0;
        Sun, 19 Nov 2023 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393325; x=1700998125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
        b=k6lcmgeREr5EjnCoxPGiWBPAcj/PIINnUtes0R5MvERFHzNfUiHG1By0ncxUzcENpt
         IX3/tjBRlbWzrNE/Oi3J7Tvsz4lBlCgJLwLXzKgxYsBuj1hx394Ky+mNT9z6CUVOEcvp
         VsNqtuYxvi9m+DpbzqSZoW0jnI9qdDNoGXXEGUJxLu6/z99KJ9XM8lxb4ls5RbwOa1lr
         cqBJ9S+xIGnOw4oO+A7gtL6uMAFUFxl4bMocdi1JCJmQM/wf9FEopMF1M93cO3lTpVSB
         xLQ4/uK/k1fjToyZsDHRqfhslhcvzCf7cMgtXjhc3vi9PyiBR1wnW1/XVLtWNqxHxbqj
         ZxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393325; x=1700998125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
        b=VzfVlL5c/0mdIoL7LDTuMKDcaz9HNZr/KuiY7HpzOWHp2QBiNIsinnkGCcR/uFv55b
         VZdjmvSHTFOr5BHV+iaIWoLKkElc1mgWonvRuseqMEAA5Q8s3QDhOxYOK6c1MItoaOZz
         gF7rsypBjIHwW95OM0y1fIw9ODIqrvKmt2RC6WKKWJYMDnhDJUQezPLmgX0oUKWjmmHt
         e+0LL0bV64UC/tiqYZkiDE6lz+Bqeg732l8W4f9lVW/UPwPPNrFwGZNWU9sCy2f9Dz6S
         pOTXaTjX2yoI0W0ipGTzCHiZnsif6FHzG5DTswSErAA0T5irzySOO07sSxfr2Enl52D8
         +u6Q==
X-Gm-Message-State: AOJu0YyYye3OPeH/VIAMKJpPY6edDALJJs/wTrCmg7Wils0CgaJZ1HZS
	ot/YxuJMA/4aXlAkSzG7wgU=
X-Google-Smtp-Source: AGHT+IEpB5ZnqGJppm4SyfFOjTFFzlNbJ5j1oKwnqCNhlB7TTiFFtmEVrL1Fkxgp4PWg2oSUQjk53Q==
X-Received: by 2002:a17:907:9394:b0:9d0:2e6b:f47f with SMTP id cm20-20020a170907939400b009d02e6bf47fmr3500186ejc.36.1700393325493;
        Sun, 19 Nov 2023 03:28:45 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:45 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/20] drivers/gpu/drm/gma500: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:23 +0100
Message-ID: <20231119112826.5115-19-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/gma500/cdv_intel_dp.c      |    1 -
 drivers/gpu/drm/gma500/intel_gmbus.c       |    1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c    |    1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8992a9507..dd1eb7e98 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -855,7 +855,6 @@ cdv_intel_dp_i2c_init(struct gma_connector *connector,
 
 	memset(&intel_dp->adapter, '\0', sizeof (intel_dp->adapter));
 	intel_dp->adapter.owner = THIS_MODULE;
-	intel_dp->adapter.class = I2C_CLASS_DDC;
 	strncpy (intel_dp->adapter.name, name, sizeof(intel_dp->adapter.name) - 1);
 	intel_dp->adapter.name[sizeof(intel_dp->adapter.name) - 1] = '\0';
 	intel_dp->adapter.algo_data = &intel_dp->algo;
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index 09cedabf4..aa4550985 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -411,7 +411,6 @@ int gma_intel_setup_gmbus(struct drm_device *dev)
 		struct intel_gmbus *bus = &dev_priv->gmbus[i];
 
 		bus->adapter.owner = THIS_MODULE;
-		bus->adapter.class = I2C_CLASS_DDC;
 		snprintf(bus->adapter.name,
 			 sizeof(bus->adapter.name),
 			 "gma500 gmbus %s",
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
index fc9a34ed5..6daa6669e 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
@@ -168,7 +168,6 @@ static struct i2c_adapter oaktrail_hdmi_i2c_adapter = {
 	.name		= "oaktrail_hdmi_i2c",
 	.nr		= 3,
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_DDC,
 	.algo		= &oaktrail_hdmi_i2c_algorithm,
 };
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index d6fd5d726..e4f914dec 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -2426,7 +2426,6 @@ psb_intel_sdvo_init_ddc_proxy(struct psb_intel_sdvo *sdvo,
 			  struct drm_device *dev)
 {
 	sdvo->ddc.owner = THIS_MODULE;
-	sdvo->ddc.class = I2C_CLASS_DDC;
 	snprintf(sdvo->ddc.name, I2C_NAME_SIZE, "SDVO DDC proxy");
 	sdvo->ddc.dev.parent = dev->dev;
 	sdvo->ddc.algo_data = sdvo;


