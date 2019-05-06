Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4796914A6C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 14:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfEFM5b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 08:57:31 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39130 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfEFM52 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 08:57:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id z26so6737023pfg.6
        for <linux-i2c@vger.kernel.org>; Mon, 06 May 2019 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AZwN4Y8XxFUK2pvt2N7G+01LXJuGE7M19RGGBuG2SYw=;
        b=hKnJBVWqMGJCsq/b4yG5yQ3YyVPH8QCMFEt15kpkj0ig0/GAPBdsTC7mLxoDrvbhMX
         mLHM301iBO2DSckX1JDR9YUqGRrQzzmT/7wzfPxD2iMHTygGIYoQPGP5SUZIPgmlyEHn
         v5ekJE76muREcBmXVd29r6Kf96uVKyvgZlNF+HMrDmOpN4dxHJqZHbhCTVgnBDra93Ul
         RdN5vSctEmwI9geG2kgV0nGD7C2NmdtTb4mg1SgSQBL9TwDPEJdO5QPBm1jB2CYw5is8
         w6I7atptCsJeuLv1BNzLZPApIqAfpJbYLoRK7/D891Uzhl6ZH3Lggynd4lWIrZmWIFOl
         fwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AZwN4Y8XxFUK2pvt2N7G+01LXJuGE7M19RGGBuG2SYw=;
        b=rDo/T0VVL9Le8QYKY8Sev3FBTdkfsSHBPJFnfEQiNjG+S/ZsgAc9vt9w06Q/o203Bm
         /cBk+IKoaAiDvCwanmMfvv/r814szyy158kTdEq/rwldNMEkWFXIwxnGxTcRd3p+Zndv
         no/Pz4u1bf5wjhuxziT0FFJ9DcmSWkQYFHHq8pxwCRJpUAOhFRZv9++XtlKaosIKFfoz
         Vi6s4YrExEnlxgVgjgqLGQiMCLcqfhIk4ajr8ino45d5yuzKscaD4eIlYQK8RbmGDgdb
         3jwUJj5Rvo1cLy6RZjyjMdP5BcKhUgJZQwB6BaoQ8LtPa8tNYfrp+ig6FV0aPGiNjIW2
         mP0g==
X-Gm-Message-State: APjAAAUIEM3hKYV8ZdZCcnt4lXe5J+CG05iRXEj4++WDBPxWNY1RES2L
        lU1yktapISRzVzdG33Pg/FJhOQ==
X-Google-Smtp-Source: APXvYqySdJKvrX5oi/GsnI2Zz/4BtbWRcPafJni1v7sN+SE8nvhny3X09satX04k94LSFysH41SGqw==
X-Received: by 2002:a65:654c:: with SMTP id a12mr31839474pgw.101.1557147447917;
        Mon, 06 May 2019 05:57:27 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id p81sm18031132pfa.26.2019.05.06.05.57.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 06 May 2019 05:57:27 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com,
        paul.walmsley@sifive.com, sagar.kadam@sifive.com,
        peter@korsgaard.com, andrew@lunn.ch, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 v1 2/3] i2c-ocore: sifive: add support for i2c device on FU540-c000 SoC.
Date:   Mon,  6 May 2019 18:23:59 +0530
Message-Id: <1557147240-29551-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update device id table for Opencores I2C master used in HiFive Unleashed
platform having FU540-c000 chipset.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 4e1a077..7bf7b0c 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -85,6 +85,7 @@ struct ocores_i2c {
 
 #define TYPE_OCORES		0
 #define TYPE_GRLIB		1
+#define TYPE_SIFIVE_REV0	2
 
 static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
 {
@@ -465,6 +466,10 @@ static u32 ocores_func(struct i2c_adapter *adap)
 		.data = (void *)TYPE_OCORES,
 	},
 	{
+		.compatible = "sifive,fu540-c000-i2c",
+		.data = (void *)TYPE_SIFIVE_REV0,
+	},
+	{
 		.compatible = "aeroflexgaisler,i2cmst",
 		.data = (void *)TYPE_GRLIB,
 	},
-- 
1.9.1

