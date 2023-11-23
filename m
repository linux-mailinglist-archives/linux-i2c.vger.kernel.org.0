Return-Path: <linux-i2c+bounces-402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1877F5B37
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BCAE1C20D2C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6956A21366;
	Thu, 23 Nov 2023 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ0US6wJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E92D41;
	Thu, 23 Nov 2023 01:40:47 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a02d91ab199so82413266b.0;
        Thu, 23 Nov 2023 01:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732446; x=1701337246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi4R483zknpMUwj3cvaLHx1vmpa1j9N3buw1XNODPJU=;
        b=SZ0US6wJvhCsJ+lGb5Ez5s0ViOWv3eK1VNTmyJ55EjaZda2L/1A7W/f0tl45aM3rJT
         GUIJqKirQkvF97fr5Wp+ofbVsGRGvnXnoaPtxaRh38Gp4G/keA9wqQzNlanyOp/ELQD0
         MPt3XnZ5gg/io5gI8LZStazTf5gpmTGHNIksF3cuPVKleBGspBME3N5C019RrjvAFgDH
         CTg0vBpSi+ntPT65FDGTl5Qftd18V2qgxeqNC+UN4PbmL3N6wrL0iR/gjID9r9wv+vFS
         ljaSkNH9q/65OcBG5jAhXvX4cTFSIFf8yeQ7ADWWosyqzMtPUx1nItpyT7GFrspSAvyo
         H/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732446; x=1701337246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi4R483zknpMUwj3cvaLHx1vmpa1j9N3buw1XNODPJU=;
        b=jPWeN1RQ1fxqZTNVM05beDfnDHp6nPikTUBSz90/H9hnAXD55BvSiwPsWOEg5OTEMC
         3mkInWPVLlSaUbYKBDeSRSrglbQUnldEYBLMIvM6iWlz538HzONjA6rP4AayVOMxMwk8
         MPRU5tf66dKaGl2/R6hYKqpY18dE5SNWkBDBoLOBtjiKqbyL/fyffcDHpWkxQ0tMd5GI
         BRINuMQkWdm61sopZYiF81YsYX2fVl9Cqem7VKvb13/r2sEWkRDikOSRFbyhJpYMfWw5
         VFBR8wwWlmDFaYRbgejT3QglO+5R4/xvA/TeDTjFBCREvImrpDIuA8NWXKt7FV8ufDia
         8KNQ==
X-Gm-Message-State: AOJu0YxQ+H4mwDSiMhZ0yNNqre3L5a0bcv137n84Ti4J8cJxFhNi7l6x
	vMRtNmgsK9i/VjkNZqTuMmI=
X-Google-Smtp-Source: AGHT+IEtwKDYnzg1xKgfKy0ud4LFwlV0rfc9uAkIx75F9WsQAVnCrYCvhXmBXTNqAzq4Kf4OfYEh4Q==
X-Received: by 2002:a17:906:7c57:b0:9fc:9b28:7ffc with SMTP id g23-20020a1709067c5700b009fc9b287ffcmr3285748ejp.17.1700732445589;
        Thu, 23 Nov 2023 01:40:45 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:45 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:21 +0100
Message-ID: <20231123094040.592-2-hkallweit1@gmail.com>
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

Acked-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/rockchip/inno_hdmi.c   |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a1..a7739b27c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -793,7 +793,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fa6e592e0..7a3f71aa2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -725,7 +725,6 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	init_completion(&i2c->cmpltn);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;


