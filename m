Return-Path: <linux-i2c+bounces-338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF987F1F74
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54B62B218C2
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70FF38FBB;
	Mon, 20 Nov 2023 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRsEeDrO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44012D2;
	Mon, 20 Nov 2023 13:46:31 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso13258455e9.0;
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516790; x=1701121590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
        b=QRsEeDrOJvqOXuhy8AvA1hY9KeECb+s+x/W1hCWBvubGYEAyfs5l1cRBk4UGrfCSpO
         NvB07SW1gaSEKk8Mwz2uOk6RU8kRFE0gW0POetdoHUmhfSUwdpYVD6sL6sfIHeraGufq
         M3EI5JPs+uSAqgmmlqAm9tbw5TA6xYyJMvS+gDZ8AaHhGLfkf6OecKvhDn08PW2em4OW
         y4hpZ4IupAc20zWNtCkcH0+nB9tEcQkpfUcg5Z/HxQyRXhLz0yan2xkdLwHyBI9cCRca
         1vpQbN3G+NlXkxY6RmH2I+PtvHEbuH+S1akoWZJSCIouckmO1SBu1Lz+jXqRF4PdCnBh
         BFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516790; x=1701121590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H76sh9TJa21kiF09BweriFrW/UpEK7sOhe75l5gn76g=;
        b=Zgv9kv+0o+Pgficic9byDXL4zGrWWZgjPOQ1egPut38LBL+ic2BFw9j1zeeHwqvhM+
         VhOv8CyMrBWJsLQo/64ny3HNLHlMSSfDpKUeDPV0yvWgfv5vCVVD9MVdMTuZJe5OiTy2
         PYItuNTRNBjlWIKhd8Lo2o3/BU2Qzd9eFeba2f2ghDu7jSz3eyvcq9QRFdNT8OD5/UpL
         sq/RGXvaXJn3mltFKv3SQPFXBT4Iuz62JO3ko4BMFnuxEwd5+rD6VCHRLuWs3XvM7sL4
         1SqEBGl//SsMgkCHGSKEpKDYHdyjva9Ld9LbEkPho1pH+V96urG/wfiQDizxDgtyGVlp
         NDZg==
X-Gm-Message-State: AOJu0YywHM2sVOc4kP+d6xW/ViOyiebF8M4YO7qC4jyhmPvM9fxl9S4w
	LEx/3VzlD+Qu1ZNQ89qi0eU=
X-Google-Smtp-Source: AGHT+IE2ErATm2xBrVPTmReU5ycJuHnLDpRJNW4Slun/A9h1smmlE3tedG4RsPPOlF2k6luf9dWXyw==
X-Received: by 2002:a5d:648b:0:b0:332:c726:ed5c with SMTP id o11-20020a5d648b000000b00332c726ed5cmr612415wri.32.1700516789457;
        Mon, 20 Nov 2023 13:46:29 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:05 +0100
Message-ID: <20231120214624.9378-3-hkallweit1@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mgag200/mgag200_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 0c48bdf3e..423eb302b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -106,7 +106,6 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 	i2c->data = BIT(info->i2c.data_bit);
 	i2c->clock = BIT(info->i2c.clock_bit);
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);


