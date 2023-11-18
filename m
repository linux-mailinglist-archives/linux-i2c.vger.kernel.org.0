Return-Path: <linux-i2c+bounces-235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF67F018C
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6452F280F21
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C531BDC5;
	Sat, 18 Nov 2023 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPj1IlFA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08331709;
	Sat, 18 Nov 2023 09:42:47 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso4656345e9.3;
        Sat, 18 Nov 2023 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329365; x=1700934165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=cPj1IlFA6jAk9zvI9Fd2gxNQPCz1EcTKleiQXvOsABIucpRqxx5Bw+AiubRGof63yj
         V0obsl4pye97YLujhygqtobxJHZhVA0m/pxhHWql0NVfM7yQLztAidQE1WwhII/yHBUd
         o3J83i7YJITzqeUkSmwBf+bR2Db2j+6Ork7Meqc/wUtYkd2BhFxGyqvWyDEruNI25U03
         v3iA/c03CIEs1nr2XUVJ5Sz58nfP/seUiK86lIdCUXSY5hqhXmH14SofhKsU127GvVPH
         d4fatJTo/UZ97qzX9A/jwVFYl3wDlP+Hr0hj/ejdwU67ZoJaNeLVhroBEyaRMwC03ZWo
         vs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329365; x=1700934165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=ihKF/vC+35nV02NCHmvuMjYy7vDs8zwHCxd5zi02falfibsJhfH/2dfQTSvq/zZWQ+
         9naJbdcznx27+cuCuBWT3g1DwE/n5Ffh+jcVxA/MvKsN6frJ7WiCT20hhb4BvEJd5XsG
         qBfmF3YHwijVA7e0eowJxyY1xkoYo+gjSxl8ozTe0z5BISi2ZbNCtMx5wgzk1/xodOG2
         ouL6+0JI4/0on7PjFkGnXHzso9/YQeJNKsdxPVRty1XJXV0TaDgJo+u83bGSodeDt7oL
         /q4VPiwLtpkAs8vEURZQqKGhRXBVqcvy40+CrIvozuBiRLtFKpces+X/n6j+75gpOvoW
         +WnA==
X-Gm-Message-State: AOJu0YxElITbzC9K54aHCmnXaO8vd9/Ys3ldZLVjeHTjxqbonXfwmm5W
	8V8unzfwuO9mEBgK1zKg/p4=
X-Google-Smtp-Source: AGHT+IG1bPAOgl9NUb3ZPEvQdEyTHO+knTlvlp83e0Ttem8msHJ/hnBaJ5EBV2Fub43robL8FmGQHA==
X-Received: by 2002:a05:600c:4ec8:b0:409:5580:bc9f with SMTP id g8-20020a05600c4ec800b004095580bc9fmr2199231wmq.34.1700329364830;
        Sat, 18 Nov 2023 09:42:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:44 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v2 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:19 +0100
Message-ID: <20231118174221.851-20-hkallweit1@gmail.com>
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e6..ac901f4b4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0e0d0e76d..4376e2c1f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	/* FIXME: set the kdev of the port's connector as parent */
 	aux->ddc.dev.parent = parent_dev;


