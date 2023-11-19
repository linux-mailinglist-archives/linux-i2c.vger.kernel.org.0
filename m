Return-Path: <linux-i2c+bounces-264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E62507F053A
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86965B209AF
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0501D4C95;
	Sun, 19 Nov 2023 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE24lUkj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDAD131;
	Sun, 19 Nov 2023 02:14:59 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9df8d0c2505so651396966b.0;
        Sun, 19 Nov 2023 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700388898; x=1700993698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=cE24lUkjrZrQug+CP3fzzrv1W1qbT4EDwGiPIdFZ/btF2SYJElBUcc9cRxJJL9Ywqy
         Sm00zWW1xo4vxW2zEUGtNo3M1jZsIYvtp9qaDz9JxLl0GtWwJ6/6TOVRx3FieAxTbakF
         8YSpWcoGzxcVm2++rgsF0YIgHEn9HGuFMvbxpxL/8VZLOaW53om9+eKzN6TpAu/xdToD
         08kAd55SfGoTZ1o1zRuSAIOfZWJsH2ckkI/zRdE7jen10mFLA57KVdywRaTUnZqCDFo1
         fB8+FK5sz4rr5ehskSiHugd85ZPkgDghyHDx3+lB5JgGYmpOiUy8IcNVgrUECxNPif32
         cHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700388898; x=1700993698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=fv76gQchHJ7K+SNNCQ0uJOLD5nmB3amwDpbIPT9BhtLeQV9MGXHWF9HV8uqM4pzwkv
         5rseLJxxUGGtlcZ6jxpmGILfsnMynAap1O2XA6wkJwPnMyjXV/VXIjzRINeTeEn0D0Xb
         Fr8PoHFXjSCFFiU8dnCX+lOY56k2c/EBpapa8F1N827aQ1JU3oPdOsnQwHwqLK+/l0rx
         6Aw31OK2G+bAv/VDtbh+hKU2ZGFa6dM6ZE0lf4l8XNAYKA1hnHg/UnnJnC46Gl3f7yFA
         CVOv21o2qJflgguWMGF7lHt+PFXqu7kzD+k6gEXklZFde/JZfuayjb3OeEzUpZrK3pwJ
         TjVw==
X-Gm-Message-State: AOJu0Ywc3iyrIl/b9yPRxAlxvN7CQUpnVIGqbLc+Xu5jNlnSgwITONgx
	wAoRt2hbX/7Kx/J7TMSTpUI=
X-Google-Smtp-Source: AGHT+IHFle1RXfTk6vKi5iOy+vzFpLJkczRWQhYONzqvKagrUs3pBjmQadRi0jtysCiaCW9sqta1Qg==
X-Received: by 2002:a17:906:c111:b0:9ee:9d98:7d8c with SMTP id do17-20020a170906c11100b009ee9d987d8cmr11093291ejc.6.1700388898244;
        Sun, 19 Nov 2023 02:14:58 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 02:14:57 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/20] drivers/video/fbdev/cyber2000fb.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:35 +0100
Message-ID: <20231119101445.4737-11-hkallweit1@gmail.com>
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


