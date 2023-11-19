Return-Path: <linux-i2c+bounces-257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F27F051F
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358C3280ECC
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF75DF4B;
	Sun, 19 Nov 2023 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdlil84z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20A612D;
	Sun, 19 Nov 2023 02:14:53 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so462036766b.1;
        Sun, 19 Nov 2023 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388892; x=1700993692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
        b=Pdlil84zVU482CytKiGGUXTOIyoDq3flsjACHoSSZ86Cbuo810xxRsS4A6KYWTyVXM
         kAcAgD9GnCR7idDOynlGBf5k59jAsnERtlxJK/ofVN2ToAa5yDdOmVKB9CCbl76cLQn6
         B8Yw1Ze0dYewAFGjNMawLQZWJpiDCiH09Kyvwjk3jCJD3+s6jvKXIUtNmppO/plwbcHD
         lqjtrk4kXc6rB9z+InKK1PMRGw+cNFp0TKKax0MxATNgMuRHg81sKH/yl4EJBbrwjZHa
         UI2VBZ5De1ncgCcZntr15JHpw4hrr0mVgk37Y7EeWcDJmt915Auz7Yn9nOIxF7VVFGka
         h9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388892; x=1700993692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyZ/cbQESDC/MGT/kN0ThvfGObcymEWZy6uoIIRVQcA=;
        b=FnmJOm/WYAJBshfc9wz0a0h78+tVCGl/f4fVYZlL47g13FczP2zP/cEhbhvZRKjIMB
         b7kbj3nQvVB5khhaPlOFNaJwqAkvvcNoGk1z0Bkxi3HM8MoUWQpPePYK0L9HuwKLrsA7
         SMNX/Wk8gPD0th0TXyaUSDfOe+qecDANhnO3Q1t91y8SfEfh3eWq4VoIUK6RZEORrPHC
         UMzb+Qa6vL108igvlhamMb+GYgz25/CQGsuScECuwYDF4T7aeOl3AhEtiYuBVsS8maQh
         onZxwz9SomiQ1STDOyYkrRJWJhkNmc7IJzr435HlDa0lpX4m0fFN+3WQpHDGo87Fk4jc
         6rrw==
X-Gm-Message-State: AOJu0YyQcIf0lpmTClbjjchh6HGu2rlx8cHbXngImx75N0GPcMt6XSCr
	fXywHgHSI1VZ3p15ual5HOE=
X-Google-Smtp-Source: AGHT+IHpCHj1EcCfnxWb2sNRSzs45S3cm1uALa2nvx3KgSG12OobKbSms5AW5GyKzojkEb4lxF1FVw==
X-Received: by 2002:a17:907:c018:b0:9bd:bbc1:1c5f with SMTP id ss24-20020a170907c01800b009bdbbc11c5fmr3589189ejc.35.1700388892263;
        Sun, 19 Nov 2023 02:14:52 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:51 -0800 (PST)
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
Date: Sun, 19 Nov 2023 11:14:28 +0100
Message-ID: <20231119101445.4737-4-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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


