Return-Path: <linux-i2c+bounces-339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB47F1F75
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73E8FB21628
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856AA38FB2;
	Mon, 20 Nov 2023 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG1thEX7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0F4E3;
	Mon, 20 Nov 2023 13:46:32 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32fdc5be26dso3168503f8f.2;
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516790; x=1701121590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
        b=LG1thEX79vY37dfvBGGe8Cby++2C3AgY6HsuUZhsWC9/nxWYupiYWrbyZ/VpGi4qhT
         aZSu1Y3D/CsSE9Ed2QNy6RIuptOdAV1woeI3oK8UGs/tjgMu42ylw3aRLOCQo0+6dNjA
         XQLo/iUhtaaRNCs+zZr4ExWPGkA4i/AAuIomHpesIzg+b2KPdiOc8PKRl0lcRzB7GSCZ
         8OqarVYASLNhTWlCSt1oF+P7RSeWDvn3qfKGDJCynMxpEQHqEGZXpg/66xa7D4v+AcSe
         DCDGZvvoqm6BfydjuHzGijBV8wLgZSYL6+9keTP6q8WpJv327yC4sHE4H/Vfjtdd3Gmc
         xDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516790; x=1701121590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
        b=ZuqldaePX9hN34aZwdfZppj6Rtgkn2gyA36IEKyh1jWhfqFGVOhT0VvexlsjM/NUrP
         ofuf7KjFYXaSinYJ6/v6oA3loGjE2GKX3CukDpRdnmL2/Rm/gKRtimcAyE3BXaKEPBey
         gXsq1qzsbSmDVMOZ2jqg8L1WsL/AZOdJBiOkR/1onQIVxjxGjURm+GaHzPaoGCTgzf3D
         Gz6yZXlTy7mOIaqphfEzM4aeR78xBFtdg3Ulxkeogbo+gbdzZdPoyU1NhLx0zxtRarj9
         iCIguBcocc5EBcRgjDaEsOFrSifPFrh8RLdgq5CGu0RlBL7ZQqNS94JO10ygVt9qzo9F
         4FNw==
X-Gm-Message-State: AOJu0YynTGV8lxxXWEWTGFieefQ95PcrkiPoiwRHG7CdSES01FzfEjMv
	Q7A2oyYpbYIaiLcLGBKBjSk=
X-Google-Smtp-Source: AGHT+IGkGQ59cG9edqQvwqmwpMO+1LuO35o+25wMSjuR193ctRjhKyTjuIwWviwx/q0Qr5EuxLxwOQ==
X-Received: by 2002:a5d:62c4:0:b0:332:c648:c646 with SMTP id o4-20020a5d62c4000000b00332c648c646mr2880040wrv.53.1700516790376;
        Mon, 20 Nov 2023 13:46:30 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:30 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:06 +0100
Message-ID: <20231120214624.9378-4-hkallweit1@gmail.com>
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

Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
v2:
- adjust tag in commit subject
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f99f6754..ae1edc6ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
 	if (!i2c)
 		return NULL;
 	i2c->base.owner = THIS_MODULE;
-	i2c->base.class = I2C_CLASS_DDC;
 	i2c->base.dev.parent = &adev->pdev->dev;
 	i2c->base.algo = &amdgpu_dm_i2c_algo;
 	snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c hw bus %d", link_index);


