Return-Path: <linux-i2c+bounces-278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A57F05AA
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3221E280E9C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC39101DD;
	Sun, 19 Nov 2023 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVy7E2Gv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8062D8;
	Sun, 19 Nov 2023 03:28:33 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9e623356d5dso473536866b.3;
        Sun, 19 Nov 2023 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393312; x=1700998112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
        b=cVy7E2GvU1UY7C2ylKxcRaKGbjhm5quJksSnVTY1dRmTx2n/y4LTSnrmQ3gphXkdP9
         /+GjjsqHG/UsADL8fKfakE4R+0vmfkCFe53axp68BnOhXaOOgRc7d/v1CCnDESzKfxW3
         dibBfI1qWpbmwuV9RD0kU7QaDo7+oMRTry6salcit72edkn0VEf6kwC4n2MfhWjr5ZBO
         Pc4QO/i39ahPGxhTPRjSJvjy8KB4v5rjNpH5NU+yUmDJQ4LvVhvPOD9pbBh0jlc9Wbqz
         wriRlWQc0LrLPGQOftJUiqCsbtzGJjKZKZtqeKInmSYj+VDq7/3b1EvubOEGlOShHpVp
         E4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393312; x=1700998112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
        b=OCQtfYH5T4sBdhIxj22qFENLm+EPMTbC4fBfbvt6Uwys7ZwTs54plX5KjTl9g8qXKI
         n5yZdsbY7uKp/mqG9ZthmDPLaox62vP8yxMXxMzPIlLTkerNYUdbDkkQjW5z3reuI8uB
         MkDvlfcRPR0DP8aT2e0rfHDksr72wNooVBqxNODGa2uvYrtvIAKpuWSVQESeC7IntKnv
         wNSHFXxYZYztwQG0Cc3bA4E4lwrMMZ5XUi09SGxol/P2KLE8K3GfIqy87K6xMxUmWyTW
         lKCCItmhiEqSo7fqEbvTqb5y/OamL4m9p0Vo+rOdAxAUG2pvEel8d6uuGPgd7YjzdzrT
         uwnA==
X-Gm-Message-State: AOJu0Yy+Y1XD0pnusUehRCInJ2+Q6cylB8ckCM5mrSiFsUpQsj0lbd49
	eWtyTJ8mPFdPKgom/JQbONE=
X-Google-Smtp-Source: AGHT+IHCBymhmMkLDgf8c72aSm6rVzHfrFKwC46JDn+N6dKLAc0aMYGmFbO3t7kmKygycOOk6QrJ/A==
X-Received: by 2002:a17:907:6d0a:b0:9a5:b878:7336 with SMTP id sa10-20020a1709076d0a00b009a5b8787336mr3794771ejc.7.1700393312239;
        Sun, 19 Nov 2023 03:28:32 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:31 -0800 (PST)
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
Subject: [PATCH v3 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:08 +0100
Message-ID: <20231119112826.5115-4-hkallweit1@gmail.com>
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


