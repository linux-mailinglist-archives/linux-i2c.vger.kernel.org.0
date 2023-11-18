Return-Path: <linux-i2c+bounces-234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6F7F018A
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F441C20982
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077961B29B;
	Sat, 18 Nov 2023 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/yAZAMX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1781702;
	Sat, 18 Nov 2023 09:42:47 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso4619605e9.2;
        Sat, 18 Nov 2023 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329363; x=1700934163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=M/yAZAMXSLO6BWy6Iqq3wPJp5KeBz9v3vLFTXb/zPNHdxeTroHs5V/+CPt7HzBVICC
         tJwP7h0zmcGQHSuM4jSkg10VGqlGRJQVgEovIYtcwT/fiz4HOJsJ8OqWw2MeamaPTK/v
         fsnDyjHh5ZS1snvhLwGMuLL5Ph5OTEy76uHURYFthiNsIdrPyA1Pz/MGb2cuw+c78gAa
         NOF9CFkvvdStRE1Yrg753L5v/hJuVFR3PzUXmQvwjMT4CZfHlJ4nteWHYEuQd9UXZHof
         tsviM8qxDVsTTgVnwR1dvn1lj6u82n/sxMVkqdGSFcjUwj3izJgsj4qlpYg4G0q+fF04
         VDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329363; x=1700934163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
        b=G1qdEAlcG/NQaktSvXwdKEKyNWLeoFrFkyhTP3RrFxPpfJ8EMH0JsPggABW7fcSllQ
         zJtonnv3w1EXVP6PkiYo/UeXnBULfknHt8DTU0V26fGvibRAMjduacGFdHeKXEpyR92a
         ORtG/R5ISFJY67wWP9eFJvDlD1GzwSchMu+1YwLZUwOdQ9h1bHeWfBs7d5N1s04cERWd
         bQm4F+c0LfO3uvfoEPwBjSrOmZOu38IyPLRHmYMHLxH0tzPre8eYQ+9hYXywv3urOfsd
         a73U0aBHBUzEzqu+pmHga5yGMRdRYplTaJq3y+bnEOJX7THfB7E3glnwZMyYHHVHImED
         aVew==
X-Gm-Message-State: AOJu0Yxll8uUEv8vwGXb4raxByTd1BAtaRFX0AizBH73Ganyz7MvVOFw
	D7d2bWrMF76Q6GWdKR4PybA=
X-Google-Smtp-Source: AGHT+IG/rpSoscDMsjiZahKHW5DKav0OGOlQ6bqp04xYQwKcY1sQ1AOt05hiLcK74Hz4Jvo+yXtCJg==
X-Received: by 2002:a05:600c:3542:b0:408:3f64:6553 with SMTP id i2-20020a05600c354200b004083f646553mr2565974wmq.16.1700329362877;
        Sat, 18 Nov 2023 09:42:42 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:42 -0800 (PST)
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
Subject: [PATCH v2 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:17 +0100
Message-ID: <20231118174221.851-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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


