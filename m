Return-Path: <linux-i2c+bounces-120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EEC7E9B13
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E47F1C20941
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E431F1CFA9;
	Mon, 13 Nov 2023 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3kZQN2A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD141944F
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:21 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0221707;
	Mon, 13 Nov 2023 03:24:16 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40a4a58cf80so15565585e9.2;
        Mon, 13 Nov 2023 03:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874655; x=1700479455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvPd1H+dWTCx2RVITrv+behT2FwWqNCuM6LTqdrhGms=;
        b=m3kZQN2AmvwtT41B43pdkmxsO+KQe0erY3H2BdlKDfn+oTax0vG5Ml61lfeZDz+K0J
         /J70Ck6sQBrxSN/8xi/yfzGi1i3LCYNC541tma7L/bgOwxx9rQWUegOOlmgVt6sAQxuZ
         a1FECv7gpCT092P6q7jES19pdw++lrhDBE12Z8xSYTClmPayvlet6rKbn+nq52rMzwWy
         I6IXxvYQuuRYbvoT2GvZEEkH0CipPiXvC3e5+Il3ZTzSHcbGIQkZIfK8e87bilyQ/WyT
         DsGWRZ1mhcG6ETEsv/4TQkSYF8Re/HWSAgkIiYN13MfWtJulOmvZNrSeI8/iIwtOJV6/
         Tnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874655; x=1700479455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvPd1H+dWTCx2RVITrv+behT2FwWqNCuM6LTqdrhGms=;
        b=l2BsB1/Gnz4wREKxyY8ITTdYjUiM71mWICJzfC5TNkjcSBzI1Z0h3RFo/gDBMSuMZI
         nglJ9wEF1tzvLLUsWQ7P751zlLAmJ2U5WgzEdxKjs8+kiwyHyNseBjv83qxNwb89h0cg
         sCMW8PePMGcjsA1Bk02xf++MJY6Jq+xE40Rt35pQ05/CtskhDw5hmRk+K01VMzvwm0S4
         YdkJWSijOyoG72/5e+0Tmd2ZE2QoLlvwxg/tbJxCH/xmMQ/FtvBpUjfBKrhONOh64oUS
         HVntA+1iEJFIIuefy7+x8WLYG9gkuRCrzythnuCMPmFgx11N8HuRYe7s77Lj9VUozaL/
         r95A==
X-Gm-Message-State: AOJu0Yw3OQZIBO2F9RDjADN8PJyECtjmWImoyfaQTclDzkJVTYrEgica
	pnJz/BVodMxdWUGY5oG8xT4Jg7BIJLICDw==
X-Google-Smtp-Source: AGHT+IEP+gQ/J990DBm09WsofRknlQRFM+I5k3Yr34oHvEhPlK+QyTp3PDB57QWr/1O4qd8w6uHuiw==
X-Received: by 2002:a05:600c:4ecc:b0:408:40e2:773b with SMTP id g12-20020a05600c4ecc00b0040840e2773bmr5743943wmq.34.1699874654607;
        Mon, 13 Nov 2023 03:24:14 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:14 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:39 +0100
Message-ID: <20231113112344.719-16-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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


