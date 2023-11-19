Return-Path: <linux-i2c+bounces-260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114C7F052D
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 011FBB20A14
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66AFE54A;
	Sun, 19 Nov 2023 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDrSJaUq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB65131;
	Sun, 19 Nov 2023 02:14:57 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9e623356e59so464997466b.0;
        Sun, 19 Nov 2023 02:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388895; x=1700993695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXnYU9L0SxzpQBJjG8833LUnrTfJuWwdCW2h6rtJH0c=;
        b=MDrSJaUqBHJfSqYEfCvfprPdo+1bWBS7CYU033N+T8Hu5ZFwF900yZKZlj5ZHCzQ6E
         EAH9PpzN2uvuDh3yUAzs6LUvS7XLOSJ6O6lQYIpIPVyzYrixevuLCB2OkZrYW8ZDL0/H
         h8jGA9Bb4KVptmb8WheFJ1JPG7wpvNOHXNZwojqyS26d8YAQH24n9WB8cEtc2gLBajwD
         iLBPcJQQYYELHyZmqZCAISM6bGfTyG6aUjJETiEJrRQs2d+eFz2dA4FJveQXjaUADYj0
         hQiTBdrMqlAse5Gk39YCRZVVzuRD/MCKPLFiwh+akbJc5KixlvuDtS0cYykTkcB6iDYN
         SESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388895; x=1700993695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXnYU9L0SxzpQBJjG8833LUnrTfJuWwdCW2h6rtJH0c=;
        b=TjKYalED+zyPhFqAYHfksv1nYtFZaFibYbPUfPrdL5w+Wt3SOuSkuYK25gREfspQvg
         S13Pc/VYruurVsjUuS0CsWPVfkB16fzpSNrENRwgjdWJvdurcKChzabKmguUe9AtqcKz
         v7LxC/x3JmgFY25TqThA+vf1vMQlA2P5PI6PXZWjwuEgMyo/pkfS7K6XfaHetOQ7qp86
         1vFEXUe5mmyDPRd8fIt81AmTQCB58xtH8kpsIWCBw1Rzdn1xKtgvglBedEwnI16sDMpa
         02A5xe/Ic0Ejq50ftFMk+bRPksNxray7tUA79JNcc9X+bXYR9VO4lonQLVOeB6X28q69
         ujXQ==
X-Gm-Message-State: AOJu0YxxTGPTeT7fMaRru+LMzsJTAkVbH5s2ZmKTGtEdPyaMQaX91fqb
	7bDSo1vDLcbGEQauhNn298s=
X-Google-Smtp-Source: AGHT+IGcxHwORYlBS6UfqYLTAlk7jFkDNf4Zgyz4V+4rMe/1cLzpIIDW4QHLGADivIY95M311Q5DQg==
X-Received: by 2002:a17:906:10d2:b0:9fd:f325:1317 with SMTP id v18-20020a17090610d200b009fdf3251317mr304396ejv.24.1700388895427;
        Sun, 19 Nov 2023 02:14:55 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:55 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/20] drivers/gpu/drm: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:32 +0100
Message-ID: <20231119101445.4737-8-hkallweit1@gmail.com>
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c |    1 -
 drivers/gpu/drm/radeon/radeon_i2c.c     |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 82608df43..d79cb13e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -175,7 +175,6 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index 314d066e6..3d174390a 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -918,7 +918,6 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
 
 	i2c->rec = *rec;
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);


