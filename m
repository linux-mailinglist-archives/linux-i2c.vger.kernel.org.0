Return-Path: <linux-i2c+bounces-114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419547E9AFD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 12:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70F1A1C2095F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 11:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8C91CA9A;
	Mon, 13 Nov 2023 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUSLXbxp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC471CF88;
	Mon, 13 Nov 2023 11:24:13 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C6FD6D;
	Mon, 13 Nov 2023 03:24:11 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso33255165e9.2;
        Mon, 13 Nov 2023 03:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699874650; x=1700479450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=aUSLXbxpet9c4fkSx6LQpXKzDXPHhv4HR5C9HuJJNENqLZRFlcT/u2qNePNrS96zrT
         oncHAPfCZtKmdsdD4dMYYxlj4eOfZ/LAXhK5dCxesmmhHAC/lr1iedqhkC+t7v0BVydn
         5RxwpTQLOMCxvgdju05nhDNR+6wdAqsjruyknbycVVX43HQuvi4JKCGD4QTZ7Dq66s7g
         +llrrW6yvZYriHouJQ96y3yxzUOGDi9pv1X5Nq9FJWdYc/lgmDVO/1W1MVAK9KA2wAJw
         FZdiMfVLxYft6N5iQ2wfTYUgti6aUbnS6Rw0p8UazlS2k2R2cUrgHXg7QBMbzcJsrIaN
         JXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699874650; x=1700479450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=r/6xSsSwr1IHSJb8YhA+9YIlT3cCLO3uRrwFhG0HCer1ZcEcCi6JSDRme/Vf4Zm/r+
         SKql18J0uX5uvfdLfaeO+aX/VcTIWSm2zRiFFzEKIm0VuOA1Fx9eZj4jC0O0Nr2KGML1
         VlMSS/qPtbwN8idOxv19hCHl+wiavBrRO3q0MetKKkWcipP7PU6if0FWYnst7koss6tB
         RYJO51l1h3RZSI3ipbx3Znfzg2G8cA5OfwuLDSfu8u4hhsTxYSnXVPj4dRoLFDbYjpQc
         m2LG6H+WdRHUno9wZbfusLCPNzg70jLag4VNAFZbaea8ndltUHKTHcpEZMspCP7hHAfk
         Ez1Q==
X-Gm-Message-State: AOJu0Yyy/NnmXRhqkF7H8feT7qGGk/BbP3y1Qm0I+wWVb4agwjCRd3jZ
	ER7SshGrAVM2h75btqmmMNk=
X-Google-Smtp-Source: AGHT+IFLTl+fAOmA9wfAnqq5QL35Y8l0EQWxEuKGeK/UmNhJYPQBWfJpPA26uHWh9GGQv+cTL2zTow==
X-Received: by 2002:a05:600c:348f:b0:406:411f:742e with SMTP id a15-20020a05600c348f00b00406411f742emr5433441wmq.34.1699874649928;
        Mon, 13 Nov 2023 03:24:09 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:24:09 -0800 (PST)
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
Subject: [PATCH 10/20] drivers/video/fbdev/cyber2000fb.c: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:34 +0100
Message-ID: <20231113112344.719-11-hkallweit1@gmail.com>
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


