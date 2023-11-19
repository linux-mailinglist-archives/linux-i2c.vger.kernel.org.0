Return-Path: <linux-i2c+bounces-271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0F7F0547
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38CAC1F220FA
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C5E101C9;
	Sun, 19 Nov 2023 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtiLBniA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28233D7B;
	Sun, 19 Nov 2023 02:15:06 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-543923af573so4899310a12.0;
        Sun, 19 Nov 2023 02:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388905; x=1700993705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=UtiLBniA1KBV1V8NsMEYejdzvFTKV+IgSP0gm7DEsLgQfFsP394vtoR6sXq4P+xLmw
         PEded6HAlgP+Hce6fOY0MeQl2wD41l+kBcYnNIVi9H+iIfIJO2Fz8wZEls2fsC/JXOYx
         t2rFAnqIvIaYNGENnb8gaj3h0dzyEy+WwSgFaScnLk9Mi/8DMrCHLlIlW0VfZXMIQ4G2
         UtcoAgbxG3vIJaG8R4GkEKk2kSJlhM7+S9M3HJcu2jMbUVGNN2Eh3uZDrBZthFFc+H7k
         iwltIQaKQEwCd00vUs258RiTmJvsC9suD5eW/Ya+5mc+Vvw9HIU6BmPrR8NgJtBL1OwN
         06fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388905; x=1700993705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=WSCF2m/6v2Ybip4r6dcMMcsHOAQJEEJ6101voXVaJxqLhnW99XdnMvntKgIl9WqLtW
         v4TTPVwERFEzFsogQJNHh/pxH7lHmE6/cq8LZ5bogcoggxVpqJFKh9Chk3TQvW91sSrK
         bkv5QcbSZ6dbSMiLQwTWaINuWHIiLW0whh+YlqvFS2az/VsUZafHS+FeKS1e0tagNNMh
         Nasbj63Eh/09lr/0vaukmjKNv4SLO2NRIEy8//9vNJhS2FlRAgCiqzuaEQqiHGxs1c50
         0Q6U/vDEoBaeVqyPaALcnvqgl6nPNgbGIF6WVvPd5iJyQdf9dH/iFWFef+J8niyAlJ6d
         XHKQ==
X-Gm-Message-State: AOJu0YznRW512GekJM6CYbuMLTszeOVvAbycg4Xh8UCt/A2Uxl//hfmW
	oddBziVTllmUoUXBmF32+I8=
X-Google-Smtp-Source: AGHT+IFVvZzXcZMoSvdXbtJGqi8lBJ7fXTKr3foFJmhtdb3r+iUKMa2DPobEi14a5i6AA9++GYiikg==
X-Received: by 2002:a17:907:cbc6:b0:9e5:2c72:9409 with SMTP id vk6-20020a170907cbc600b009e52c729409mr4079477ejc.43.1700388905079;
        Sun, 19 Nov 2023 02:15:05 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:15:04 -0800 (PST)
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
Subject: [PATCH v3 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:42 +0100
Message-ID: <20231119101445.4737-18-hkallweit1@gmail.com>
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


