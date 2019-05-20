Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C1F2377A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 15:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732776AbfETMtn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 08:49:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40178 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388149AbfETMVY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 08:21:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id u17so7149224pfn.7
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4KK0MRvh5MgzBUDrn06tdDHg6h6KtmoqvmbKK6rVaok=;
        b=i/P9RCiDrUaIMpMf95McN8b9avW7QYLVIOKO2jlZMWKcLY/05ZW/xSzalEe2ZC2ium
         J+wLdgoANMLVAvwplbq/pkBi7usMO3QjlXEvjQ1Gs64ly9KvlZ2Pu3yKn0WT9pQ1InKG
         R1rSPrKmyTWs7h7zpnUHeqFD/UGsn7zMLBkG0+sA8QG5TWQx+b/Hhc7sYBOavOW+U/5g
         HAV8eBw9nk//Dtx3Z7BXuyrBpbg/WceaNIs1kK0+QG6MJCaEtEVuGWGx9l8EESebrOmm
         OahLLa8h7oaqtfm3NLAs/DeCR58Cf7obmOOgqP4+fbTPnkqwyR22Fqs4fG7q30WWpok+
         pJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4KK0MRvh5MgzBUDrn06tdDHg6h6KtmoqvmbKK6rVaok=;
        b=STL+0YyhXNFghC//+SOUMwk8dF8UsNopsxmRPMs7SzTOaoJjhjAj10tMRPPQJLAX06
         eacstIVVlPL+9E/47A+RCmSeBX0moURJQS3vymPYvboCVYoT+DEqgvctTI9dvIvihq2f
         +MurPAFl6fryr2LrNkkCmKRmlBLfUu3lvYUEojdwreDNkD5NWe9fnQigxMUgIlQJ8Vaw
         esvXnckDQT4UUK2ZUsKnfBv/TbAnLptHaCvF/Ac97XC11eKs0ydpWd4hLeoH8A2g4F1H
         7EG//3tWIHCF7XAIc3vHVHYyN3NmHtecSSMF3RfGwJTlvlryijOmN1O1PGtpSuMouvCE
         r9qQ==
X-Gm-Message-State: APjAAAX8xKdrhul6Sthn39CtLVaw0GQyjZOb2Gbnw10UaUr4YqN+pDva
        PsLyaAllng/r5pHIqeGE5+8uxg==
X-Google-Smtp-Source: APXvYqx/aDaf41fZIhhNQijCLymVj8l2tADUtw/HunCGJBDhenLRfcPSr+pEa51noxzJs7l4d1SCNQ==
X-Received: by 2002:a63:8741:: with SMTP id i62mr74826207pge.313.1558354883537;
        Mon, 20 May 2019 05:21:23 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id n27sm38137077pfb.129.2019.05.20.05.21.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 05:21:23 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
Date:   Mon, 20 May 2019 17:50:16 +0530
Message-Id: <1558354817-12034-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
References: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
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

