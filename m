Return-Path: <linux-i2c+bounces-282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B57F05B4
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421C61C204F6
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3B5101EA;
	Sun, 19 Nov 2023 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIHEUfjx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67069129;
	Sun, 19 Nov 2023 03:28:37 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so4670468a12.3;
        Sun, 19 Nov 2023 03:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393316; x=1700998116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXnYU9L0SxzpQBJjG8833LUnrTfJuWwdCW2h6rtJH0c=;
        b=ZIHEUfjxh8WbOt7CBeHQ9B8KAefwXqAuaSdr8gS8TOQcG6C0eE/ly7RzKNwleiHg95
         a4VMqzMip/ycqa+28Y35rBR0RpLZwPkq6486YXBOXvA3Ck5OcvPqJYbjouy/LG3AFhKP
         wrGhEwLmkf3EuIiZMJKBSlglg57AU1IT9zGgfan1JPRQqkptM48jr7wwDXeQN1GuyNhf
         QGf+dFYnlPwZTXAsuiQ6nv0GbAmliQezCXPaBHS3O3YQSgvzNbP3Vhe1KIBCyYqntY+V
         2sYxkXmXRvui8Mq9LAjhvyru1bBq5WnOs1d/Y9gEqeEBbV4Nl3qL5xfXZX2dZw4KHN4L
         eDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393316; x=1700998116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXnYU9L0SxzpQBJjG8833LUnrTfJuWwdCW2h6rtJH0c=;
        b=Xm+UfIMEys6QjPYC9drBAt2mLOekLa2hZxGuk35Fqq/oaHPlmxVw+TltgdyV5YaPBv
         YoOq85TzTa/2Ld4kei5fR+qnr3M8fqGY9WdwGe5EV99f6by9hLYGATZCTiEutElf2iVc
         FIC291cX6XFAykk8gtI2DVj4cQBBP/ASSxcsd8OYkCiO4DMaBQqnsRgtmVMXU5ePY2UZ
         5ZaZfafmVy2adpvKdMcQUaq1QJo5CTaChmFymtRE08ndFa9tHdPGQ/NoGfTbtN5bLjR9
         8lGNDbGj2wRPiEPypCFBX1QQBiB1WFOijNyMlHJ3MdfRP2J0rO/aJ6ldLnVJ/lx7S1+w
         izOQ==
X-Gm-Message-State: AOJu0YyyyZ6FXS9no9CQ7duYPCLDVN2/oHVwXMRnBkTbn8DAM09Ev8In
	QLwldXT/v9W+giOGWYLJBoQ=
X-Google-Smtp-Source: AGHT+IHI2Q6G5KgXpMdvYcK+AMXMsl9sksekFidT3A1JwDhyvE5DtqVUCJVruR3PsUB6x6IR6xT6Zg==
X-Received: by 2002:a17:906:74cb:b0:9fa:783b:c197 with SMTP id z11-20020a17090674cb00b009fa783bc197mr2843048ejl.13.1700393315790;
        Sun, 19 Nov 2023 03:28:35 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:35 -0800 (PST)
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
Date: Sun, 19 Nov 2023 12:28:12 +0100
Message-ID: <20231119112826.5115-8-hkallweit1@gmail.com>
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


