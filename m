Return-Path: <linux-i2c+bounces-355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8617F1F99
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E153A1F23C74
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3171239842;
	Mon, 20 Nov 2023 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXyrklz9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B1FD63;
	Mon, 20 Nov 2023 13:46:46 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332c46d5988so1117817f8f.1;
        Mon, 20 Nov 2023 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516805; x=1701121605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=LXyrklz9NdIABktGaWIu9SmMhyCrDNoXI2o00RsbYG163kgsVMykEO5+e1uc56ERyI
         jaQ2LpR0+xF/c4xOH1bx//Sk0o8tvS6sfjJNpt2AAad5aXMVH8Rb4dGDxSy3xmQ6yk4b
         a0ZfVeb51hMhX1Cw3CRkbFcZi9HDVDhr2eEZkUMHWwogqqAjAEBSvAUM1SWwuc+XYHa6
         UGmDAoBN2L8ikID6ePl5vzeS8GZhxbqm6/d6qglJbPQceZTaoqPaYia+hDajr3AudyE1
         SnCf7oVu5J0Waa5f24HR9q3ZQWkRL83Ppi/n53rY9EhGzSa7ag+ihJo9PCwU/UFcPDcJ
         x14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516805; x=1701121605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
        b=hryciiSj5mZ7HVwHax84BUbw7c+UykxM7hDbrHWghEHTOxtRNoHS67q4BaYNFdplMS
         KVC8gdpGbN6lyJgjtL1P4SEj4n9sOVdD34mVf0nTVFJH3eIwi9N14XkTcvutZQ6a3/hU
         999FnmO4lTS58mSXPu9aFpQZJd+oDe1PILvwoKCVVHUACEQ8SMena/0LabnfwZogoisD
         L16qZlmUrkEsRK41k1Yu2GKb/WIv+uhsOgeDnzo69YkoG68xlVldR9tIjpurO8I62vLv
         L3UKQT3KdODguoWPKIHvR4GCC7X3bIv44B9WUXJNdMTPTQQcYbd2ARaTMpmRkp7ZjGMM
         Vf0w==
X-Gm-Message-State: AOJu0YyFhKQlQ8KEfboiZFYJuUNPT+76Y+venARGxw2C3td9AH3Q0kKQ
	odx1hqzs4hAX2qeSx+DOXqI=
X-Google-Smtp-Source: AGHT+IFO9ZmrSbH6A+/A5LyWdCeKfgaeedlrEYc7qHHXqeUF8v+awr8pU44qCeg4rV4R9MhiuP768w==
X-Received: by 2002:a05:6000:18ad:b0:32d:b06c:d30b with SMTP id b13-20020a05600018ad00b0032db06cd30bmr6861142wri.55.1700516804962;
        Mon, 20 Nov 2023 13:46:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:44 -0800 (PST)
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
Subject: [PATCH v4 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:22 +0100
Message-ID: <20231120214624.9378-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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


