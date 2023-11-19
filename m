Return-Path: <linux-i2c+bounces-269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B787F0542
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23EE1C208CA
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB61C2D2;
	Sun, 19 Nov 2023 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNq2T+6N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B494D5F;
	Sun, 19 Nov 2023 02:15:04 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d216597f64so461957566b.3;
        Sun, 19 Nov 2023 02:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388903; x=1700993703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=UNq2T+6N22AEnS4HLrQgLByl+B2Ei0pp3qOLSXxh8Rslie/hghh/PYEX9CJxeETBoW
         e1KuVBNw52Pyowrpvdwobh98UsTQfMscErY2VMR4E2NUdRmQNOHj6TeEmaqsOlN2ou+w
         8bAgKzP3uM/3XmCMsTNgLsj2Uge5LT8tuRMu636VTXRyYmvDsqLoqXPIeIYAT4qySXMu
         /dIykQ7dX58nkN4b2yYV5Jv0TGfo/MPGclA0sG1Ajnz3hcmLXXBY+DZvqwpOQ+GzIQVr
         FsrrWql3IlHUPH7TSd+EEtd77ZxHKMEDV0C+J6PO6FHUnvPTkrb3/WbqG5PmXbzedggI
         JQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388903; x=1700993703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=XHZ2LMVFIJSqsXf98CAYGuW2KbJVUUwd/rlkX12mdTr1JuZYyABYBT+mKJ7H6vg/qT
         6i/xLvDHclxQjX+9PG9xt+XgQvcOChd7oRVFOsA5LlOcx1IdltdL2NA0yT5xIrIAJPb9
         HTrCcZoJm/T4feaY/8XpyIJ+Ja41CJqJZWMgT12gr/Y0up+3m6eng1njpDQcbyLYE/IE
         k5MduWr1sFdzIz/Do8fXUBqDF28Jaq5T5eenutw5Bskgr/R6sDXR3bKzHfO552QzvzAb
         T4tsibPMMCD9d5qaGOanY1t5fcaZ5agi13Exrs6IFH58BudEv3sDw2vf6PMSfMDq/4az
         Wt3g==
X-Gm-Message-State: AOJu0YxaX/uTntIgqHiEV+oYa3cK8NrfFgApUoga94zKPQI4VdPbKECv
	baiw+MBIiGEpEhx5xbi+P/k=
X-Google-Smtp-Source: AGHT+IHP6byAlqIoVwDbbgjuChf3oN9zUpAvK+yJPawUfgKyxdFFP80iOw8k2baYpP8MVO/1Y6ukEg==
X-Received: by 2002:a17:907:1ca4:b0:9c7:5200:e4f4 with SMTP id nb36-20020a1709071ca400b009c75200e4f4mr4905232ejc.41.1700388903204;
        Sun, 19 Nov 2023 02:15:03 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:15:02 -0800 (PST)
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
Date: Sun, 19 Nov 2023 11:14:40 +0100
Message-ID: <20231119101445.4737-16-hkallweit1@gmail.com>
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


