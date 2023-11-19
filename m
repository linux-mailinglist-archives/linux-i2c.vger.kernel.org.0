Return-Path: <linux-i2c+bounces-292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6DE7F05D2
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A381F22554
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533D5101E8;
	Sun, 19 Nov 2023 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvyUB/T4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88B810F7;
	Sun, 19 Nov 2023 03:28:48 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so4933697a12.0;
        Sun, 19 Nov 2023 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393324; x=1700998124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=QvyUB/T4bkulU4stWcp9gggfkRjiqR+kiq0guBAXbDZJ9PTljx1jzadKjNf1zx5KfY
         CCEk6dGcQgvP6+cGj+FkPv1hWC/oKGqfZIO9tY8VstBYwrR9qd0EVR2JBu0Ory9Q8Fv5
         O68EGmHfuCaZvyRescHiYEVbkJneBWLmCa3+PVCkIex1DphjGMqaA5hq426WwPM3jsqW
         0wVrgsT2yw33QYlYb6MWPhg1UzTFdplI8I8vM0BI5rAE4KFYO12SvmfB+2hhB9ho15HN
         pkQj/uBFWmLXX5kK6XbLXVls0WLiNHdpdLIXFoAjTqnHHUURTS8KYvJG/2SFh4H27mIO
         wJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393324; x=1700998124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=TiluqC6lYjjcbmATYkmEAIMYmRY31lIQFGdGtex7K/Qj0Jicg3QBBGg8Zvjm8CeZpA
         WJPveWtrANLp1kX+0eBlkTgbrbj4DUgklPFqmqpcCI8/Ws31bFyAOWhB2XGh0RqJY/7c
         HFPDnpprT1LXURAgxX2XGpGmhwGZesOtVGh05AaYqWwXgIM7IHlIe6LJbM7XeFobbnrE
         fL4IVuZOYW8JTxMOb/9NptGfPO7dJHim9yz9uOzJRRUFTBMqE+slnQ2oUZj2bOGqLqIA
         CwQV5MUkdj/PYBS/lDOUjfSEWuNPpsRKjS+wkmJFSHrcitPg+6JsQMqFpByBhZYb6Q4Y
         el2g==
X-Gm-Message-State: AOJu0YzFUmMHDie6juxkkvuvJW19x1sHLrzdw1RYrnUNbQ7mwM3SuDw7
	RhOTNg077VHzT67GvXwrEc0=
X-Google-Smtp-Source: AGHT+IFb7FJqtaozsUjTf6lsnbfpB7UGN4+3ECKCKWY6V95FP/oQIeTwzIueiarO6eHMyVbgM8bRWg==
X-Received: by 2002:a17:906:446:b0:9e7:3af8:1fd2 with SMTP id e6-20020a170906044600b009e73af81fd2mr3244286eja.58.1700393324637;
        Sun, 19 Nov 2023 03:28:44 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:44 -0800 (PST)
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
Date: Sun, 19 Nov 2023 12:28:22 +0100
Message-ID: <20231119112826.5115-18-hkallweit1@gmail.com>
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


