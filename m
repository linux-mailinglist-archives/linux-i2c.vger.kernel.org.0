Return-Path: <linux-i2c+bounces-10504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E6A94C2C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 07:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27915189214A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 05:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1061258CC4;
	Mon, 21 Apr 2025 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaJGJt7y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40814258CC1;
	Mon, 21 Apr 2025 05:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213822; cv=none; b=JNWaZG/NY80fVaTo2HYl5G8nH4yP4vDJueL451FdDsSDEuKdQemCUmR766rWqql/ql5bF/PrEYyOUtd+7niXKnnZJ5SISyQVPC73FMmCqY5TbsB8kZnSCo7LVB5uqwn70yL448IyeMEzBYi7JMLOK5+Oy5ohC8jwwNtwv3uHY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213822; c=relaxed/simple;
	bh=qnDuboyg3uC3ZM73XxREV7nSTfV+BWdos5WixRH5ZSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7aIDkSahPIZ86MxwPkIHoqWPQKEwoWhBXDYgXomw7Z47vvj2MKrjQUhmhvhKZzg5LDK1Z1+zpPqcTr7jK2ki5345MnCWflrcW7zf67SmMSOuuRB1COwKn/+eaFb/C44GbpRQFF7ukiUTZqJOp/rysY8OLgiPr2HwPJrzYlRgXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaJGJt7y; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7398d65476eso2885279b3a.1;
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213820; x=1745818620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=;
        b=gaJGJt7y8X/z8rpC6BxHyhsyLvydjfGPzoGZ5Tk89A+hYH01l7RYYj6lT6wkN0F0jN
         faYXo6cniHhG05/I8ELaZ0XVT7WaLT4+NzYTA6BLt57tor30Da2lYFA+4Mh/65SnIi8P
         dne8Jl703UCfxqaWSiLp/SsBPZUkG59IGxAosn2mA0wNzhp3YB86vC5tHkHXEgPfwaGh
         XB5soOkMmwJnGHB0Mk00fQrhkMuOqisHXWqFp4lAQhEyxqENfctt6LTCuyzILDJWLOoo
         +CAdFsb+QJGLGT/mSH3h79Aj/23G1i39yayqddtBuGnzM5BSNZdr+zu36D2OvmD+p/cN
         IBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213820; x=1745818620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=;
        b=Juf6LKAOEPkZYD4s0xJf4JSRiVBxZwoqYIakYC9t+jmDFNEko/n9X5uZuWrMb/DnWK
         ZavquooIpCJzxm8nMYB7BHVXW636VzXK64vjqudwvkX8gOon54g+V923+xgCyX6lqA4z
         d250xn1/rOZ77u6cCRZZvSTQ+cSWy2lMGu6bnTaDd0P/WlLfLTVQ7i9dBjQCz6xo6ZR3
         q7f+IygJs749t+tlifoSOE4J/gTc5TCAwsA0fkXLUqkw0g0vYIx7aSqdzBWFn0zfgVE1
         H3/x8oPskcrDzFgbDkZTad+x4HeYM7p8Zy2tLA4+AbiZnX0XtJFXdnHYOKT1Kl1GMjA9
         Xdag==
X-Forwarded-Encrypted: i=1; AJvYcCWtf8r0EseWL0Qp4zNgIUM+5j7in8Fy5VI6bg/5+17VvWxSv4oIz1O9/c0TeydC25Imj6yxzeqlz50Ro28=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4jlt5vqB4xNtrvJZUvB+YgSM68hi4FpxRnZ2PafN8VGCbpE8q
	TLLNSy+X4uL0i90i5fGxoVQax3Hw9qu6zvkLVVkP/3TUxt9LGLkR
X-Gm-Gg: ASbGncsXe+FCIvgX/UyBAegtANG0dH6660nRNMi+t+pthNoqm8emALklCd1DL+5Godf
	fbCwmSf5KfISasnc3hgYApquj5qTHef7GAo3yjpk/q84MOQry/plRgB2YwpFJBudlu7HhIBU6KQ
	bk5y6eJr0epIRvRbM478JeJCvNx6/QzJR+y6Y/2twr72VUNmo9c89cg1SdAGMJB3W29AEzB1Lk8
	5HYdi4zpw4Ie02O8GPZeKuhPugTa5ydIILzH0SSHAy3SljbsqDNOhDqxXUrwFPrzdmjqlHXegh0
	L4Q3J6BbpXfJjksDVWvtdfM/sOPvef7gLow=
X-Google-Smtp-Source: AGHT+IGaq1j44bIV9U9aAP6Lw87+CebUioUl2IXpzgU4JKDPc1gVaozyiEZcGrmNCAOWX4YZqafxgA==
X-Received: by 2002:a05:6a00:3905:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-73dc1b7d92cmr16890178b3a.12.1745213820426;
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 21 Apr 2025 13:36:39 +0800
Subject: [PATCH 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
In-Reply-To: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=820;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=qnDuboyg3uC3ZM73XxREV7nSTfV+BWdos5WixRH5ZSc=;
 b=9uDtFJOoouBVDqMeSweTMN8B5tBnbcf6uzO7/1YWRkgpM8iHl97fMt3EJ7tOaMIeXYzCFS9LS
 xyWr9Pns8uVDLFXmqfUey18aE+a/BSO9hELI++WhIAvbX4BdBLxZoq9
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cb96a57df4a0..dd07fde79632 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1690,8 +1690,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1


