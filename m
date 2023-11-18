Return-Path: <linux-i2c+bounces-232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7397F0186
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169FA1F23182
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BEC1A711;
	Sat, 18 Nov 2023 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJHfSzf7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C225A10DD;
	Sat, 18 Nov 2023 09:42:42 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4083f613275so4952805e9.2;
        Sat, 18 Nov 2023 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329361; x=1700934161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=gJHfSzf7SHa+hRLm5XImcbhng8GhNjNEGYAtxgzGbcV47g2AxA2LvzVJjfaiq/QFQ3
         lsXboH77POZHUwM73s2Jjn+yZg64+r3tMbRuxShUMuRY8+PWOZQ0TbstKj+lEunlByi6
         6cvryysQCABci7n8/PO9wdxf6JJcAsQC9N1WybQEhz9eI9AsvavZCLXGiActDtR58fzs
         IXn1UJOnLiq9ltnDL/zI7vu5l86vBobVrNnqLRC85ebzWcPhQoEYMcS7je+E1Luks+Li
         xTv+1yxIY60vKOb/vUH2B90xn3y4XZpcdpVewT5xqg6NR7rf/jycRiVK+Zli/L9FpWB4
         xK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329361; x=1700934161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=oNR6tQDdDq0jUela4RjFiJ4zHI07xUhRQg/k9/ERvzx8DkEmOt0awerVyJX5DAU8a4
         lSAxcRB2GdTqW0fF6NhTEHUv3iUbPPAkE0oaE0VpyRGQIKpf0zmU3vc4HXJKhrR577ut
         TwGYE0tWqQBCr4IDubnCaKmyK3K6oQOvewVa7bgw5l+RJgmK/8OPGj7YYQy1mdSzQuYg
         damTI2VHLRM3EDsVwEYg3Uc/10nXdVcvd0jkUNX8irvkX9MKShHsYOdExBp7BVtBIgcZ
         +fK1wIzTkJn4t+GldM8vb2JePi9PCfjTlxLaVYfKF+QO9VF2EENR2Eie09yxmy2ClMSV
         14Rg==
X-Gm-Message-State: AOJu0YxZJxf2BzOWsyc2B3wMWV84NnB5dC+i3YEARMnW16E9jwAXNibn
	Vs3fTSX299LAZ2xClhWErRE=
X-Google-Smtp-Source: AGHT+IEkxDeGvExBagSpF2r2LyZYIYynbcTphCNzYg+c+I50dSmhTAOksLkHYQ3bRD9pqUIHOvui6Q==
X-Received: by 2002:a05:600c:35d6:b0:405:95ae:4a94 with SMTP id r22-20020a05600c35d600b0040595ae4a94mr2254158wmq.5.1700329360770;
        Sat, 18 Nov 2023 09:42:40 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:40 -0800 (PST)
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
Subject: [PATCH v2 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:15 +0100
Message-ID: <20231118174221.851-16-hkallweit1@gmail.com>
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


