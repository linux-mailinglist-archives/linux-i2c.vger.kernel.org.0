Return-Path: <linux-i2c+bounces-259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FB7F0522
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949731C204F6
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC030DF62;
	Sun, 19 Nov 2023 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daAI2dT0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9AF115;
	Sun, 19 Nov 2023 02:14:55 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9f27af23443so477268366b.0;
        Sun, 19 Nov 2023 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388894; x=1700993694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DB25C7bMVd6OfgWCKQSEO94Aa30Zg5F+mwrgxtdXDA=;
        b=daAI2dT0R2juqVd4F/qCjEv3E+28uPTQsE4lEc4JoXzusx9x7iG2gjYJ6gyrQMnEs1
         mspmc35PS5o7Xy//4hjYI5Wzwwq/BpP7FgDoW8HEH6ALLyXVglpAhA7X0qFg350Wh3+K
         2nK5v0hUOv3EugaK4q3MP33z5pmzTvUirrsodp2Rk/FyeR6/UMSmBsgwI50ewZ8ShOiz
         AN/ELoCrrJDiuEWHeLnS1D3DY4geNSjpEm5VZG2caIjKLWFOk9O1U7YO2cccBRWfw8jK
         yBoAMkrQLxUWuItXO+kgdKyZ+w+edWv00PdM33Tv293QyDfUmx/eVO/BKoS97ccROlVL
         6t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388894; x=1700993694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DB25C7bMVd6OfgWCKQSEO94Aa30Zg5F+mwrgxtdXDA=;
        b=Dyw9b2vTnAwx13z/4j7Nzo+RKZTtDDD0RlUgsNaFxSvBOI9VGlhBrUCxNuAyT+Hdns
         FeQYJRbBxIBEp0OIzT2nPGk0s1SE8TXqur/cgXzOscng/r9ENgZK2dKbtqJF2sdH0yhE
         AEhkJ215Bmfpa4AbpaEmpTHV2ycXdQ0Yb/Nbjjn9m/L6G0da4p2XBdGSypqsutPVhUz2
         vqstxQJB6/Rh4KvYZwMVupH0a/Ao3eYBLYIwrzsw6FR4kTaw4xO1vlwV1dciLn4KTLZb
         ikBc1bF58T7uebF6kC1m6uhS8UAPpcllUloOkQgbfUDa9MHHBZGeCDWzUP7s6dpdXPMm
         Cf2w==
X-Gm-Message-State: AOJu0YzZ6WC7cq/2htS2/ysROde8GUXTrdVUggsZbzi+l9NVlctytwoG
	Nv1K3Z9F4BkhXhyML1lVDdpiSdVDFZN30g==
X-Google-Smtp-Source: AGHT+IFSg9U5qIMb4AcJbjF+T77S5CydHJz/amx7poWoeUOMU+9+UHjyyGXBcelTE4xsBAI3I9B5Tg==
X-Received: by 2002:a17:906:2253:b0:9b9:4509:d575 with SMTP id 19-20020a170906225300b009b94509d575mr3597295ejr.2.1700388893905;
        Sun, 19 Nov 2023 02:14:53 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:53 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:30 +0100
Message-ID: <20231119101445.4737-6-hkallweit1@gmail.com>
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
v3:
 - fix compile error
---
 drivers/video/fbdev/i740fb.c              |  1 -
 drivers/video/fbdev/matrox/i2c-matroxfb.c | 15 +++++----------
 drivers/video/fbdev/s3fb.c                |  1 -
 drivers/video/fbdev/tdfxfb.c              |  1 -
 drivers/video/fbdev/tridentfb.c           |  1 -
 5 files changed, 5 insertions(+), 14 deletions(-)

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
index e2e4705e3..bb048e14b 100644
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
@@ -160,27 +158,24 @@ static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
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
 			printk(KERN_INFO "i2c-matroxfb: Could not register secondary output i2c bus. Continuing anyway.\n");
 		/* Register maven bus even on G450/G550 */
-		err = i2c_bus_reg(&m2info->maven, minfo,
-				  MAT_DATA, MAT_CLK, "MAVEN:fb%u", 0);
+		err = i2c_bus_reg(&m2info->maven, minfo, MAT_DATA, MAT_CLK, "MAVEN:fb%u");
 		if (err)
 			printk(KERN_INFO "i2c-matroxfb: Could not register Maven i2c bus. Continuing anyway.\n");
 		else {
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
-- 
2.42.1


