Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24892505E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfEUNdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:33:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44281 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbfEUNdY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 09:33:24 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so1935280pgp.11
        for <linux-i2c@vger.kernel.org>; Tue, 21 May 2019 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/BRFvwHTJGi4mC+l6/NtyYz/ZOf9cjorYo3iOt6cwfc=;
        b=MihmeJoI2Kctk0t4cBE6oHsC3/eL4jMiONd0z9ECsi8xF1h36S2fBIAYttGJ+D/VR6
         lqUeTum/ne1zyIfAWGp7YIF0hAuqw9Ru6Ee9KOw4M6h1fHcU4CtUeCPLTrt+ESAkZDbz
         EBvXNPjJps5LmyKDeUtSTeh+zfNLZnSFKAsV6P3uiaN5nQ9DXL/+28bW7LQWUN9lPRju
         jNS+d1P3PwHSigIq5bMuDW2bUKSUvzDGM24Wc/2iDlKQagXjw6WGe1SdsZQja2oPT7cL
         GMXoYXJBGLWcysOjoJih56jXxc9nUsTO29getB3MaFyK4NGgHFSSoOZtJQ8ueCZ1LZDe
         sO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/BRFvwHTJGi4mC+l6/NtyYz/ZOf9cjorYo3iOt6cwfc=;
        b=lWYpLgyGGTrWU1kL5pMBlnkPGk5QEhwQkZ6VGo5uhL89cvY/LdBaUNpJf3WnVxGKJZ
         SIFn/iRzha19zj7B31qNie8gqnYrFNcFRXj97v12xZHFtSyQXwtT96gBjknpq/k4MwSk
         PihWKBBsajFm6QISJRWe9PStJNRKjF5UaNO+ncAImqZ4kAJASVcZDVgw7hug8CY6L1C+
         YnUi95fS2Kxy+ezC1atwF0WxlGgIeGfLa5hP5jM44kKaWNKoXqcs/O67XGDpcyiHg7e+
         u2a9qjmcv+L65X+GTtKu8zk+o7DlvzAFKENrXLb101Jr++idQ8+yO/8U32c+bjkLwpJO
         cNzg==
X-Gm-Message-State: APjAAAUR+XrUfGEPRaeNVcXWGy4M7trSum0smO2h1Km+mLKBVR9LplK0
        xwPSH1Mr+G9FPniU8GqSBGZzbw==
X-Google-Smtp-Source: APXvYqxEv2PJu+YRU/OJSvjSo53F+3SPbm1+GyvMmTi3+tv2KXiA05zIWK5yTfHuZpUZZI5bB1e+Mw==
X-Received: by 2002:a63:e43:: with SMTP id 3mr39548393pgo.253.1558445604442;
        Tue, 21 May 2019 06:33:24 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id d15sm65368906pfm.186.2019.05.21.06.33.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 21 May 2019 06:33:22 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
Date:   Tue, 21 May 2019 19:02:53 +0530
Message-Id: <1558445574-16471-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
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

