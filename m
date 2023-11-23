Return-Path: <linux-i2c+bounces-409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C27F5B4F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AEE9B20EE6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0072233A;
	Thu, 23 Nov 2023 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF6Yf/8y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D61BA;
	Thu, 23 Nov 2023 01:40:53 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a02cc476581so80118266b.2;
        Thu, 23 Nov 2023 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732451; x=1701337251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE3vmdF0wanDhCYGlSWZub+/X2exFV1gowAmEM/g0Pw=;
        b=XF6Yf/8y9yAjqNPNJn4LCtc1KnxkywrRMBJwkAv+VdzFe9rMpNApJD4SZU5EoAJ0z/
         DecJ8R//xKs4kN1Qa4iIL5o+XlrpcEojjJZTtJD3EgyMn9H4ejyo40M/4f0NLbyg4NEp
         Na5ivFczRP8/nkuWptprIhjivKcCrHzoZ7mO+0cZ7fgmSAy//x+F3UgBgX+HQ/Wvw/Q9
         YKrxMND9O9ZZQF46nGlIRB7fxeBj2xHjlkOtvI5QskaHGB2u4NTvKDD2KFPxZ77nT4Wd
         gaa55Z/G4ea5DjGFaJWpkzyJw/KYzWB8SboDmKkrNQu9P8uvtPL+IvAQjFV715UH4oXm
         Xgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732451; x=1701337251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NE3vmdF0wanDhCYGlSWZub+/X2exFV1gowAmEM/g0Pw=;
        b=SAAGkGQ6mbZnOUPIYRNXIA3biX7Pwkh9fCpvqOq49IklZ8JUvpo2JyU44LEVs5sA9r
         +LbrmjtCY41sRJlNhfseTk09Wm/8spffMwT8WLCj87q9PNGUVICBMUc9LwvOT7nqA61L
         g45kZDR2EYxA3nVPPHdkmKK/9V5FGt8xGOn5x7x2WHkcKuU3uokGUUWePDiCBmORvPnT
         DPgk4EFfcFlPabpt8CAYN2KvDwUv8vJ6ZjtwCN3wle7Sak6gL+pg6GYIsNPIZw0W3m10
         Hhl6K5sT2lD/L6pb77ZEOO0bMiFrUnteOi3bRI0fNDcqYLocwhrVMsCbfLKDzKMwuXTm
         wfgw==
X-Gm-Message-State: AOJu0YzHuZXI4rPNX3+kXpUshiQzLU4Mh7n8TwRsx5tFCnyfv+dEU03t
	DjydwPW5Op6Iq7SNTVYLzkI=
X-Google-Smtp-Source: AGHT+IEsOmKWsqrRI9wn8tyepMe2HWVZeZdZCX+kXs5QK5xUIlIuKwnFMGVkK2jR0mQNB43pWbZGag==
X-Received: by 2002:a17:907:30d0:b0:9fe:6508:a051 with SMTP id vl16-20020a17090730d000b009fe6508a051mr1921733ejb.71.1700732451429;
        Thu, 23 Nov 2023 01:40:51 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:51 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sui Jingfeng <suijingfeng@loongson.cn>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:28 +0100
Message-ID: <20231123094040.592-9-hkallweit1@gmail.com>
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
 drivers/gpu/drm/loongson/lsdc_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index 9625d0b1d..ce90c2553 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -154,7 +154,6 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	adapter = &li2c->adapter;
 	adapter->algo_data = &li2c->bit;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->dev.parent = ddev->dev;
 	adapter->nr = -1;
 


