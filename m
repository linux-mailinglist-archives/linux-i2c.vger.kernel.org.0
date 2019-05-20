Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 038E32398C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 16:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733292AbfETONB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 10:13:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40868 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731439AbfETONA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 10:13:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id d30so6865029pgm.7
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4KK0MRvh5MgzBUDrn06tdDHg6h6KtmoqvmbKK6rVaok=;
        b=OAQ0DsHAZfIcur5262VF3nMZHoryfuG6j3qbM/gqN/eIPJOxhv64Emillk+Ncuo0MV
         s7wpVKOr63V4BS9AKRaSULQA9YtCsBe4lJy9bhCZ3lmCmyCv2mU26bKQCVO6QrOUlXRW
         1Z6WwUzW3Zi/wI2jgZf8H/VtrhRTBzoDz4kLUOAU4bt0KU7TR0b3QQ/zAeBDBsJJu0JZ
         bZR1o5HVrFv0a64SNt5A1IXGbTJI7RzJDGc3STIWphIUodtxC49ll4+AYh3zaAx4dJsa
         Kt2jr96X3tScTJUTqkHCELTRGw1ILqZ/NHsfGfZ7b5lQnaYlBuqYrbOJbE7vmr9n27ur
         DD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4KK0MRvh5MgzBUDrn06tdDHg6h6KtmoqvmbKK6rVaok=;
        b=ovF70I4j/Q2fob9qX/gF9+sccHGZ20NvAHsJb5+dqGNYJkw/oTeXgDy7kZbOPS2VoZ
         QilbEMtAciBRrxqaLftJWhO8E/tREdqCrJ7iC5Qt0MizwhUqJ8TJJJVttd4fef/i1H82
         a9/iJBN8DgJQxc2S2CAaWlSCOBLte/KgPLypHnVyb94pkJEBlfwYaHrZRsbJD06yANQq
         0e/uJFw9/SHYKbgJeQdz39v9ZJ97v4QUZsAdhY04lmamlnpMXXh0jaDFP/kytisKpB50
         u34t+L0jilVrFJdZPckdLAhVqgq0MCkI4cd6WxlnIztS/SNrhvSWsy9SmMFIStt77WZS
         wJGQ==
X-Gm-Message-State: APjAAAW2n5HYcZ2PlPUFUiqgfc0dLCvZx/vZ23OItPDQzk/QiK8zP6iX
        FXxVZ1BRV0/2eEDt01XXDAplMw==
X-Google-Smtp-Source: APXvYqx6TcjEmaWTHf2leDwIV6L5TLuoA52r8b5QDadU3z7lyJAZACiDuRsvgHZAJCXRuSsqGueiVg==
X-Received: by 2002:a62:82c1:: with SMTP id w184mr50009193pfd.171.1558361580333;
        Mon, 20 May 2019 07:13:00 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id a9sm26388248pgw.72.2019.05.20.07.12.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:12:59 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
Date:   Mon, 20 May 2019 19:41:17 +0530
Message-Id: <1558361478-4381-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
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
index 4e1a077..aee1d86 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -85,6 +85,7 @@ struct ocores_i2c {
 
 #define TYPE_OCORES		0
 #define TYPE_GRLIB		1
+#define TYPE_SIFIVE_REV0	2
 
 static void oc_setreg_8(struct ocores_i2c *i2c, int reg, u8 value)
 {
@@ -468,6 +469,14 @@ static u32 ocores_func(struct i2c_adapter *adap)
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

