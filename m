Return-Path: <linux-i2c+bounces-219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B674D7F0165
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83191C20948
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE109199D7;
	Sat, 18 Nov 2023 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP1RC6Ba"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B44130;
	Sat, 18 Nov 2023 09:42:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083f613275so4951565e9.2;
        Sat, 18 Nov 2023 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329347; x=1700934147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=KP1RC6Ba6PXsQozBHV4kk/de6pTWwhNQtfegrVKppUJp1i2Gyuj3aeWOT4LKFXXGy3
         GClr5m3glaTo1JQECTROzX7kU/tSKtIzRMuyWkeKDG9wFjNXHoBDI3QIIice5Nn2dtmm
         R/SiBW26QkNiOjejH+fTiYPwXlLsMqBHhhz/E6D9AMt0K6bUz8VLCFqIpFrnL8oHhEPY
         pF8slpT0whttGTqad3gDSBULnOBjEIK03wuVZInvJBg60V3Q7oYNUPNgzc80y0tjigDh
         aZrFiCzdpEaVxCbRoXxutteel+bp8inQIXHAITMa/4xwz+QLISDHr6fBlYTNVEyIsBqW
         KtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329347; x=1700934147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=DO62MDLveag5BzJNfXmbyJLYIQ5pZr3+JcFNdSeCFCzoCsj59Wa7CZwGOskHKguEec
         BCiPfQB48CqdLXzmhekcJ6JiGiThRNpvJmOxt/pbm1aPijYE10aLo5NWuzOXypYqEwxM
         Dxgvg5qs8cYQQGsB+Hio6Q2feyWpxK4hVyNa1XM06MDD6KE+ZDfqC5bh0IyZtUKr1o2t
         a/hkSMuwoTJtrL/xYNviwAcZg4cB2V1gf4VLQxN3EfXPpvIQ4fW4aBryOvorNsl+WZO5
         ww6PDtQaPRlvQslyJz1tkb2zNWE5Ba7f40iuyIg4ewfO6kr5cB/6Avw+2NE56wJhC9Wd
         RXCg==
X-Gm-Message-State: AOJu0YzlzVLV7O6r6BgtM0nOL6tFdr67+FZ/RLnVrpBERbgEtnr/NAcb
	9Lfd2+MBYdGHeRkzxQ+LcgQ=
X-Google-Smtp-Source: AGHT+IGchLGNn/UTh+TSPBum/ynhaPI5RIfSnYeSODGRmp9mYu+xtswabBOKG8QD70Eu929TNCd0ww==
X-Received: by 2002:a05:600c:358d:b0:406:849f:f3cd with SMTP id p13-20020a05600c358d00b00406849ff3cdmr2461814wmq.29.1700329346812;
        Sat, 18 Nov 2023 09:42:26 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:26 -0800 (PST)
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
Subject: [PATCH v2 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:01 +0100
Message-ID: <20231118174221.851-2-hkallweit1@gmail.com>
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

Acked-by: Heiko Stuebner <heiko@sntech.de>
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


