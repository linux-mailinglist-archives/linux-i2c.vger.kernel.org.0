Return-Path: <linux-i2c+bounces-258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B376C7F0521
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CE14280E90
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FF96FDB;
	Sun, 19 Nov 2023 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/kofEEW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07751B6;
	Sun, 19 Nov 2023 02:14:55 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo4835929a12.3;
        Sun, 19 Nov 2023 02:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388893; x=1700993693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=E/kofEEWob7OG07wSdUV6YKCL/Iio0p2OYRhNKDzegXPMcuLt33Mw169dIY0neC9Xb
         ab53IuV3xpwSTqck3XJcOE6jz87+GsQFaE+POzcx/qteCqGe1aXWjFeIzgOlOSAJxx2J
         Npundf9lXumkEXmkvH/hz9T0/yKAuvfXzGEcMPfBUIJEi/SjJGh/qjevwoitagbQn/oq
         97FZW93Ejh1ZTQd9nsYtNh+Kerz6OuOxRfzYzsuuuE4jJKGN+LMKCC7yh8HefKsUzVnO
         boLvB84lPnyc4PihHlaHliLXrL6xXEB0GB469QMWFiNufvge4Zj8FX4dIsm1cOknLcGp
         jV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388893; x=1700993693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFS8KKprIzFM0zE+Ai6M4ORed6sy7M8DbezDgWX5KRQ=;
        b=af3Rr9AtIUkT+yokI146Wt0XjR+MQ2+csEd2AWUnmcWkYswPSTMUdWg7IoGBYbYnyT
         AEGDZc4vMmgIlqI8vW+6aZwqjfSi7Qjvd1jZGe6YPove0vr3Ny7f/FtFEebuW1YCFTgT
         6XhbW7AlZs9wuNIDpJ8NVem6M0L80OXUYIf5l4GvW28Sa8CXuHta4lo/RLTjHyx2vrvK
         XwYA3NZwU2UDLCGtwG18i9+fqW/g42CdNI71ZGzfZ/ElBylBCpUD9O6gwdqtoHlO+7cn
         qOskhHWnn7lKldZoIfEvVuKE8v1UOPnlGdCoGIwLLQRPMiY+Bnq97I5OUNn+ZaNoD3+r
         bObA==
X-Gm-Message-State: AOJu0Yydp9BBJmZvkzMWl6zQfMDpGR89+ybiK346Az1XoDuuZV+wcgUL
	Y5sPGC2H9vVFkuyfOBqBjWU=
X-Google-Smtp-Source: AGHT+IFcb1Rra71IEq6JfJPC58ag489QhCbPNIPTSnf82g6F4cllHuVlGQs/WMup357oql3Lum0POQ==
X-Received: by 2002:a17:906:158:b0:9fd:a833:996e with SMTP id 24-20020a170906015800b009fda833996emr416969ejh.77.1700388893152;
        Sun, 19 Nov 2023 02:14:53 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:52 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:29 +0100
Message-ID: <20231119101445.4737-5-hkallweit1@gmail.com>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index d1a65a921..f5f62eb0e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
 		return -ENOMEM;
 
 	adap->owner = THIS_MODULE;
-	adap->class = I2C_CLASS_DDC;
 	adap->algo = &sun4i_hdmi_i2c_algorithm;
 	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
 	i2c_set_adapdata(adap, hdmi);


