Return-Path: <linux-i2c+bounces-121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B17E9B16
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00058280D72
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1681CAB9;
	Mon, 13 Nov 2023 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3nbqALU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2991CAA7
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 11:24:26 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35101731;
	Mon, 13 Nov 2023 03:24:18 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c7c7544c78so45905081fa.2;
        Mon, 13 Nov 2023 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874656; x=1700479456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=b3nbqALUkrztWmaV5GXvLcY1G4OGspi0qrwSNm2QUyVzHUc0NziK5bY5LJdUz2TQvv
         whJ6SuZuCJpSmKf6wzB3YR0od7vF/2O+myIqxUAntqt2vImddVt4mpR1z+kK5YUm3Dih
         UYUvluD31MvwdzlU/dJH079UjpKgKU256IMXhcA4cyWZuT5O5LJQErFEvh4u2s5uZspY
         DBlFitewYUbOepb1+RBScsq83Wim18D9E30ETIQrNlSZn8Q6dw5Q7vOCPTzvuCU+/TSG
         k0r9qt1ZE7u1a1zPq6gCQ3uLpQUHvvx/HX3Kacvn6LjA6Lr0D8s47AyB1nrQDK8ZiQg2
         wIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874656; x=1700479456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=uOzIByNf2S6FtODc6UBoefb1BCCr/trlHy+GGVkKoll6cMTiJaiTEb58VlgbOOslLR
         +Ai05+lpZukw8netf7m6MOl3Yrw9kNTzTt5EG37OKugOVIZ7AIw3/b91N8B9HYRtFIDo
         vs6YQgiaUGw4+fQqirZIIJV6HYtp1O53DTQemn1sN6GvtmyODSal0W+lqqJwn9AE26NK
         Sibr3YVY3j2H/coaSzuwB0g8v0aJSxmvB1xPd6mIWzx8zl9nV9xhIcSWZDWqQm8Ua+j8
         Ia4I2hs3D8ZgGWPramPOzhYeS1JmBwxlDOkG+1WBgxrGp0Ua2bxa8biEEE/zjT8IscHq
         TSYg==
X-Gm-Message-State: AOJu0YxE+IDe2mRYU0pmz8XnyHckLnATMmTwos6kXK8YSN2BZX2qD+vM
	LGyJnCutXijeQjbbr/yvIll6bkbr9hhXDQ==
X-Google-Smtp-Source: AGHT+IGwZkPMUDnYf7aWTcm7+nEKhgTcMFQj/pdloNSaCeOKlzkBATJoAqDNZ0r9EMoXYM2oSPX3zA==
X-Received: by 2002:a05:651c:1049:b0:2c5:1f70:a266 with SMTP id x9-20020a05651c104900b002c51f70a266mr4020668ljm.50.1699874656613;
        Mon, 13 Nov 2023 03:24:16 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:16 -0800 (PST)
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
Subject: [PATCH 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:41 +0100
Message-ID: <20231113112344.719-18-hkallweit1@gmail.com>
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
 drivers/gpu/drm/ast/ast_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index 0e845e7ac..e5d3f7121 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -120,7 +120,6 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 		return NULL;
 
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);


