Return-Path: <linux-i2c+bounces-345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 433707F1F81
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 22:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749251C21171
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 21:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9EB38FBB;
	Mon, 20 Nov 2023 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNkrgF2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3188A4;
	Mon, 20 Nov 2023 13:46:37 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40839652b97so18363605e9.3;
        Mon, 20 Nov 2023 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516796; x=1701121596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq7nwej1uXJ8BJR7pdDi87hSI0E9HenTuebLuXr0HrY=;
        b=HNkrgF2IFppu1basFaX0egxxy4+lcRL2RLcuxEGSyeHMQq+F5s0Oo5vesx5ItPg0iI
         G5OjAFtGIgm+2Gauqt5l2AAHIJhxoNUFxRDZZcpLOieN1kQzj2194yJihDs0VZaalGXe
         iTshEtZTm3N0/cUpGhiNcF4gpg2yW5aOYJHlFHcyF6KFwO3u81aceXn7IVqTEmYsuJPV
         B+oqlni8bnQL8dabOKFPvXdYcH77l8n2P6KNm1rFK++tWNDxfO+be8XXnHeF3qyamDTo
         PqRz9+WUoGN4lYi/ZDT1e0o6JSwv6GMkQxd1fvIlKYYBIv+wUzYItSPGiP7Eoe/typlU
         6hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516796; x=1701121596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq7nwej1uXJ8BJR7pdDi87hSI0E9HenTuebLuXr0HrY=;
        b=hcwrUFYyFz+J+MmdkzWqDt8J58U29G3qkMN0w5oTSCJXT47p1dfcNwIBwln7YBdNMe
         jhLvs5L5ceaDCeJ50Ms8ZmxlHDxpTI6zFovnM02kqs5t7XHOyaF7LX3zscmg44HLgAyn
         JdKMBbKZfkGk/tfToRcGx8fVxE6N9lKbODtq8aD5N3fCo6L6RaEdIoL6p3bL1/AUvi1T
         F0AcEbtg42szYM/g62uQGQ9DPjWio6GPzRr/H6PN3geoY7we74p4az1JaWvluUhkB+oE
         jYjt/YDWcvO8iRag1ZcucqS8pQrrVIh3g+WsM3d7imUsMA7IlTC3XtwSAQa+Waw5eR7Z
         rANw==
X-Gm-Message-State: AOJu0Yy57nd5JnYEPf5lk2HuhrIQ08/HwII7rcFsNeDtHYC37b7unY9I
	jXmrYsgK3pAxoFieKHX3/Bk=
X-Google-Smtp-Source: AGHT+IH1S4/fJsobtHJJPWdqFrJEAF5OXQoLCltzpm8iDTMOYpJCpPVCKnhW9kW09x82/VjIEFaoPg==
X-Received: by 2002:a05:6000:381:b0:332:c65a:8f1f with SMTP id u1-20020a056000038100b00332c65a8f1fmr4065388wrf.47.1700516796157;
        Mon, 20 Nov 2023 13:46:36 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:35 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/20] drivers/video/fbdev/via/via_i2c.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:12 +0100
Message-ID: <20231120214624.9378-10-hkallweit1@gmail.com>
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
 drivers/video/fbdev/via/via_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c35e530e0..582502810 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -201,7 +201,6 @@ static int create_i2c_bus(struct i2c_adapter *adapter,
 	sprintf(adapter->name, "viafb i2c io_port idx 0x%02x",
 		adap_cfg->ioport_index);
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->algo_data = algo;
 	if (pdev)
 		adapter->dev.parent = &pdev->dev;


