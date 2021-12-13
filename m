Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 230FD47373B
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 23:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243485AbhLMWHI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 17:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243312AbhLMWHH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Dec 2021 17:07:07 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516EEC061574
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 14:07:07 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id q3so29403769wru.5
        for <linux-i2c@vger.kernel.org>; Mon, 13 Dec 2021 14:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=LnYKpyynBhmrPIEOLFCUpRPE8RT4qeWjAOamfFI4/9U=;
        b=AN61QUBY2K5apIxoOxxs0ge+X5kMsyholqeo9dZcvHVTMDae0jpDD2AF3TYLaNNuca
         8d6+iEBW/ljBpIUN7LcXNe1ViIZE26HHxJriFoMjsMn+CRXxLoKWNQ1R1TQ+p/yFHByd
         qL88Hhc8X5dRGcqLU1UXf92ojRd3JMnmX5IrkwFsXGI2IaSreVgdTHzc/voB97UpECti
         N74WGpyM2k4SI7oxzHfqJR+IyBzJjGlVNrzt21ieLSnbESIbXQSUg6sDmLYktcFeJvbm
         L7O8uqARVEiPP4unPCC8K2G0Lmqphc5xdOhu0YQkHj8m/RJJdTrOnPUOspcLMkxW+j9X
         YsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=LnYKpyynBhmrPIEOLFCUpRPE8RT4qeWjAOamfFI4/9U=;
        b=w918XJ6BnyQIgy6ViY8XDvw7vvMnH2+QwB8wn/URo6WZxHn/CKT/BgotuyTJoG1vxw
         p7wdMkuKqwuHEj+f6hZRrod64GYkpEMaapQfs9jY6w1CHTd8C8vKZ3kmQjx/Dy/10GlL
         kiForourMychTGMh4VsIoVKZyfNCWKlIE/K12Lis7/zrhDtX+HIaeKI4acC3iW+GSNNR
         qmMhZiVM4yeGjBUTVHuYP4T43QWgN2pWkfi2oyrGX2lgaTqWfsmNh7XvhAzg7EirM2Ib
         pfTKr9oy+rqU5EHP/jqCKZ9+rLjsCNbmXBTeWBDJBz6tgazzPjE1rRKcPLnSRx6BA3GY
         n6yw==
X-Gm-Message-State: AOAM532BNLw8ydEldHrNdkXGxKqupfrEWj+Ik+mzsMRjOG/NVUvKFa1a
        cNv8UpQzkzSgSYncopk1WdX25WyyxF0=
X-Google-Smtp-Source: ABdhPJwJwYab2HjSKetiKs0wmK8DqWjjlinevICqWdzYpsS7pmQwBN41fbMpre9tMrvWTv0Vjg8KAQ==
X-Received: by 2002:a05:6000:154b:: with SMTP id 11mr1342827wry.394.1639433225829;
        Mon, 13 Dec 2021 14:07:05 -0800 (PST)
Received: from ?IPV6:2003:ea:8f24:fd00:71c4:b9fd:67eb:934? (p200300ea8f24fd0071c4b9fd67eb0934.dip0.t-ipconnect.de. [2003:ea:8f24:fd00:71c4:b9fd:67eb:934])
        by smtp.googlemail.com with ESMTPSA id p12sm14601346wrr.10.2021.12.13.14.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 14:07:05 -0800 (PST)
Message-ID: <0736c634-eab7-255a-c158-0e724ec4bc0b@gmail.com>
Date:   Mon, 13 Dec 2021 23:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: enable FEATURE_IRQ and FEATURE_I2C_BLOCK_READ on
 all chip versions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 drivers/i2c/busses/i2c-i801.c | 138 +++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 70 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index e1ea7c9d7..5420d9e19 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -12,69 +12,69 @@
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
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -168,7 +168,7 @@
 #define I801_WORD_DATA		0x0C
 #define I801_PROC_CALL		0x10	/* unimplemented */
 #define I801_BLOCK_DATA		0x14
-#define I801_I2C_BLOCK_DATA	0x18	/* ICH5 and later */
+#define I801_I2C_BLOCK_DATA	0x18
 #define I801_BLOCK_PROC_CALL	0x1C
 
 /* I801 Host Control register bits */
@@ -979,11 +979,8 @@ static const struct i2c_algorithm smbus_algorithm = {
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
@@ -1670,7 +1667,8 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	mutex_init(&priv->acpi_lock);
 
 	priv->pci_dev = dev;
-	priv->features = id->driver_data;
+	priv->features = FEATURE_IRQ | FEATURE_I2C_BLOCK_READ;
+	priv->features |= id->driver_data;
 
 	/* Disable features on user request */
 	for (i = 0; i < ARRAY_SIZE(i801_feature_names); i++) {
-- 
2.34.1

