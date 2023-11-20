Return-Path: <linux-i2c+bounces-341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3FF7F1F76
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 313951C2108D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCEE39840;
	Mon, 20 Nov 2023 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mB9Ncvxs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138F4A4;
	Mon, 20 Nov 2023 13:46:34 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32f7c44f6a7so3253122f8f.1;
        Mon, 20 Nov 2023 13:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516792; x=1701121592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3q7Wv0ykBXfyqStd9azoeaEamTJsEK38bA0+KKsVDzQ=;
        b=mB9NcvxsWOaeym9+DWswPk3IGfoUbFwWqMRvehhpsff/V3z6mpzRqax7QCZcc0edxS
         KB3YVd0yje01GLNSZ55W1Jbj18JsWggVRa0T0qPih433mTRqd1kx6DT1ZonZ5l0ISf7S
         W+j4Nig2ipqDHg52X9nU7BvnyL7x9wqZCGi1ETEFVOh2ht/6RtW71zLqLhu92/4+2wGK
         Qn7N88ieUry1BJdvhf9Wk937pdj2RUIamLqGAREssVakJcM8Lb8cMhB0JYHmbtbbVmI7
         EWsYnY4eM4J2o2v+PetKxOf4k23gSKxvXz9+RkuZicMTwKwzJN77KlmR25FGPR39an1E
         eSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516792; x=1701121592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3q7Wv0ykBXfyqStd9azoeaEamTJsEK38bA0+KKsVDzQ=;
        b=XcVSU1gnF955KJ3s3L6glurvcp2I3Yh3RdWGTXNbio4ID+L+GF3eQA/bDQeTKyWR1o
         QOQ1Z6f4/X2TxRJOEyaF/hYpAE4VHw+x7mhA07NYc7vsi+Wh1xpPa0/WVXlhHN8OTdAW
         hwkSy/Zl4KZSpnvp37F4zB3c6OPPUuTVn/c1UBqA/1U51HD0SxijLH4OBphm19SohM2g
         OXLE2vgFwJLk+R8uD9N3pZzz0/vm0kcGE87YPRBZ6nO5m7YScB0upnWFm7g0tRw1tyYJ
         2RtM/s6NYZ0TJpTpMhbJPAnDU4kow2j9c9IP8L06hjdB4RG12qYysNcbm4SS0ek4Rb6y
         0U/Q==
X-Gm-Message-State: AOJu0Yw68w7QM9zr7SQbXq/1HpKeafVm/5hd+cw+aQkhhhdIK/AqYp4G
	vd9GHfU0By037a+CMbDExdU=
X-Google-Smtp-Source: AGHT+IE22PcDp7LHr0bveTlzIwiDDweuP3YXTMT1Ylh4ts3pme+8jKLYvs372KUXsQfXq+9sxxC5eQ==
X-Received: by 2002:a05:6000:1543:b0:32f:869e:b24b with SMTP id 3-20020a056000154300b0032f869eb24bmr6908763wry.14.1700516792331;
        Mon, 20 Nov 2023 13:46:32 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:08 +0100
Message-ID: <20231120214624.9378-6-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

Acked-by: Helge Deller <deller@gmx.de>
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


