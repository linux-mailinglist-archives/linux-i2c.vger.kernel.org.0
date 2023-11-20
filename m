Return-Path: <linux-i2c+bounces-347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC57F1F88
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFB58B21B25
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8F338FBC;
	Mon, 20 Nov 2023 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ltf2UMO7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAB5D9;
	Mon, 20 Nov 2023 13:46:39 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4079ed65582so18418775e9.1;
        Mon, 20 Nov 2023 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516798; x=1701121598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYIXvkWgZP3jTqRawAZ0bvfdTUgjzQkomxaiR6ITIUY=;
        b=Ltf2UMO7YeFPPV2fvCp7ZOtdj7rjkbHoixuqDi4G5d9wFuyd4ebNy5PqJUXGSoWmxP
         Irk2Je8wTddNZHFroUwnFwiHWJZF4wbLlIzaakh8P1aqqfIDgqPxvc+7NSFXhjgDH9zA
         y6Zs2kxvJM6QdEy6c8Scn9s5l5csfg7axfZcxbsFEBaGKjraW6AgpkrBlzuCdSiUYJP7
         NZ2VaWRx5vIE3EjMCXJayEJXUpk4S5KcjG+jgAXZFrjP6KP6a2ZhOfhfDZndTgM4kwBu
         MMMhk0e4pSvvSH4hG4JlL3SXaJKU4JGnTiNSrxtZj6L92he0rdeqkHKAOf9lfw77ntyT
         XPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516798; x=1701121598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYIXvkWgZP3jTqRawAZ0bvfdTUgjzQkomxaiR6ITIUY=;
        b=ZlvDNEcFBxt6gljdovlyoUL3Exkuo4RYb8HG+nbRLkmImxBO3C6u7OongD/qx6Q997
         jOo8gDgXKidKMytkT6TuDNE2LgGMr25kkomVCwY4AiZZBXK7ewB7qrm93QawkW1jxr9d
         pFcLuyXZW67lIPM/RsRUSOtRYs9B+kpTe1tAkak/0nAaSWQZXpzdR7TtM1ucn+w4WWlX
         S8IX+DKApqiX3E8EP3UCECA0xtc8r/hkzrtxyhwXYPnCHThIy/hSAGb5HKH40mPgR2MY
         a/yHtbqy/EtCjmHajJNstSV/cAZSMUscxmAQa0a6+g6p5P0r2uC4xPLPyy/fBN0IWbav
         c7Bw==
X-Gm-Message-State: AOJu0Yzq6NuazsxJXfL1037An8dLn1yruP9DOablJgQCbNtnrqGoD1Vy
	kPeWiDu3ntqEVqMl6U+O9gg=
X-Google-Smtp-Source: AGHT+IFKwgcCGvl+3GjRXi3JOaMzRX6/rxJnUMyqVb00sOOqmTwTqVycHrl5HKcsMJsrsDJpaUNpzw==
X-Received: by 2002:a5d:574e:0:b0:32f:810e:8a3f with SMTP id q14-20020a5d574e000000b0032f810e8a3fmr5245352wrw.14.1700516797921;
        Mon, 20 Nov 2023 13:46:37 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:14 +0100
Message-ID: <20231120214624.9378-12-hkallweit1@gmail.com>
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;


