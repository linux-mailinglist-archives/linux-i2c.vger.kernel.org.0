Return-Path: <linux-i2c+bounces-406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83C7F5B40
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 10:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8661C20D62
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 09:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F398921112;
	Thu, 23 Nov 2023 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+nUW6jo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB6F1A4;
	Thu, 23 Nov 2023 01:40:51 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-548d60a4d60so849427a12.2;
        Thu, 23 Nov 2023 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732450; x=1701337250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4xwkZlQCS57rh5cLLkPqLJtM9ewQjK5YT1ZnNRRYzc=;
        b=L+nUW6joC/xY5dKblIyi4QUSjOUDmSummlD50kmpmvnKsbLdts8gvFnkTVBCnuFb/6
         jvDUa+mU2fT5xI13X5qdHyN5GQOVeAdMmfUcO3fqx//OrrwIhVCdvEcvqArpJUswQJDR
         0gOntavuQvMPOYMnSzGJHxph/9PRf3M5thVawQ3/a16iW76ZG39QWiWhsoMF3q8b+/9L
         wcL/iCpZEZFsnofPAv+FSwKyKy6SzD4Ij0UFboPXlnuizKZbpAYr9yE6V1mP3qjt+yPj
         mRZZ2gHW+B+y5QIRW5aHleiJ0D2AQN2kdp5Zzz99w6ojS9u4lYpE99LIhDT6WInoSazG
         PVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732450; x=1701337250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4xwkZlQCS57rh5cLLkPqLJtM9ewQjK5YT1ZnNRRYzc=;
        b=qbHUg3pHITKq/O33T+GjhyKJQt34XgwKqR/DXK3BNGZc1B3My1jalA2R1IC2Uf6p6f
         HQW9G8Jqn5qVeCAJnBnxOI1AWF2+SEiucu7Wtux3z+7Q9eVHfkoi+e6XbDSr0id4GlQ3
         ykCfCv0Gxbd8adRfwFdjBQ/qvbSrFQfgzQ/Sy1hdt5/CdPeOwwlZ2KXPBdL7mdLkD16k
         +meK4Kdjap2F6VVRFb+YA/neyGVBKoMl2cW/QbY/Ck2wqx48Mve1KIhRZvUoTUSFSx1i
         kOo2/UCt8cAzkuVGuSSdBUz1khzTPouPK7Mi4Hxtylcy70O6n/0PEwoN7AuvVNa3+RD4
         6onQ==
X-Gm-Message-State: AOJu0YyQ0MHsCh4qypVKADA8FGC9xpJTEQANL+6OqOdZidZ9b1Nza+Cj
	nKRmMsAHWj3rME+oWlGoqCo=
X-Google-Smtp-Source: AGHT+IHb38lKBzahmB3scsQJ4G9h8mrxfVKAwJLraoLG53oT4I/ucTZBBGxcgUItZfDjTqSw8rrB4w==
X-Received: by 2002:a17:906:7197:b0:9e3:5c27:8862 with SMTP id h23-20020a170906719700b009e35c278862mr3223427ejk.27.1700732449746;
        Thu, 23 Nov 2023 01:40:49 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:49 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 06/20] drivers/video/fbdev/core/fb_ddc.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:26 +0100
Message-ID: <20231123094040.592-7-hkallweit1@gmail.com>
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
 drivers/video/fbdev/core/fb_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_ddc.c b/drivers/video/fbdev/core/fb_ddc.c
index 8bf5f2f54..e25143219 100644
--- a/drivers/video/fbdev/core/fb_ddc.c
+++ b/drivers/video/fbdev/core/fb_ddc.c
@@ -116,7 +116,6 @@ unsigned char *fb_ddc_read(struct i2c_adapter *adapter)
 	algo_data->setsda(algo_data->data, 1);
 	algo_data->setscl(algo_data->data, 1);
 
-	adapter->class |= I2C_CLASS_DDC;
 	return edid;
 }
 


