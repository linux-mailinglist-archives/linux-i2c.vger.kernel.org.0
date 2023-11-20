Return-Path: <linux-i2c+bounces-344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71E7F1F7E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01521C21083
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E37F38F91;
	Mon, 20 Nov 2023 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORibleWo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BBA100;
	Mon, 20 Nov 2023 13:46:36 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b26d6f7dbso2836295e9.2;
        Mon, 20 Nov 2023 13:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516795; x=1701121595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=ORibleWohRfM4Ab4bN6m5HPmyebs0jNqoswNx6MzwUH/rTTU0tqVW7vHLpkzsu1f2q
         bl1ZQ1DlUAVqTlQN4akWLUlwRtYEX1rfeiTmuURQXgcoP481dJ/7amon2o5AHkqS+84x
         EAWq9rCIaQuUxqdIWVnpoiS2sp8wfDEWUPwARCHYBMAc2PnfOSSt4Q0q9QkW+IeFD+VZ
         rclcEFJXdQuUXpNFuTYLzN3j9RNPR82B8vk02iDGyAh4B0ibGw7JSuOLJOByZfCgbK8M
         nwkryG1Tcng9InI31ycWbhaLb/GpC7wXvLQwp/qgvKJ72/nsKMBjXAEnbBaC6WaqyHDb
         qXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516795; x=1701121595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=tTnQluBSPtddhgkTEjKlJT+mny6pAtTZ51yn1fA/djdyofYJkuhaWZc/VMUO5eFlQp
         reBhcqcFICo3ciUEKIo+zqY2obTysX6InTIn76ZaLmubABY2JU6CrECfcF54ZwX4cxQI
         t9jeHctfGJi0jituutLHWJloAlmtrlDMSWMyCOIQCiPu+MrfL9WmAeoiUfhwLnJkG1Pj
         +9YiV9M+rSH78OPutQZxkreUe2xx+ML3YDc/k/tqByfYHNSueTQCyAhFL/er3CH3+0nY
         nVaRoPfbNCkTvlcsFyGxTMAa41i6jbWokKJCTB1ts3AE4fhiBoXo/JeFQeA7puMi2Pw5
         BtuA==
X-Gm-Message-State: AOJu0YyGR2icIauXtmUs2Wi+bkdVpJ+Aj4gn7uAhmyPwQWUWntla/U9/
	lIHmNnHLJglDyaRdiNhTEY4=
X-Google-Smtp-Source: AGHT+IFWapLuFxCSewhtGN5+SzhD5+H3LCSt/zm2fnp0PaW4rmMLvzE2JdtHwPvZpR+N8k/OW58kcw==
X-Received: by 2002:adf:b318:0:b0:331:69a2:ceab with SMTP id j24-20020adfb318000000b0033169a2ceabmr6977633wrd.19.1700516795084;
        Mon, 20 Nov 2023 13:46:35 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:34 -0800 (PST)
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
Subject: [PATCH v4 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:11 +0100
Message-ID: <20231120214624.9378-9-hkallweit1@gmail.com>
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
 


