Return-Path: <linux-i2c+bounces-290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D27F05CE
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0231F21EE8
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C41C101D9;
	Sun, 19 Nov 2023 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr0bOBMc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EB7E6;
	Sun, 19 Nov 2023 03:28:45 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-548a2c20f50so463692a12.1;
        Sun, 19 Nov 2023 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393323; x=1700998123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=Nr0bOBMcw3x7yEBx+1+tPww4WvLdtIfve1DRcHMZYniG7MLlJ47/jME494jgGvx6ad
         OIYEICa2bL+SdkqbOHC+wnjpMyMrg7fTw17FYws0NNy1beTZMB75I25E/3osHM2kdqCB
         wcKCZZOmHnfNIVPSdjINzFrXNpGFjx6+Ql3c8VPi0bhYsQ55+aS0Jy8hP3R7nULyZuxq
         p8WwMwnewtgNPrVP1/1tqvHWZBXPMa8v60HpkrygjnXhZssYtXtIceVkaIzlbwhhrycQ
         Laan7nhYlWMYv8607nngqRx5D7qROm6jJ6KZ9o3OdmgFjeNV7YKS8y2nEEKnXFhMbBMT
         4BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393323; x=1700998123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=RnM7OLKd80GpbYD+KdeXCuN0GSH33C0Xy5piJ2wPvq2B3fwNJARYJzdwAufcjpeVjM
         zdhVkpzcOOQ6k4gnXi391oxOTSMSCvfcAOg2P636uydKksDiPXP+wNbDvvJMmoXinv7c
         4SFcF/RYiq7GreV4PMpzd9prM3n3ftzUrZVeMs1TLeEZUJV7OBTingRej1xd2H6EgeIH
         +SrIPwU8Fd42cwvCqg3lJYX1eBTrR215nYEn1d8WsxLF5aQEfpajINm4W94ZpftFv2AC
         1l8unwhAjAuomOZX6ty+PX0v4ldaEA6DGZlhA1hJXNMKG7uTC3MD8CXuGKN64Gk21kFa
         keLw==
X-Gm-Message-State: AOJu0YzSCkhPF56r5qrNS4APP1gz/cte6T1dLVNY85C78qRR7YW39iyu
	uFv5PrDGf+l17zLikakzcCab0nnOnXUwDQ==
X-Google-Smtp-Source: AGHT+IF98s8aEn0w1sgMJYs8s2hcKMxZPSkooSx15XAU5tgESM/m3QK98+ws4NtnHf+xbrajq9DL3g==
X-Received: by 2002:a17:906:1859:b0:9e8:2c4d:40d4 with SMTP id w25-20020a170906185900b009e82c4d40d4mr4394226eje.30.1700393322803;
        Sun, 19 Nov 2023 03:28:42 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:42 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:20 +0100
Message-ID: <20231119112826.5115-16-hkallweit1@gmail.com>
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
 drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 40d7b6f3f..e9e4dcf34 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
 		}
 
 		bus->adapter.owner = THIS_MODULE;
-		bus->adapter.class = I2C_CLASS_DDC;
 		snprintf(bus->adapter.name,
 			 sizeof(bus->adapter.name),
 			 "i915 gmbus %s", gmbus_pin->name);
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index a636f42ce..5e64d1baf 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
 	ddc->ddc_bus = ddc_bus;
 
 	ddc->ddc.owner = THIS_MODULE;
-	ddc->ddc.class = I2C_CLASS_DDC;
 	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
 		 port_name(sdvo->base.port), ddc_bus);
 	ddc->ddc.dev.parent = &pdev->dev;


