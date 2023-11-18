Return-Path: <linux-i2c+bounces-237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D47F018F
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CB881F2317C
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 17:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181961C2AE;
	Sat, 18 Nov 2023 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S345bEvs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C64DD61;
	Sat, 18 Nov 2023 09:42:48 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40806e4106dso2722565e9.1;
        Sat, 18 Nov 2023 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329365; x=1700934165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=S345bEvs9q0MqPOtaAOcFjLkuKJYcZuBe9+JHYMUOJ/aidB/fA8FAwWff0YZn7Vld5
         DAXfGYN1AL4uDos8ZAOjWGzbccx4ihr+ljiDm71OcTdhbptVH96J6eCudD3bpEBrlSJ0
         rB+USljCL3nLz9tJ4oVmoo2IHVoy+pTPkjlFqt2MTk+BO2RAlivRgFB7udVuU3GoSCO9
         Mc5O7zM/M31VxOb3cMOfegY+beqWdx7LnDKCqcG2eMwIOaESYwecQoP5dZm5pICuKDQq
         ceTznY3dSIV/VeKhfcxD6NXFNVUVlC+VRTnIW6pLfXWF4Qo5xFR4mxYt+FBUHVEZCPZv
         T2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329365; x=1700934165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=XUNJdvD0BFcFJ5f7hGSqOserz6eraMqyNXI+7A8r2aotfeMQfuHdWoKpY5yQBTTnK1
         2zBIU8BwZ0O6xkbR4MLxERYccj0J5jHuZIHb9mO6dZOVPNSuVoL0AJs97rfPqn6rzw9h
         QgAA7aYPu+gciCNJI1LawmTQLqhfZO1g3wdPqpY+oJX2AuiBkqSONccrMhPHjPgDC1AH
         W1w3X7GVP2+fJwWu217WLz/3ENV/t7CsH/PXMduov6BdQMFF/5AqCOxVh7RatTtntqod
         uO/P2vWUyrap+CKepFnl0nQDRjRjCb5+OMJiEUDbNw7PcOZhtzXzZM22zhXbypfqR89u
         UkOQ==
X-Gm-Message-State: AOJu0YyZ+MTkA/RnrRk2pBMY9zAV9VumrV6axJ79gNaBEdMmkLti3dd3
	PIO9S4JVbH1Wr8h5nWQOLNg=
X-Google-Smtp-Source: AGHT+IEfGC11GbAgY9a3iwog8RZFBCmOzsqpJ0VCuNPTs77rF0/5JKKRTlqJUA+zSfuaII4HOyGD2Q==
X-Received: by 2002:a05:600c:4f56:b0:3fe:1fd9:bedf with SMTP id m22-20020a05600c4f5600b003fe1fd9bedfmr2222060wmq.11.1700329365491;
        Sat, 18 Nov 2023 09:42:45 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:45 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/20] include/linux/i2c.h: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:20 +0100
Message-ID: <20231118174221.851-21-hkallweit1@gmail.com>
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
 include/linux/i2c.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27..d029aade3 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -850,7 +850,6 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 
 /* i2c adapter classes (bitmask) */
 #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
-#define I2C_CLASS_DDC		(1<<3)	/* DDC bus on graphics adapters */
 #define I2C_CLASS_SPD		(1<<7)	/* Memory modules */
 /* Warn users that the adapter doesn't support classes anymore */
 #define I2C_CLASS_DEPRECATED	(1<<8)


