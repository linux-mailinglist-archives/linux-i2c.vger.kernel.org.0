Return-Path: <linux-i2c+bounces-112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8E7E9AF7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900C9280D3E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3564A1CFAD;
	Mon, 13 Nov 2023 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKCjsQ2o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02A1CA96
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:11 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5649BD64;
	Mon, 13 Nov 2023 03:24:10 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so60567081fa.3;
        Mon, 13 Nov 2023 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874648; x=1700479448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=AKCjsQ2oyI70y1Di4HELVlyc6admFlE7MSgNUuc4whagEphc7soDrTPig9D5QP7yqB
         f0+ClqVr0/Je0QZXdaE7TeJNzwOWwyA39E+saoOqQk0OF3Ns47vlrlfuNZhiBK2R/1LC
         BOgDMvD38xanE9jGPlLi3mYI1P+9v65KBX8bdtUdRReP1HBrrGDIfrHYuS4gtyHnHgnQ
         PLNfHXMMxFJKHI53nPF+rJjvsefv/ZbS6CRxslltenVtj4/GNelnbucUWWGuhDcA1gsF
         4VIgJAYHJXV4yfAgb09/wwTdBLnzRqMIgkKaRD+UgGvvBKOVhOhFoRux+6ahr5Bdp2ze
         p+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874648; x=1700479448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=NDdBb02YKbPztyfkcd7tayRXu9OdhCm3l6cm0/bDgCQ7dETiZJlBbqyNa7Ngj8KJ2S
         OXc5n04rMb5T7U5Wm5wjUbrRH/YiuGiSEPO0Awa00XKdzoJJactdFUIKTzbKKJ3sZBVD
         oKuD5q9tRsgqr418GAyHAyOY4gBFdMX7n72dyDi2sqePNzHpxZfeWmnOerD9yXAEXwuq
         JzmhmIhBQ7m6BiKGBEWKKLeg+i6doU0XbIMDe0/SgX6/xD6xatr38xgRaMCzFn1kbjZo
         lE5gE8wFpv3yqThSUGn2dwi4qLLFFaXctBeLrabn5/AjxxDGhdZWWxgUJAfFfJutJAhH
         rAHg==
X-Gm-Message-State: AOJu0YxB/AHwXL1hfpc9OUsXzXfD5auh1t4abKu045YPN0A7JpGO1K0O
	ZwUXz1mKIGY3L26KC9rldDc=
X-Google-Smtp-Source: AGHT+IF2LC+FtafvR61kuDtbo2rv3av6bi24h2BSF0FTWH3WvMa6H2hTWbFG6Bmtzn7VrYm9qOaXwA==
X-Received: by 2002:a2e:f0a:0:b0:2c6:f17d:ae84 with SMTP id 10-20020a2e0f0a000000b002c6f17dae84mr4752809ljp.3.1699874648370;
        Mon, 13 Nov 2023 03:24:08 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:08 -0800 (PST)
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
Subject: [PATCH 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:32 +0100
Message-ID: <20231113112344.719-9-hkallweit1@gmail.com>
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
 


