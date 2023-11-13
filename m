Return-Path: <linux-i2c+bounces-125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4C7E9B40
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3A38B20B6B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE421CAA8;
	Mon, 13 Nov 2023 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMNHKbAJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA6B1C69B
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:37:20 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D94D6C
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 03:37:17 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-543923af573so6674836a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 03:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699875436; x=1700480236; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgL+h1xvkV19EYm8iY1TRE4bSspx8QceS9CKDbQWUdE=;
        b=FMNHKbAJi8E/6AAhLPnP+tgEBC7ECBwHF9bZrdJrU8nplg2VVknVhxBQHbmLyDHBQc
         ym3J5+fc88CMC9UbMpeP0PmJWrDCXx9R12tSz+vDy1uQkRFPXEMtmbstomGVcevre7Ts
         0hAeuIxp4c44s//2H6IUejlylEN8vWdnRjWZE3AJ6qu13SQpRSrCqu67NnvYL4o+hW3a
         WOh2oAOuAb68NMgvscQsVeJuzujlLUpCPm7UyDhuAE4/TN6V2JC8LxlF6klwQqVCDU6V
         cP7OZ3m1JUaBSQ0lkIBHhXvUU1sWFGVSO8HE5BMEuYBRXnmLtpLDXZ+l0ZlrLIh/sMvV
         xwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699875436; x=1700480236;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DgL+h1xvkV19EYm8iY1TRE4bSspx8QceS9CKDbQWUdE=;
        b=JAU5wF01LS049g2d+G9vbRaSZCqD4rw55Y1PUiNNJv3cPtSt9BpH4o1mLcY43aiDIl
         t2NxAHs9Hk6xxtJCHhzcLTyVL5/rgSeCEL7xeSyv8vqBdaAqpyauVB0cB0y2bHR4724V
         kGyWKsA1mDEfFLRNrsZQ21W5i5tR2gEffFQB3fiEpC82CPNU/GsUVDcbnY1Zo4qBnVir
         6OKRT9S/Xbbitkk+hqSdpq2wuo1Vy1V1GlIqlzSez419gs0Km+ARpgYLCVGuJdjHUkE8
         6Xts4o9VVw5uYFWb5SIIaE7VG60DyIoZsU+P4qWX1QHUWQN0aFLlszee5OSSWbUjDrMW
         Erpw==
X-Gm-Message-State: AOJu0YylIgdI4etmZbfDCCNsADIBlRn8ZDbOhc99+UTMoWxaywtjSJWC
	VMtP3k/LARB8uMKO2ssCbfw=
X-Google-Smtp-Source: AGHT+IFEqHqhLdUMGiCY9qRSeJATe2WDRNYP1706/LoUMXQwgB2L6HSCW/GqTT4mEMVGXIFV7KFjZg==
X-Received: by 2002:a17:906:a187:b0:9dd:9ba7:690d with SMTP id s7-20020a170906a18700b009dd9ba7690dmr4390106ejy.14.1699875436133;
        Mon, 13 Nov 2023 03:37:16 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e16:fe00:5105:d737:3805:1e81? (dynamic-2a01-0c22-6e16-fe00-5105-d737-3805-1e81.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:5105:d737:3805:1e81])
        by smtp.googlemail.com with ESMTPSA id t17-20020a1709064f1100b009e60b72dd17sm3863344eju.100.2023.11.13.03.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:37:15 -0800 (PST)
Message-ID: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
Date: Mon, 13 Nov 2023 12:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>
Cc: "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] drm/amd/pm: Remove I2C_CLASS_SPD support
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I2C_CLASS_SPD was used to expose the EEPROM content to user space,
via the legacy eeprom driver. Now that this driver has been removed,
we can remove I2C_CLASS_SPD support. at24 driver with explicit
instantiation should be used instead.

If in doubt this patch could be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c   | 1 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 1 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
index 1a6675d70..bc56a29e6 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
@@ -1527,7 +1527,6 @@ static int aldebaran_i2c_control_init(struct smu_context *smu)
 	smu_i2c->port = 0;
 	mutex_init(&smu_i2c->mutex);
 	control->owner = THIS_MODULE;
-	control->class = I2C_CLASS_SPD;
 	control->dev.parent = &adev->pdev->dev;
 	control->algo = &aldebaran_i2c_algo;
 	snprintf(control->name, sizeof(control->name), "AMDGPU SMU 0");
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 82c4e1f1c..c0e62bab9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2720,7 +2720,6 @@ static int smu_v13_0_0_i2c_control_init(struct smu_context *smu)
 		smu_i2c->port = i;
 		mutex_init(&smu_i2c->mutex);
 		control->owner = THIS_MODULE;
-		control->class = I2C_CLASS_SPD;
 		control->dev.parent = &adev->pdev->dev;
 		control->algo = &smu_v13_0_0_i2c_algo;
 		snprintf(control->name, sizeof(control->name), "AMDGPU SMU %d", i);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 891605d49..9de91bd77 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -1884,7 +1884,6 @@ static int smu_v13_0_6_i2c_control_init(struct smu_context *smu)
 		smu_i2c->port = i;
 		mutex_init(&smu_i2c->mutex);
 		control->owner = THIS_MODULE;
-		control->class = I2C_CLASS_SPD;
 		control->dev.parent = &adev->pdev->dev;
 		control->algo = &smu_v13_0_6_i2c_algo;
 		snprintf(control->name, sizeof(control->name), "AMDGPU SMU %d", i);
-- 
2.42.1


