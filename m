Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A56319DB
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 08:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfFAGLu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 02:11:50 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35428 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfFAGLt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jun 2019 02:11:49 -0400
Received: by mail-pg1-f196.google.com with SMTP id t1so1704340pgc.2
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 23:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/BRFvwHTJGi4mC+l6/NtyYz/ZOf9cjorYo3iOt6cwfc=;
        b=GYWLNCJxwtsJELEDc5nOhmMnFhrKwQdhBjRn/pKyrJmzcf6pahtsoYHDBq+A92qt9z
         CKOroINqBp1vkIndKgWR+oEcf11Suw39Yg7+jtLk5PE8a/8iwxexLe8YnsyRFbt/M0Aw
         U+guAgtPl5u2eJRJhqlKsoxPrYUHxVJNYNxkmTnO6etOVMsMXG7M6kK8xfbHPLMjllgP
         nvCPJBqQQvRf+Q9Ynwl7ENeH6EUxw98uPQSFkCO8TY/kSEKBFOfslVh+dMcAxHDblCDi
         PBhpoERxK22Q4q6VPYMNgQgguFBIG6CDZ5JQtZ6O+QpI5/hQ3Ru0lkdIwgSsMN4MOPps
         UiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/BRFvwHTJGi4mC+l6/NtyYz/ZOf9cjorYo3iOt6cwfc=;
        b=nO/EKPRvfOVIc3tz2cstfxHa3CKoEqXi8sGuy3qR4l/NryJacdWJ65BKrIiuEII0od
         yFn2GhjlbWm5IRaCsnO9y+X0DsXtGRLZwSgIQ0OwYufItTkenP9Lgef2awpOHybsPptJ
         8zpEeB3MiTN3szISMJtWCsROXJw1jCgicTMkq1wBbRety3XLZnQXmLGBd9IjL926QvP7
         hy4nmNP/sttE29DOQJJX2Gb80c7ItjnqBR/VTfAo8Emp+Rtr63aQAFpSe4KBginVM62M
         QtULIaGT6QLOUlZLLlGd+RLvCqZiMFOhCsYBRiNrkDG8jvwMu82Yz0cYXb9GDewOFxfc
         wvaQ==
X-Gm-Message-State: APjAAAUmmQ4wj/ajlf7QLToIGsRP0rVjaxoJnyz1lem8wMeEDhqo9q6Y
        dqfrnKL+PBCigfqR5x6lvxnlEw==
X-Google-Smtp-Source: APXvYqzlk3hrluDCHk21oBfq1TiS/zO95WiT9eRFQoVOSTZcNwULqaajTm6A9o7fAd6f12vsWlBp5w==
X-Received: by 2002:a63:8449:: with SMTP id k70mr13784046pgd.208.1559369509095;
        Fri, 31 May 2019 23:11:49 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm8935850pgl.40.2019.05.31.23.11.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 23:11:48 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH REPOST v8 2/3] i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
Date:   Sat,  1 Jun 2019 11:41:14 +0530
Message-Id: <1559369475-15374-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update device id table for Opencore's I2C master based re-implementation
used in FU540-c000 chipset on HiFive Unleashed platform.

Device ID's include Sifive, soc-specific device for chip specific tweaks
and sifive IP block specific device for generic programming model.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index c3dabee..b334fa2 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -82,6 +82,7 @@ struct ocores_i2c {
 
 #define TYPE_OCORES		0
 #define TYPE_GRLIB		1
+#define TYPE_SIFIVE_REV0	2
 
 static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
 {
@@ -462,6 +463,14 @@ static u32 ocores_func(struct i2c_adapter *adap)
 		.compatible = "aeroflexgaisler,i2cmst",
 		.data = (void *)TYPE_GRLIB,
 	},
+	{
+		.compatible = "sifive,fu540-c000-i2c",
+		.data = (void *)TYPE_SIFIVE_REV0,
+	},
+	{
+		.compatible = "sifive,i2c0",
+		.data = (void *)TYPE_SIFIVE_REV0,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, ocores_i2c_match);
-- 
1.9.1

