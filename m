Return-Path: <linux-i2c+bounces-276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D87F05A6
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED9591C208EA
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3FAF9CA;
	Sun, 19 Nov 2023 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPic1rlS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E38E6;
	Sun, 19 Nov 2023 03:28:32 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9f27af23443so482242566b.0;
        Sun, 19 Nov 2023 03:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393311; x=1700998111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=XPic1rlS9RsrsKZJxF8iWj/rxcj1dVksuJ84g9vtpLJduXR/w6ZL3LrMl7HPYnLNsg
         0ivNUGoPYg9Ap3rfLedjyTnu7nceJ2Y2hjeWr3Gg3/C4RHhi411VjJ1PimM+AjMeJO13
         UKqPy4DR9TIsbRNUtFV0D9nZlqbr0/MFnuk1ZRMLxAMjFaR2m5kN2eqM6Y6dYZTO8GG9
         wXRWctqDil+98iwQpJkvxPDpub5OWG2DVxlZvfLrd++Z85Eph3AoxI3HHYEHBe7ztJ9i
         AxcmXj+WlxIEaLxtDNTBxwXmOltvCHN0Jmsg/IjRGioeEznhG5YXzhCfhKpBsVv7RgFn
         DaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393311; x=1700998111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
        b=TRZOkBik6YaQNib/e2N/npjsERDg7dBhmQDtqYWRfB9CHPwD+9EAzr8worOHw/LiTp
         ctoW2To3q66rIJ6XugBQSfGx+iXNk4vdSZONsIdiTksvHmfdZdJZ+0toXIDhM5bDbJGe
         UOPsh7i6nR9l4Rxh8iwlCdS7XvKqQvDxQgeMvW14tDaL1nCFJMXEcBpNRNMXPNeRY2Dr
         sRBO6b3NhQ/xNSaburjgzfezejawrOS4HiNqpTHNSCNC2TjIfMRYA9lwmjYmQ6zZT256
         dOkWVxKxncADC/o8Y3DP/uIjICXZBFLgiMLfIGtngnJq5woSkSduM7ZdVx78GNB6ETfu
         rxSw==
X-Gm-Message-State: AOJu0YyhLmVlm8wceuYoKFlWh6WWNXi8U/ZrGmoesJE2BKvy3cKG7MdX
	HE6p3HYjzG9cNSv7eeiKIn4=
X-Google-Smtp-Source: AGHT+IHPtJDz6Y9TbEJbQOyBB/Oo4sosA/jONsRYvNjJizHcLos8hKdg2Z5bR3z0yhjciXL0cwqKOg==
X-Received: by 2002:a17:906:309a:b0:9df:2fb1:1a83 with SMTP id 26-20020a170906309a00b009df2fb11a83mr3398055ejv.39.1700393310552;
        Sun, 19 Nov 2023 03:28:30 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:29 -0800 (PST)
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
Date: Sun, 19 Nov 2023 12:28:06 +0100
Message-ID: <20231119112826.5115-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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


