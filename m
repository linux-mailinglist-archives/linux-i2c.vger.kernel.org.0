Return-Path: <linux-i2c+bounces-255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5D7F051C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6759E280D6F
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8625AC2D2;
	Sun, 19 Nov 2023 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqbABW0Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC50115;
	Sun, 19 Nov 2023 02:14:52 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9e623356e59so464992566b.0;
        Sun, 19 Nov 2023 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388891; x=1700993691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=lqbABW0Y5psgVQc2IvRucUX32oGYkZv19S4dLdmD+BHgOJr+8Iz10zoyX9RsBVyH9o
         EkHpIusHSx7LC9d1Ec2fB9lubBn+92YQo3PH21wJdlxwkPbKp1712LhtfR9VPkihCYFx
         ibx7zpvj2BvRU3yuuasH22o3jSm7Vm5cXgM4hY/5ldrVlxIP8XlNy6vp/SicfEJbJZVU
         zG0NbgfLKKhvCXMC4FNPtj4J4tvrw2DADVmAD4GRDSZJPsik2fw5Tu2QaDw3TlfQPQu9
         pHpZwh3hG2G7c1UTO9PTce9YDzZJp9Y+rq8yN9d3gGaT51Tp2wuGVjYFz40vvp6VBcIn
         Vy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388891; x=1700993691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=GnYnKYpl/gOiTaVu9wCOtMk2wlKjFNKo5hNRi/L7puuNECbz27X74TISHi/S8t9RER
         w5Zhamoum+JZvYlv3EOhWvhUseeaS4IzdSrprguvlKGU0pllWbx5JbayYS9GAoE+3MGD
         kUFsuR59OuR66aUatZzKzsKh6qcYO+t4zHf66Vw3dBOOFQ5RKJUF/cpjYezfoJ5bGk60
         cY7HdlddGV+eYfoApTOX8vKdEkPIIPqr478lEnAo8LgOO82iCIppYll+Fql1CKF+GYH3
         N7o5/iYTkGcchspt09APGW6zCMdhzAU7QrcWTCoSsK8bKIq9FcKawWTRcuggYCKWJqvx
         TgBQ==
X-Gm-Message-State: AOJu0Yz//UHdCC0LefZDn7cneiuXLKSKtsUGLUZVdjrpJKbip0Af/k/9
	uogwMRRJJ5PB9rZ7IOO6+bw=
X-Google-Smtp-Source: AGHT+IEEVozgrh/6Rx9qN+MfKy5rNAZjGHZv+pzm8pL0WUjL9KQQ2Sv26qqyIC1UTM8PRyGpjsraBQ==
X-Received: by 2002:a17:906:7394:b0:9c7:db3:8b31 with SMTP id f20-20020a170906739400b009c70db38b31mr3495931ejl.59.1700388890388;
        Sun, 19 Nov 2023 02:14:50 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:50 -0800 (PST)
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
Subject: [PATCH v3 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:26 +0100
Message-ID: <20231119101445.4737-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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


