Return-Path: <linux-i2c+bounces-416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0337F5B66
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CDC6B2138B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3E522303;
	Thu, 23 Nov 2023 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsZnwxxb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4C310C9;
	Thu, 23 Nov 2023 01:40:59 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a00b01955acso88959166b.1;
        Thu, 23 Nov 2023 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732458; x=1701337258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr795psFWS5/sYRWa84NPLDqDZJaWExrkcgD8My4bAU=;
        b=NsZnwxxbgvsLoGXtWq7K3MaAIo3fkH8xflFJ1htX97WWInGV5v04Hq8c02JvPrXryA
         P5wP2ZgwIdCfX/APfGe7+KSUSrs38aKh7BDfUshOXJKWN+cMpKg+ruB1YLU/qzLKhm9J
         wjMaUNV86J/rDQkErPqD8QyrgSC9rsnUMldrMmFhI4C98wprwn5yj9Z1J5wl0ouEok2K
         jxj3HgJ9p4R1I+w6vTD30r+L3PjSCHHs8Q6KWm2y3PJeeX4dOzGOveEudWPVNHkSjeqY
         YUwTHPXhyLfxoW4z3DGiXGDpPTjXejXGOPdixqM/gNYr0rIym0eOzzCYPOwLOMuG2ErQ
         J2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732458; x=1701337258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr795psFWS5/sYRWa84NPLDqDZJaWExrkcgD8My4bAU=;
        b=kefIH8mAdB0rf4+MBUBKUBqnroP833UxrEdQnvibL8CdsT9mamPsQTajDRc/leWvo4
         oQpew0B9vXQjcRaQ6k6RJCJv1ihThyPTwOI9nc/IYnEJqODLKWkD15PTChOhvkNSARtC
         4BP1qITjgZwUz2haorl+QLQMdNH73Ml9mfOpOPw/Pgfkkr9Dp13DUttCjb1MVCB3ew4J
         WEbFYu0Q6dAwjd4JeAyIJwxjObRKm4KrSDAp595agqgJc2En5IJg/0JVVSwKmGSCbrxL
         eICKH3CA2Wa2I5huna3DTpjDrkwPMFS+Ho38FBd0oDndrsklORr/x4isei4zb/pw5cWm
         nY2Q==
X-Gm-Message-State: AOJu0Yz3F7OoNI7RDGdY9JQp0C2K//Fws0bR+14D3YBvxLiQHTfyvq39
	3rfApUXmro1waezhd4QnB+Y=
X-Google-Smtp-Source: AGHT+IEG/JB/o9MucSUuFgW0Hx/NQMaV9GLQLv3jnO/TXJE6jD5ckNqjKF0YzoqBA/n4IjpIuJ4Oqw==
X-Received: by 2002:a17:906:4ed2:b0:9fa:a075:c329 with SMTP id i18-20020a1709064ed200b009faa075c329mr3506046ejv.61.1700732457677;
        Thu, 23 Nov 2023 01:40:57 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:57 -0800 (PST)
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
	Jani Nikula <jani.nikula@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 15/20] drivers/gpu/drm/i915/display: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:35 +0100
Message-ID: <20231123094040.592-16-hkallweit1@gmail.com>
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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


