Return-Path: <linux-i2c+bounces-417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A407F5B63
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AF92815EE
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F2B224CA;
	Thu, 23 Nov 2023 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ5A0zqC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEB810CF;
	Thu, 23 Nov 2023 01:41:00 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a002562bd8bso135524166b.0;
        Thu, 23 Nov 2023 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732458; x=1701337258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq+FEnQba7Sk+IX5HM84oJaaaLkn3lu8uiYE4NrIrFw=;
        b=fQ5A0zqCst/xtjHsSgPmt1rCFNsbOWd3YRJQ3gQRYNcaBsY9RJbu28Eip1orCYrHfA
         IKyRuY/c3qqiNr+HdAVIgMpUxjwV/uWpyjYH/zmALwRc7TLxj6X1iJs12VnbsFDOp/LJ
         rL/onbKmDUUfIYbS1upJn21YSUutXkN7SGdSAiNJUjDfxzsxFSvgArH0hqLG6f1CuAGC
         m2y6pjV2fuuBAqjP6KB0SSEzGoAqKhcCSgPGmyfOUhJ2P+OKIz3i6BF8jWUyAfALnUQl
         qyYcCcTCfVREg8qX2UegJijmQYyksiwz8Ru4onwcs0EnM0akDmh5E0usdC3tdq8pXBk9
         B9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732458; x=1701337258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq+FEnQba7Sk+IX5HM84oJaaaLkn3lu8uiYE4NrIrFw=;
        b=mOHLh7o4k7B/d2//uL25lr+jzkJb37Kv8McWgS26lvtDuEc5MslHU6hKB2rmbWrHWQ
         ewUP6m2ZDcZegHRvTWu5fIkH8IwoHcL4NYvFn3AEnVjC5nYbP8CyM+327611AFuL7IZI
         61Zt2eOoncFPEz2uWIHuWcweUo5kdqgl4F0WGdZoiNtSkcflARvmC4OCyAK6fwE+8JTl
         O0Dp4QZwZy0Ca18hqp/fYMtZI3rQnD3bGem1qiNJfE+es459u+joEhBJkxg99ggwGbm0
         xhG8Hh2zxTVEq24eJmW6Ze7zLhq9iEjBH2Wn52gCN8xaGImYarihk3SVxrat3ZnEEdFs
         OkBA==
X-Gm-Message-State: AOJu0Yxi6hvtunOPtx2aLacAXqdJUWNzJ8UQXuZPMaVMBaXAsTq+/a+S
	BicrjRjJ/E6wLqIsLiOyGW0=
X-Google-Smtp-Source: AGHT+IHo0GBiadovOU1BBR1oWkASv65VH9/WnHAU5a3ZhwF8MBuNzgNR/J1hpFuh5wSinOqeTq7u8w==
X-Received: by 2002:a17:906:78c:b0:a04:e1e7:d14c with SMTP id l12-20020a170906078c00b00a04e1e7d14cmr1774196ejc.32.1700732458571;
        Thu, 23 Nov 2023 01:40:58 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:58 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:36 +0100
Message-ID: <20231123094040.592-17-hkallweit1@gmail.com>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 410bd019b..e6e48651c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -81,7 +81,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev,
 		     struct hibmc_connector *connector)
 {
 	connector->adapter.owner = THIS_MODULE;
-	connector->adapter.class = I2C_CLASS_DDC;
 	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
 	connector->adapter.dev.parent = drm_dev->dev;
 	i2c_set_adapdata(&connector->adapter, connector);


