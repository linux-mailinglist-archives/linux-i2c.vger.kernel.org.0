Return-Path: <linux-i2c+bounces-407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D31AE7F5B42
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9B11F20F0D
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490A321352;
	Thu, 23 Nov 2023 09:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mweEUmqU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F187D40;
	Thu, 23 Nov 2023 01:40:52 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so88625966b.1;
        Thu, 23 Nov 2023 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732451; x=1701337251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJZTY7Ppscmc7/agjAjlMp0CjMt1Rvl0KUPChAkdlBw=;
        b=mweEUmqUjNz/PHkFEfe7yagVBSBd2Ap1rqhUBed+JpOdE24d3n3U5BbFgCy3KG16dQ
         KQSf4nbBTAHjTXZVe/wYqkGJACJltQ8cNhmMfdeFtviwJ7ntoZDz1LnmT41MKPMFVk1j
         ow9R0UVyzi3M0JXoPFjYUsm9iqaQ9slMLNdWghhEkwe3JxkqUpXoEOawvUmIpDE6LZYK
         R8qvcryl9uIwktJsdjfhc9hxI2Mj3BQyEoPkd9geiS3ef26w0wqFns+cxDLXa4pC0w48
         hN+2rMqnrUOmJGJQhJX8yPGkDKXoubDe075/FPX8BC64XUr8AfNpvjuPVpG1UfaVjXlv
         jRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732451; x=1701337251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJZTY7Ppscmc7/agjAjlMp0CjMt1Rvl0KUPChAkdlBw=;
        b=w2JXyJEW8fUI+r9rbJn2G+dPwTielIg4a1UCcDscruCpkIdCQ0beHTcct59qnMD9lc
         C6T4Blm/exZpnZe4lUAcwWe2IdLXt+Hfrm1ktgU0tFpaPkZSBvO7gddVWoUessqaJ+NL
         /9I+a3M5OW8CpEgcYYg1XliAhKerPjydd89foRXL92AHzEZuersN8LYsexyqT4/DSiIp
         s1TDGjQH3+intese7rvacwwMMNprvrU9AyVmdW0NQTucFqymdBMqBwlXRv/04Q/ZWOan
         Tf8iR3ZOzV70mg1HyFV+OH9NiYpH7bIP2OrHIr+HmRFceuylK2P9Jlwy50hR1Ol5pIV5
         E4Bg==
X-Gm-Message-State: AOJu0Yy8jZSYrg9FfUVQ7ucqj1fkpp2FYLlGctVAAhsY/N4T6tc8cJC3
	VwsYpgUXFopwGk6biu/x5YY=
X-Google-Smtp-Source: AGHT+IHzN7AwPcm/sO9dy22vICRd2Xk4zJMeYsib0E7Fgzi8vCiMlpZC9C+ucr3iLv4APW5MC35HAA==
X-Received: by 2002:a17:907:371:b0:a02:9700:bf53 with SMTP id rs17-20020a170907037100b00a029700bf53mr3303778ejb.46.1700732450616;
        Thu, 23 Nov 2023 01:40:50 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:50 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 07/20] drivers/gpu/drm: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:27 +0100
Message-ID: <20231123094040.592-8-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c     |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 82608df43..d79cb13e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -175,7 +175,6 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 314d066e6..3d174390a 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -918,7 +918,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);


