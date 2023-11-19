Return-Path: <linux-i2c+bounces-283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9417F05B7
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CCFD1C2092E
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D62101F7;
	Sun, 19 Nov 2023 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF8FpONY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C13192;
	Sun, 19 Nov 2023 03:28:38 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso469973166b.0;
        Sun, 19 Nov 2023 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393316; x=1700998116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=OF8FpONYZHEOx/jjiWm8SSrPA0CTusZ33hBQP9zwf8yE6mhLeskUmrs5oytVw2K4ZJ
         mBhNGeAex+xxZyY6gNPY/R6R3rxFNL1f7k1jE+HPWZgfHMga+kqF5WlvCHbgU2yEvnOI
         iUXnOL7f1W62O1yV2/SGbAEzEGrwdmIwhj8E/GdLOKXko87mNRmVqKndO7JS9qK+hREI
         8H+ncP3n+SW1cv1+ZbDxExco1VlxlgR4NhXJ4UKdSt9LqaY+kWePskruEpuuUmp6vWoQ
         Os4QdfhBYfWIkiVEKbhV9havlA8PIcTVPSs7lbTpGs2JS0BB7jXKBz7lpc666fUYcJ+H
         IxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393316; x=1700998116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suS4LCfsusePiDPKTqW40E2H77s8OXx5HVyNs+o+yDE=;
        b=FcbBbupsFkhAw0KfyEpLY1FSmUbIfw+kItBvchSeNYVT7oG7KNMUpp22TfCZ1pWATu
         SywHTgwBG4ugLWaWgZtxyG+1YGcyYhKGmgUDyD87yk0XJJa30q3rWHbC/yTOXx0RJbaA
         wByFGALJUSMw7LeAOjCSN5shyNEm1dzefa7rPvdw/u8pWyL3bTKMFRSR+yMf7whphygv
         kdYGbIVZwo5G5d/s1z+u009R3Rg6zm1JrqaA8XLTICx3HfQs11T5m8Jf5MpcNcskDT6X
         25FIGRiUXJ6c2XCVPGprKA0uSz1mO+6MOsUVqLKXW8fXxzIRyZHDVeigmPD2deRbv+kI
         waHg==
X-Gm-Message-State: AOJu0YzZStPQbLdbNDRI40E7sMW9PYc8MdK4M4GAA4ymGSU/GwQI/DJW
	eAY5fN/cCzy8d0/booYVOGhHyR6sEc5NAA==
X-Google-Smtp-Source: AGHT+IFAzJyXCJEw3gxpP4VAZc4O/kxe4jDCoc7MCgJsBx9nZyrHJVYwUkbM5vIdYXckmNcBLAEJ4A==
X-Received: by 2002:a17:906:51c5:b0:9e7:2d0b:8c41 with SMTP id v5-20020a17090651c500b009e72d0b8c41mr3246047ejk.0.1700393316640;
        Sun, 19 Nov 2023 03:28:36 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:36 -0800 (PST)
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
Date: Sun, 19 Nov 2023 12:28:13 +0100
Message-ID: <20231119112826.5115-9-hkallweit1@gmail.com>
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
 


