Return-Path: <linux-i2c+bounces-98-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7A7E950D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 03:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8AFD28111F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 02:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2927E20329;
	Mon, 13 Nov 2023 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZgnGRdwV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7982031F
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 02:32:53 +0000 (UTC)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA26210C
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 18:32:51 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5ac376d311aso43708177b3.1
        for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 18:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699842771; x=1700447571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JRTOkQAIxvqqyHp7IwShDoodnSKUTwTjnZNRiFS76Wk=;
        b=ZgnGRdwVxoipjMYHh/D2bfcvbYeUbUCHiPwnZBZshXoe6HhfYC9+9eXhABTNeCzP59
         ieY03kI0mt+0zK3oPcBSdLPa8F2yMDXGdWZeTn9nrS9b+S2CXgMLpyEjJCSwdq+qf9YL
         hp+tZ1nP0YcbKwJM3n0LF3RU02N8c7G3I4IzlWdC3d8WzGhLOEO9s70xPTCVGB6oBzin
         G/uPwQmz5UqsjhWsCk1WJo+oTUlHkBaz4953AiR2CUGmnDPHTNnrhViLGKpcv3MjkuMr
         eNL0NIcyubmJ6q2Nb9/mMqqytl9ZGC84znJsM4IMWsQft7I7Zl5huXXrp4NfnTISTdRr
         JLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699842771; x=1700447571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRTOkQAIxvqqyHp7IwShDoodnSKUTwTjnZNRiFS76Wk=;
        b=OCJPB+0cjR9lAYfsNzto1xyMO8nA/wg/N8j2bgyVye8CWYriE+fd5rc85Va7cjdRMV
         4Mr+w7FMNsBq0PxGGBAaubL3futFKuigxI/SyWc259nDIOCWb39vk5duNGolFp+ziL23
         zUUw5jUTJGfa+z4+/sBfige7yFJwMoS6uSYaFVqwInRk/ZQ5aTUHm7GNw4iflrDYZcPU
         JVg+/OQW/Tkw8CAhQO9hz734Z9xt2mGtvogl01PwF/JlugjG/FRJVjBYUEGdBMsveHpF
         /wyogpsZqOw/JGysuSIWWzblt8iqUoce2HF0OI0vs3vI6Wd9oZWFAtOwNZBBzf9AUgOS
         YdFg==
X-Gm-Message-State: AOJu0YwuU9O7xvAdW49RszyQgQkv0OTH2vraaLC4k4kWo7vAuM7X2qSz
	KSUo1F+EEW2SrMbg9wGfZkn0hu0TfcpSLMuRE10=
X-Google-Smtp-Source: AGHT+IHrTceJ+TpoCZpIupL9IC+qT1b1tAzCHxEcPIUg1xI+sNkAyNWBP7csGLAU9+Wi7w1iFOxsNg==
X-Received: by 2002:a81:4113:0:b0:5a8:277f:b378 with SMTP id o19-20020a814113000000b005a8277fb378mr2806271ywa.1.1699842770781;
        Sun, 12 Nov 2023 18:32:50 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id n10-20020a056a000d4a00b006b725b2158bsm3026399pfv.41.2023.11.12.18.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 18:32:50 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: ocores: Move system PM hooks to the NOIRQ phase
Date: Sun, 12 Nov 2023 18:32:45 -0800
Message-ID: <20231113023249.1185682-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
the regmap-irq code must be able to perform I2C transactions during
suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
be suspended/resumed during the NOIRQ phase.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on v6.7-rc1

 drivers/i2c/busses/i2c-ocores.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 041a76f71a49..e106af83cef4 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -771,8 +771,8 @@ static int ocores_i2c_resume(struct device *dev)
 	return ocores_init(dev, i2c);
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(ocores_i2c_pm,
-				ocores_i2c_suspend, ocores_i2c_resume);
+static DEFINE_NOIRQ_DEV_PM_OPS(ocores_i2c_pm,
+			       ocores_i2c_suspend, ocores_i2c_resume);
 
 static struct platform_driver ocores_i2c_driver = {
 	.probe   = ocores_i2c_probe,
-- 
2.42.0


