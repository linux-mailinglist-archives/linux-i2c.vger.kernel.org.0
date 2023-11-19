Return-Path: <linux-i2c+bounces-262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 556F07F0530
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1E31F210F8
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A08DF500;
	Sun, 19 Nov 2023 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbRoarWf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0420C12D;
	Sun, 19 Nov 2023 02:14:58 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9c2a0725825so473208666b.2;
        Sun, 19 Nov 2023 02:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388896; x=1700993696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=FbRoarWf0cVzL8adg93LLBj4XLV4DNzvQrfDAuaNJAMbAlLkOLk7ZsBoITmqiK2YBY
         PMYfidAGh2P2AjwVytKHMrnx0Od/4i/Vnd8l1H3pqgXRFRLNxA2F7aV5Jr8QSHJrawQ0
         4ZyGsWCs/uQfUdTDqJxX2r0ZFXUj+5I1K1WhjkUlFezq3YNzX1A9dpBtUMS3X1ZXI6iT
         pQvetbuQ0++qXqtdSTKEJWegXo5E0iI4bb+8twPuJL+dUFX60poQiXZInVtC8jyXY9+5
         0pOcU9eDNMThC5+A1ONu0uFJiG62TfI3fDYcQgGKX2RyOcVjSN0itcU2Us1LhWMiC67b
         Eqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388896; x=1700993696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=CuC3xJKYPshCuFJ5XSSUgf79cxilrUrq/yIJ5x8xdgmaIcRJ5H5N5UswO0aGt0Wxb3
         IFnsSpZQes7LODaNYnQ1kSmiofVGRzJoz0ib1FexH/rF+pDubTglEKSPOF7pvB4haLXZ
         ZVgUqe3CK/d+x9JqC38WUd0fsjWwDAbZaqZ1GLvMcA1TXh3+CMhnrPeAusycpflzeZ3X
         1Jf9Eg681wiz/ekFUe8zFkXmI0idQBRcL6rnIdvPK6fOCT6EhURuad0deabPlUto/S6B
         nXM4IDzcyaieMDw+6qToLzxMpM/c9FUN2zFUXedxs9YREnRoBApnRDqboESUcI8Blg3c
         TWJA==
X-Gm-Message-State: AOJu0YyfNSMpXCGT+f5XkLwCZZ8C8GB0qKe54sHJ9p7GBsClZf/isUOm
	5pICJpzgI9AsZJ0fCmt3vhA=
X-Google-Smtp-Source: AGHT+IGNzCPy8DY6OUpPEzcikwvV3TQNAAHEQOERuY2DqLuCmbBKa7aBRaSFRQKH6eGa/KeJALv/Hg==
X-Received: by 2002:a17:906:8f:b0:9c7:5db4:c943 with SMTP id 15-20020a170906008f00b009c75db4c943mr3606445ejc.40.1700388896314;
        Sun, 19 Nov 2023 02:14:56 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:55 -0800 (PST)
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
Subject: [PATCH v3 08/20] drivers/gpu/drm/loongson/lsdc_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:33 +0100
Message-ID: <20231119101445.4737-9-hkallweit1@gmail.com>
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
 


