Return-Path: <linux-i2c+bounces-268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 598BE7F0541
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14CB8280A85
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1634B6131;
	Sun, 19 Nov 2023 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7yw72Wv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCA8131;
	Sun, 19 Nov 2023 02:15:02 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54864b675b2so1815574a12.2;
        Sun, 19 Nov 2023 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388901; x=1700993701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gja50uK+VGu03YOVtNxYd9PQDwE60KteuWGZ1s7ZCqk=;
        b=l7yw72WvxpTaJnhCRDzM7XM0Rd/DulBEJF1fJEeYjA+tKkOhEx1c2zIw+yjWFilxSQ
         QywwcdHxmlEM2MhUj8h3fB06374mmVYRg0tFeLrHiSmz7nA/o03YriB6S8qfHEtxoqjO
         3dF+oxjGjGCE8+9i/2YLrsaoD6BbeEefKrcB9PE+I9lDwklQMA9dE8nqtqRCKnWK7o45
         nZ14g+8hcwCg6dSiBRGV3yXfWyBHAYkUvd94JQ56dhA1Jx92nUg9onEkwW/VBy9RZ71X
         0lUjSRmjiahvIdjdWcIn9Ep+k9XbAL4xJZYTzM9V1Nr+gDlHwjEPBEEKw/RnR5zcyati
         /AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388901; x=1700993701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gja50uK+VGu03YOVtNxYd9PQDwE60KteuWGZ1s7ZCqk=;
        b=dAw2PF4o/1GXr9zl8evtsENtsfBmqZyjNCFV9dyns4K9v79MOmGnti5gnhM2fZQAaM
         0KpagnuepyAYi6sxcuL5uAvcDklEBZv6dgKCZxzBJ0I67SiXJwuSSYxf+6lwPb34oRxR
         WGkGb0Ry71durN8Hgne6FleFMbmA8TJiuzQWSaSEWizvJrvG10GbXi9L9hc3aGK203+b
         2uzI6MdqEtS7eZl8FqzqylF/k923jFz5+GObdX8vV426+Bmd+CpZJHisqIjS8auhuIaq
         Q7Cxtqkb6GKDuUYrQ0HaGZmxOX6YAVhSB8JOL5SQ+BbsTeaKKm8lis5chB2CeUpS7OqF
         86rA==
X-Gm-Message-State: AOJu0YxpHTn0d0zRJN06tq6EvOO0uJPe3s1cIBPcPcXPSOts4ApHwI59
	/sAEyWfgWoxPWUCk25YraTA=
X-Google-Smtp-Source: AGHT+IEUMMC5ITmLhQ++xTxsq0EC3YjolDxqXOJe5kffmWkOeFgA/YeGu7mWuST9nb8zkP/u6wQ1cA==
X-Received: by 2002:a17:907:d510:b0:9e2:af56:c375 with SMTP id wb16-20020a170907d51000b009e2af56c375mr4580366ejc.52.1700388901208;
        Sun, 19 Nov 2023 02:15:01 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:15:00 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Maik Broemme <mbroemme@libmpq.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/20] drivers/video/fbdev/intelfb/intelfb_i2c.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:38 +0100
Message-ID: <20231119101445.4737-14-hkallweit1@gmail.com>
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
 drivers/video/fbdev/intelfb/intelfb_i2c.c |   15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/intelfb/intelfb_i2c.c b/drivers/video/fbdev/intelfb/intelfb_i2c.c
index 3300bd31d..f24c7cb4c 100644
--- a/drivers/video/fbdev/intelfb/intelfb_i2c.c
+++ b/drivers/video/fbdev/intelfb/intelfb_i2c.c
@@ -99,8 +99,7 @@ static int intelfb_gpio_getsda(void *data)
 
 static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
 				 struct intelfb_i2c_chan *chan,
-				 const u32 reg, const char *name,
-				 int class)
+				 const u32 reg, const char *name)
 {
 	int rc;
 
@@ -108,7 +107,6 @@ static int intelfb_setup_i2c_bus(struct intelfb_info *dinfo,
 	chan->reg			= reg;
 	snprintf(chan->adapter.name, sizeof(chan->adapter.name),
 		 "intelfb %s", name);
-	chan->adapter.class		= class;
 	chan->adapter.owner		= THIS_MODULE;
 	chan->adapter.algo_data		= &chan->algo;
 	chan->adapter.dev.parent	= &chan->dinfo->pdev->dev;
@@ -144,8 +142,7 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 	dinfo->output[i].type = INTELFB_OUTPUT_ANALOG;
 
 	/* setup the DDC bus for analog output */
-	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA,
-			      "CRTDDC_A", I2C_CLASS_DDC);
+	intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOA, "CRTDDC_A");
 	i++;
 
 	/* need to add the output busses for each device
@@ -159,10 +156,8 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 	case INTEL_855GM:
 	case INTEL_865G:
 		dinfo->output[i].type = INTELFB_OUTPUT_DVO;
-		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus,
-				      GPIOD, "DVODDC_D", I2C_CLASS_DDC);
-		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
-				      GPIOE, "DVOI2C_E", 0);
+		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].ddc_bus, GPIOD, "DVODDC_D");
+		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus, GPIOE, "DVOI2C_E");
 		i++;
 		break;
 	case INTEL_915G:
@@ -176,7 +171,7 @@ void intelfb_create_i2c_busses(struct intelfb_info *dinfo)
 		/* SDVO ports have a single control bus - 2 devices */
 		dinfo->output[i].type = INTELFB_OUTPUT_SDVO;
 		intelfb_setup_i2c_bus(dinfo, &dinfo->output[i].i2c_bus,
-				      GPIOE, "SDVOCTRL_E", 0);
+				      GPIOE, "SDVOCTRL_E");
 		/* TODO: initialize the SDVO */
 		/* I830SDVOInit(pScrn, i, DVOB); */
 		i++;


