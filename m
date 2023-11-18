Return-Path: <linux-i2c+bounces-225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A11E07F0174
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5806D1F23045
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C501A70B;
	Sat, 18 Nov 2023 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPLU3XHt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F8FD4D;
	Sat, 18 Nov 2023 09:42:35 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso4671135e9.2;
        Sat, 18 Nov 2023 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329354; x=1700934154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=aPLU3XHtplIReVL/oaZ3Hk6wuEQOsJcN/3LxE4qv0mZeDWdSGZ08fgBamyuKjfSRqi
         TdMAnXvuxjs07caaIgudbtgVcBc1CqrstTzrbJHMrU+BOXAFpusYa4IEHeqSjzFFRgJn
         p5LHhU8BdjuW6rWpW20ncEgtfvSWT0fm+4ifNCTW6cM6mWxTCfpHNfC/H7X+1GBbfl52
         o8oLQ2Z9/OV86Xj97BCe1/qT+E0AiTaVyzcXfMZQvi9c0mP0D6fuWGuhZYVwncwkaita
         8lAhpZ4fs0137PnKs/9m6DJig8uZO4yG1jpEaih0qm688ZuG9bN9YZBIHQtGkeXGH8na
         J+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329354; x=1700934154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=cbkLCld9eOi6sGHb92pqr18geOzOBrf8Za2rfHHA97GvBOZ/S6/o6Gq9OfaZ1iTcXI
         ST6zFatLglDiztJCm5Z5/yt3Ug4M9bAvilLQLJgEVv/rnjpHq21B5WxBCbTwgkrZV0vL
         3dxa17G1Gxb4XQbDJn7OX+kdV8cxGDPWjB4kKPDOMi4hTZQc2AzAdzO26DqUFmC/rxcC
         F9aIHDjvw0u8r6II1kRtep/7LRCvdiPbYmVgOEhi9HRFdUk/wZJD0mmYZV59pvG86Fp4
         fxr/rqSeaJSWANaXlT2Peqz2RX9SEx+brA0Vb8M12c6x9UyWsrp2F4wUAJwqbmOG/rOB
         NpTw==
X-Gm-Message-State: AOJu0YzrAxLg4Dhxb5wSn8YTF0h0pgbCeuFepZSUkI0dy2cUgRQQ0zAW
	lGF4VgPBPAn0zaQxTdiiQlA=
X-Google-Smtp-Source: AGHT+IHFeQem3GC7lyXfhuux3W0nXFchU62Mp5yU1I3tjQqqacuqysAcTGeFS+2WghbyMr4dvj9rxw==
X-Received: by 2002:a05:600c:4712:b0:405:348e:aa43 with SMTP id v18-20020a05600c471200b00405348eaa43mr2139830wmo.12.1700329353750;
        Sat, 18 Nov 2023 09:42:33 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:33 -0800 (PST)
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
Subject: [PATCH v2 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:08 +0100
Message-ID: <20231118174221.851-9-hkallweit1@gmail.com>
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
 


