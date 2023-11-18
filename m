Return-Path: <linux-i2c+bounces-236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0577F018D
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96157280ED1
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAB31BDF4;
	Sat, 18 Nov 2023 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO56adCT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0721707;
	Sat, 18 Nov 2023 09:42:47 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-408382da7f0so5043895e9.0;
        Sat, 18 Nov 2023 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329364; x=1700934164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
        b=iO56adCTQ6IlcPzaJrarrEknImjsxoKOsdVUfZoJ9mP2iKCIwzW1x59vSNnEscAl9y
         vMcQd85i+f9RoGQbyfHWLjldPJJ8svJmOTybNGyLDaelB3LTjH3uEammmfQdYxTbJw5o
         Kud1XLASqqsATkzAqmI4cudB61KY07VWz4qaTsLytxoRo2UVaqFUN+MYrGHg5tqhLJwg
         I3kctrQbIG7Fq/U9xuSPj18x7Hk5HJkdyvlS5dTM23DjexilU8GzK//A2FlhNAtShyBv
         6DN6EjGS7CcKuamJyYIi/2LaieA7cKPrAlptZYFdYDVpFdE8CRPCtH6C/DorqAxcMRXK
         6JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329364; x=1700934164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvYv7yv0Rz2qXj3RF4iM+eVeFbHCrgQ2kQmEmocPEPY=;
        b=SaY0d/pv3rHsHWSuPGplYwiboTQOApteqvG2MRyHr8fnfVLNM26P/Xjh3/r5+2g+NO
         Vi0v8zURp89XcM3xh0J0/i3pBihWs6MZHR7U2cf7+6r+qsD6UB0St6PeHdB7u7WsxpzN
         3O4POq+9+qUH0Bh33OcQi5pervSTtra82/cHChw3jS/DY3hAWfNm1lc6s6CnZyrNYDTD
         iDZY0QrrwzbS0kJnsJL9fAcXABU9mu9jtuFTZhK204vQ1hqyZKO7Q4HTtGtPpo5xQFtx
         ItojZsx3nCPg8KPUniAu0k3DPiO2HvNC8A8bhCQdpYk2Okzweuj68RNQVPJRPMSdOT0S
         RhdQ==
X-Gm-Message-State: AOJu0YzyCVq1ismXQstR7Beo6vzrBHX9rBPcMwpX6oneK8VhElv13GhL
	lb/jW4iG2utQg5NLWprhUr4=
X-Google-Smtp-Source: AGHT+IE0BbMsvTSWTVOENdiMPkZHzodITfzmcl8KlNhZRnTozdLCx9oIUql/Zj2eZN+2ewtb0OZtew==
X-Received: by 2002:a05:600c:198b:b0:405:3e9a:f1e3 with SMTP id t11-20020a05600c198b00b004053e9af1e3mr2171546wmq.11.1700329364007;
        Sat, 18 Nov 2023 09:42:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:43 -0800 (PST)
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
Subject: [PATCH v2 18/20] drivers/gpu/drm/gma500: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:18 +0100
Message-ID: <20231118174221.851-19-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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


