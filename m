Return-Path: <linux-i2c+bounces-352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B95F37F1F92
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4371C21154
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3482338FB4;
	Mon, 20 Nov 2023 21:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9uTnzRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5C31A1;
	Mon, 20 Nov 2023 13:46:44 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso20452795e9.0;
        Mon, 20 Nov 2023 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516802; x=1701121602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=R9uTnzRuk8C6IVifraIGRrXzWfIJH0LESZKTQpuCvq8EC3qfce2MgsfCtufdubrtbN
         yppLC4ibhuQN6YCrsDUVkMDjerBi6UK3oFLAF9JXJ5ZDbXIJEW+ViXQHrrn12XdyjAcH
         KWtryUpRy1Q4Zdd4ad4yRiOaoKN03R+SN1FgL+DrksF/2Pmc5P77d3mUxA7WKFkkwHTj
         NgEGLDUrUJ7OTPufXZbbvGZPs6teezeE71Ko9tDuQRf7cDXVd+ERRC9nTrDcL2d8tw8r
         oP3MNns2nX6Dklp5ZleEec0TNfvGtqJ5waPdJ0UvmKQe87cktUXCpxjrqdCzpNUMxMUy
         N7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516802; x=1701121602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anw5D9jgaSVgoYwRFPH2zMk9qB9A7j/26DqujJWuba0=;
        b=RVO+j2EOz0uhGA0ytAS5iy/nSiIEUnle0vTLuz6cfyTWRY6mmCexq11ZIIsSRJrwpk
         UCxHOfvxT+MzLDCKGK4RdAlDicuPCXyfCQ+RUZ97cm6kzswmFzDDgqV6M9Pc/wEdmqTQ
         LfITHKmSNYEMphkZBiy2/8eQRz/EPlz+tajpDPJTCSiO045axH6PEL1R5d8zvR8gJTB/
         AThQxCETsC2WY6uNhbfcGBLv2O2p/B0XNrVlcgMCuLqhDfaR1zesDg8TTEiW3/DwiqH2
         2Hl5kpXxLD2F3QfP2Erhz4ssAyqeRhz6DlkvJJN+LRh2AKPCDA3ckCqImXE3utCu9hoV
         yLng==
X-Gm-Message-State: AOJu0YzzMZAwARSmtmUH2G8PR7axNguk51fvvNpN3CfSY2Vn2fhtYNaq
	Bh3VLOvArZ8Br4HX4MfISEM=
X-Google-Smtp-Source: AGHT+IGCNvJ+s9QKyAFCEyfQzE+WdN1YcyTEOm5eawrcWLv+hW9plFQx2WrzNQnxKdHkttv2+45PsA==
X-Received: by 2002:adf:ed45:0:b0:331:41ab:22ad with SMTP id u5-20020adfed45000000b0033141ab22admr5898305wro.20.1700516802375;
        Mon, 20 Nov 2023 13:46:42 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:42 -0800 (PST)
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
Subject: [PATCH v4 16/20] drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:19 +0100
Message-ID: <20231120214624.9378-17-hkallweit1@gmail.com>
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


