Return-Path: <linux-i2c+bounces-247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906EB7F01DC
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7881C20904
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCCCD27E;
	Sat, 18 Nov 2023 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyO97uV0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFCEE6;
	Sat, 18 Nov 2023 10:05:17 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991c786369cso426548466b.1;
        Sat, 18 Nov 2023 10:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330716; x=1700935516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roBdCcPzLstLM8/JSIpHl0j2D5fXKoNfX0rW8q8tWfA=;
        b=VyO97uV0Av7l/4W2GVvwl+0S0J1ojkNjvjYZmUnUUzSRgVcJUBlIuE0lmVKY9qjnUP
         1V0u99zgcxO/wtQ6DGD93pM83Cl4cW6hw0aKlHuf+Pag0IaW7aOvWmLTwLVG5kAtsmOl
         F1TlUI1iv5puxwqff7VEae7GABGpOLqWjWZBEbwVDANorQMXgXtbKZ8XQpVmNLFBfHOb
         ubjUHIUy5r3Tp14k5mX3PhWkI5Bl2SY8cBiG00IZDD7nXAIIY3BN7g0v3Q2kihRd9cqY
         ajLp0eIAqMiQ8ALKzK/37PpO+jkV4n0eZoimyetApy8wZqZmMyKpy98cIbe/aBAr0P8X
         b4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330716; x=1700935516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roBdCcPzLstLM8/JSIpHl0j2D5fXKoNfX0rW8q8tWfA=;
        b=ulunymfEYwdjSUPHd2ezXR6k8C9dgXyjd9iryHzsnWcmAdrKZXjgs0657M3Y/JiJSi
         8dupmeg7kaapnAt1v5jhVfLpJ6gJWGvfGQd9J0hd5ZzQqrg6p6vCwPkMd9f613xA0kUx
         gyWFoHkAdSYb2hziz8XTHvMWk5hZ6e7iSenq1Xln8FYyNzQgIbA0X08fNMXaDL+ksZQ2
         lTG7mgn0mCQDR7UE35GLihuES9aGfTrzkk68iT86qbBsmC6mO2SJQ44pJ9wWkrgDsBhv
         N+gW85zSvaffzaGO2gbVpdOHJTp3mMCP5E1Fl+1BzjzAiWnhjkcUQ/yYbQcDCB1L0Wjt
         DsCQ==
X-Gm-Message-State: AOJu0YxnQMIJvYwYCPiwldyKkF8exBcMCR2Bv1zUt8ZdJwT4F6gs8it/
	/zlZbRrmRmtSgXuBTZWEzvk=
X-Google-Smtp-Source: AGHT+IFuIGbRgTD4uVbNdcVghcMFD47Oaw8MS2fl2m1153cbcnrxqtCQ1AwH2CiR5GHDmRZ+Ogwx0Q==
X-Received: by 2002:a17:906:f193:b0:9bf:5771:a8cf with SMTP id gs19-20020a170906f19300b009bf5771a8cfmr2174684ejb.70.1700330715918;
        Sat, 18 Nov 2023 10:05:15 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:15 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Michael Shych <michaelsh@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] drivers/i2c/busses/i2c-mlxcpld.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:05:01 +0100
Message-ID: <20231118180504.1785-8-hkallweit1@gmail.com>
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
 drivers/i2c/busses/i2c-mlxcpld.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 6fec64ea6..099291a04 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -477,7 +477,7 @@ static const struct i2c_adapter_quirks mlxcpld_i2c_quirks_ext2 = {
 static struct i2c_adapter mlxcpld_i2c_adapter = {
 	.owner          = THIS_MODULE,
 	.name           = "i2c-mlxcpld",
-	.class          = I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class          = I2C_CLASS_HWMON,
 	.algo           = &mlxcpld_i2c_algo,
 	.quirks		= &mlxcpld_i2c_quirks,
 	.retries	= MLXCPLD_I2C_RETR_NUM,


