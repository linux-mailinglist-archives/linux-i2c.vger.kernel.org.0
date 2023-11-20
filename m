Return-Path: <linux-i2c+bounces-351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A38757F1F8F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A601C2159A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C545239848;
	Mon, 20 Nov 2023 21:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZBDuolz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4C8CB;
	Mon, 20 Nov 2023 13:46:43 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-331733acbacso2126166f8f.1;
        Mon, 20 Nov 2023 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516801; x=1701121601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=lZBDuolz/Ve2Kql39nrWMyssJK46MAX8SIa0avgweMI4nQ47+b4g7VVIhaLDjiAfqH
         WYdAXiLvxCzRwkhG2Cl7ivBwHik+eKYQ5loboZgtUfZpfID2SBayPdXwa58nXuqknzvU
         ZRoezjLbNew4xxz7xflIntWujLU3xlRfsY2PPMLHX28V1Tg8v3BJMf9B4UQwbooMFiHy
         JhUvy3dHXvbWbWHgQdBdwS4lm01I3kvYdtQo6vIL6DUMJzfgvxPPyd/UcYD60/3kGnZc
         hTK9wuFb4PrVTvKQEB1TqFWtsfX6TwSaaE7Owgn1S9caAHORGICBKx0cbaLzrmRguFSe
         WcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516801; x=1701121601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwY3dw5n8Qn4ucno1MuBuADAhIYe/cj92x0CcIZXqhc=;
        b=uefdVcBzdX4dnxAapyYE/3mbYyJDVIIkRbZmI8ugo4vtqotdOxSjk1fgZ2GtLRG838
         wJ/bae83kqaIb4jFDhBYcEQHQZLbMq5WXAVaaQ2D8lLF1X2x1Rw5PguIhrS7Az5LDYx5
         q//4rB6XnDtD9ZuFUwu0nBbmHdFkfD2EjJ1CxHC+6z2pNLKTBbMa+EOflYA2+isFiUM7
         0Ajp4eID7KhaLqYDctkcz2bF0HAtgh0aztLW7oKbsD/sNqL3yQBfluAXmUSTfx8kHsM/
         mTxac3ayzrWdEixYK1U8LrNaK3zoOcgzD1x3H7NXpfu5Fx9Jxxb2MOeqUsNs11rWUmvT
         02Rw==
X-Gm-Message-State: AOJu0Yyfo0JYNH1+QSWs+SOlBc4NqB37u9/TFSlRVymWXgoaInLVb0pY
	FbTYKzV/vvUGqlZYGdvaCrkd/5M4j0nDtQ==
X-Google-Smtp-Source: AGHT+IH3/XFzq2U/6agtXbj1oqhLy7Jth3QoBz9Hz0FwIflN3vy7qQTcPG492HCCqk1aqFe8zNZYvA==
X-Received: by 2002:a5d:6d87:0:b0:332:c49d:28f6 with SMTP id l7-20020a5d6d87000000b00332c49d28f6mr3843056wrs.13.1700516801468;
        Mon, 20 Nov 2023 13:46:41 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:41 -0800 (PST)
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
Subject: [PATCH v4 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:18 +0100
Message-ID: <20231120214624.9378-16-hkallweit1@gmail.com>
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


