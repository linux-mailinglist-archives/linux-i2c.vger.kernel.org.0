Return-Path: <linux-i2c+bounces-105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD07E9AE5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92DB5280CB5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A682E1CAB8;
	Mon, 13 Nov 2023 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxi9OuCu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027931CA96
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:04 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466A8D64;
	Mon, 13 Nov 2023 03:24:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a55302e0so5970097e87.0;
        Mon, 13 Nov 2023 03:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874641; x=1700479441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opo2n1kgRGyqTe3TRkg8x+CZ1bdNAAuwb0HOdaOfFW0=;
        b=Xxi9OuCu23iF795mx0AV4jY0S96aTUsfbJ3J3kijhzo/FiXLKKK2yOZH8qXcc0lLEk
         PFmh4twfYm9GswWFwI5TrhZ5HDF3w0IG9H2FzJD7s9PngiCyAZSn8a+9zRAFQ3+LZIOm
         mHr0lefBWnhnnyqqihTIDavzogT+gN8D0wR7DCnaweE/kZIAuiaZwwH4Xk8ai3WmE8Md
         QixW1+Rc06dlpOpas1yaAlt/yBwTU/T23PA3meYF9jl3i5FFosQZ54kiokdJz5qcSWyF
         z91Pm1c7A+6MgIGylaupK14sixvzgEZmV34jNFor1SPZxqjyQuozmxTXibM6+1Bwzzer
         dV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874641; x=1700479441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opo2n1kgRGyqTe3TRkg8x+CZ1bdNAAuwb0HOdaOfFW0=;
        b=JZbNzBFH66M7eOgsdwnnkU7Ta3bTp6Hk+XEWZXBsiXTdrPcekxEUxB9aFlktZYqkoQ
         6KYplNh6CeexOVPlshhywJL7Pv/ulKsPvJYrxMq2sFOr8+0kUXKe1bIB2yFAyHEEXiPt
         DfwnvjAt/IEezzTLoEtWEdmdjhbngvVYbjU/7lbePJiM4dXPApkdsvQ6HrLmtkpyXCKa
         tniCOGe5wMKqSgyLImm6cEYoQWpA9Sj8VmiBEOITaRY3MY+V1lGaAFUchCimtwcHOB4V
         KErgZCBnec+fKNP0jpJTiAY3J9yTxNYDMyxuR0YAravzMT5ANqbKgtKnu31ZlPnRu13L
         E7MA==
X-Gm-Message-State: AOJu0YyO5w5g55Zv0ZIz8yJrond6LaNBSA0cmSBPltBfEqibWJ1wfMaY
	R/nsupPQa5Ax03KDWs3oayw=
X-Google-Smtp-Source: AGHT+IEC4bNxMxVLe61hoEBoRm/P4z68EeACSaOaY2P2h8vmjgRJS7MeWj+M0EXY9PL6tHaJ0DbGAg==
X-Received: by 2002:a05:6512:3e0f:b0:507:9628:afb with SMTP id i15-20020a0565123e0f00b0050796280afbmr5515817lfv.68.1699874641249;
        Mon, 13 Nov 2023 03:24:01 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:00 -0800 (PST)
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
Subject: [PATCH 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:25 +0100
Message-ID: <20231113112344.719-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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


