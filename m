Return-Path: <linux-i2c+bounces-411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1107F5B52
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9D81F20F04
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01EF22310;
	Thu, 23 Nov 2023 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0aDHZ6G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FC01A4;
	Thu, 23 Nov 2023 01:40:54 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a013d22effcso79270466b.2;
        Thu, 23 Nov 2023 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732453; x=1701337253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X2LDaMbB0c5HZoTNyhIjHAhgnohEDN3uV01ROjEnUc=;
        b=D0aDHZ6GvGqBNZyanabWGNj9zDgGbkkjWPxW3QCsS0g4G3eIuqN8hsj91YkgbcDm90
         Dr2YRdN2djdgcsUPjEDHqR/nm9CrKcPXi74tqT3B9L/0qRipn0VM43J/faMcAiZZFLNv
         el31maAxsj5ba7rJNsvFgdoyuErKiG5G9aL4gM5/FB4bL+IMd6l7f33gqEm8ZHHFJd3d
         8DOYph1l9DwAy8+2nSMQRikv4KByTCHuMVcuPApbb+1h8mOJfLs2fds2Dxq2QnraNEWy
         r+i0t/kyzp6A97tju3a35qv53I4KTO+YTzf3780IES1uTvIxJY1RBAREvO3IpowxMaD2
         ci5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732453; x=1701337253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X2LDaMbB0c5HZoTNyhIjHAhgnohEDN3uV01ROjEnUc=;
        b=j7xhLO8o4Dipjsf8zjT+isfcUm27Wohyc1Nhv68Yw/WHG348dyn1smBrLeEbf1jrKh
         m33Uf2hz32t24vQDgWrkww7vv3fIKrnr9nEIZKMaccVpFloefUrPXnTrmJykhInJEFrv
         6spEFAyiPjmFjz08o5DHjCa+Wry04S7b1nlyQKTn1PBD5yevLduTN2bn6dkr4Txmm2GV
         1VHFwKshXf6Ss8T4nvkMH23RHI9ky967sXH5ziOV/RCsa+MqIGjqfhglgGXAiwISc9Jq
         psXORKA8wePMbmHrKUVXoVIrxzczm2mSuw3fem42NsiMoteTTT9QrS5ZT6hS6gGCPaa/
         yeug==
X-Gm-Message-State: AOJu0YytPhZXXuJU3JpIftQmqssyO3wKaFdivm6QJu8QvYx5VrNPunCt
	e2fRdMD6YcdFbH74gJoCdaekw2Zlwnw=
X-Google-Smtp-Source: AGHT+IG2ldSIvJkPOWRUMwqptBELwha4P3UEDAWFeFhYxPAf0Hq1Cr63BHUft7JxbUZhAWi2pEm5Tg==
X-Received: by 2002:a17:907:9382:b0:a00:9550:b08b with SMTP id cm2-20020a170907938200b00a009550b08bmr3262185ejc.24.1700732453321;
        Thu, 23 Nov 2023 01:40:53 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:52 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 10/20] drivers/video/fbdev/cyber2000fb.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:30 +0100
Message-ID: <20231123094040.592-11-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/cyber2000fb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 52105dc1a..79775deda 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1234,7 +1234,6 @@ static int cyber2000fb_setup_ddc_bus(struct cfb_info *cfb)
 	strscpy(cfb->ddc_adapter.name, cfb->fb.fix.id,
 		sizeof(cfb->ddc_adapter.name));
 	cfb->ddc_adapter.owner		= THIS_MODULE;
-	cfb->ddc_adapter.class		= I2C_CLASS_DDC;
 	cfb->ddc_adapter.algo_data	= &cfb->ddc_algo;
 	cfb->ddc_adapter.dev.parent	= cfb->fb.device;
 	cfb->ddc_algo.setsda		= cyber2000fb_ddc_setsda;


