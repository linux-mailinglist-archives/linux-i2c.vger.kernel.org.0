Return-Path: <linux-i2c+bounces-222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498C7F016A
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27DD1F22FFA
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AAE199B5;
	Sat, 18 Nov 2023 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPpsSSQm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5D9192;
	Sat, 18 Nov 2023 09:42:33 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso3913925e9.0;
        Sat, 18 Nov 2023 09:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329352; x=1700934152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
        b=CPpsSSQm6GhTtfEI0/p4dQE9MJuM44aEe4ecCtbWsNZm+C4s9amn8tbp5Fn10NRMDk
         DbckHsMxmCF+KrqAcxzi1ihcrUWbsRkYavMWx5Bheb4tWvO9XDn4y5Y1igjjtNw0yJ3d
         KrrJo9VoHJFzG5E8Ux0zMCr+mbSmBDLKbNR//zrjiagBk7Ve5bTgMS8oar6G67sWYxW/
         PmJaAhljUW4xzO28qckyzix8niDt19G5IE08FEDussYiQld6WvVaNQVnnXkurzWlzosb
         8QkIoLxJJbuuAQEMVhx/7frhkIrAjYCINUicXmDTb9l4l+sN4OKt6ZkkOmDbooPNlMyh
         K3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329352; x=1700934152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTrCOgNzORg+kX6P4q5KSwq1S4WQ2CSsbEPwGEitBjk=;
        b=NvX2C1QdE5pN8Ivrj7eZ/OfkzCEqHTfL+3cmmSjUcVNvL6AZHbHo2mIfkldj+dZiuM
         VH/0fenczweaPDR0gCkM5tb7oTYrWm5HmQnVVYBIchv0sM6m2E7vxpp2aOFbDoJhSZOF
         kPpQTmGi7zcht4rlMw2cz+iVoNV7PsWmj8F5XuawRQLVyrsyGV8ngDWPZJ/+Mw1sh76t
         a9n+9FTUPv5crzo13UF0ht5EqsLCdqS6WVXxpN/PLtKNacLHsG+Szm4Mz8kIXQGVE0T5
         DrJuXh1EHfjd4yViFr2hDUAO5GlXbl4oq7+l4Jr+OlRTqrheo3cJKtd/FWWMXdoC5tAW
         D/Mw==
X-Gm-Message-State: AOJu0YzjrAkQm80n3AsygIborPyWecJiyKYUZL/TeThqdkkMDv6vsblH
	5WOLZi/2qv9FWxpVT0QXJAM=
X-Google-Smtp-Source: AGHT+IF2uuCnONQDkgVMYOEey1RFRUe8GnD9gILj5PaZk9ukHNBactX5XsSTUMsKSBKRWlQHaR36FQ==
X-Received: by 2002:a05:600c:35c7:b0:3ff:233f:2cfb with SMTP id r7-20020a05600c35c700b003ff233f2cfbmr2013183wmq.23.1700329351574;
        Sat, 18 Nov 2023 09:42:31 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:31 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/20] drivers/video/fbdev/core/fb_ddc.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:06 +0100
Message-ID: <20231118174221.851-7-hkallweit1@gmail.com>
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
 


