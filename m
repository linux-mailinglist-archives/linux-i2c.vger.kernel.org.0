Return-Path: <linux-i2c+bounces-294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22A7F05D7
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273391C20873
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFF8101F7;
	Sun, 19 Nov 2023 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaKm0WFp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6355C10FE;
	Sun, 19 Nov 2023 03:28:49 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so2689429a12.3;
        Sun, 19 Nov 2023 03:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393327; x=1700998127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=DaKm0WFpw4PtuyW50BcNwa8kUrDaTwYYr1CQlZAj9eJdibdWWJ67dKTENpbRoVTQpQ
         GYHo1dQY5j6Qihfxkbd/YzlEvMWeJVMomZUXC1qOhVp0mf9jEle6VMA6ZsbVToBKe3+1
         mvoFxtOgHOJEkmL23D0aypRezsZRBsQoVX7CRn6xpJzJbSbgxRXLDDVfB2mPC/KNzeC2
         imqbD66+H1e2N5DNuYTs2jTrujMQ9ChfzqVilgIp3vTjBU7pIHwjEappI42aJWeRuuJd
         KfBkPzF+Qdvt2b/XG0RbiBa8EjY30dJXH0OCHphd+pMxPh6DrGy3KCF+fQqbBz9/ibcQ
         Syzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393327; x=1700998127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoOuxVfYX3lHdi36PKjYbl3tsLm17OpynR1y+9rBRUM=;
        b=n4lPx4I3PnHPESx0UpnHmTgjrr1AOFFxyCMJATwaDIhMzoHJq9VZKS5YRRIZze8VvT
         SESZOaO10G3g9P9erl/LwJEpAOdXQDUGFI+dlcok7z/AbRZWyRFfxa95Y8mx6jbtyazU
         GDYfQE28Z8laPkNnA3+1aeY80HPE1iVUy2BcEXLNYea8a9OCb/dwd7yY95gZ22PWtrx+
         mteuZW7f1WatSDnZH/WPV6F3Ee1WgwfbFEfji5F7jouLrZztNAIHJiRxY4p7z/G9nket
         QDtp+efIvMj7yBKOY98v6CMoNeTMqpzGTk4XhedspCHi+P/IxrAUtPWEHTl+Cqs8O5XA
         6QPA==
X-Gm-Message-State: AOJu0YyfOpvnu6Xu0F7xk5okZNiqm5lcweHqqyHio4UXC1jQfjwiRAzl
	gFLgA26w7mlGThivUTpdAJ4=
X-Google-Smtp-Source: AGHT+IHfngVXlSW4LUIjnlkKJhW6cPwJdp2SIROIb9ruMWWShNHesG1OZE+QGCvwGdrnD4kqvy0Bvg==
X-Received: by 2002:a17:907:2da7:b0:9c6:1143:b52 with SMTP id gt39-20020a1709072da700b009c611430b52mr4489746ejc.55.1700393327195;
        Sun, 19 Nov 2023 03:28:47 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:46 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/20] include/linux/i2c.h: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:25 +0100
Message-ID: <20231119112826.5115-21-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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


