Return-Path: <linux-i2c+bounces-119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F37E9B11
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77888280D45
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BEE1CF86;
	Mon, 13 Nov 2023 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncJhAI06"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F11D53D
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:21 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EDB1718;
	Mon, 13 Nov 2023 03:24:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4083f61322fso33328725e9.1;
        Mon, 13 Nov 2023 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874656; x=1700479456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=ncJhAI06m0q5MnA8e2hlzpFWZwzwCwI11gWa8uuE5aK4q0nQoh5wzK599ok8mJkFdY
         Pa3H8VGlMXD9jdRyWkk7QJ5usIKz5Dl756lThIXQV3QrM3Wqgrxjpen2rCDF6FgcycO3
         bDwvGNO/DUd0u6kje6wWoxE/yTcmPRbnqV2xMimjqOrILNjLc+1WWnXELI+WYgDNx4Zu
         pkkZI7VyehNG318Y/rytVDqytdpZ2ZPHIuN2u8ydM5uj2vSSDnfdHzuGCKhmH0mHN1uK
         Zgwy65Oaeqj6IEoBhoe9YDIPS9Hjxi/XpEiZsgt/AvLuKigNIWKYlH6ppa40yzyi7p/P
         h+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874656; x=1700479456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=YPvlH8+39shKSyRXuuebLQ/V2Nw6jIRwUscdubOYN2grHadxaHpgAUR8FMJIFnKxef
         cu4UZ5GX9Ti510juPgeG0HG747jdVYZv7mBPaIuUk1FpmgFn1xdZrjxY6W8KfFiAv+EF
         FijMUwR46pa8gsIZQR3jECMc3Ox758+mwbGLA31G5m2tVdtVlkI1E2+L2Iway9XBWl9G
         sRJuNUrTgi+I6NGBWMMIUS4UlvIVdiRlPaFIy1TNFp8zS+72iXUzMG+4qdVGXazFRGw1
         fCurGg7fWSAAKgopgIb3KWEr9/UX8XUMbEXep+bYQ5/DzVM8oFmBVMpOh9xrFyCb5dO/
         GDeQ==
X-Gm-Message-State: AOJu0YwqgAt1jwomRt+Osgy4VewPku754pFv7/Njokyv+QySt61gv6Gs
	68Osk28F3TvbaX97iN2tb/Y=
X-Google-Smtp-Source: AGHT+IGb+/PX8N/YBLSMktQPtV1TVThx5TMgiemxOvWo2/x4okWcnwzbKL/ul1BqwEI+X1zzPo4MTw==
X-Received: by 2002:a05:600c:4691:b0:401:38dc:8916 with SMTP id p17-20020a05600c469100b0040138dc8916mr5424949wmo.10.1699874655563;
        Mon, 13 Nov 2023 03:24:15 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:15 -0800 (PST)
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
Subject: [PATCH 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:40 +0100
Message-ID: <20231113112344.719-17-hkallweit1@gmail.com>
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


