Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C4016668
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 17:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfEGPPs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 11:15:48 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43140 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfEGPPs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 May 2019 11:15:48 -0400
Received: by mail-pl1-f194.google.com with SMTP id n8so8344921plp.10
        for <linux-i2c@vger.kernel.org>; Tue, 07 May 2019 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:from:to:subject:date:message-id:in-reply-to:references;
        bh=ezJJYEzxOSAxwZu5Qv2HQh0qcKaC7e6tAejJ+6qzI9Q=;
        b=iF+0g7n/cGqvlvQeGxp24KtUxCsPs5OnWSZxz/XHDeizhBZE7614RnZcXAUMn008mt
         dS7YBnc+jzPJXOfz5nDgtuadv8DNFXP3xqgyusW6CyoA2VbHBp3KRZ7sAUYN4EpZ3VdP
         K5n7Ti0LA37SB2HOGCFiS/tNcrMZkRk9+krjFnMnkoVNhEF9qRGmTzDtHU73HYCFFN58
         TgoN1B4+dkLZ5TTz3pCmEFFp8AeZpCwuBm3WxGcDxWVuVLQaQflBs7mJMyCoTiUMNNdj
         vcRq4MNqefMYJuPrivAOmfYlMH8msmZJtWlSnwZtcsdcIlF45eVITjv7sMfQyBRrury9
         lsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references;
        bh=ezJJYEzxOSAxwZu5Qv2HQh0qcKaC7e6tAejJ+6qzI9Q=;
        b=EpGXBN4dGfs3FmYu1Mr7Y8tcIk9JyKm0GTw1H4Jyqo+CI3R3g6qpziDeK7Cj87Ztwi
         InuhwWDL/tFjsAQlTLrG4sMw7tdChSvgUbDDVokoZZrbouFJFpVsDXXNgCR3N54/4Luh
         ZdL/W8YmM9r0cf3uTwxzz7sFuOXJOe1M/fc9iWWKHV6P4j3kjqAiQS09bKpVoE7q91Fj
         iv3VJCZhTCAlarSdFKk94xWiT+CBJ82/w+xzpdnFkFGG+j0zQ48WVw1tIz55eOJQXxYt
         sJWS4mOspAi6O6JcpFeQx84nXENY+gx7sguXek0d4lmaTxqe47NNq5NplcSMsL6ara04
         bUNw==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAUzz2LiodDg3ChFN6cx3tO75t9nN1reJi/cg4q0jg5U/Q0jrrsY
        RmTzLWv9sHZo6gGWhIy8WAShV9tCVcaatRsBS5s82z3Q8jalpe2uVRcMv+s7LR6BOl8b/YmdCIQ
        0McUZ794jb9ZPOg==
X-Google-Smtp-Source: APXvYqw92q/y/dpF3qOih3WEvN/1uShPh4h/eO54vUyzDYo/E8LVRT/CQ3YgidasSD0wUxoLDRXJwA==
X-Received: by 2002:a17:902:900a:: with SMTP id a10mr40804350plp.336.1557242147782;
        Tue, 07 May 2019 08:15:47 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm5397398pgc.49.2019.05.07.08.15.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 May 2019 08:15:47 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 v2 2/3] i2c-ocore: sifive: add support for i2c device on FU540-c000 SoC.
Date:   Tue,  7 May 2019 20:45:07 +0530
Message-Id: <1557242108-13580-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
Content-Type: text/plain; charset="US-ASCII"
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


-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.
