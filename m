Return-Path: <linux-i2c+bounces-248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D63BF7F01DE
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913C9280D4B
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C511CF95;
	Sat, 18 Nov 2023 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv1atdjH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B153D58;
	Sat, 18 Nov 2023 10:05:18 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso398915466b.1;
        Sat, 18 Nov 2023 10:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330717; x=1700935517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbsbH1CThP42UiUJns2VDtTJbIoXHmLVJdFuam5YX4A=;
        b=Dv1atdjHcnH/I2odaOBenqZknAsMnKzuSQWWgeZPa2HfRKHZJKBv9Sl+MgIYr6Y2zU
         qnt75kcKK3rNa5np1KabUB7otAx/uHdrCDpkfxTNDq2YySVWaLAoA2YD9QzX4ZxnNYAn
         XVNHJxftBKepdmKI+60sTXxmODw1bw19uK0o61ZK2H0EiPa+ynDxqrGRz23vfxuKyx1f
         ISlGzp5f2j8gxxbXmg+xxvRVnWkhM3uSm2d01tFJls9GHsyI55WnagtCAyLLIuygy9hH
         9Pn2xouodlTVkMQo0XJbA0yvvm/qzYoGxjg7v4tdZj2gwffmmA7RyDAw8a9b+g8ucMOK
         WkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330717; x=1700935517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbsbH1CThP42UiUJns2VDtTJbIoXHmLVJdFuam5YX4A=;
        b=jBrXXt5zX/hyUkTiM5FECe9OmA9I/R14NI2jc0mOG3jWZGQc93wDYNOK1gBqWBxKuy
         GYIF0VsG85tKxcMupytOVm4WcfHZeM7PpgAQcsGrk7Ur3kmRNrAnq8ipleSauB0E9q26
         JK0Fzqm3UGly+7tL64LpYUPeUyYQk3D036e9TtvieHsWSZLiY4BEWoSCe2wAFGDa5rja
         Z5Vyw+OPUdqwpkWsBbprVr9HNC80TpxCEE4GZO1OsW+QIG/MwRQMgN7ZYynT+MfTXZ2C
         04yR6g7bVXByu9UazPaaaZOjb/sgIa8Fw77XkGmjv73QtasT3IpB1GfzCuUIBVQjDLco
         J+TA==
X-Gm-Message-State: AOJu0YxTHejG0lUrJ26vB1CPgidtrfvUJvfOuu9Lorlq3Qrf1rJwcGdM
	dGhqiO3afGPdk1uvGdN5kQE=
X-Google-Smtp-Source: AGHT+IE6NYND1q390q99WYS/6bIoGK12vSvwGzpUiPl4o+SJV3Ry6vIbBPSwfHZdeucyCd1k1/QcHA==
X-Received: by 2002:a17:906:d7:b0:9ae:37d9:803e with SMTP id 23-20020a17090600d700b009ae37d9803emr2558599eji.8.1700330716752;
        Sat, 18 Nov 2023 10:05:16 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:16 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sergey Kozlov <serjk@netup.ru>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Abylay Ospan <aospan@netup.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:05:02 +0100
Message-ID: <20231118180504.1785-9-hkallweit1@gmail.com>
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
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index bd38ce444..46676f2c8 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -289,7 +289,7 @@ static const struct i2c_algorithm netup_i2c_algorithm = {
 static const struct i2c_adapter netup_i2c_adapter = {
 	.owner		= THIS_MODULE,
 	.name		= NETUP_UNIDVB_NAME,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &netup_i2c_algorithm,
 };
 


