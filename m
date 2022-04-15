Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03F9502E16
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356035AbiDORCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356073AbiDORCc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:32 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7073DA43
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:03 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id b24so10488182edu.10
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=GLRRJ2iaJwRECu/ap1UxHntOmtdYLUu5sPHYjcQwSIY=;
        b=oSkOUtVNkBqFLQ7DxKU2Z3YK4Zvcm2HPS0szIk35UGkqs68FhqcaEw5Cx1VuvQyyYJ
         dVfC6CqLhK4vP+BN6ZIeiGDELmkVqj6UXNG1nUwWjX3SPSWASJPeO9KqIaPEvuHHfX1r
         QlC6JrdNjcPLgYBnEPJ/l+eobymQr5mQCk6S/HNt9OOeEG6q5F19JRj36lSenjLZMGwE
         UPsPoXOE1N0sgtC/C3cEbfZYcsOPjqA3dbppEiJVGS8V3yXtB3SFIa5HOCV+dfNoyGHE
         leVws5C+mQQVT7kcWUGSQTAuUwTFKmCWvjXr1VJ1t9HpmrK8EkydKnPOLjdwVd2djCRv
         OrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=GLRRJ2iaJwRECu/ap1UxHntOmtdYLUu5sPHYjcQwSIY=;
        b=ehClVIgqVV7lw8snlzefUr1MjySa0FDLxk2//hQyR3IvN/rsNuFW+F+YCMu2UF0sgz
         /Sv3NcYbt8Brk3/SoqflDIwURmGBstx4E/LfNLrH6aDrB58fitk+NXoIFhZHSWebX/Zy
         ivI/LzZzBktiGeFvhD+bc4OygDmW865M98Sa+02kHcOMp65hGYUIUAfzuF+6Stl0R6h+
         Uev841v9qHFlhwCa11p6N/OpyZpN/sVEsUfO4KLYhkQM+4k3HozERjCBQeawiG7j0AjW
         ehJH74mjSsBTbfKvQaX7iE9ZkYTtnHCo+BlixJb0b40lYqvrYciMs8svZfC1lDaopgbo
         e9bQ==
X-Gm-Message-State: AOAM531VuK8RKBeTgrxDleIRiruY3lJy1bj7j6khORoDQ9NbCIcSeJjQ
        7ZsQbCpvS1aYGmf7lOak351HqsNqqbg=
X-Google-Smtp-Source: ABdhPJwOYIvjiyNSTMNsNPLQ2XZh88cK6ousbzWsNYEGw9tS34/USZhc2T4zuHZQOlUTYRIWYdeIaA==
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id i20-20020a05640242d400b00412c26b0789mr183345edc.232.1650042001743;
        Fri, 15 Apr 2022 10:00:01 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id fq6-20020a1709069d8600b006e891c0b7e0sm1823468ejc.129.2022.04.15.10.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 10:00:01 -0700 (PDT)
Message-ID: <1f81a126-11b4-aa22-1e2c-9824e0ad730c@gmail.com>
Date:   Fri, 15 Apr 2022 18:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 4/8] i2c: i801: enable FEATURE_IRQ and FEATURE_I2C_BLOCK_READ
 on all chip versions
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
In-Reply-To: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

According to the datasheets interrupt mode and i2c block read are
supported on all chip versions. Therefore set both feature flags for
all chip versions.
Note: Don't remove the two feature flags as such (at least for now),
so that in case of a problem users can use the disable_features
module parameter to disable a problematic feature.

Patch is based solely on the datasheets. I don't have old enough
test hw, therefore the patch is compile-tested only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 140 +++++++++++++++++-----------------
 1 file changed, 69 insertions(+), 71 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1d8182901..a9737f14d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -12,70 +12,70 @@
 /*
  * Supports the following Intel I/O Controller Hubs (ICH):
  *
- *					I/O			Block	I2C
- *					region	SMBus	Block	proc.	block
- * Chip name			PCI ID	size	PEC	buffer	call	read
- * ---------------------------------------------------------------------------
- * 82801AA (ICH)		0x2413	16	no	no	no	no
- * 82801AB (ICH0)		0x2423	16	no	no	no	no
- * 82801BA (ICH2)		0x2443	16	no	no	no	no
- * 82801CA (ICH3)		0x2483	32	soft	no	no	no
- * 82801DB (ICH4)		0x24c3	32	hard	yes	no	no
- * 82801E (ICH5)		0x24d3	32	hard	yes	yes	yes
- * 6300ESB			0x25a4	32	hard	yes	yes	yes
- * 82801F (ICH6)		0x266a	32	hard	yes	yes	yes
- * 6310ESB/6320ESB		0x269b	32	hard	yes	yes	yes
- * 82801G (ICH7)		0x27da	32	hard	yes	yes	yes
- * 82801H (ICH8)		0x283e	32	hard	yes	yes	yes
- * 82801I (ICH9)		0x2930	32	hard	yes	yes	yes
- * EP80579 (Tolapai)		0x5032	32	hard	yes	yes	yes
- * ICH10			0x3a30	32	hard	yes	yes	yes
- * ICH10			0x3a60	32	hard	yes	yes	yes
- * 5/3400 Series (PCH)		0x3b30	32	hard	yes	yes	yes
- * 6 Series (PCH)		0x1c22	32	hard	yes	yes	yes
- * Patsburg (PCH)		0x1d22	32	hard	yes	yes	yes
- * Patsburg (PCH) IDF		0x1d70	32	hard	yes	yes	yes
- * Patsburg (PCH) IDF		0x1d71	32	hard	yes	yes	yes
- * Patsburg (PCH) IDF		0x1d72	32	hard	yes	yes	yes
- * DH89xxCC (PCH)		0x2330	32	hard	yes	yes	yes
- * Panther Point (PCH)		0x1e22	32	hard	yes	yes	yes
- * Lynx Point (PCH)		0x8c22	32	hard	yes	yes	yes
- * Lynx Point-LP (PCH)		0x9c22	32	hard	yes	yes	yes
- * Avoton (SOC)			0x1f3c	32	hard	yes	yes	yes
- * Wellsburg (PCH)		0x8d22	32	hard	yes	yes	yes
- * Wellsburg (PCH) MS		0x8d7d	32	hard	yes	yes	yes
- * Wellsburg (PCH) MS		0x8d7e	32	hard	yes	yes	yes
- * Wellsburg (PCH) MS		0x8d7f	32	hard	yes	yes	yes
- * Coleto Creek (PCH)		0x23b0	32	hard	yes	yes	yes
- * Wildcat Point (PCH)		0x8ca2	32	hard	yes	yes	yes
- * Wildcat Point-LP (PCH)	0x9ca2	32	hard	yes	yes	yes
- * BayTrail (SOC)		0x0f12	32	hard	yes	yes	yes
- * Braswell (SOC)		0x2292	32	hard	yes	yes	yes
- * Sunrise Point-H (PCH) 	0xa123  32	hard	yes	yes	yes
- * Sunrise Point-LP (PCH)	0x9d23	32	hard	yes	yes	yes
- * DNV (SOC)			0x19df	32	hard	yes	yes	yes
- * Emmitsburg (PCH)		0x1bc9	32	hard	yes	yes	yes
- * Broxton (SOC)		0x5ad4	32	hard	yes	yes	yes
- * Lewisburg (PCH)		0xa1a3	32	hard	yes	yes	yes
- * Lewisburg Supersku (PCH)	0xa223	32	hard	yes	yes	yes
- * Kaby Lake PCH-H (PCH)	0xa2a3	32	hard	yes	yes	yes
- * Gemini Lake (SOC)		0x31d4	32	hard	yes	yes	yes
- * Cannon Lake-H (PCH)		0xa323	32	hard	yes	yes	yes
- * Cannon Lake-LP (PCH)		0x9da3	32	hard	yes	yes	yes
- * Cedar Fork (PCH)		0x18df	32	hard	yes	yes	yes
- * Ice Lake-LP (PCH)		0x34a3	32	hard	yes	yes	yes
- * Ice Lake-N (PCH)		0x38a3	32	hard	yes	yes	yes
- * Comet Lake (PCH)		0x02a3	32	hard	yes	yes	yes
- * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
- * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
- * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
- * Tiger Lake-H (PCH)		0x43a3	32	hard	yes	yes	yes
- * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes	yes
- * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes	yes
- * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes	yes
- * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
- * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
- * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
+ *					I/O			Block
+ *					region	SMBus	Block	proc.
+ * Chip name			PCI ID	size	PEC	buffer	call
+ * -------------------------------------------------------------------
+ * 82801AA (ICH)		0x2413	16	no	no	no
+ * 82801AB (ICH0)		0x2423	16	no	no	no
+ * 82801BA (ICH2)		0x2443	16	no	no	no
+ * 82801CA (ICH3)		0x2483	32	soft	no	no
+ * 82801DB (ICH4)		0x24c3	32	hard	yes	no
+ * 82801E (ICH5)		0x24d3	32	hard	yes	yes
+ * 6300ESB			0x25a4	32	hard	yes	yes
+ * 82801F (ICH6)		0x266a	32	hard	yes	yes
+ * 6310ESB/6320ESB		0x269b	32	hard	yes	yes
+ * 82801G (ICH7)		0x27da	32	hard	yes	yes
+ * 82801H (ICH8)		0x283e	32	hard	yes	yes
+ * 82801I (ICH9)		0x2930	32	hard	yes	yes
+ * EP80579 (Tolapai)		0x5032	32	hard	yes	yes
+ * ICH10			0x3a30	32	hard	yes	yes
+ * ICH10			0x3a60	32	hard	yes	yes
+ * 5/3400 Series (PCH)		0x3b30	32	hard	yes	yes
+ * 6 Series (PCH)		0x1c22	32	hard	yes	yes
+ * Patsburg (PCH)		0x1d22	32	hard	yes	yes
+ * Patsburg (PCH) IDF		0x1d70	32	hard	yes	yes
+ * Patsburg (PCH) IDF		0x1d71	32	hard	yes	yes
+ * Patsburg (PCH) IDF		0x1d72	32	hard	yes	yes
+ * DH89xxCC (PCH)		0x2330	32	hard	yes	yes
+ * Panther Point (PCH)		0x1e22	32	hard	yes	yes
+ * Lynx Point (PCH)		0x8c22	32	hard	yes	yes
+ * Lynx Point-LP (PCH)		0x9c22	32	hard	yes	yes
+ * Avoton (SOC)			0x1f3c	32	hard	yes	yes
+ * Wellsburg (PCH)		0x8d22	32	hard	yes	yes
+ * Wellsburg (PCH) MS		0x8d7d	32	hard	yes	yes
+ * Wellsburg (PCH) MS		0x8d7e	32	hard	yes	yes
+ * Wellsburg (PCH) MS		0x8d7f	32	hard	yes	yes
+ * Coleto Creek (PCH)		0x23b0	32	hard	yes	yes
+ * Wildcat Point (PCH)		0x8ca2	32	hard	yes	yes
+ * Wildcat Point-LP (PCH)	0x9ca2	32	hard	yes	yes
+ * BayTrail (SOC)		0x0f12	32	hard	yes	yes
+ * Braswell (SOC)		0x2292	32	hard	yes	yes
+ * Sunrise Point-H (PCH)	0xa123  32	hard	yes	yes
+ * Sunrise Point-LP (PCH)	0x9d23	32	hard	yes	yes
+ * DNV (SOC)			0x19df	32	hard	yes	yes
+ * Emmitsburg (PCH)		0x1bc9	32	hard	yes	yes
+ * Broxton (SOC)		0x5ad4	32	hard	yes	yes
+ * Lewisburg (PCH)		0xa1a3	32	hard	yes	yes
+ * Lewisburg Supersku (PCH)	0xa223	32	hard	yes	yes
+ * Kaby Lake PCH-H (PCH)	0xa2a3	32	hard	yes	yes
+ * Gemini Lake (SOC)		0x31d4	32	hard	yes	yes
+ * Cannon Lake-H (PCH)		0xa323	32	hard	yes	yes
+ * Cannon Lake-LP (PCH)		0x9da3	32	hard	yes	yes
+ * Cedar Fork (PCH)		0x18df	32	hard	yes	yes
+ * Ice Lake-LP (PCH)		0x34a3	32	hard	yes	yes
+ * Ice Lake-N (PCH)		0x38a3	32	hard	yes	yes
+ * Comet Lake (PCH)		0x02a3	32	hard	yes	yes
+ * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes
+ * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes
+ * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes
+ * Tiger Lake-H (PCH)		0x43a3	32	hard	yes	yes
+ * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes
+ * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes
+ * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes
+ * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes
+ * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes
+ * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -168,7 +168,7 @@
 #define I801_WORD_DATA		0x0C
 #define I801_PROC_CALL		0x10
 #define I801_BLOCK_DATA		0x14
-#define I801_I2C_BLOCK_DATA	0x18	/* ICH5 and later */
+#define I801_I2C_BLOCK_DATA	0x18
 #define I801_BLOCK_PROC_CALL	0x1C
 
 /* I801 Host Control register bits */
@@ -973,11 +973,8 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= i801_func,
 };
 
-#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \
-			 FEATURE_IRQ | FEATURE_SMBUS_PEC		| \
-			 FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
-#define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \
-			 FEATURE_HOST_NOTIFY)
+#define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
+#define FEATURES_ICH5	(FEATURES_ICH4 | FEATURE_BLOCK_PROC)
 
 static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, 82801AA_3,		0)				 },
@@ -1665,7 +1662,8 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	mutex_init(&priv->acpi_lock);
 
 	priv->pci_dev = dev;
-	priv->features = id->driver_data;
+	priv->features = FEATURE_IRQ | FEATURE_I2C_BLOCK_READ;
+	priv->features |= id->driver_data;
 
 	/* Disable features on user request */
 	for (i = 0; i < ARRAY_SIZE(i801_feature_names); i++) {
-- 
2.35.3


