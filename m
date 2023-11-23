Return-Path: <linux-i2c+bounces-405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E017F5B3F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68CC41C20D2E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C06821A14;
	Thu, 23 Nov 2023 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2/H56+Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D41983;
	Thu, 23 Nov 2023 01:40:49 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a013d22effcso79256566b.2;
        Thu, 23 Nov 2023 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732447; x=1701337247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjxI0Bhxo2VvjdWdUiaiba2vg3SpmPuRCWUjk40Qtf4=;
        b=j2/H56+ZwIFVlZup3UwVyk6iSD77UAlOjrxEVIe29S6lG65BJ5uAAi43kuOxK/AACp
         7CqA1XxkITHR52EGjZb4Pyip54dczO8R/epUIWEN8FlWC4V5oZxS5MkBI7ANk6AVUlKk
         HQz3wuHyqm1IDDmQ8guwD4KJC04Po3/ZooctSYjz5qbq2CqXH7kSe7fY+Ji91uD0Fyr/
         sXfKsWxWPRzDImrNvN/co4tHyKfSBJwN4ydHbe6uU5DnTFPMkriMjKD69trZj6FNzP4N
         X6+cmwCxVezZ7gFSQjVZyDQp54am9xUhgxoqkyB1qt35lHzZ4BVXIKwW4nSkwTj0P7d/
         9PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732447; x=1701337247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjxI0Bhxo2VvjdWdUiaiba2vg3SpmPuRCWUjk40Qtf4=;
        b=LeLlZqTLT/V2k4Tsqv3zOXUB9rwtBAl3294Bj0Hqre1Je8FOjGKvL8zNcTDQGu8k/l
         9KWtBHlPQcWG/W6tg1/1RTnfsm82ZavNS+0k4On3CqhMXmZTkHfn6inDAtfh+7jBrFus
         SthS+o3t+2Bb32LQGF+xwHlHcI65TGd20w8Pwn0kfhaydO0p3g/33RPq8VWowJi0xlXv
         W2qCgRDmN/w4VzUvUZlnIDGv6PtLaq7ihkK4bElCcyeciQt6QLT0O+9V17eVXTOaKkxz
         HpAGFS5pzjQL9v7hHzuLVjAFv+tVzW0AX6tSk0wyQ95/xXr6J/Re9aJpqKQ98R1Pcgm3
         ygHw==
X-Gm-Message-State: AOJu0YyvCFpnU/JAj171g2jiACopLRInl58CB8+5VzS1z1z+EPKAPGvj
	GAivX8LpMmV/ujvcaa7kJ7E=
X-Google-Smtp-Source: AGHT+IECDb65WJFfHKu5SLZ2mOzLFfopB3AUFOLDwQ98H15uIbQ5s5jWEv8KNWp+97LCJrRr5q5rCA==
X-Received: by 2002:a17:907:9087:b0:9bf:63b2:b6e2 with SMTP id ge7-20020a170907908700b009bf63b2b6e2mr3326670ejb.26.1700732447203;
        Thu, 23 Nov 2023 01:40:47 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:46 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 03/20] drm/amd/display: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:23 +0100
Message-ID: <20231123094040.592-4-hkallweit1@gmail.com>
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

Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
v2:
- adjust tag in commit subject
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6f99f6754..ae1edc6ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
 	if (!i2c)
 		return NULL;
 	i2c->base.owner = THIS_MODULE;
-	i2c->base.class = I2C_CLASS_DDC;
 	i2c->base.dev.parent = &adev->pdev->dev;
 	i2c->base.algo = &amdgpu_dm_i2c_algo;
 	snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c hw bus %d", link_index);


