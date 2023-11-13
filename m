Return-Path: <linux-i2c+bounces-109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A40B7E9AEE
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2B0280DA0
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00BA1CF99;
	Mon, 13 Nov 2023 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnzppg/O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9F1CF88;
	Mon, 13 Nov 2023 11:24:08 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C33DD58;
	Mon, 13 Nov 2023 03:24:07 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083f613275so35514495e9.2;
        Mon, 13 Nov 2023 03:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874645; x=1700479445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ibVEHgtEJ5eQu45MMiPygdDJxNCKoN0M/oBQUtm4Q4=;
        b=Qnzppg/OYbqEGRW/GtPZVhaKQpQMx2An4Yxyf2Park1jV/oLJ9rWppWbs4mM5t32HD
         jZtHNXY19W1zM+keGI3gZ2pubjI54AhzLVMipuKYTXaQITMU2en4DvWE0p40wyNIzcyv
         vCfutGG1wsUXa0OZNTSzZL4Jk3CFqUVR1AGNWpcr9HET7JZvft48zTH6R+xiGgRR967l
         iHUSwYpUT2lC7Y8WNrvrp0ZEzEFxgQ8QrZm1Y9eaYqfglBx/rJbBYg1wNIrFWnFZcouB
         zzgtv1GKMphBYS42zruIsZDZSUce/cq3xRCjZ+H41b4eqXJgSZKqLAho9Wzxw66B/fcd
         1TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874645; x=1700479445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ibVEHgtEJ5eQu45MMiPygdDJxNCKoN0M/oBQUtm4Q4=;
        b=INoEthd1dJt7lceGLfVMfQV7rZ0vvtfwzuLd9cdeAXBe4jw+TaN2arpUNNDSic9tJw
         3mArkd8Kk5EFYBUxGEl02t++Zf4aBVd7lJgKNN89iqCQvGptSFQBlt16NQZHhHI3Wb26
         4VbEMSV7nJH9mSbGd4BM8jtEAL9rGEF/4L/VLk8rs81KWAvRhtzH4SSs6PCAUBvDCtGS
         ECZC5OeEVnQ8d0RkU68HltpsNQAoGWw2oPS/ei7LxKtL0QKwIau8qrMXZ6TcuPR+48EP
         Y7OpOGExZWxImmHz26Czj6ng3bNuO4d+UzhFRlKXjV7bbY622kKCdWVoASYZcaE3A6+I
         pkVw==
X-Gm-Message-State: AOJu0YzhSdXsm4BHXSwZ9u9Ad4yZrqYTgFnlFMzptyDDIGsu8KSYxFqo
	LlF0a4rtiWCmXqC8llKIwbEhX9NDC4w=
X-Google-Smtp-Source: AGHT+IFwoPnKRqNYZ50VTFF9dpExU5UAtXF1Gn/qxxZ3ZoO0LlwSRlRkjGu84hHJe+NLBkdc3zHFzA==
X-Received: by 2002:a05:600c:3595:b0:406:849f:f3cd with SMTP id p21-20020a05600c359500b00406849ff3cdmr5399554wmq.29.1699874645374;
        Mon, 13 Nov 2023 03:24:05 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:05 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:29 +0100
Message-ID: <20231113112344.719-6-hkallweit1@gmail.com>
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
 drivers/video/fbdev/i740fb.c              |    1 -
 drivers/video/fbdev/matrox/i2c-matroxfb.c |   12 ++++--------
 drivers/video/fbdev/s3fb.c                |    1 -
 drivers/video/fbdev/tdfxfb.c              |    1 -
 drivers/video/fbdev/tridentfb.c           |    1 -
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 1897e65ab..9b74dae71 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -163,7 +163,6 @@ static int i740fb_setup_ddc_bus(struct fb_info *info)
 	strscpy(par->ddc_adapter.name, info->fix.id,
 		sizeof(par->ddc_adapter.name));
 	par->ddc_adapter.owner		= THIS_MODULE;
-	par->ddc_adapter.class		= I2C_CLASS_DDC;
 	par->ddc_adapter.algo_data	= &par->ddc_algo;
 	par->ddc_adapter.dev.parent	= info->device;
 	par->ddc_algo.setsda		= i740fb_ddc_setsda;
diff --git a/drivers/video/fbdev/matrox/i2c-matroxfb.c b/drivers/video/fbdev/matrox/i2c-matroxfb.c
index e2e4705e3..fa07e1e5c 100644
--- a/drivers/video/fbdev/matrox/i2c-matroxfb.c
+++ b/drivers/video/fbdev/matrox/i2c-matroxfb.c
@@ -100,8 +100,7 @@ static const struct i2c_algo_bit_data matrox_i2c_algo_template =
 };
 
 static int i2c_bus_reg(struct i2c_bit_adapter* b, struct matrox_fb_info* minfo, 
-		unsigned int data, unsigned int clock, const char *name,
-		int class)
+		unsigned int data, unsigned int clock, const char *name)
 {
 	int err;
 
@@ -112,7 +111,6 @@ static int i2c_bus_reg(struct i2c_bit_adapter* b, struct matrox_fb_info* minfo,
 	snprintf(b->adapter.name, sizeof(b->adapter.name), name,
 		minfo->fbcon.node);
 	i2c_set_adapdata(&b->adapter, b);
-	b->adapter.class = class;
 	b->adapter.algo_data = &b->bac;
 	b->adapter.dev.parent = &minfo->pcidev->dev;
 	b->bac = matrox_i2c_algo_template;
@@ -160,20 +158,18 @@ static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
 		case MGA_2164:
 			err = i2c_bus_reg(&m2info->ddc1, minfo,
 					  DDC1B_DATA, DDC1B_CLK,
-					  "DDC:fb%u #0", I2C_CLASS_DDC);
+					  "DDC:fb%u #0");
 			break;
 		default:
 			err = i2c_bus_reg(&m2info->ddc1, minfo,
 					  DDC1_DATA, DDC1_CLK,
-					  "DDC:fb%u #0", I2C_CLASS_DDC);
+					  "DDC:fb%u #0");
 			break;
 	}
 	if (err)
 		goto fail_ddc1;
 	if (minfo->devflags.dualhead) {
-		err = i2c_bus_reg(&m2info->ddc2, minfo,
-				  DDC2_DATA, DDC2_CLK,
-				  "DDC:fb%u #1", I2C_CLASS_DDC);
+		err = i2c_bus_reg(&m2info->ddc2, minfo, DDC2_DATA, DDC2_CLK, "DDC:fb%u #1");
 		if (err == -ENODEV) {
 			printk(KERN_INFO "i2c-matroxfb: VGA->TV plug detected, DDC unavailable.\n");
 		} else if (err)
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 589b349cb..07722a5ea 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -252,7 +252,6 @@ static int s3fb_setup_ddc_bus(struct fb_info *info)
 	strscpy(par->ddc_adapter.name, info->fix.id,
 		sizeof(par->ddc_adapter.name));
 	par->ddc_adapter.owner		= THIS_MODULE;
-	par->ddc_adapter.class		= I2C_CLASS_DDC;
 	par->ddc_adapter.algo_data	= &par->ddc_algo;
 	par->ddc_adapter.dev.parent	= info->device;
 	par->ddc_algo.setsda		= s3fb_ddc_setsda;
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 22aa95313..51ebe7835 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1267,7 +1267,6 @@ static int tdfxfb_setup_ddc_bus(struct tdfxfb_i2c_chan *chan, const char *name,
 
 	strscpy(chan->adapter.name, name, sizeof(chan->adapter.name));
 	chan->adapter.owner		= THIS_MODULE;
-	chan->adapter.class		= I2C_CLASS_DDC;
 	chan->adapter.algo_data		= &chan->algo;
 	chan->adapter.dev.parent	= dev;
 	chan->algo.setsda		= tdfxfb_ddc_setsda;
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 816d40b6f..516cf2a18 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -274,7 +274,6 @@ static int tridentfb_setup_ddc_bus(struct fb_info *info)
 	strscpy(par->ddc_adapter.name, info->fix.id,
 		sizeof(par->ddc_adapter.name));
 	par->ddc_adapter.owner		= THIS_MODULE;
-	par->ddc_adapter.class		= I2C_CLASS_DDC;
 	par->ddc_adapter.algo_data	= &par->ddc_algo;
 	par->ddc_adapter.dev.parent	= info->device;
 	if (is_oldclock(par->chip_id)) { /* not sure if this check is OK */


