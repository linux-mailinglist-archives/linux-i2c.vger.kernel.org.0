Return-Path: <linux-i2c+bounces-293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F27E7F05D4
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD28280F16
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F500101ED;
	Sun, 19 Nov 2023 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1fNgBpX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA6E10FC;
	Sun, 19 Nov 2023 03:28:48 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9e1021dbd28so477069666b.3;
        Sun, 19 Nov 2023 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393326; x=1700998126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=W1fNgBpX/ahU7SgsIFClqJtLpSBkujxH5re2v1pqmEUNIKs8NMYipyw58T95Elxpde
         tg3YF5sduyAJPsa5Gk8wYE5eWUEG3pe1A4namyDoW6APse2R/ss+bTHR4B4CM/g5Glhk
         gLr9QU6s1s7z+jcShhKE614FcWUUMNOrtt0o3qC+7bKSJtVppmJxK3ivM9sWfxBp7p2M
         l8QxdwHxUjaWsEpWBWGA2GFja4JpCMjV+KLF7kCi9FhqXTPy1BaDAhAHUmo3I3Xr4R+g
         Mgod73gvFfuI6DM1cY3s5MMrPpME91Ta59XQUy7Tm0ho4CKJP3j6rX7yTpZ8LZiEEE/5
         J3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393326; x=1700998126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=PQpf3/0mgKmioDzjh8FEyoZG1dGHJU9UA4d4rKQLG3DqEo2E9oPYLd/s0MZQz7qWTS
         DaGugyZNqvDOs+uVe3mdpGpL6nyNyGd+E/W+3loCZyA/YXwenNnfrOkqFZoBYlyWafTz
         3YiCfV332xuDI9FMrG5Nkkg0Ni+juLCduUF1iRBqoC5dlAaBK7cXZ854yKcuR2xxfMEo
         xgHFmbAkXgqPxFR9XQPPHidZK2mBZ7Hw+xRMebYZd3riMOwvAmBvsE1ZCb/56AhPvFQy
         bHuoGy8Un+L7kkre13HsZhNhazqBOpcu55neawuTUHBdRv35Y5autIdMjbMEpT6R+w6t
         Bnbw==
X-Gm-Message-State: AOJu0YwVJcsDlLPWiwAbn2K+GuCEp1KgZV5CmQWI4+pQgt3nAny2mGuq
	kFuMemyhEX1zZThULMSQmQQ=
X-Google-Smtp-Source: AGHT+IHKw/gC9gJLG/4vNKZ0Qe1xoAFlXwe05kjZcQmwp8jadVTM2Ill34LRBvmTqhTjC6YBAI0o8w==
X-Received: by 2002:a17:907:11c9:b0:9be:30c2:b8fd with SMTP id va9-20020a17090711c900b009be30c2b8fdmr3210885ejb.66.1700393326334;
        Sun, 19 Nov 2023 03:28:46 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:46 -0800 (PST)
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
Subject: [PATCH v3 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:24 +0100
Message-ID: <20231119112826.5115-20-hkallweit1@gmail.com>
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


