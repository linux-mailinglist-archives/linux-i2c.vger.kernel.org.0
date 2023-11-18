Return-Path: <linux-i2c+bounces-241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 656367F01D2
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9693B1C208BB
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C821C28F;
	Sat, 18 Nov 2023 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZa2Xia/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ABAE6;
	Sat, 18 Nov 2023 10:05:12 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9df8d0c2505so579278566b.0;
        Sat, 18 Nov 2023 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330711; x=1700935511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEQQ4sBftaBxEQfqkfYlxYDOwzoa8t3+UXmC0vdAGio=;
        b=KZa2Xia/iQXFdBV84GKBJ2jo5iqcLvUFFXEP2+pd4EEBveWryZYrHM4CBEjwkdwW+q
         9IAI9vSeX/T7mm5bQnEsBesvn11mGLqFmb6a7dHJDPkm6JZc5G7BxvnFfwh+Iqb0ZMmD
         h6rUs/GKeVbG42MXgY6bTomST658EpzoJn0LS3s7ValvMiXir+2DcjuCyX8ioRv+Ef7F
         JQGwFZ1Yf9gF/Anu1ga3QGK7s1Syqy6KIRUtnRM0We/OBFlFLz4Hf0xW3VKiVrfRREyi
         WtwCUBCnX+o0s05YFRsq9qXyABOapKO2SIDpIs863vxP6Zc2+rbMz3aNt4AOsQZPAhK7
         7yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330711; x=1700935511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEQQ4sBftaBxEQfqkfYlxYDOwzoa8t3+UXmC0vdAGio=;
        b=WGCwlXpO/I2MM3ngdq/uLuBeraXp+E4AJp5WTITjFb5RPLUbchFFKCcy4Q5tSJiDjS
         VPkJtgLU1CwkDg3Ehlu62wVUPax2oolAJUympqUb1mdAHuqTs5COi/Xmg57F5mBF6GKL
         I8HZLdHC58FyQB8QHRPk3iCMLYJn6gGAoku4CoQf/GWIwnjN4+G8fHZL0+F0da0O4bD6
         Mj1o7fKzKwlJiZv9wGRJS7FG6Pjsy96yIqX2iA8Bqz2NjP5LopBTZvqTM1Vcz0Hb8ZtJ
         Zu5Gj3v7ELfemwXWrCjS0MxKsDUKXc9YvE92vbHaJqukZDwgGK5lLH64JHeibv5TAMEU
         Ts+A==
X-Gm-Message-State: AOJu0YzBZxbjB3cWsIL+StsBgKj09hQNppUfBfgXheCUJzp2VOfV2pYB
	tdxNPtPCA94TMNx79KfcJ5qzKsPzUhux1w==
X-Google-Smtp-Source: AGHT+IGYLilIkdrNACXRJAHaolL+uXijwWBEXjtZAesjgsYT4+SMXgcWH+uTG6gF4MPghLKCC6/PYA==
X-Received: by 2002:a17:907:d21:b0:9f4:1bd6:2d26 with SMTP id gn33-20020a1709070d2100b009f41bd62d26mr10976580ejc.0.1700330710912;
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] drivers/staging/greybus/i2c.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:56 +0100
Message-ID: <20231118180504.1785-3-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/staging/greybus/i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index de2f6516d..22325ab9d 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -264,7 +264,7 @@ static int gb_i2c_probe(struct gbphy_device *gbphy_dev,
 	/* Looks good; up our i2c adapter */
 	adapter = &gb_i2c_dev->adapter;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->algo = &gb_i2c_algorithm;
 
 	adapter->dev.parent = &gbphy_dev->dev;


